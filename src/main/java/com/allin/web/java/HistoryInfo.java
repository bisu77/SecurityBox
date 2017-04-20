package com.allin.web.java;

public class HistoryInfo {
	private String item;
	private String invoice;
	private String estimate;
	private String receiver;
	private String sender;
	private String receiverAddr;
	private String time;
	private String where;
	private String kind;
	private String worker_name;
	private String worker_phone;
	private String img_name;

	public HistoryInfo(String item, String invoice, String estimate, String receiver, String sender,
			String receiverAddr, String time, String where, String kind, String worker_name, String worker_phone,String img_name) {
		this.item = item;
		this.invoice = invoice;
		this.estimate = estimate;
		this.receiver = receiver;
		this.sender = sender;
		this.receiverAddr = receiverAddr;
		this.time = time;
		this.where = where;
		this.kind = kind;
		this.worker_name = worker_name;
		this.worker_phone = worker_phone;
		this.img_name = img_name;

	}

	public HistoryInfo() {

	}

	public String getItem() {
		return item;
	}

	public void setItem(String item) {
		this.item = item;
	}

	public String getInvoice() {
		return invoice;
	}

	public void setInvoice(String invoice) {
		this.invoice = invoice;
	}

	public String getEstimate() {
		return estimate;
	}

	public void setEstimate(String estimate) {
		this.estimate = estimate;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getReceiverAddr() {
		return receiverAddr;
	}

	public void setReceiverAddr(String receiverAddr) {
		this.receiverAddr = receiverAddr;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getWhere() {
		return where;
	}

	public void setWhere(String where) {
		this.where = where;
	}

	public String getKind() {
		return kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
	}

	public String getWorker_name() {
		return worker_name;
	}

	public void setWorker_name(String worker_name) {
		this.worker_name = worker_name;
	}

	public String getWorker_phone() {
		return worker_phone;
	}

	public void setWorker_phone(String worker_phone) {
		this.worker_phone = worker_phone;
	}
	public String getImg_name() {
		return img_name;
	}

	public void setImg_name(String img_name) {
		this.img_name = img_name;
	}

	
}
