package com.teksands.user.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.teksands.user.dao.BlogsDAO;
import com.teksands.user.model.Article;
import com.teksands.user.model.Blogs;
import com.teksands.utils.Utils;

@Controller
public class BlogsController {

	@Autowired
	BlogsDAO blogsDAO;
	
	
	@RequestMapping(value="/blog")
	public String blog(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		try
		{	
            String pageid = request.getParameter("pageid");
            String category = request.getParameter("category");
            
			if(pageid == null){pageid = "1";}
			if(category == null){category = "";}
			
			request.setAttribute("category", category);
			request.setAttribute("pageid", pageid);
			
            int page_id = Integer.parseInt(pageid);
		    
			List<Blogs> blogsList = blogsDAO.getAllBlogsByPageId((page_id - 1), category);
			request.setAttribute("blogsList", blogsList);
			
			List<Blogs> latestBlogs = blogsDAO.getLatestBlogs(3);
			request.setAttribute("latestBlogs", latestBlogs);
			
			int blogPageCount = blogsDAO.getBlogsPageCount(category);
            request.setAttribute("blogPageCount", blogPageCount);
            request.setAttribute("pageid", pageid);
            
            List<Integer> paginator =  Utils.paginator(page_id, blogPageCount);
            
            int beginPaginatorId = paginator.get(0);  
            int endPaginatorId = paginator.get(1);
            
            request.setAttribute("beginPaginatorId", beginPaginatorId);
            request.setAttribute("endPaginatorId", endPaginatorId);
			
			request.setAttribute("page", "blog");
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return "user.blog";
	}
	
	@RequestMapping(value="/blog/{title}")
	public String blogdetails(HttpServletRequest request, HttpServletResponse response,
			@PathVariable(value="title") String title) throws Exception 
	{
		try
		{	
			
			Blogs blog = blogsDAO.getBlogByUrl(title);
			if(blog == null) 
			{
				response.sendRedirect(request.getContextPath() + "/error");
				return "user.error";
			}
			request.setAttribute("blog", blog);
			
			int viewed_count = blog.getViewed_count();
			blog.setViewed_count(viewed_count + 1);
			blogsDAO.updateBlogs(blog);
			
			List<Blogs> latestBlogsList = blogsDAO.getLatestBlogsList(3);
			request.setAttribute("latestBlogsList", latestBlogsList);
			
			request.setAttribute("page", "blog-details");
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return "user.blog.details";
	}
	
	@RequestMapping(value="/shortreads")
	public String shortreads(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		try
		{	
			String pageid = request.getParameter("pageid");
            String category = request.getParameter("category");
            
			if(pageid == null){pageid = "1";}
			if(category == null){category = "";}
			
			request.setAttribute("category", category);
			request.setAttribute("pageid", pageid);
			
			int page_id = Integer.parseInt(pageid);
			
			List<Article> articleList = blogsDAO.getAllArticleByPageId((page_id - 1), category);
			request.setAttribute("articleList", articleList);
			
			List<Article> LatestArticles = blogsDAO.getLatestArticles(3);
			request.setAttribute("LatestArticles", LatestArticles);
			
			int articlePageCount = blogsDAO.getArticlesPageCount(category);
            request.setAttribute("articlePageCount", articlePageCount);
			
            List<Integer> paginator =  Utils.paginator(page_id, articlePageCount);
            
            int beginPaginatorId = paginator.get(0);  
            int endPaginatorId = paginator.get(1);
            
            request.setAttribute("beginPaginatorId", beginPaginatorId);
            request.setAttribute("endPaginatorId", endPaginatorId);
			
			request.setAttribute("page", "article");
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return "user.article";
	}
	
	@RequestMapping(value="/shortreads/{title}")
	public String shortreadsdetails(HttpServletRequest request, HttpServletResponse response,
			@PathVariable(value="title") String title) throws Exception 
	{
		try
		{	
			
			Article article = blogsDAO.getArticleByUrl(title);

			if(article == null) 
			{
				response.sendRedirect(request.getContextPath() + "/error");
				return "user.error";
			}
			request.setAttribute("article", article);
			
			int viewed_count = article.getViewed_count();
			article.setViewed_count(viewed_count + 1);
			blogsDAO.updateArticle(article);
			
			List<Article> LatestArticles = blogsDAO.getLatestArticlesList(3);
			request.setAttribute("LatestArticles", LatestArticles);
			
			request.setAttribute("page", "article-details");
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return "user.article.details";
	}
}
