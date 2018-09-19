package com.home.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.home.entity.HomeDevice;

public class DeviceDao {


//*****************set status*****************************************	
	
public static int setcontrol(HomeDevice device) throws SQLException {
		
		Connection conn =null;
		PreparedStatement st =null;
		int rs =0;
		int result=0;
		
		try {
			conn=Config.config();
			st=conn.prepareStatement("insert into home_device(device_name,control) values(?,?)");  
			st.setString(1, device.getDeviceName());
			st.setString(2, device.getControl());
			
			
			rs=st.executeUpdate(); 
			if(rs>0) {
				result=1;
			}else {
				result=0	;
						}
						
		}catch(Exception e) {
			e.printStackTrace();
			
		}finally {
			
			if(conn!=null) {
				st.close();
				conn.close();								
			}
		}
		return result;
	}
	

//*****************get status*****************************************
public static List<HomeDevice> getcontrol() throws SQLException {
	
	Connection conn =null;
	PreparedStatement st =null;
	ResultSet rs = null;
	int result=0;
	HomeDevice device  = new HomeDevice() ;
	List<HomeDevice> ll=new ArrayList<HomeDevice>();
	
	try {
		conn=Config.config();
		st=conn.prepareStatement("select * from home_device ");  
		
		rs=st.executeQuery(); 
		
		while(rs.next()) {
			device.setDeviceName(rs.getString("device_name"));
			device.setStatus(rs.getString("status"));
			ll.add(device);
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
	return ll;
}



	
}
