package com.teksands.bootcamp.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.teksands.bootcamp.model.Bootcamp;
import com.teksands.bootcamp.model.Candidate;
import com.teksands.bootcamp.model.MentorMaster;
import com.teksands.dbConfig.HibernateUtils;

public class BootcampDAO {
		
	public List<Bootcamp> getAllBootcamp()
	{
		Session session = null;
		Query query = null;
		List<Bootcamp> bootcampList = null;
		
		try {
			
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			query = session.createQuery("from Bootcamp");
			bootcampList = query.list();

			session.getTransaction().commit();
		}
		catch(Exception ex)
		{
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return bootcampList;
	}
	
	public List<String> getAllBootcampNames(String name)
	{
		Session session = null;
		Query query = null;
		List<String> bootcampNameList = null;
		
		try
		{
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			query = session.createQuery("select distinct name from Bootcamp where active = 1");
			query.setString("name", name);
			bootcampNameList = query.list();

			session.getTransaction().commit();
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			session.getTransaction().rollback();
		}
		return bootcampNameList;
	}
	
	public Bootcamp getBootcampById(Integer id)
	{
		Session session = null;
		Query query = null;
		Bootcamp bootcamp = null;
		try 
		{
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			query = session.createQuery("from Bootcamp where id = :id");
			query.setParameter("id", id);
			if(query.list().size() > 0) {
				bootcamp = (Bootcamp) query.list().get(0);
			}
			
			session.getTransaction().commit();
		}
		catch(Exception ex)
		{
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return bootcamp;
	}
	
	public void saveOrUpdateBootcamp (Bootcamp bootcamp) {
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			session.saveOrUpdate(bootcamp);
			
			session.getTransaction().commit();
		}
		catch(Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
	}
	
	public List<Candidate> getBootcampActiveCandidatebyBootcampId (String bootcamp_id)
	{
		Session session = null;
		Query query = null;
		List<Candidate> candidateList = null;
		
		try {
			
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			System.out.println("bootcamp_id-->"+bootcamp_id);
			
			query = session.createQuery("from Candidate where find_in_set(:bootcamp_ids, bootcamp_ids) <> 0");
			query.setString("bootcamp_ids", bootcamp_id);
			candidateList = query.list();
			
			System.out.println("candidateList-->"+candidateList.size());

			session.getTransaction().commit();
		}
		catch(Exception ex)
		{
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return candidateList;
	}
	
	public List<Bootcamp> getLatestBootcamp(int maxResults) 
	{
		Session session = null;
		Query query = null;
		List<Bootcamp> bootcampList = null;
		
		try
		{
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			query = session.createQuery("from Bootcamp order by id desc");
			query.setMaxResults(maxResults);
			bootcampList = query.list();
			
			session.getTransaction().commit();
		}
		catch(Exception ex)
		{
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return bootcampList;
	}
}
