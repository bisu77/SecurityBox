package com.allin.web.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.allin.web.dto.MemberDTO;

public interface MemberDAO{
	public ArrayList<MemberDTO> memberSelect() throws Exception;
	public MemberDTO one_memberSelect(String id) throws Exception;
	public MemberDTO find_id(String name,String box_code) throws Exception;
	public MemberDTO find_pw(String id, String name, String box_code) throws Exception;
	public void modify_pw(String id, String pw) throws Exception;
	public void memberInsert(String userId,String userPassword,String userName, Timestamp timestamp,String userBox_code,String userAddress,String userZipcode) ;
	public void openDoor(String id) throws Exception;
	
}
