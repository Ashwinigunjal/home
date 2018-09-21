package com.home.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletContextAttributeEvent;
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
		 List<HashMap<String,String>> res_data = new LinkedList<HashMap<String,String>>();
		 HashMap<String,String> res=new HashMap<String,String>();	
	    ObjectMapper mapper = new ObjectMapper();
	  
		response.setContentType("application/json");
		try {
			res_data=DeviceDao.getstatus();
			System.out.println(res_data);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		mapper.writeValue(response.getOutputStream(),res_data);
	}
		
		
		
	}


