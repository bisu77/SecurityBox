package com.allin.web.dto;

public class HistoryDTO {
	private String company;
	private String trans_num;
	private String arrive_time;
	private String enroll_time;
	private String id;
	private String box_code;

		
	
	public HistoryDTO(String company, String trans_num, String arrive_time, String enroll_time, String id,String box_code) {
		this.company=company;
		this.trans_num= trans_num;
		this.arrive_time = arrive_time;
		this.enroll_time =enroll_time;
		this.id = id;
		this.box_code = box_code;		
	}
	public HistoryDTO()
	{
		
	}
	
	

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company= company;
	}
	public String getTrans_num() {
		return trans_num;
	}
	public void setTrans_num(String trans_num) {
		this.trans_num= trans_num;
	}
	public String getArrive_time() {
		return arrive_time;
	}
	public void setArrive_time(String arrive_time) {
		this.arrive_time= arrive_time;
	}
	public String getEnroll_time() {
		return enroll_time;
	}
	public void setEnroll_time(String enroll_time) {
		this.enroll_time= enroll_time;
	}
	public String getBox_code() {
		return box_code;
	}
	public void setBox_code(String box_code) {
		this.box_code = box_code;
	}
	}
