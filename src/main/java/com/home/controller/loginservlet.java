package com.home.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.home.dao.AdminDao;
import com.home.entity.HomeAdmin;

import com.sun.org.apache.bcel.internal.generic.AALOAD;


public class loginservlet extends HttpServlet {
	
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		String command = request.getParameter("command");
		String mobile = request.getParameter("mobile");
		String password = request.getParameter("password");
		out.println(command);
		out.println(mobile);
		out.println(password);
		
		if(command.equals("login")) {
			
			out.println("inside if");
			HomeAdmin admin = new HomeAdmin();
			admin.setMobile(mobile);
			admin.setPassword(password);
			try {
				int data =AdminDao.checkLogin(admin);
				if(data == 1) {
					 HttpSession session=request.getSession();  
					if(session !=null) {
				    	session.setAttribute("mobile",mobile );
				    	session.setAttribute("pass",password);
					}
				    	response.sendRedirect("home.jsp");
					
				}else {
					request.setAttribute("errorMessage", "Invalid Username & Password");
			    	getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
					
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
		}
		
		
		
		
		
	}

}
