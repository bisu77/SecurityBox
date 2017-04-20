package com.allin.web.java;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

import com.allin.web.dao.IFDao;
import com.allin.web.dto.FDto;
 
public class DownloadView extends AbstractView {

	@Autowired
	private SqlSession sqlSession;

	@Autowired
	public void setTemplate(JdbcTemplate template) {

	}

	public DownloadView() {
        setContentType("applicaiton/download;charset=utf-8");
    }

	 private void setDownloadFileName(String fileName, HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
	        String userAgent = request.getHeader("User-Agent");

	        boolean isIe = userAgent.indexOf("MSIE") != -1;
	        if(isIe){
	            fileName = URLEncoder.encode(fileName, "UTF-8");
	            System.out.println("1 : " + fileName);
	        } else {
	            fileName = URLEncoder.encode(fileName, "UTF-8");
	            System.out.println("2 : " + fileName);
	        }
	        

	        response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\";");
	        response.setHeader("Content-Transfer-Encoding", "binary");
	        response.setHeader("Content-Type", "application/octet-stream");
	        

	    }
    private void downloadFile(File downloadFile, HttpServletRequest request, HttpServletResponse response) throws Exception {
        OutputStream out = response.getOutputStream();
        FileInputStream in = new FileInputStream(downloadFile);

        try {
            FileCopyUtils.copy(in, out);
            out.flush();
        } catch (Exception e) {
            throw e;
        } finally {
            try { if (in != null) in.close(); } catch (IOException ioe) {}
            try { if (out != null) out.close(); } catch (IOException ioe) {}
        }
    }

    @Override
    protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request, HttpServletResponse response) throws Exception {
        try {
            this.setResponseContentType(request, response);
            
            File downloadFile = (File) model.get("downloadFile");

            if (logger.isDebugEnabled()) {
                logger.debug("downloadFile: " + downloadFile);
            }

            IFDao fdao = sqlSession.getMapper(IFDao.class);
    		String fileName = fdao.get_original_name(downloadFile.getName());
            
            /*this.setDownloadFileName(downloadFile.getName(), request, response);*/
    		this.setDownloadFileName(fileName, request, response);

            response.setContentLength((int) downloadFile.length());
            this.downloadFile(downloadFile, request, response);
        } catch (Exception e) {
            throw e;
        }
       
    }
    
}
