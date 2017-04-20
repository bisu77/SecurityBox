package com.allin.web.dto;

public class MemberDTO {
	private String id;
	private String password;
	private String name;
	private String box_code;
	private String join_date;
	private String address;
	private int door_state;
	
	
	
	public MemberDTO(String id, String password, String name, String box_code, String join_date, String address,
			int door_state) {
		this.id = id;
		this.password = password;
		this.name = name;
		this.box_code = box_code;
		this.join_date = join_date;
		this.address = address;
		this.door_state = door_state;
	}
	public MemberDTO()
	{}
	

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBox_code() {
		return box_code;
	}
	public void setBox_code(String box_code) {
		this.box_code = box_code;
	}
	public String getJoin_date() {
		return join_date;
	}
	public void setJoin_date(String join_date) {
		this.join_date = join_date;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getDoor_state() {
		return door_state;
	}
	public void setDoor_state(int door_state) {
		this.door_state = door_state;
	}
	

}
