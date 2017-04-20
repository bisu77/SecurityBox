package com.allin.web.java;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class ParseHistory {

	String url = "http://tracking.sweettracker.net/tracking"; //
	String key = "ODaww62B9zsxfAqRLrQ3GA";
	String code;
	String invoice;
	String company;

	public ParseHistory(String code, String invoice) throws Exception{
		this.company = code;


		 if (code.equals("우체국택배"))
	            this.code = "01";
	      else if (code.equals("CJ대한통운"))
	           this.code = "04";
	      else if (code.equals("한진택배"))
	           this.code = "05";
	      else if (code.equals("로젠택배"))
	           this.code = "06";
	      else if (code.equals("현대택배"))
	           this.code = "08";
	      else if (code.equals("KGB택배"))
	           this.code = "10";
	      else if (code.equals("일양로지스"))
	           this.code = "11";
	      else if (code.equals("EMS"))
	           this.code = "12";
	      else if (code.equals("기타"))
	           this.code = "99";
	      else
	           this.code = "99";
		
		this.invoice = invoice;
		
	}

	public HistoryInfo parser() {
		HistoryInfo info=null ;
		try{
		String furl = String.format("%s/?t_key=%s&t_code=%s&t_invoice=%s", url, key, code, invoice);

	
		URL obj = new URL(furl);
		HttpURLConnection httpConn = (HttpURLConnection) obj.openConnection();

		httpConn.setRequestMethod("GET");
		httpConn.setRequestProperty("User-Agent", "Mozilla/5.0");
		httpConn.setRequestProperty("Accept", "application/json");

		BufferedReader in = new BufferedReader(new InputStreamReader(httpConn.getInputStream(),"utf-8"));

		String inputLine;
		StringBuffer response = new StringBuffer();

		while ((inputLine = in.readLine()) != null) {
			response.append(inputLine);
		}

		in.close();

		JSONParser jsonParser = new JSONParser();

		JSONObject jsonObject = (JSONObject) jsonParser.parse(response.toString());
		if(jsonObject.get("result").toString().equals("N")){
			return null;
		}
		
		String item = (String)jsonObject.get("itemName");		
		String estimate = (String) jsonObject.get("estimate");
		String receiver = (String)jsonObject.get("receiverName");
		String sender = (String)jsonObject.get("senderName");
		String receiverAddr= (String)jsonObject.get("receiverAddr");
		
		JSONObject transInfo = (JSONObject)jsonObject.get("lastDetail");
		String time = (String)transInfo.get("timeString");
		String where = (String)transInfo.get("where");
		String kind= (String)transInfo.get("kind");
		String worker_name= (String) transInfo.get("manName");
		String worker_phone= (String) transInfo.get("telno2");
		Long level= (Long) transInfo.get("level");
		String img_name="delivery.png";
		
				
			if (item.equals("") || item.equals("null")) {
				item = "미정";
			}
			if (estimate == null) {
				estimate = "미정";
			} else {
				if (estimate.equals("")) {
					estimate = "미정";
				}
			}
			if (receiver.equals("") || receiver.equals("null")) {
				receiver = "미정";
			}
			if (sender.equals("") || sender.equals("null")) {
				sender = "미정";
			}
			if (receiverAddr == null) {
				receiverAddr = "미정";
			} else {
				if (receiverAddr.equals("")) {
					receiverAddr = "미정";
				}
			}
			if (time.equals("") || time.equals("null")) {
				time = "미정";
			}
			if (where.equals("") || where.equals("null")) {
				where = "미정";
			}
			if (kind.equals("") || kind.equals("null")) {
				kind = "미정";
			}			
			if (worker_name == null) {
				worker_name = "미정";
			} else {
				if (worker_name.equals("")) {
					worker_name = "미정";
				}
			}
			if (worker_phone == null) {
				worker_phone = "미정";
			} else {
				if (worker_phone.equals("")) {
					worker_phone = "미정";
				}
			}
			
			if(level==6)
			{
				img_name="complete.png";
			}
		
		
		
		info = new HistoryInfo(item,invoice,estimate,receiver,sender,receiverAddr,time,where,kind,worker_name,worker_phone,img_name);
		
		}
		catch(IOException e)
		{
			 e.printStackTrace();
		}
		catch(org.json.simple.parser.ParseException e)
		{
			 e.printStackTrace();
		}
		return info;

	}

}
