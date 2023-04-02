package com.teksands.bootcamp.dao;

import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.teksands.bootcamp.model.Brand;
import com.teksands.bootcamp.model.BrandDirectors;
import com.teksands.bootcamp.model.ClientContact;
import com.teksands.bootcamp.model.ClientMaster;
import com.teksands.bootcamp.model.CmsParameter;
import com.teksands.bootcamp.model.CmsUser;
import com.teksands.bootcamp.model.JobMaster;
import com.teksands.bootcamp.model.Log;
import com.teksands.dbConfig.HibernateUtils;
import com.teksands.user.response.CommonResponse;
import com.teksands.utils.Utils;

public class BrandAdminDAO {

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
	
	public List<CmsUser> getAllClientAdminAndRecruiterUsersByBrandId (Integer brand_id)
	{
		Session session = null;
		Query query = null;
		List<CmsUser> cmsUserList = null;
		try 
		{
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			query = session.createQuery("from CmsUser where brand_id = :brand_id and user_type in ('clientAdmin','recruiter')");
			query.setParameter("brand_id", brand_id);
			cmsUserList = query.list();
			
			session.getTransaction().commit();
		}
		catch(Exception ex)
		{
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return cmsUserList;
	}
	
	public List<CmsParameter> getAllParametersByBrandId (Integer brand_id, String para_type)
	{
		Session session = null;
		Query query = null;
		List<CmsParameter> cmsParameterList = null;
		try 
		{
			System.out.println("brand_id =========dao"+ brand_id);
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			query = session.createQuery("from CmsParameter where brand_id = :brand_id and para_type = :para_type");
			query.setParameter("brand_id", brand_id);
			query.setParameter("para_type", para_type);
			cmsParameterList = query.list();
			
			session.getTransaction().commit();
		}
		catch(Exception ex)
		{
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return cmsParameterList;
	}
	
	public void saveOrUpdateCmsParamer(CmsParameter cmsParameter) {
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			session.saveOrUpdate(cmsParameter);
			
			session.getTransaction().commit();
		}
		catch(Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
	}
	public CmsParameter getParameterById (Integer id)
	{
		Session session = null;
		Query query = null;
		CmsParameter parameter = null;
		try 
		{
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			query = session.createQuery("from CmsParameter where id = :id");
			query.setParameter("id", id);
			if(query.list().size() > 0) {
				parameter = (CmsParameter) query.list().get(0);
			}
			
			session.getTransaction().commit();
		}
		catch(Exception ex)
		{
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return parameter;
	}
	public Boolean deleteParameterById(Integer id) {
		Boolean result = false;
		Session session = null;
		Query query = null;
		try {
			
			System.out.println("delete id" + id);
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			query = session.createQuery("DELETE FROM CmsParameter where id = :id");
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
	public List<ClientMaster> getAllActiveClients()
	{
		Session session = null;
		Query query = null;
		List<ClientMaster> clients = null;
		
		try {
			
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			query = session.createQuery("from ClientMaster where active = 1");
			clients = query.list();

			session.getTransaction().commit();
		}
		catch(Exception ex)
		{
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return clients;
	}
	public List<ClientMaster> getAllActiveClientsByBrandId(Integer brand_id)
	{
		Session session = null;
		Query query = null;
		List<ClientMaster> clients = null;
		
		try {
			
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			query = session.createQuery("from ClientMaster where brand_id = :brand_id and active = 1");
			query.setParameter("brand_id", brand_id);		
			clients = query.list();
			
			session.getTransaction().commit();
		}
		catch(Exception ex)
		{
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return clients;
	}

	public ClientMaster getclientById(Integer id)
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
	public List<Object[]> getObjclientById(Integer brand_id)
	{
		Session session = null;
		Query query = null;
		List<Object[]> clients = null;
		try 
		{
			session = HibernateUtils.getSession();
			session.getTransaction().begin();			
			
			query = session.createSQLQuery("select * from cms_client_master where active = 1 and brand_id = "+brand_id+"");		
			clients = query.list();
			
			session.getTransaction().commit();
		}
		catch(Exception ex)
		{
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return clients;
	}
	
	public List<Object[]> getClientNotInById(Integer brand_id, String ClientIds)
	{
		Session session = null;
		Query query = null;
		List<Object[]> clients = null;
		try 
		{
			session = HibernateUtils.getSession();
			session.getTransaction().begin();			
			
			query = session.createSQLQuery("select * from cms_client_master where id NOT IN ("+ClientIds+") and active = 1 and brand_id = "+brand_id+"");		
			clients = query.list();
			
			session.getTransaction().commit();
		}
		catch(Exception ex)
		{
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return clients;
	}
	
	public List<Object[]> getClientIdByUserId(Integer brand_id, String user_id)
	{
		Session session = null;
		Query query = null;
		List<Object[]> clients = null;
		try 
		{
			session = HibernateUtils.getSession();
			session.getTransaction().begin();			
			query = session.createSQLQuery("select * from cms_client_master where FIND_IN_SET ("+user_id+",user_id) and active = 1 and brand_id = "+brand_id+"");		
			clients = query.list();
			
			session.getTransaction().commit();
		}
		catch(Exception ex)
		{
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return clients;
	}	
	
	public List<ClientMaster> getAllActiveClientsByBrandandUserId(Integer brand_id, String user_id)
	{
		Session session = null;
		Query query = null;
		List<ClientMaster> clients = null;
		try 
		{
			session = HibernateUtils.getSession();
			session.getTransaction().begin();	
			
			query = session.createQuery("from ClientMaster where user_id like '%"+user_id+"%' and active = 1 and brand_id = "+brand_id+"");		
			clients = query.list();
			
			session.getTransaction().commit();
		}
		catch(Exception ex)
		{
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return clients;
	}		


	public void saveOrUpdateClient (ClientMaster clientMaster) {
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
	public Boolean updateUsersIdByClientId(Integer client_id, String user_ids) {
		Boolean result = false;
		Session session = null;
		Query query = null;
		try {
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			query = session.createSQLQuery("UPDATE cms_client_master SET user_id = '"+user_ids+"' where id = "+client_id+" ");			
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
	public Boolean deleteClientById(Integer id,Integer brand_id) {
		Boolean result = false;
		Session session = null;
		Query query = null;
		try {
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			query = session.createSQLQuery("UPDATE cms_client_master SET active = 0 where id = "+id+" and brand_id = "+brand_id+"");	
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
	public ClientContact getClientContactById(Integer id)
	{
		Session session = null;
		Query query = null;
		ClientContact clientContacts = null;
		try 
		{
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			query = session.createQuery("from ClientContact where id = :id");
			query.setParameter("id", id);
			if(query.list().size() > 0) {
				clientContacts = (ClientContact) query.list().get(0);
			}
			
			session.getTransaction().commit();
		}
		catch(Exception ex)
		{
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return clientContacts;
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
	public Boolean deleteClientContactByClientId(Integer client_id, Integer brand_id) {
		Boolean result = false;
		Session session = null;
		Query query = null;
		try {
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			query = session.createSQLQuery("UPDATE cms_client_contacts SET active = 0 where id = "+client_id+" and brand_id ="+brand_id+" ");			
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
	public Boolean deleteBrandDirectorsById(Integer id, Integer brand_id) {
		Boolean result = false;
		Session session = null;
		Query query = null;
		try {
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			query = session.createSQLQuery("UPDATE cms_brand_directors SET active = 0 where id = "+id+" and brand_id = "+brand_id+"");	
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
	public Boolean deleteClientContactById(Integer id, Integer brand_id) {
		Boolean result = false;
		Session session = null;
		Query query = null;
		try {
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			query = session.createQuery("DELETE FROM ClientContact where id = :id and brand_id = :brand_id");
			query.setParameter("id", id);
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
	public List<ClientContact> getAllClientContactByBrandandClientId (Integer client_id,Integer brand_id)
	{
		Session session = null;
		Query query = null;
		List<ClientContact> clientContactList = null;
		try 
		{
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			query = session.createQuery("from ClientContact where client_id = :client_id and brand_id = :brand_id and active = 1");
			query.setParameter("client_id", client_id);
			query.setParameter("brand_id", brand_id);
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
}
