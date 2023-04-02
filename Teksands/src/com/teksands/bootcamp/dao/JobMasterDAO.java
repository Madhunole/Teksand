package com.teksands.bootcamp.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.teksands.bootcamp.model.Bootcamp;
import com.teksands.bootcamp.model.Candidate;
import com.teksands.bootcamp.model.ClientContact;
import com.teksands.bootcamp.model.ClientMaster;
import com.teksands.bootcamp.model.JobApplication;
import com.teksands.bootcamp.model.JobMaster;
import com.teksands.bootcamp.model.TestResults;
import com.teksands.dbConfig.HibernateUtils;
import com.teksands.user.model.Jobs;
import com.teksands.user.response.CandidateandJobResponse;

public class JobMasterDAO {
	
	public ClientContact getClientContactByCampanyId(String companyId)
	{
		Session session = null;
		ClientContact clientContact = null;
		try
		{
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			Query query = session.createQuery("from ClientContact where client_master_id=:companyId");
			query.setString("companyId", companyId);
			query.setMaxResults(1);
			List<ClientContact> list = query.list();
			if(list != null && list.size() > 0)
			{
				clientContact = list.get(0);
			}
			
			session.getTransaction().commit();
		}
		catch(Exception ex)
		{
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return clientContact;
	}
	
	public JobMaster getJobsById(Integer id)
	{
		Session session = null;
		Query query = null;
		JobMaster jobMaster = null;
		try 
		{
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			query = session.createQuery("from JobMaster where id = :id");
			query.setParameter("id", id);
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
	
	public ClientMaster getClientMasterById(Integer companyId)
	{
		Session session = null;
		ClientMaster clientMaster = null;
		try
		{
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			Query query = session.createQuery("from ClientMaster where id=:id");
			query.setParameter("id", companyId);
			query.setMaxResults(1);
			List<ClientMaster> list = query.list();
			if(list != null && list.size() > 0)
			{
				clientMaster = list.get(0);
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
	
	public void saveOrUpdateJobMaster (JobMaster jobMaster) {
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			session.saveOrUpdate(jobMaster);
			
			session.getTransaction().commit();
		}
		catch(Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
	}
	
	public List<JobMaster> getAllActiveJobMaster()
	{
		Session session = null;
		Query query = null;
		List<JobMaster> jobMasterList = null;
		
		try {
			
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			query = session.createQuery("from JobMaster where active=1");
			jobMasterList = query.list();

			
			
			session.getTransaction().commit();
		}
		catch(Exception ex)
		{
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return jobMasterList;
	}
	
	public void getCandidateUnCheckToJob(String jobMaster_id)
	{
		Session session = null;
		Query query = null;
		
		try 
		{
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			query = session.createQuery("from JobApplication where job_id = :"+jobMaster_id+"");
			List<JobApplication> jobApplicationList = query.list();
			for (JobApplication jobApplication : jobApplicationList) 
			{
				jobApplication.setActive(false);
				saveOrUpdateJobApplication(jobApplication);
			}
		}
		catch(Exception ex)
		{
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
	}
	
	public void saveOrUpdateJobApplication(JobApplication jobApplication) {
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			session.saveOrUpdate(jobApplication);
			
			session.getTransaction().commit();
		}
		catch(Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
	}
	
	public JobApplication getJobApplicationByCandidateAndJobId(Integer candidate_id, Integer job_id)
	{
		Session session = null;
		Query query = null;
		JobApplication jobApplication = null;
		try 
		{
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			query = session.createQuery("from JobApplication where candidate_id = :candidate_id and job_id = :job_id");
			query.setParameter("candidate_id", candidate_id);
			query.setParameter("job_id", job_id);
			if(query.list().size() > 0) {
				jobApplication = (JobApplication) query.list().get(0);
			}
			
			session.getTransaction().commit();
		}
		catch(Exception ex)
		{
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return jobApplication;
	}
	
	public List<JobApplication> setJobApplicationInactiveByCandidateAndJobId(String candidateStr, Integer job_id)
	{
		Session session = null;
		Query query = null;
		List<JobApplication> jobApplicationList = null;
		
		try {
			
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			System.out.println("candidateStr DAO = " + candidateStr);
			
			query = session.createQuery("from JobApplication where candidate_id not in ("+candidateStr+") and job_id = "+job_id+"");
			jobApplicationList = query.list();

			session.getTransaction().commit();
		}
		catch(Exception ex)
		{
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return jobApplicationList;
	}
	
	public List<JobApplication> getJobApplicationByJobId(Integer id)
	{
		Session session = null;
		Query query = null;
		List<JobApplication> jobApplication = null;
		
		try {
			
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			query = session.createQuery("from JobApplication where job_id = :id");
			query.setParameter("id", id);
			jobApplication = query.list();

			session.getTransaction().commit();
		}
		catch(Exception ex)
		{
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return jobApplication;
	}
	
	public List<Object[]> getJobApplicationByJobCatId(Integer id)
	{
		Session session = null;
		Query query = null;
		List<Object[]> jobApplication = null;
		
		try {
			
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
		//	query = session.createQuery("from JobApplication where job_id = :id");
		//	query = session.createSQLQuery("SELECT jp.candidate_id,jp.job_id,cd.name, cd.email, cd.mobile,cd.texperience,cd.key_skills from cms_candidate cd JOIN cms_jobs_application jp ON cd.id = jp.candidate_id where jp.job_id =  '" + id + "'");
	
			String queryelss = "";
			
			queryelss += " SELECT jp.candidate_id,jp.job_id,cd.name, cd.email, cd.mobile,cd.total_experience,cd.key_skills,cd.resume,cd.created_date";
			queryelss += " FROM cms_candidate cd";
			queryelss += " JOIN cms_jobs_application jp ON cd.id = jp.candidate_id";
			queryelss += " WHERE jp.job_id =  '" + id + "' order by cd.created_date desc";
			query = session.createSQLQuery(queryelss);
			
			jobApplication = query.list();
		

			session.getTransaction().commit();
		}
		catch(Exception ex)
		{
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return jobApplication;
	}
	
	
	public List<Object[]> getJobApplicationByJobCatIdObj()
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
			queryelss += " FROM teksands.cms_jobs_master AS cjm order by cjm.date_of_posted desc";		
			
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
	
	public void getJobCandidateUnCheck(String jobMaster_id)
	{
		Session session = null;
		Query query = null;
		
		try 
		{
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			query = session.createQuery("from JobApplication where job_id like '%"+jobMaster_id+"%'");
			List<JobApplication> jobApplicationList = query.list();
						
			for (JobApplication jobApplication : jobApplicationList) 
			{
				jobApplication.setActive(false);
			}
			
			session.getTransaction().commit();
		}
		catch(Exception ex)
		{
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
	}
	
	public List<Candidate> getCandidateByJobId (Integer job_id)
	{
		Session session = null;
		Query query = null;
		List<Candidate> candidateList = null;
		System.out.println("job id = "+job_id);
		try {
			
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			query = session.createQuery("from Candidate where job_id = :job_id");
			query.setParameter("job_id", job_id);
			candidateList = query.list();
			System.out.println("candidateListsize = "+candidateList.size());
			
			session.getTransaction().commit();
		}
		catch(Exception ex)
		{
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return candidateList;
	}
	
	public List<JobMaster> getJobsByPageId(Integer pageId, String category, String tags)
	{
		Session session = null;
		Query query = null;
		List<JobMaster> jobMasterList = null;
		
		try
		{
			session = HibernateUtils.getSession();
			session.getTransaction().begin();

			if(!category.isEmpty()) 
			{
				query = session.createQuery("from JobMaster where category = :category and active = 1 order by id desc");
				query.setParameter("category", category);
			}
			else if (!tags.isEmpty())
			{
				query = session.createQuery("from JobMaster where tags like :tags and active = 1 order by id desc");
				query.setParameter("tags", "%"+tags+"%");
			}
			else 
			{
				query = session.createQuery("from JobMaster where active = 1 order by id desc");
			}
			
			query.setFirstResult(pageId * 10);
			query.setMaxResults(10);
			jobMasterList = query.list();
			
			session.getTransaction().commit();
		}
		catch(Exception ex)
		{
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return jobMasterList;
		
	}
	public List<JobMaster> getRelatedJobsByPageCategory(String category) 
	{
		Session session = null;
		Query query = null;
		List<JobMaster> jobMasterRelatedList = null;
		
		try
		{
			session = HibernateUtils.getSession();
			session.getTransaction().begin();

			query = session.createQuery("from JobMaster where category = :category and active = 1 order by id desc");
			query.setParameter("category", category);
			query.setMaxResults(10);
			jobMasterRelatedList = query.list();
			
			session.getTransaction().commit();
		}
		catch(Exception ex)
		{
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return jobMasterRelatedList;
	}
	public JobMaster getJobsByJobsURL(String jobs_url)
	{
		Session session = null;
		Query query = null;
		JobMaster jobs = null;
		
		try
		{
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			query = session.createQuery("from JobMaster where jobs_url = :jobs_url");
			query.setParameter("jobs_url", jobs_url);
			
			if(query.list().size() > 0)
			{
				jobs = (JobMaster) query.list().get(0);
			}
			
			session.getTransaction().commit();
		}
		catch(Exception ex)
		{
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		
		return jobs;
	}
	public List<JobMaster> getLatestJobs(int maxResults) 
	{
		Session session = null;
		Query query = null;
		List<JobMaster> latestJobs = null;
		
		try
		{
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			query = session.createQuery("from JobMaster where active = 1 order by id desc");
			query.setMaxResults(maxResults);
			latestJobs = query.list();
			
			session.getTransaction().commit();
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return latestJobs;
	}
	public int getJobsPageCount()
    {
		 Session session = null;
		 Query query = null;
		 int noOfPages = 1;
	     
		 try
		 {
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			query = session.createQuery("from JobMaster where active ='1' order by id desc");
			List<JobMaster> jobsList = query.list();
			if(jobsList.size() > 0)
			{
				noOfPages = ((jobsList.size())/5);
				double reminder = (((double)jobsList.size())%5);
				if(reminder > 0)
				{
					noOfPages = noOfPages + 1;
				}
			}
			
			session.getTransaction().commit();
		 }
		 catch(Exception ex)
		 {
			session.getTransaction().rollback();
			ex.printStackTrace();
		 }
		 return noOfPages;
	 }
	public JobMaster getJobsByAuthCode(String auth_code) {
		Session session = null;
		Query query = null;
		JobMaster jobs = null;
		try {
			session = HibernateUtils.getSession();
			session.getTransaction().begin();

			query = session.createQuery("from JobMaster where auth_code = :auth_code");
			query.setParameter("auth_code", auth_code);
			if (query.list().size() > 0) {
				jobs = (JobMaster) query.list().get(0);
			}

			session.getTransaction().commit();
		} catch (Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return jobs;
	}

	public List<JobMaster> getAllActiveJobsByBrandId(Integer brand_id)
	{
		Session session = null;
		Query query = null;
		List<JobMaster> jobMasterList = null;
		
		try {
			
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			query = session.createQuery("from JobMaster");
			jobMasterList = query.list();

			session.getTransaction().commit();
		}
		catch(Exception ex)
		{
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return jobMasterList;
	}
	
	public List<JobMaster> getJobMasterCount(Integer job_id)
	{
		Session session = null;
		Query query = null;
		List<JobMaster> jobMasterCount = null;
		
		try {
			
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			query = session.createSQLQuery("select count(*) from cms_jobs_master where id=:id");
			query.setParameter("id", job_id);
			jobMasterCount = query.list();

			session.getTransaction().commit();
		}
		catch(Exception ex)
		{
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return jobMasterCount;
	}
}
