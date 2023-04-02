package com.teksands.user.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.teksands.dbConfig.HibernateUtils;
import com.teksands.user.model.Contactus;
import com.teksands.user.model.Ebooks;
import com.teksands.user.model.EbooksDownload;

public class EbooksDAO {

	public List<Ebooks> getAllEbooksByPageId (Integer pageId)
	
	{
		Session session = null;
		Query query = null;
		List<Ebooks> ebooksList = null;
		
		try {
			
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			query = session.createQuery("from Ebooks order by id desc");
			query.setFirstResult(pageId * 3);
			query.setMaxResults(3);
			
			ebooksList = query.list();
			
			session.getTransaction().commit();
		}
		catch(Exception ex)
		{
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return ebooksList;
	}
	public Ebooks getEbooksbyId (Integer pageId)
	
	{
		Session session = null;
		Query query = null;
	    Ebooks ebook = null;
		
		try {
			
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			query = session.createQuery("from Ebooks where id=:id");
			query.setParameter("id", pageId);
			ebook = (Ebooks) query.list().get(0);
			
			session.getTransaction().commit();
		}
		catch(Exception ex)
		{
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return ebook;
	}
	public Boolean saveEbooksContacts (EbooksDownload ebooksDownload) {
		
		Boolean result = false;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			session.save(ebooksDownload);
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
}
