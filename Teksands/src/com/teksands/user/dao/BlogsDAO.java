package com.teksands.user.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.teksands.dbConfig.HibernateUtils;
import com.teksands.user.model.Article;
import com.teksands.user.model.Blogs;
import com.teksands.user.model.Countries;
import com.teksands.user.model.Jobs;


public class BlogsDAO {
	
	public Blogs getBlogByUrl(String blog_url)
	{
		Session session = null;
		Query query = null;
		Blogs blog = null;
		
		try
		{
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			query = session.createQuery("from Blogs where blog_url = :blog_url ");
			query.setParameter("blog_url", blog_url);
			if(query.list().size() > 0)
			{
				blog = (Blogs) query.list().get(0);
			}
			
			session.getTransaction().commit();
		}
		catch(Exception ex)
		{
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		
		return blog;
	}
	
	public List<Blogs> getAllBlogsByPageId(Integer pageId, String category) 
	{
		Session session = null;
		Query query = null;
		List<Blogs> blogsList = null;
		
		try
		{
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			if(!category.isEmpty()) 
			{
				query = session.createQuery("from Blogs where category_name = :category_name order by id desc");
				query.setParameter("category_name", category);
			}else 
			{
				query = session.createQuery("from Blogs order by id desc");
			}
			query.setFirstResult(pageId * 6);
			query.setMaxResults(6);
			blogsList = query.list();
			
			session.getTransaction().commit();
		}
		catch(Exception ex)
		{
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return blogsList;
		
	}
	
	public int getBlogsPageCount(String category)
    {
		 Session session = null;
		 Query query = null;
		 int noOfPages = 1;
	     
		 try
		 {
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			if(!category.isEmpty()) 
			{
				query = session.createQuery("from Blogs where category_name = :category_name order by id desc");
				query.setParameter("category_name", category);
			}else 
			{
				query = session.createQuery("from Blogs order by id desc");
			}
			List<Blogs> blogsList = query.list();
			if(blogsList.size() > 0)
			{
				noOfPages = ((blogsList.size())/6);
				double reminder = (((double)blogsList.size())%6);
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
	
	public List<Blogs> getAllBlogsByTags(Integer pageId, String tag) 
	{
		Session session = null;
		Query query = null;
		List<Blogs> blogsList = null;
		
		try
		{
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			query = session.createQuery("from Blogs where tags like :tags order by id desc");
			query.setParameter("tags", "%"+tag+"%");
			
			query.setFirstResult(pageId * 4);
			query.setMaxResults(4);
			blogsList = query.list();
			
			session.getTransaction().commit();
		}
		catch(Exception ex)
		{
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return blogsList;
		
	}
	
	public List<Blogs> getLatestBlogs(int maxResults) 
	{
		Session session = null;
		Query query = null;
		List<Blogs> blogsList = null;
		
		try
		{
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			query = session.createQuery("from Blogs order by id desc");
			query.setMaxResults(maxResults);
			blogsList = query.list();
			
			session.getTransaction().commit();
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return blogsList;
	}
	
	public List<Blogs> getLatestBlogsList (int maxResults) 
	{
		Session session = null;
		Query query = null;
		List<Blogs> blogsList = null;
		
		try
		{
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			query = session.createQuery("from Blogs order by id desc");
			query.setMaxResults(maxResults);
			blogsList = query.list();
			
			session.getTransaction().commit();
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return blogsList;
	}
	
	public Boolean updateBlogs (Blogs blogs) {
		
		Boolean result = false;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			session.update(blogs);
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
	
	public List<Article> getAllArticleByPageId(Integer pageId, String category) 
	{
		Session session = null;
		Query query = null;
		List<Article> articleList = null;
		
		try
		{
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			if(!category.isEmpty()) 
			{
				query = session.createQuery("from Article where category_name = :category_name order by id desc");
				query.setParameter("category_name", category);
			}else 
			{
				query = session.createQuery("from Article order by id desc");
			}
			query.setFirstResult(pageId * 6);
			query.setMaxResults(6);
			articleList = query.list();
			
			session.getTransaction().commit();
		}
		catch(Exception ex)
		{
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return articleList;
		
	}
	
	public Article getArticleByUrl(String blog_url)
	{
		Session session = null;
		Query query = null;
		Article article = null;
		
		try
		{
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			query = session.createQuery("from Article where blog_url = :blog_url ");
			query.setParameter("blog_url", blog_url);
			if(query.list().size() > 0)
			{
				article = (Article) query.list().get(0);
			}
			
			session.getTransaction().commit();
		}
		catch(Exception ex)
		{
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		
		return article;
	}
	
	public List<Article> getLatestArticles(int maxResults) 
	{
		Session session = null;
		Query query = null;
		List<Article> articleList = null;
		
		try
		{
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			query = session.createQuery("from Article order by id desc");
			query.setMaxResults(maxResults);
			articleList = query.list();
			
			session.getTransaction().commit();
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return articleList;
	}
	
	public List<Article> getLatestArticlesList (int maxResults) 
	{
		Session session = null;
		Query query = null;
		List<Article> articleList = null;
		
		try
		{
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			query = session.createQuery("from Article order by id desc");
			query.setMaxResults(maxResults);
			articleList = query.list();
			
			session.getTransaction().commit();
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return articleList;
	}
	
	public int getArticlesPageCount(String category)
    {
		 Session session = null;
		 Query query = null;
		 int noOfPages = 1;
	     
		 try
		 {
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			if(!category.isEmpty()) 
			{
				query = session.createQuery("from Article where category_name = :category_name order by id desc");
				query.setParameter("category_name", category);
			}else 
			{
				query = session.createQuery("from Article order by id desc");
			}
			List<Article> articleList = query.list();
			if(articleList.size() > 0)
			{
				noOfPages = ((articleList.size())/6);
				double reminder = (((double)articleList.size())%6);
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
	
	public Boolean updateArticle (Article article) {
		
		Boolean result = false;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			session.update(article);
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
