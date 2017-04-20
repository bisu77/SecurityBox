package com.allin.web.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Timestamp;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;

import com.allin.web.dao.HistoryDAO;
import com.allin.web.dao.MemberDAO;
import com.allin.web.dto.HistoryDTO;
import com.allin.web.dto.MemberDTO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	 @Autowired
	   private SqlSession sqlSession;      // Autowired도 resource와 같은 기능 근데 뭐가 다른지는 정확히 모르겠다
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "main", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		
		return "main/home";
	}
	
	
	
	
	
	@RequestMapping("/client_main")
	   public String client_main(Model model) {		
		return "main/client_main";		     
	}
	@RequestMapping("/c_main")
	   public String c_main(Model model) {		
		return "main/c_main";		     
	}
	@RequestMapping("/login_page")
	   public String login_page(Model model) {		
		return "login/login_page";		     
	}
	@RequestMapping("/regist_page")
	   public String regist_page(Model model) {		
		return "history/regist_page";		     
	}
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(HttpServletRequest request, Model model, HttpSession session) {
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		boolean check_login = false; // 로그인 성공 여부

		if (id.equals("admin")) {
			if (password.equals("allin")) {
				// 관리자모드 들어가기
				session.setAttribute("ID", id);

				return "login/login_ok";
			}
		} else {
			MemberDAO mem = sqlSession.getMapper(MemberDAO.class);
			try {
				MemberDTO mem_dto = mem.one_memberSelect(id);

				MessageDigest digest = MessageDigest.getInstance("SHA-256");
				byte[] hash = digest.digest(password.getBytes("UTF-8"));
				StringBuffer sha_pw = new StringBuffer();

				for (int i = 0; i < hash.length; i++) {
					String hex = Integer.toHexString(0xff & hash[i]);
					if (hex.length() == 1)
						sha_pw.append('0');
					sha_pw.append(hex);
				}

				if (mem_dto.getPassword().equals(sha_pw.toString())) {
					check_login = true;
				}

				if (check_login) {
					session.setAttribute("ID", id);
					return "login/login_ok";
				} else {

					return "login/login_error";
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				return "login/login_error";
			}

		}
		return "login/login_error";
	}
	@RequestMapping("/find_ID")
	   public String find_ID(Model model) {		
		return "login/find_ID";		     
	}
	@RequestMapping("/findid")
	public String findid(HttpServletRequest request,Model model, HttpSession session) {
		String name=request.getParameter("name");
		String box_code=request.getParameter("box_code");
		String id="";
		MemberDAO mem= sqlSession.getMapper(MemberDAO.class);
		MemberDTO dto;
		try {
			dto = mem.find_id(name, box_code);
			id=dto.getId();
			model.addAttribute("id", id);
			return "login/find_ID_alert";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			return "login/find_ID_alert";
		}

	}
	
	@RequestMapping("/find_PW")
	   public String find_PW(Model model) {		
		return "login/find_PW";		     
	}
	@RequestMapping("/modifypw")
	   public String modifypw(HttpServletRequest request, Model model) {	
		String pw1=request.getParameter("password");
		String pw2=request.getParameter("password_check");
		String id=request.getParameter("id");
		String new_pw="";
		
		if(pw1.equals(pw2))
		{//변경
			MemberDAO mem= sqlSession.getMapper(MemberDAO.class);
			try {
				
				MessageDigest digest = MessageDigest.getInstance("SHA-256");
				byte[] hash = digest.digest(pw1.getBytes("UTF-8"));
				StringBuffer sha_pw = new StringBuffer();
				
				for(int i = 0; i<hash.length; i++)
				{
					String hex= Integer.toHexString(0xff & hash[i]);
					if(hex.length() == 1)
						sha_pw.append('0');
					sha_pw.append(hex);
				}	
				
				mem.modify_pw(id, sha_pw.toString());
				new_pw=pw1;
				model.addAttribute("pw",new_pw);
			} catch (Exception e) {
				return "login/modify_PW_alert";
			}
		}
		else
		{//변경실패 다시시도
			model.addAttribute("pw","");
			return "login/modify_PW_alert";
		}
		return "login/modify_PW_alert";
	}
	@RequestMapping("/findpw")
	public String findpw(HttpServletRequest request,Model model, HttpSession session) {
		String id=request.getParameter("id");
		String name=request.getParameter("name");
		String box_code=request.getParameter("box_code");
		
		MemberDAO mem= sqlSession.getMapper(MemberDAO.class);
		MemberDTO dto;
		try {
			dto = mem.find_pw(id, name, box_code);
			if(dto!=null)
			{
			model.addAttribute("id", id);
			return "login/modify_PW";
			}
			else
			{return "login/find_PW_error";}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			return "login/find_PW_error";
		}

	}
	@RequestMapping("/JoinMember")
	   public String JoinMember(Model model) {		
		return "joinmember/JoinMember";		     
	}
	@RequestMapping("/idcheck")
	   public String idcheck(HttpServletRequest request,Model model,HttpSession session) {
		MemberDAO mem= sqlSession.getMapper(MemberDAO.class);
		String id = request.getParameter("id");
		ArrayList<MemberDTO> dto;
		try {
			dto = mem.memberSelect();
			for (int i = 0; i < dto.size(); i++) {
				if (id.equals(dto.get(i).getId())) {
					// 아이디 중복 return
					model.addAttribute("id", id);
					return "joinmember/idcheck_error";
				}
			}
			// 아이디 중복 없음 리턴
			model.addAttribute("id", id);
			return "joinmember/idcheck_ok";	
		} catch (Exception e) {
			// TODO Auto-generated catch block
			return "joinmember/idcehc_error";
			}

			     
	}
	@RequestMapping("/boxcheck")
	   public String boxcheck(HttpServletRequest request,Model model,HttpSession session) {
		MemberDAO mem= sqlSession.getMapper(MemberDAO.class);
		String boxcode = request.getParameter("box_code");
		ArrayList<MemberDTO> dto;
		try {
			dto = mem.memberSelect();
			for (int i = 0; i < dto.size(); i++) {
				if (boxcode.equals(dto.get(i).getBox_code())) {
					//boxcode 중복 return
					model.addAttribute("boxcode", boxcode);
					return "joinmember/boxcheck_error";
				}
			}
			// boxcode중복 없음 리턴
			model.addAttribute("boxcode", boxcode);
			return "joinmember/boxcheck_ok";	
		} catch (Exception e) {
			// TODO Auto-generated catch block
			return "joinmember/boxcheck_error";
		}
			     
	}
	@RequestMapping("/insertMember")
	   public String insertMember(HttpServletRequest request,Model model) {	
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String box_code = request.getParameter("box_code");
		String zipcode = request.getParameter("zipcode");
		String addr = request.getParameter("addr1") + request.getParameter("addr2");
		String check_id = request.getParameter("check_id");
		String check_box = request.getParameter("check_box");
		String check_addr = request.getParameter("check_addr");
		
		java.util.Date date = new Date();
		Timestamp timestamp = new Timestamp(date.getTime());
		
		if (check_id.equals("false") || check_box.equals("false") || check_addr.equals("false"))
		{
			return "joinmember/insertMem_error";			
		}
		else {
			try {
				MessageDigest digest = MessageDigest.getInstance("SHA-256");
				byte[] hash = digest.digest(password.getBytes("UTF-8"));
				StringBuffer sha_pw = new StringBuffer();
				
				for(int i = 0; i<hash.length; i++)
				{
					String hex= Integer.toHexString(0xff & hash[i]);
					if(hex.length() == 1)
						sha_pw.append('0');
					sha_pw.append(hex);
				}
				System.out.println("암호화!!!");
				System.out.println(sha_pw.toString());

				MemberDAO mem = sqlSession.getMapper(MemberDAO.class);

				mem.memberInsert(id, sha_pw.toString(), name, timestamp, box_code, addr, zipcode);
				return "joinmember/insertMem_ok";
			} catch (NoSuchAlgorithmException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return "joinmember/insertMem_error";			

			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return "joinmember/insertMem_error";	
			}
		}

	}
	@RequestMapping("/addrcheck")
	   public String addrcheck(Model model) {		
		return "joinmember/addrcheck";		     
	}
	@RequestMapping("/regist_history")
	   public String regist_history(HttpServletRequest request,HttpSession session) throws IOException{
		HistoryDAO his = sqlSession.getMapper(HistoryDAO.class);
		//MemberDAO mem = sqlSession.getMapper(MemberDAO.class);
		request.setCharacterEncoding("euc-kr");
		String invoice=request.getParameter("trans_num");
		String company = request.getParameter("company");
		String id = (String) session.getAttribute("ID");
		try {
			String box_code = his.BoxSelect(id);
			if (invoice.equals("")) {
				return "history/regist_null";
			} else {
				his.historyInsert(company, invoice, id, box_code);
				return "history/regist_ok";

			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			return "history/regist_error";
		}
	}

	@RequestMapping("/show_history")
	public String show_history(Model model, HttpSession session) {
		HistoryDAO his = sqlSession.getMapper(HistoryDAO.class);
		ArrayList<HistoryDTO> dto;
		try {
			dto = his.historySelect((String) session.getAttribute("ID"));
			if (dto.isEmpty()) {
				return "history/history_list_empty";
			} else {
				model.addAttribute("list", dto);
				return "history/history_list_ok";
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			return "history/history_list_error";
		}

	}

	@RequestMapping("/parse_history")
	   public String parse_history(Model model) {		
		return "history/parse_history";		     
	}
	@RequestMapping("/company_list")
	   public String company_list(Model model) {		
		return "main/company_list";		     
	}
	@RequestMapping("/del_history")
	   public String del_history(HttpServletRequest request,HttpSession session) {
		HistoryDAO his = sqlSession.getMapper(HistoryDAO.class);
		try {
			his.historyDelete(request.getParameter("trans_num"), (String)session.getAttribute("ID"));
			return "history/del_ok";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			return "history/del_error";
		}				     
	}
	@RequestMapping("/update_history")
	   public String update_history(HttpServletRequest request,HttpSession session) {		
		HistoryDAO his = sqlSession.getMapper(HistoryDAO.class);
		
		
		java.util.Date date = new Date();
		Timestamp timestamp = new Timestamp(date.getTime());

		try {
			his.historyUpdate(request.getParameter("trans_num"), (String)session.getAttribute("ID"),timestamp);
			return "history/update_ok";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			return "history/update_error";
		}
	}
	@RequestMapping("/open_door")
	   public String open_door(Model model,HttpSession session) {
		return "main/open_door";		     
	}
	@RequestMapping("/open_door_alert")
	   public String open_door_alert(Model model,HttpSession session) {
		String id=session.getAttribute("ID").toString();
		MemberDAO dao =sqlSession.getMapper(MemberDAO.class);
		String result="";
		try {
			dao.openDoor(id);
			result="success";
			model.addAttribute("result",result );
			return "main/open_door_alert";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			return "main/open_door_alert";
		}
				     
	}
	
}
