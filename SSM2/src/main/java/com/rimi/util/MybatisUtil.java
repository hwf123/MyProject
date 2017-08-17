package com.rimi.util;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.tomcat.jdbc.pool.DataSourceFactory;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;

public class MybatisUtil {

	
	public static SqlSession getSession() {
		
		try {
			//得到配置文件的流信息
			InputStream  in=Resources.getResourceAsStream("mybatis-config.xml");
			// 解析配置文件  并得到 session工厂
			SqlSessionFactory sf=new  SqlSessionFactoryBuilder().build(in);
			// 获得、打开 session 会话
			return  sf.openSession();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	
}
