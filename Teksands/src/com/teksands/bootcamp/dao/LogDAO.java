package com.teksands.bootcamp.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.teksands.bootcamp.model.Bootcamp;
import com.teksands.bootcamp.model.Log;
import com.teksands.dbConfig.HibernateUtils;

public class LogDAO {
	
	public Log saveLog(Log log) {
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			session.save(log);
			
			session.getTransaction().commit();
		}
		catch(Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return log;
	}
	
	public List<Log> getAllLog()
	{
		Session session = null;
		Query query = null;
		List<Log> logList = null;
		
		try {
			
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			query = session.createQuery("from Log");
			logList = query.list();

			session.getTransaction().commit();
		}
		catch(Exception ex)
		{
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return logList;
	}
	
	public List<Log> getLatestLog(int maxResults) 
	{
		Session session = null;
		Query query = null;
		List<Log> logList = null;
		
		try
		{
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			query = session.createQuery("from Log order by id desc");
			query.setMaxResults(maxResults);
			logList = query.list();
			
			session.getTransaction().commit();
		}
		catch(Exception ex)
		{
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return logList;
	}
}


