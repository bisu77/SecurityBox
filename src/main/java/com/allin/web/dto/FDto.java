package com.allin.web.dto;

public class FDto {
	int bId;
	String original_file_name;
	String stored_file_name;
	int file_size;
	String date;
	
	public FDto(){
		
	}
	
	
	public FDto(int bId, String original_file_name, String stored_file_name, int file_size,String date) {
		
		this.bId = bId;
		this.original_file_name = original_file_name;
		this.stored_file_name = stored_file_name;
		this.file_size = file_size;
		this.date=date;
	}
	
	
	public int getbId() {
		return bId;
	}
	public void setbId(int bId) {
		this.bId = bId;
	}
	public String getOriginal_file_name() {
		return original_file_name;
	}
	public void setOriginal_file_name(String original_file_name) {
		this.original_file_name = original_file_name;
	}
	public String getStored_file_name() {
		return stored_file_name;
	}
	public void setStored_file_name(String stored_file_name) {
		this.stored_file_name = stored_file_name;
	}
	public int getFile_size() {
		return file_size;
	}
	public void setFile_size(int file_size) {
		this.file_size = file_size;
	}


	public String getDate() {
		return date;
	}


	public void setDate(String date) {
		this.date = date;
	}
	
	
	
	
	
}
