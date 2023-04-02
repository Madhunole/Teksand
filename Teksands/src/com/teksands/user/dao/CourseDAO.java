package com.teksands.user.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.teksands.dbConfig.HibernateUtils;
import com.teksands.user.model.Blogs;
import com.teksands.user.model.Courses;
import com.teksands.user.model.Ebooks;

public class CourseDAO {

	public List<Courses> getAllCoursesByPageId(Integer pageId, String tag) 
	{
		Session session = null;
		Query query = null;
		List<Courses> coursesList = null;
		
		try
		{
			session = HibernateUtils.getSession();
			session.getTransaction().begin();

			query = session.createQuery("from Courses where tags like :tags order by id desc");
			query.setParameter("tags", "%"+tag+"%");
			
			query.setFirstResult(pageId * 4);
			query.setMaxResults(4);
			coursesList = query.list();
			
			session.getTransaction().commit();
		}
		catch(Exception ex)
		{
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return coursesList;
		
	}
	
	public List<Courses> getAllCoursesByPageId (Integer pageId)
	
	{
		Session session = null;
		Query query = null;
		List<Courses> coursesList = null;
		
		try {
			
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			query = session.createQuery("from Courses order by id desc");
			query.setFirstResult(pageId * 6);
			query.setMaxResults(6);
			
			coursesList = query.list();
			
			session.getTransaction().commit();
		}
		catch(Exception ex)
		{
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return coursesList;
	}
	
}
