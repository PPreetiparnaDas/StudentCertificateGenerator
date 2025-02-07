package com.otz.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DbConnection {
	
	
	public static Connection getConnection() {
		Connection con=null;
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");  
			con=DriverManager.getConnection( "jdbc:mysql://localhost:3306/studentcirtificate","root","preeti"); 
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return con;
	}

	public static String Path() {
		return "C:/Users/daspr/Downloads/Telegram Desktop/CAREPLUS (2)/CAREPLUS/src/main/webapp/Images";		
	}

	
}
