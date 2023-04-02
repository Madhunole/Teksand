package com.teksands.bootcamp.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.teksands.bootcamp.model.Bootcamp;
import com.teksands.bootcamp.model.Candidate;
import com.teksands.bootcamp.model.ClientContact;
import com.teksands.bootcamp.model.ClientMaster;
import com.teksands.bootcamp.model.JobMaster;
import com.teksands.dbConfig.HibernateUtils;

public class ClientMasterDAO {
	
	public List<ClientMaster> getAllClientMaster()
	{
		Session session = null;
		Query query = null;
		List<ClientMaster> clientMasterList = null;
		
		try {
			
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			query = session.createQuery("from ClientMaster");
			clientMasterList = query.list();

			session.getTransaction().commit();
		}
		catch(Exception ex)
		{
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return clientMasterList;
	}
	
	public ClientMaster getClientMasterById(Integer id)
	{
		Session session = null;
		Query query = null;
		ClientMaster clientMaster = null;
		try 
		{
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			query = session.createQuery("from ClientMaster where id = :id");
			query.setParameter("id", id);
			if(query.list().size() > 0) {
				clientMaster = (ClientMaster) query.list().get(0);
			}
			
			session.getTransaction().commit();
		}
		catch(Exception ex)
		{
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return clientMaster;
	}
	
	public void saveOrUpdateClientMaster (ClientMaster clientMaster) {
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			session.saveOrUpdate(clientMaster);
			
			session.getTransaction().commit();
		}
		catch(Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
	}
	
	public void saveOrUpdateClientContact (ClientContact clientContact) {
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			session.saveOrUpdate(clientContact);
			
			session.getTransaction().commit();
		}
		catch(Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
	}
	
	/*public ClientContact getClientContactById(Integer id)
	{
		Session session = null;
		Query query = null;
		ClientContact clientContact = null;
		try 
		{
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			query = session.createQuery("from ClientContact where client_master_id = :id");
			query.setParameter("id", id);
			if(query.list().size() > 0) {
				clientContact = (ClientContact) query.list().get(0);
			}
			
			session.getTransaction().commit();
		}
		catch(Exception ex)
		{
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return clientContact;
	}*/
	
	public List<ClientContact> getClientContactById(Integer client_master_id)
	{
		Session session = null;
		Query query = null;
		List<ClientContact> clientContactList = null;
		
		try {
			
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			query = session.createQuery("from ClientContact where client_master_id = :client_master_id");
			query.setParameter("client_master_id", client_master_id);
			clientContactList = query.list();

			session.getTransaction().commit();
		}
		catch(Exception ex)
		{
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return clientContactList;
	}

	public List<Object[]> getJobMasterApplicationCountByBrandId(Integer brand_id)
	{
		Session session = null;
		Query query = null;
		List<Object[]> jobMaster = null;
		//List<JobMaster> jobMasterList = null;
		
		try {
			
			session = HibernateUtils.getSession();
			session.getTransaction().begin();

			//query = session.createQuery("from JobMaster where active=1");
			//jobMasterList = query.list();		
			
			String queryelss = "";			
			queryelss += "SELECT DISTINCT (SELECT COUNT(*) FROM teksands.cms_jobs_application WHERE job_id = cjm.id) AS job_idCount,cjm.id,cjm.position,cjm.company_name,cjm.date_of_posted,cjm.min_salary_range,cjm.max_salary_range,cjm.experience,cjm.skills_required,cjm.location,cjm.total_vacancy";
			queryelss += " FROM teksands.cms_jobs_master AS cjm where cjm.active = 1 and cjm.brand_id = "+brand_id+" order by cjm.date_of_posted desc";		
			
			// System.out.println("qury "+queryelss);

			query = session.createSQLQuery(queryelss);
			
			jobMaster = query.list();
		

			session.getTransaction().commit();
		}
		catch(Exception ex)
		{
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return jobMaster;
	}
	
	public List<Object[]> getJobMasterApplicationCountByBrandandClientId(Integer brand_id, String client_ids)
	{
		Session session = null;
		Query query = null;
		List<Object[]> jobMaster = null;
		//List<JobMaster> jobMasterList = null;
        int count = client_ids.replaceAll("[^,]","").length();
		try {
			
			session = HibernateUtils.getSession();
			session.getTransaction().begin();

			//query = session.createQuery("from JobMaster where active=1");
			//jobMasterList = query.list();	
			String queryelss = "";	
			if(count > 0)
			{					
				queryelss += "SELECT DISTINCT (SELECT COUNT(*) FROM cms_jobs_application WHERE job_id = cjm.id) AS job_idCount,cjm.id,cjm.position,cjm.company_name,cjm.date_of_posted,cjm.min_salary_range,cjm.max_salary_range,cjm.experience,cjm.skills_required,cjm.location,cjm.total_vacancy";
				queryelss += " FROM cms_jobs_master AS cjm where cjm.client_id in ("+client_ids+") and cjm.active = 1 and cjm.brand_id = "+brand_id+" order by cjm.date_of_posted desc";		
			}
			else
			{					
				queryelss += "SELECT DISTINCT (SELECT COUNT(*) FROM cms_jobs_application WHERE job_id = cjm.id) AS job_idCount,cjm.id,cjm.position,cjm.company_name,cjm.date_of_posted,cjm.min_salary_range,cjm.max_salary_range,cjm.experience,cjm.skills_required,cjm.location,cjm.total_vacancy";
				queryelss += " FROM cms_jobs_master AS cjm where cjm.client_id like '%"+client_ids+"%' and cjm.active = 1 and cjm.brand_id = "+brand_id+" order by cjm.date_of_posted desc";				
			}
			query = session.createSQLQuery(queryelss);
			
			jobMaster = query.list();
			System.out.println("dao list size"+ query.list().size());
			session.getTransaction().commit();
		}
		catch(Exception ex)
		{
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return jobMaster;
	}
	
	public JobMaster getJobMasterByBrandId(Integer brand_id)
	{
		Session session = null;
		Query query = null;
		JobMaster jobMaster = null;
		
		try {
			
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			query = session.createQuery("from JobMaster where active=1 and brand_id = :brand_id");
			query.setParameter("brand_id", brand_id);
			if(query.list().size() > 0) {
				jobMaster = (JobMaster) query.list().get(0);
			}
			

			session.getTransaction().commit();
		}
		catch(Exception ex)
		{
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return jobMaster;
	}	
}
