package com.rimi.util;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class JdbcTemplate {
	
	//链接数据库的参数
	private static String  driver;
	private static String  username;
	private static String  password;
	private static String  url;
	//操作数据库的对象
	private Connection con;
	private Statement  sta;
	private PreparedStatement psta;
	private ResultSet  rs;
	
	
	
	static {
		//获得配置文件信息
		InputStream  in=JdbcTemplate.class.getClassLoader().getResourceAsStream("jdbc.properties");
		//使用工具类去解析配置文件
		Properties  pro=new Properties();
		
		try {
			pro.load(in);
		} catch (IOException e) {
			e.printStackTrace();
		}
		//获取文件信息
		driver=pro.getProperty("driver");
		username=pro.getProperty("username");
		password=pro.getProperty("password");
		url=pro.getProperty("url");
		
		//加载驱动
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
	}
	//获得连接
	private void  getConnection() {
		try {
			con=DriverManager.getConnection(url, username, password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	//创建通道
	//状态通道
	private   void  createStatement() {
		this.getConnection();
		try {
			sta=con.createStatement();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	//与状态通道
	
	// 执行sql语句 
	// 基于状态通道查询  
	public  ResultSet query(String sql) {
		this.createStatement();
		
		try {
			rs=sta.executeQuery(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}
	// 基于状态通道修改
	public  int  update(String sql) {
		this.createStatement();
		int i=0;
		try {
			i= sta.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return  i;
	}
	// 基于预状态通道查询  
	// 基于预状态通道修改
	
	//关闭资源
	public  void  closeRes() {
		try {
			if(rs!=null) {
				rs.close();
			}
			if(sta!=null) {
				sta.close();
			}
			if(con!=null) {
				con.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	
}
