package com.home.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.home.entity.HomeAdmin;

public class AdminDao {

	public static int checkLogin(HomeAdmin admin) throws SQLException {
		
		Connection conn =null;
		PreparedStatement st =null;
		ResultSet rs = null;
		int result=0;
		
		try {
			conn=Config.config();
			 st=conn.prepareStatement("select * from home_admin where mobile=? and password=? ");  
			st.setString(1, admin.getMobile());
			st.setString(2, admin.getPassword());
			
			
			rs=st.executeQuery(); 
			String mobile="";
			String password="";
			while(rs.next()) {
				mobile=rs.getString(3);
				password=rs.getString(4);
				System.out.println(rs.getString(3) + " " + rs.getString(4));
				
			}
			if(mobile.equals(admin.getMobile()) &&  password.equals(admin.getPassword())) {
				result =1;
			}
			else {
				result=0;
			}
						
		}catch(Exception e) {
			e.printStackTrace();
			
		}finally {
			
			if(conn!=null) {
				st.close();
				rs.close();
				conn.close();								
			}
		}
		return result;
	}
	

	public static int veryfyLogin() {
		
		Connection conn =null;
		 
		conn=Config.config();

		
		
		return 0;
		
	}
	
	
}
