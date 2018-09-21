package com.home.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Config {

	public static Connection config() {
		 Connection conn = null;
		try {
			
		  Class.forName("com.mysql.jdbc.Driver");
			
			 conn = DriverManager.getConnection(  
			"jdbc:mysql://localhost:3306/home","root","password");
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}   
		return conn;
		
	}
	
	
}
