package com.teksands.user.dao;

import org.hibernate.Session;

import com.teksands.dbConfig.HibernateUtils;
import com.teksands.user.model.Career;
import com.teksands.user.model.CorporateEnquiry;
import com.teksands.user.model.EBPCandidate;
import com.teksands.user.model.EbpEmails;
import com.teksands.user.model.Mentors;
import com.teksands.user.model.Trainers;

public class EbpDAO {

	public Boolean saveCorporateEnquiry (CorporateEnquiry corporateEnquiry) {
		
		Boolean result = false;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			session.save(corporateEnquiry);
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

	public Boolean saveMentors (Mentors mentors) {
	
	Boolean result = false;
	Session session = null;
	try {
		session = HibernateUtils.getSession();
		session.getTransaction().begin();
		
		session.save(mentors);
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
	
	public Boolean saveEbpCandidate(EBPCandidate ebpCandidate)
	{
		Boolean result = false;
		Session session = null;
		
		try {
			
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			session.save(ebpCandidate);
			result = true;
			
			session.getTransaction().commit();
		}
		catch(Exception ex)
		{
			session.getTransaction().rollback();
			ex.printStackTrace();
			return result;
		}
		return result;
	}
	
	public Boolean saveEmails (EbpEmails ebpEmails) {
		
		Boolean result = false;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			session.save(ebpEmails);
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
