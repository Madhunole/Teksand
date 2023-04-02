package com.teksands.bootcamp.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.teksands.bootcamp.model.Bootcamp;
import com.teksands.bootcamp.model.Candidate;
import com.teksands.bootcamp.model.ClientMaster;
import com.teksands.bootcamp.model.Interview;
import com.teksands.bootcamp.model.TestResults;
import com.teksands.dbConfig.HibernateUtils;

public class InterviewDAO {

	public List<Interview> getInterview()
	{
		Session session = null;
		Query query = null;
		List<Interview> interviewList = null;
		
		try {
			
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			query = session.createQuery("from Interview");
			interviewList = query.list();

			session.getTransaction().commit();
		}
		catch(Exception ex)
		{
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return interviewList;
	}
	
	public void saveOrUpdateInterview (Interview interview) {
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			session.saveOrUpdate(interview);
			
			session.getTransaction().commit();
		}
		catch(Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
	}
	
	public Interview getInterviewByBootcampId(Integer bootcamp_id)
	{
		Session session = null;
		Query query = null;
		Interview interview = null;
		try 
		{
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			query = session.createQuery("from Interview where bootcamp_id = :bootcamp_id");
			query.setParameter("bootcamp_id", bootcamp_id);
			if(query.list().size() > 0) {
				interview = (Interview) query.list().get(0);
			}
			
			session.getTransaction().commit();
		}
		catch(Exception ex)
		{
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return interview;
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
			
			query = session.createSQLQuery("select * from cms_candidate where FIND_IN_SET ('"+bootcamp_id+"', bootcamp_ids)");
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
	
	public Interview getInterviewById(Integer id)
	{
		Session session = null;
		Query query = null;
		Interview interview = null;
		try 
		{
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			query = session.createQuery("from Interview where id = :id");
			query.setParameter("id", id);
			if(query.list().size() > 0) {
				interview = (Interview) query.list().get(0);
			}
			
			session.getTransaction().commit();
		}
		catch(Exception ex)
		{
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return interview;
	}
	
	public List<Interview> getAllInterviewbyCandidateId (Integer candidate_id)
	{
		Session session = null;
		Query query = null;
		List<Interview> iInterviewList = null;
		try 
		{
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			query = session.createQuery("from Interview where candidate_id = :candidate_id");
			query.setParameter("candidate_id", candidate_id);
			iInterviewList = query.list();
			
			session.getTransaction().commit();
		}
		catch(Exception ex)
		{
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return iInterviewList;
	}
}
