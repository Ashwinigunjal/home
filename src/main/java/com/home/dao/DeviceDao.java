package com.home.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
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
	
//*****************set status*****************************************	

public static int adddevice(HomeDevice device) throws SQLException {
		
		Connection conn =null;
		PreparedStatement st =null;
		int rs =0;
		int result=0;
		
		try {
			conn=Config.config();
			st=conn.prepareStatement("insert into home_device(device_name) values(?)");  
			st.setString(1, device.getDeviceName());
			
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
public static List getstatus() throws SQLException {
	
	Connection conn =null;
	PreparedStatement st =null;
	ResultSet rs = null;
	int result=0;
	HomeDevice device  = new HomeDevice() ;
	List ll=new ArrayList();
		
	
	try {
		conn=Config.config();
		st=conn.prepareStatement("select Max(id), device_name,status,device_type  from home_device where device_type=1 GROUP by device_name ");  
		
		rs=st.executeQuery(); 
		
		while(rs.next()) {
			HashMap<String,String> res=new HashMap<String,String>();
			res.put("device_name", rs.getString(2));
			res.put("device_type", rs.getString(4));
			res.put("status", rs.getString(3));
			System.out.println("*********************");
			System.out.println(rs.getString(2)+" : "+ rs.getString(4) +" : "+ rs.getString(3));
			System.out.println("*********************");
//			System.out.println(res);
			ll.add(res);
//			System.out.println(ll);
			
		}
		System.out.println(ll);
					
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

//*****************Get List*****************************************
public static List<String> getlist() throws SQLException {
	
	Connection conn =null;
	PreparedStatement st =null;
	ResultSet rs = null;
	int result=0;
	HomeDevice device  = new HomeDevice() ;
	List<String> ll=new ArrayList<String>();
	
	try {
		conn=Config.config();
		st=conn.prepareStatement("select distinct device_name from home_device  where device_type=1");  
		
		rs=st.executeQuery(); 
		
		while(rs.next()) {
			
			ll.add(rs.getString("device_name"));
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
