package com.home.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
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

public class GetStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 List<HomeDevice> res_data = new LinkedList<HomeDevice>();
		 HashMap<String,String> res=new HashMap<String,String>();  

		BufferedReader br = new BufferedReader(new  InputStreamReader(request.getInputStream()));
	    String json = "";
	    if(br != null){
	        json = br.readLine();
	    }
	    ObjectMapper mapper = new ObjectMapper();
	    HomeDevice device = mapper.readValue(json, HomeDevice.class);
	    System.out.println(json);
		
		response.setContentType("application/json");
		try {
			res_data=DeviceDao.getcontrol();
			System.out.println(res_data);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
	}
		
		
		
	}


