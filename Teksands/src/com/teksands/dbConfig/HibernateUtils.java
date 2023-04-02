package com.teksands.dbConfig;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateUtils {

	private static final SessionFactory sessionFactory = buildSessionFactory();
	
	@SuppressWarnings("deprecation")
	private static SessionFactory buildSessionFactory() {
		try {
			//return new Configuration().configure().buildSessionFactory();
			return new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
			
		} catch (Throwable ex) {
			System.err.println("Initial SessionFactory creation failed." + ex);
			throw new ExceptionInInitializerError(ex);
		}
	}
	
	public static Session getSession() {
		
		if(sessionFactory.isClosed())
		{
			return sessionFactory.openSession();
			
		}
		else
		{
			return sessionFactory.getCurrentSession();
		}
	}
	
}