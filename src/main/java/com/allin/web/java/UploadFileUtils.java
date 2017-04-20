package com.allin.web.java;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.util.FileCopyUtils;

import com.allin.web.dao.IFDao;
import com.allin.web.dto.FDto;

import java.util.Calendar;

public class UploadFileUtils {
	
	public static String uploadFile(String uploadPath,String originalName,byte[]fileData) throws Exception{
		
		UUID uid = UUID.randomUUID();
		String savedName = uid.toString() + originalName.substring(originalName.lastIndexOf("."));
		String savedPath = calcPath(uploadPath);
		File target = new File(uploadPath + savedPath,savedName);
		FileCopyUtils.copy(fileData, target);
		
		return savedName;
	}
	
	
	public static String calcPath(String uploadPath){
		Calendar cal = Calendar.getInstance();
		String yearPath = File.separator + cal.get(Calendar.YEAR);
		String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH)+1);
		String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		
		makeDir(uploadPath,yearPath,monthPath,datePath);
		
		return datePath;
	}
	
	private static void makeDir(String uploadPath, String...paths){
		if(new File(paths[paths.length-1]).exists()){
			return ;
		}
		for(String path : paths){
			File dirPath = new File(uploadPath + path);
			if(!dirPath.exists()){
				dirPath.mkdir();
			}
		}
	}
}
