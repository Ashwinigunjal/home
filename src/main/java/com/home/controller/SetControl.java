package com.home.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.home.dao.DeviceDao;
import com.home.entity.HomeDevice;

/**
 * Servlet implementation class SetControl
 */
public class SetControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
//		List<HomeDevice> res_data = new LinkedList<HomeDevice>();
		 HashMap<String,String> res=new HashMap<String,String>();  

		BufferedReader br = new BufferedReader(new  InputStreamReader(request.getInputStream()));
	    String json = "";
	    if(br != null){
	        json = br.readLine();
	    }
	    ObjectMapper mapper = new ObjectMapper();
	    HomeDevice device = mapper.readValue(json, HomeDevice.class);
//		System.out.println(device.getControl() + " : "+ device.getDeviceName());
		
		response.setContentType("application/json");
		res.put("device_name", device.getDeviceName());
		try {
			int i = DeviceDao.setcontrol(device);
			if(i ==1) {
				device.setSt("1");
				res.put("st",device.getSt());
			}
			else {
				device.setSt("2");
				res.put("st",device.getSt());
			}
		} catch (SQLException e) {
			
			e.printStackTrace();

		}		 	
		 mapper.writeValue(response.getOutputStream(), res);		
		 System.out.println(res);
		
	}

}
