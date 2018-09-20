package com.home.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.home.dao.DeviceDao;

/**
 * Servlet implementation class GetList
 */
public class GetList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		  ObjectMapper mapper = new ObjectMapper();
		  List<String> ll;
		try {
			ll = DeviceDao.getlist();
			 mapper.writeValue(response.getOutputStream(), ll);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 		
	
	}

}
