package com.lumodiem.common.sql;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlSessionTemplate {
	public static SqlSession getSqlSession() {
		SqlSession session = null;
		try {
			String path = "/mybatis-config.xml";
			InputStream is = Resources.getResourceAsStream(path);
			SqlSessionFactoryBuilder sfb = new SqlSessionFactoryBuilder();
			SqlSessionFactory sf = sfb.build(is);
			session = sf.openSession();
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		return session;
	}
	
	public static void commitRollback(SqlSession session, int temp) {
		if(temp > 0) {
			session.commit();
		} else {
			session.rollback();
		}
	}
	public static void commitRollback(int temp, SqlSession session) {
		if(temp > 0) {
			session.commit();
		} else {
			session.rollback();
		}
	}
}
