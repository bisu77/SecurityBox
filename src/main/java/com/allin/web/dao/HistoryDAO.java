package com.allin.web.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.PreparedStatementSetter;

import com.allin.web.dto.HistoryDTO;

/*내가 할 DB 함수 정의만 해주면 됨!*/
public interface HistoryDAO {
   public ArrayList<HistoryDTO> historySelect(String id) throws Exception;
   public void historyInsert(String company, String trans_num,String id, String box_code) throws Exception;
   public String BoxSelect(String id) throws Exception;
   public void historyDelete(String trans_num,String id) throws Exception;
   public void historyUpdate(String trans_num,String id,Timestamp timestamp) throws Exception;
}