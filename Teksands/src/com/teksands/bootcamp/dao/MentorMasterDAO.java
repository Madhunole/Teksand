package com.teksands.bootcamp.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.teksands.bootcamp.model.Bootcamp;
import com.teksands.bootcamp.model.Candidate;
import com.teksands.bootcamp.model.ClientMaster;
import com.teksands.bootcamp.model.MentorMaster;
import com.teksands.dbConfig.HibernateUtils;

public class MentorMasterDAO {
	
	public List<MentorMaster> getAllMentorMaster()
	{
		Session session = null;
		Query query = null;
		List<MentorMaster> mentorMasterList = null;
		
		try {
			
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			query = session.createQuery("from MentorMaster");
			mentorMasterList = query.list();

			session.getTransaction().commit();
		}
		catch(Exception ex)
		{
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return mentorMasterList;
	}
	
	public MentorMaster getMentorMasterById(Integer id)
	{
		Session session = null;
		Query query = null;
		MentorMaster mentorMaster = null;
		try 
		{
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			query = session.createQuery("from MentorMaster where id = :id");
			query.setParameter("id", id);
			if(query.list().size() > 0) {
				mentorMaster = (MentorMaster) query.list().get(0);
			}
			
			session.getTransaction().commit();
		}
		catch(Exception ex)
		{
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return mentorMaster;
	}
	
	public void saveOrUpdateMentorMaster (MentorMaster mentorMaster) {
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			session.saveOrUpdate(mentorMaster);
			
			session.getTransaction().commit();
		}
		catch(Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
	}

}
