package com.allin.web.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.PreparedStatementSetter;

import com.allin.web.java.SearchCriteria;
import com.allin.web.dto.BDto;

/*���� �� DB �Լ� ���Ǹ� ���ָ� ��!*/
public interface IBDao {
	public ArrayList<BDto> list();
	public Integer getCurrval();
	public void write(String bName, String bTitle, String bContent, Integer currval,String file);
	public void upHit(final String bId);
	public BDto contentView(String strId);
	public void modify(final String bId,final String bName,final String bTitle, final String bContent,String file);
	public void delete(final String bId);
	public BDto reply_view(String strId);
	public void reply(final String bName,final String bTitle, final String bContent,final String bGroup,final String bStep,final String bIndent,String bFile);
	public void replyShape(final String strGroup, final String strStep);
	public Integer count();
	public ArrayList<BDto> listPage(int page);
	
	public ArrayList<BDto> listSearch(SearchCriteria cri) throws Exception;
	public int listSearchCount(SearchCriteria cri) throws Exception;
}
