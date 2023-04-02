package com.teksands.user.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.teksands.dbConfig.HibernateUtils;
import com.teksands.user.model.Career;
import com.teksands.user.model.Contactus;
import com.teksands.user.model.Contributor;
import com.teksands.user.model.Countries;
import com.teksands.user.model.Ebooks;
import com.teksands.user.model.HomeEnquiry;
import com.teksands.user.model.Internship;
import com.teksands.user.model.ItStaffing;
import com.teksands.user.model.Leads;
import com.teksands.user.model.Trainers;


public class CommonDAO {
	
	public Boolean saveContacts (Contactus contactus) {
		
		Boolean result = false;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			session.save(contactus);
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
	
	public List<Countries> getCountries(){
		
		Session session = null;
		Query query = null;
		List<Countries> countriesList = null;
		try {
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			query = session.createQuery("from Countries");
			countriesList = query.list();
			
			session.getTransaction().commit();
		}
		catch(Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
			return countriesList;
		}
		return countriesList;
	}
	
	public Boolean saveTrainers (Trainers trainers) {
		
		Boolean result = false;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			session.save(trainers);
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
	public Boolean saveContributor (Contributor contributor) {
		
		Boolean result = false;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			session.save(contributor);
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
	public Boolean saveLeads(Leads leads) 
	{
		Boolean result = false;
		Session session = null;
		try
		{
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			session.save(leads);
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
	public Boolean saveCareer(Career career)
	{
		Boolean result = false;
		Session session = null;
		
		try {
			
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			session.save(career);
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
	public Boolean saveInternships(Internship Internship)
	{
		Boolean result = false;
		Session session = null;
		
		try {
			
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			session.save(Internship);
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
	public Boolean saveEbooks(Ebooks ebooks)
	{
		Boolean result = false;
		Session session = null;
		
		try {
			
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			session.save(ebooks);
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
	
	public Boolean saveLiftOffContact (HomeEnquiry homeEnquiry) {
		
		Boolean result = false;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			session.save(homeEnquiry);
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
	
	public Boolean saveItStaffingContacts (ItStaffing itStaffing) {
		
		Boolean result = false;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			session.save(itStaffing);
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
