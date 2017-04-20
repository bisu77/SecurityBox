package com.allin.web.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.DecimalFormat;
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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.allin.web.java.Criteria;
import com.allin.web.java.PageMaker;
import com.allin.web.java.SearchCriteria;
import com.allin.web.dao.IBDao;
import com.allin.web.dao.IFDao;
import com.allin.web.dto.BDto;
import com.allin.web.dto.FDto;
import com.allin.web.java.UploadFileUtils;

/**
 * Servlet implementation class BoardFrontController
 */


@Controller
public class BController {
	
	@Resource(name="downloadView")		// resource�� servlet-context���� ������ �� �״�� ����
	private View downloadView;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@Autowired
	private SqlSession sqlSession;		// Autowired�� resource�� ���� ��� �ٵ� ���� �ٸ����� ��Ȯ�� �𸣰ڴ�

	@Autowired
	public void setTemplate(JdbcTemplate template) {

	}
	
	// request��ü(jsp->controller ������ ����)
	// model��ü(controller->jsp ������ ����)
	// session��ü(session ����)

	
	
	@RequestMapping("/write_view")
	public String write_view(@ModelAttribute("cri") SearchCriteria cri,Model model) {
		model.addAttribute("cri", cri);
		return "board/write_view";
	}
	@RequestMapping("/list")
	public String list(Criteria cri,Model model){
		IBDao dao = sqlSession.getMapper(IBDao.class);
		model.addAttribute("list", dao.list());
		
		return "board/list_android";
	}
	@RequestMapping(value = "/modify_view", method=RequestMethod.POST)
	public String modify_view(@ModelAttribute("cri") SearchCriteria cri,HttpServletRequest request,Model model) {
		IBDao dao = sqlSession.getMapper(IBDao.class);
		model.addAttribute("modify_view", dao.contentView(request.getParameter("bId")));
		model.addAttribute("cri", cri);
		return "board/modify_view";
	}
	
	@RequestMapping(value = "/write",method=RequestMethod.POST)
	public String write(@ModelAttribute("cri") SearchCriteria cri,RedirectAttributes rttr,HttpServletRequest request, HttpSession session,MultipartFile file,Model model) throws Exception {
		IBDao dao =sqlSession.getMapper(IBDao.class);
		Integer currval = dao.getCurrval();
		
		if(!file.isEmpty()){
			dao.write((String)session.getAttribute("ID"), request.getParameter("bTitle"), request.getParameter("bContent"),currval,"T");
			IFDao fdao = sqlSession.getMapper(IFDao.class);
			Integer bId = fdao.bId_max();
			String savedName = UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());
			String date = UploadFileUtils.calcPath(uploadPath);
			fdao.file_write(bId,file.getOriginalFilename(), savedName , (int)file.getSize(),date);
			//model.addAttribute("savedName", savedName);
		}
		else{
			dao.write((String)session.getAttribute("ID"), request.getParameter("bTitle"), request.getParameter("bContent"),currval,"F");
		}
		
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		String msg = "WRITE_SUCCESS";
		rttr.addAttribute("msg", msg);
		return "redirect:listPage";
	}

	
	
	@RequestMapping("/content_view")
	public String content_view(@ModelAttribute("cri") SearchCriteria cri,HttpServletRequest request, Model model,HttpSession session){
		
		if(session.getAttribute("ID")!=null){
			IBDao dao = sqlSession.getMapper(IBDao.class);
			IFDao fdao = sqlSession.getMapper(IFDao.class);
			dao.upHit(request.getParameter("bId"));
			System.out.println("ddddddddddddd");
			System.out.println(request.getParameter("bId"));
			FDto fdto = fdao.file_select(request.getParameter("bId"));
			
			model.addAttribute("content_view", dao.contentView(request.getParameter("bId")));
			model.addAttribute("file_select",fdto);
			
			model.addAttribute("cri", cri);
		}
		else{
			IBDao dao = sqlSession.getMapper(IBDao.class);
			IFDao fdao = sqlSession.getMapper(IFDao.class);
			dao.upHit(request.getParameter("bId"));
			System.out.println("sssssssssss");
			System.out.println(request.getParameter("bId"));
			FDto fdto = fdao.file_select(request.getParameter("bId"));
			
			model.addAttribute("content_view", dao.contentView(request.getParameter("bId")));
			model.addAttribute("file_select",fdto);
			
			session.setAttribute("ID",request.getParameter("id"));
			model.addAttribute("cri", cri);
		}
		return "board/content_view";
		
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.POST )
	public String modify(@ModelAttribute("cri") SearchCriteria cri,HttpServletRequest request, Model model,MultipartFile file,RedirectAttributes rttr) throws Exception, Exception{

		IBDao dao = sqlSession.getMapper(IBDao.class);
		
		if(!file.isEmpty()){
			dao.modify(request.getParameter("bName"), request.getParameter("bTitle"), request.getParameter("bContent"),request.getParameter("bId"),"T");
			
			IFDao fdao = sqlSession.getMapper(IFDao.class);
			FDto fdto = fdao.file_select(request.getParameter("bId"));
			
			serverFileDelete(uploadPath + fdto.getDate() + "\\" + fdto.getStored_file_name());
			fdao.delete_file(request.getParameter("bId"));

			String savedName = UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());
			String date = UploadFileUtils.calcPath(uploadPath);
			fdao.file_write(Integer.valueOf(request.getParameter("bId")),file.getOriginalFilename(), savedName , (int)file.getSize(),date);
		}
		else{
			BDto dto = dao.contentView(request.getParameter("bId"));
			if(dto.getbFile().equals("T")){
				dao.modify(request.getParameter("bName"), request.getParameter("bTitle"), request.getParameter("bContent"),request.getParameter("bId"),"T");
			}
			else{
				dao.modify(request.getParameter("bName"), request.getParameter("bTitle"), request.getParameter("bContent"),request.getParameter("bId"),"F");
			}
		}
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		String msg="MODIFY_SUCCESS";
		rttr.addAttribute("msg", msg);
		return "redirect:listPage";
	}
	
	@RequestMapping("/file_down")
	public ModelAndView file_down(@RequestParam("bId")String bId){
		ModelAndView mav = new ModelAndView();
		
		mav.setView(this.downloadView);
		IFDao fdao = sqlSession.getMapper(IFDao.class);
		FDto fdto = fdao.file_select(bId);
		
		
		String datePath = fdto.getDate();
		File downloadFile = new File(uploadPath + datePath + "\\" + fdto.getStored_file_name());
		
		mav.addObject("downloadFile",downloadFile);
		
		return mav;
	}
	
	
	@RequestMapping("/reply_view")
	public String reply_view(@ModelAttribute("cri") SearchCriteria cri,HttpServletRequest request, Model model,HttpSession session){
		
		IBDao dao = sqlSession.getMapper(IBDao.class);
		model.addAttribute("reply_view", dao.reply_view(request.getParameter("bId")));
		model.addAttribute("ID", session.getAttribute("ID"));
		model.addAttribute("cri",cri);

		return "board/reply_view";
	}
	
	@RequestMapping("/reply")
	public String reply(@ModelAttribute("cri") SearchCriteria cri,HttpServletRequest request, Model model,MultipartFile file,RedirectAttributes rttr) throws IOException, Exception {
		
		IBDao dao = sqlSession.getMapper(IBDao.class);
		dao.replyShape(request.getParameter("bGroup"), request.getParameter("bStep"));
		
		
		if(!file.isEmpty()){
			dao.reply(request.getParameter("bName"), request.getParameter("bTitle"), request.getParameter("bContent"), request.getParameter("bGroup"), request.getParameter("bStep"), request.getParameter("bIndent"),"T");

			IFDao fdao = sqlSession.getMapper(IFDao.class);
			Integer bId = fdao.bId_max();
			String savedName = UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());
			String date = UploadFileUtils.calcPath(uploadPath);
			fdao.file_write(bId,file.getOriginalFilename(), savedName , (int)file.getSize(),date);

		}
		else{
			dao.reply(request.getParameter("bName"), request.getParameter("bTitle"), request.getParameter("bContent"), request.getParameter("bGroup"), request.getParameter("bStep"), request.getParameter("bIndent"),"F");
		}
		
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		String msg = "REPLY_SUCCESS";
		rttr.addAttribute("msg", msg);
		return "redirect:listPage";
	}
	
	@RequestMapping(value = "/delete",method=RequestMethod.POST)
	public String delete(@ModelAttribute("cri") SearchCriteria cri,HttpServletRequest request, Model model,RedirectAttributes rttr) {

		IBDao dao = sqlSession.getMapper(IBDao.class);
		BDto dto = dao.contentView(request.getParameter("bId"));
		
		if(dto.getbFile().equals("T")){
			IFDao fdao = sqlSession.getMapper(IFDao.class);
			FDto fdto = fdao.file_select(request.getParameter("bId"));
			
			serverFileDelete(uploadPath + fdto.getDate() + "\\" + fdto.getStored_file_name());
			fdao.delete_file(request.getParameter("bId"));
		
		}
		
		dao.delete(request.getParameter("bId"));
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		String msg = "DELETE_SUCCESS";
		rttr.addAttribute("msg", msg);
		return "redirect:listPage";
	}
	
	public static void serverFileDelete(String path){
		File file = new File(path);
		if(file.exists()==true){
			file.delete();
		}
		
	}
	@RequestMapping(value="listPage", method = RequestMethod.GET)
	public String listPage(@ModelAttribute("cri") SearchCriteria cri, HttpSession session,Model model,HttpServletRequest request,RedirectAttributes rttr) throws Exception{
		IBDao dao = sqlSession.getMapper(IBDao.class);
		String result=request.getParameter("msg");

		int page = cri.getPage();
		
		if(page<=0){
			page = 1;
		}
		page = (page -1) * 10;
		model.addAttribute("list", dao.listSearch(cri));
				
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(cri);
		pageMaker.setTotalCount(dao.listSearchCount(cri));
		
		model.addAttribute("pageMaker", pageMaker);
		rttr.addFlashAttribute("msg", result);		
		return "board/list";
	}
	
}
