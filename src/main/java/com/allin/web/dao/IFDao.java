package com.allin.web.dao;

import com.allin.web.dto.FDto;

public interface IFDao {
	public void file_write(Integer bId,String originalName, String storedName, int fileSize,String date);
	public Integer bId_max();
	public FDto file_select(String bId);
	public String get_original_name(String stored_file_name);
	public void delete_file(String bId);
	public String get_date(String bId);
}
