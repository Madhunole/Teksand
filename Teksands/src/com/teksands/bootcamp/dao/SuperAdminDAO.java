package com.teksands.bootcamp.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.teksands.bootcamp.model.Brand;
import com.teksands.bootcamp.model.BrandDirectors;
import com.teksands.bootcamp.model.CmsUser;
import com.teksands.dbConfig.HibernateUtils;

public class SuperAdminDAO {

	public Brand getBrandById(Integer id)
	{
		Session session = null;
		Query query = null;
		Brand brand = null;
		try 
		{
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			query = session.createQuery("from Brand where id = :id");
			query.setParameter("id", id);
			if(query.list().size() > 0) {
				brand = (Brand) query.list().get(0);
			}
			
			session.getTransaction().commit();
		}
		catch(Exception ex)
		{
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return brand;
	}
	
	public List<BrandDirectors> getAllBrandDirectorsListByBrandId (Integer brand_id)
	{
		Session session = null;
		Query query = null;
		List<BrandDirectors> brandDirectorsList = null;
		try 
		{
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			query = session.createQuery("from BrandDirectors where brand_id = :brand_id and active = 1");
			query.setParameter("brand_id", brand_id);
			brandDirectorsList = query.list();
			
			session.getTransaction().commit();
		}
		catch(Exception ex)
		{
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return brandDirectorsList;
	}
	
	public void saveOrUpdateBrand (Brand brand) {
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			session.saveOrUpdate(brand);
			
			session.getTransaction().commit();
		}
		catch(Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
	}
	
	public void saveOrUpdateBrandDirector (BrandDirectors brandDirectors) {
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			session.saveOrUpdate(brandDirectors);
			
			session.getTransaction().commit();
		}
		catch(Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
	}
	
	public BrandDirectors getBrandDirectorById(Integer id)
	{
		Session session = null;
		Query query = null;
		BrandDirectors brandDirectors = null;
		try 
		{
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			query = session.createQuery("from BrandDirectors where id = :id");
			query.setParameter("id", id);
			if(query.list().size() > 0) {
				brandDirectors = (BrandDirectors) query.list().get(0);
			}
			
			session.getTransaction().commit();
		}
		catch(Exception ex)
		{
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return brandDirectors;
	}
	
	public List<Brand> getAllActiveBrands()
	{
		Session session = null;
		Query query = null;
		List<Brand> brands = null;
		
		try {
			
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			query = session.createQuery("from Brand where active = 1");
			brands = query.list();

			session.getTransaction().commit();
		}
		catch(Exception ex)
		{
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return brands;
	}
	
	public Boolean deleteUserById(Integer id) {
		Boolean result = false;
		Session session = null;
		Query query = null;
		try {
			
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			query = session.createQuery("DELETE FROM CmsUser where id = :id");
			query.setParameter("id", id);
			query.executeUpdate();
			result = true;
	
			session.getTransaction().commit();
		} catch (Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
			return result;
		}
		return result;
	}
	
	public Boolean deleteBrandById(Integer id) {
		Boolean result = false;
		Session session = null;
		Query query = null;
		try {
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			query = session.createQuery("DELETE FROM Brand where id = :id");
			query.setParameter("id", id);
			query.executeUpdate();
			result = true;
	
			session.getTransaction().commit();
		} catch (Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
			return result;
		}
		return result;
	}
	
	public Boolean deleteBrandDirectorsByBrandId(Integer brand_id) {
		Boolean result = false;
		Session session = null;
		Query query = null;
		try {
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			query = session.createQuery("DELETE FROM BrandDirectors where brand_id = :brand_id");
			query.setParameter("brand_id", brand_id);
			query.executeUpdate();
			result = true;
	
			session.getTransaction().commit();
		} catch (Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
			return result;
		}
		return result;
	}
	
	public Boolean deleteBrandDirectorsById(Integer brand_director_id) {
		Boolean result = false;
		Session session = null;
		Query query = null;
		try {
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			query = session.createQuery("DELETE FROM BrandDirectors where id = :id");
			query.setParameter("id", brand_director_id);
			query.executeUpdate();
			result = true;
	
			session.getTransaction().commit();
		} catch (Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
			return result;
		}
		return result;
	}
	public Boolean updateactiveStatusUserByBrandId(Integer brand_id, Integer status) {
		Boolean result = false;
		Session session = null;
		Query query = null;
		try {
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			System.out.println("admin dao");
			query = session.createSQLQuery("UPDATE cms_user set active = "+status+" where brand_id = "+brand_id+"");
			query.executeUpdate();
			result = true;
	
			session.getTransaction().commit();
		} catch (Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
			return result;
		}
		return result;
	}
	public List<CmsUser> getAllBrandAdmin()
	{
		Session session = null;
		Query query = null;
		List<CmsUser> cmsUserBradAdminList = null;
		try 
		{
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			query = session.createQuery("from CmsUser where user_type_id = 6");
			cmsUserBradAdminList = query.list();
			
			session.getTransaction().commit();
		}
		catch(Exception ex)
		{
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return cmsUserBradAdminList;
	}
	public Brand getBrandByUserId(Integer user_id)
	{
		Session session = null;
		Query query = null;
		Brand brand = null;
		try 
		{
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			query = session.createQuery("from Brand where user_id = :user_id");
			query.setParameter("user_id", user_id);
			if(query.list().size() > 0) {
				brand = (Brand) query.list().get(0);
			}
			
			session.getTransaction().commit();
		}
		catch(Exception ex)
		{
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return brand;
	}
	
}
