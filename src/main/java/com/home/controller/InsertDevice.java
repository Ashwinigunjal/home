package com.home.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.home.dao.DeviceDao;
import com.home.entity.HomeDevice;

/**
 * Servlet implementation class InsertDevice
 */
public class InsertDevice extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertDevice() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String devicename= request.getParameter("dev_name");
		HomeDevice device =new HomeDevice();
		device.setDeviceName(devicename);
		int r=0;
		try {
			r = DeviceDao.adddevice(device);
			System.out.println(r);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(r==1) {
			response.sendRedirect("home.jsp");
		}
	}

}
