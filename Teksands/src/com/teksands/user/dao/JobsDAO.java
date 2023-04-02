package com.teksands.user.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.teksands.bootcamp.model.JobMaster;
import com.teksands.dbConfig.HibernateUtils;
import com.teksands.user.model.Blogs;
import com.teksands.user.model.Career;
import com.teksands.user.model.Courses;
import com.teksands.user.model.Ebooks;
import com.teksands.user.model.Jobs;
import com.teksands.user.model.JobsApplications;
import com.teksands.user.model.Trainers;
import com.teksands.user.model.Webinars;

public class JobsDAO {
	
	public Jobs getJobsByJobsURL(String jobs_url)
	{
		Session session = null;
		Query query = null;
		Jobs jobs = null;
		
		try
		{
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			query = session.createQuery("from Jobs where jobs_url = :jobs_url");
			query.setParameter("jobs_url", jobs_url);
			
			if(query.list().size() > 0)
			{
				jobs = (Jobs) query.list().get(0);
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
	public List<Jobs> getJobsByPageId(Integer pageId, String category, String tags)
	{
		Session session = null;
		Query query = null;
		List<Jobs> jobsList = null;
		
		try
		{
			session = HibernateUtils.getSession();
			session.getTransaction().begin();

			if(!category.isEmpty()) 
			{
				query = session.createQuery("from Jobs where category = :category and active = 1 order by id desc");
				query.setParameter("category", category);
			}
			else if (!tags.isEmpty())
			{
				query = session.createQuery("from Jobs where tags like :tags and active = 1 order by id desc");
				query.setParameter("tags", "%"+tags+"%");
			}
			else 
			{
				query = session.createQuery("from Jobs where active = 1 order by id desc");
			}
			
			query.setFirstResult(pageId * 10);
			query.setMaxResults(10);
			jobsList = query.list();
			
			session.getTransaction().commit();
		}
		catch(Exception ex)
		{
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return jobsList;
		
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
			
			query = session.createQuery("from Jobs where active ='1' order by id desc");
			List<Jobs> jobsList = query.list();
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

	public Boolean saveJobs(JobsApplications jobsApplications)
	{
		Boolean result = false;
		Session session = null;
		
		try {
			
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			session.save(jobsApplications);
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
	public Jobs getJobsbyId (Integer pageId)
	
	{
		Session session = null;
		Query query = null;
		Jobs jobs = null;
		
		try {
			
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			query = session.createQuery("from Jobs where id=:id");
			query.setParameter("id", pageId);
			jobs = (Jobs) query.list().get(0);
			
			session.getTransaction().commit();
		}
		catch(Exception ex)
		{
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return jobs;
	}
	
	public List<Jobs> getRelatedJobsByPageCategory(String category) 
	{
		Session session = null;
		Query query = null;
		List<Jobs> jobsRelatedList = null;
		
		try
		{
			session = HibernateUtils.getSession();
			session.getTransaction().begin();

			query = session.createQuery("from Jobs where category = :category and active = 1 order by id desc");
			query.setParameter("category", category);
			query.setMaxResults(10);
			jobsRelatedList = query.list();
			
			session.getTransaction().commit();
		}
		catch(Exception ex)
		{
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return jobsRelatedList;
	}
	public List<Jobs> getLatestJobs(int maxResults) 
	{
		Session session = null;
		Query query = null;
		List<Jobs> latestJobs = null;
		
		try
		{
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			query = session.createQuery("from Jobs where active = 1 order by id desc");
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
	
	public List<Jobs> getAllJobsByTags(String tags) 
	{
		Session session = null;
		Query query = null;
		List<Jobs> JobstagList = null;
		
		try
		{
			session = HibernateUtils.getSession();
			session.getTransaction().begin();

			query = session.createQuery("from Jobs where tags = :tags order by id desc");
			query.setParameter("tags", tags);
			query.setMaxResults(10);
			JobstagList = query.list();
			
			session.getTransaction().commit();
		}
		catch(Exception ex)
		{
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return JobstagList;
	}
	
	public List<JobMaster> searchAllJobsByPageId(String keyword, int pageId)
    {
		 Session session = null;
		 Query query = null;
		 List<JobMaster> jobMasterList = null;
		 
		 try
		 {
			 session = HibernateUtils.getSession();
			 session.getTransaction().begin();
			
				String str = "";
				String[] arr = keyword.split(" ");
				int k = 0;
				for (String string : arr) 
				{
					if(k == (arr.length-1))
					{
						str = str + "role_name like '%" + string + "%'";
					}else
					{
						str = str + "role_name like '%" + string + "%' or ";
					}
					k++;
				}
				
				String sql = "";
				if(keyword.equalsIgnoreCase("all"))
				{
					sql = "from JobMaster where active = 1 order by id desc";
				}
				else
				{
					sql = "from JobMaster where "+ str +"  and active = 1 order by id desc";
				}
		
				query = session.createQuery(sql);
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
}

