package com.teksands.user.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.teksands.dbConfig.HibernateUtils;
import com.teksands.user.model.Courses;
import com.teksands.user.model.Ebooks;
import com.teksands.user.model.EbooksDownload;
import com.teksands.user.model.WebinarContacts;
import com.teksands.user.model.Webinars;

public class WebinarsDAO {
	
	public List<Webinars> getAllWebinarsByPageId(Integer pageId, String category) 
	{
		Session session = null;
		Query query = null;
		List<Webinars> webinarList = null;
		
		try
		{
			session = HibernateUtils.getSession();
			session.getTransaction().begin();

			if(!category.isEmpty()) 
			{
				query = session.createQuery("from Webinars where category =:category and status = 1 order by id desc");
				query.setParameter("category", category);
			}else 
			{
				query = session.createQuery("from Webinars where status = 1 order by id desc");
				query.setParameter("categoryAll", category);
			}
			
			query.setFirstResult(pageId * 3);
			query.setMaxResults(4);
			webinarList = query.list();
			
			session.getTransaction().commit();
		}
		catch(Exception ex)
		{
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return webinarList;
		
	}
	public List<Webinars> getWebinarsByPageId(Integer pageId)
	{
		Session session = null;
		Query query = null;
		List<Webinars> webinarList = null;
		
		try
		{
			session = HibernateUtils.getSession();
			session.getTransaction().begin();

			query = session.createQuery("from Webinars where status = 1 order by id desc");
			webinarList = query.list();
			
			session.getTransaction().commit();
		}
		catch(Exception ex)
		{
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return webinarList;
		
	}
	
	public Webinars getWebinarsbyId (Integer pageId)
	
	{
		Session session = null;
		Query query = null;
		Webinars webinars = null;
		
		try {
			
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			query = session.createQuery("from Webinars where id=:id and status = 1");
			query.setParameter("id", pageId);
			webinars = (Webinars) query.list().get(0);
			
			session.getTransaction().commit();
		}
		catch(Exception ex)
		{
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return webinars;
	}
	public Boolean saveWebinarsContacts (WebinarContacts webinarContacts) {
		
		Boolean result = false;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			session.save(webinarContacts);
			result = true;
			
			session.getTransaction().commit();
		}
		catch(Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
			return result;
		}
		return result;
	}
	public List<Webinars> getActiveWebnars(int maxResults) 
	{
		Session session = null;
		Query query = null;
		List<Webinars> webinarsActiveList = null;
		
		try
		{
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			query = session.createQuery("from Webinars where status = 1 order by id desc");
			query.setMaxResults(maxResults);
			webinarsActiveList = query.list();
			
			session.getTransaction().commit();
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return webinarsActiveList;
	}
	public List<Webinars> getInActiveWebnars(Integer pageId)
	{
		Session session = null;
		Query query = null;
		List<Webinars> inactivewebinarList = null;
		
		try
		{
			session = HibernateUtils.getSession();
			session.getTransaction().begin();

			query = session.createQuery("from Webinars where status = 0 order by id desc");
			inactivewebinarList = query.list();
			
			session.getTransaction().commit();
		}
		catch(Exception ex)
		{
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return inactivewebinarList;
		
	}

}
