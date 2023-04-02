package com.teksands.bootcamp.dao;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import org.apache.commons.io.FilenameUtils;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.hibernate.Query;
import org.hibernate.Session;

import com.teksands.bootcamp.model.Bootcamp;
import com.teksands.bootcamp.model.Brand;
import com.teksands.bootcamp.model.CallSchedule;
import com.teksands.bootcamp.model.Candidate;
import com.teksands.bootcamp.model.CandidateFeedback;
import com.teksands.bootcamp.model.ClientContact;
import com.teksands.bootcamp.model.ClientMaster;
import com.teksands.bootcamp.model.CmsUser;
import com.teksands.bootcamp.model.MentorMaster;
import com.teksands.bootcamp.model.Pincode;
import com.teksands.bootcamp.model.TestResults;
import com.teksands.dbConfig.HibernateUtils;
import com.teksands.utils.Utils;

public class CandidateDAO 
{

	public CmsUser getUserByEmail (String email)
	{
		Session session = null;
		Query query = null;
		CmsUser user = null;
		try 
		{
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			query = session.createQuery("from CmsUser where email = :email");
			query.setParameter("email", email);
			if(query.list().size() > 0) {
				user = (CmsUser) query.list().get(0);
			}
			
			session.getTransaction().commit();
		}
		catch(Exception ex)
		{
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return user;
	}
	
	public CmsUser ValidateLogin (String email, String password)
	{
		Session session = null;
		CmsUser cmsUser = null;
		Query query = null;

		try 
		{
			
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			query = session.createQuery("from CmsUser where email = :email and password = :password and active=1");
			query.setParameter("email", email);
			query.setParameter("password", password);
			if(query.list().size() > 0) {
				cmsUser = (CmsUser) query.list().get(0);
			}
		
			session.getTransaction().commit();
		}
		catch(Exception ex)
		{
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return cmsUser;
	}
	
	public CmsUser getUserById (Integer id)
	{
		Session session = null;
		Query query = null;
		CmsUser user = null;
		try 
		{
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			query = session.createQuery("from CmsUser where id = :id");
			query.setParameter("id", id);
			if(query.list().size() > 0) {
				user = (CmsUser) query.list().get(0);
			}
			
			session.getTransaction().commit();
		}
		catch(Exception ex)
		{
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return user;
	}
	
	public void changePassword(String id, String password)
	{
		Session session = null;
		Query query = null;
		List<CmsUser> list = null;
		
		try
		{
			session = HibernateUtils.getSession();
			session.getTransaction().begin();	
			
			query = session.createQuery("from CmsUser where id = :id");
			query.setString("id", id);
			list = query.list();
			
			if(list != null && list.size() > 0)
			{
				for (CmsUser user : list) 
				{
					String enc_pass = Utils.EncodeString(password);
					
					user.setPassword_encrypted(enc_pass);
	    			session.update(user);
				}
			}
			
			session.getTransaction().commit();
		}
		catch(Exception ex)
		{
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
	}
	
	public Candidate getCandidateById(Integer id)
	{
		Session session = null;
		Query query = null;
		Candidate candidate = null;
		try 
		{
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			query = session.createQuery("from Candidate where id = :id");
			query.setParameter("id", id);
			if(query.list().size() > 0) {
				candidate = (Candidate) query.list().get(0);
			}
			
			session.getTransaction().commit();
		}
		catch(Exception ex)
		{
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return candidate;
	}
	
	public void saveOrUpdateCandidate (Candidate candidate) {
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			session.saveOrUpdate(candidate);
			
			session.getTransaction().commit();
		}
		catch(Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
	}
	
	public List<Candidate> getLatestCandidate(int maxResults) 
	{
		Session session = null;
		Query query = null;
		List<Candidate> candidateList = null;
		
		try
		{
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			query = session.createQuery("from Candidate order by id desc");
			query.setMaxResults(maxResults);
			candidateList = query.list();
			
			session.getTransaction().commit();
		}
		catch(Exception ex)
		{
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return candidateList;
	}
	
	public Pincode getCityStateForPincode(String pincode)
	{
		Session session = null;
		Pincode pin = null;
		try
		{
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			Query query = session.createQuery("from Pincode where pincode=:pincode");
			query.setString("pincode", pincode);
			query.setMaxResults(1);
			List<Pincode> list = query.list();
			if(list != null && list.size() > 0)
			{
				pin = list.get(0);
			}
			else
			{
				pin = new Pincode();
				pin.setPincode(pincode);
				pin.setState("");
				pin.setCity("");
				pin.setState_code("");
			}
			session.getTransaction().commit();
		}
		catch(Exception ex)
		{
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return pin;
	}
	
	public List<Candidate> getAllCandidate ()
	{
		Session session = null;
		Query query = null;
		List<Candidate> candidateList = null;
		
		try {
			
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			query = session.createQuery("from Candidate");
			candidateList = query.list();

			session.getTransaction().commit();
		}
		catch(Exception ex)
		{
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return candidateList;
	}
	
	public List<Candidate> getAllCandidatesByJobId (Integer job_id)
	{
		Session session = null;
		Query query = null;
		List<Candidate> candidateList = null;
		
		try {
			
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			query = session.createQuery("from Candidate where job_id =:job_id order by created_date desc");
			query.setParameter("job_id", job_id);
			candidateList = query.list();

			session.getTransaction().commit();
		}
		catch(Exception ex)
		{
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return candidateList;
	}
	
	public void getCandidateUnCheck(String bootcamp_id, String bootcamp_name)
	{
		Session session = null;
		Query query = null;
		
		try 
		{
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			query = session.createQuery("from Candidate where bootcamp_ids like '%"+bootcamp_id+"%'");
			List<Candidate> candidateList = query.list();
			for (Candidate candidate : candidateList) 
			{
				String boot_ids = candidate.getBootcamp_ids();
				System.out.println("boot_ids--->"+boot_ids);
				String boot_names = candidate.getBootcamp_name();
				System.out.println("boot_names--->"+boot_names);
				String[] id_arr = boot_ids.split(",");
				String[] name_arr = boot_names.split(",");
				String new_text = "";
				String new_name = "";
				int cnt = 0;
				for (String str : id_arr) 
				{
					if(bootcamp_id.equalsIgnoreCase(str)) 
					{
						
					}else 
					{
						if(cnt != 0) 
						{
							new_text += ",";
						}
						new_text += str;
						cnt++;
					}
				}
				if(new_text.isEmpty()) 
				{
					new_text = "";
				}
				
				candidate.setBootcamp_ids(new_text);
				
				for (String str : name_arr) 
				{
					if(bootcamp_name.equalsIgnoreCase(str)) 
					{
						
					}else 
					{
						if(cnt != 0) 
						{
							new_name += ",";
						}
						new_name += str;
						cnt++;
					}
				}
				if(new_name.isEmpty()) 
				{
					new_name = "";
				}
				candidate.setBootcamp_name(new_name);
			}
			
			session.getTransaction().commit();
		}
		catch(Exception ex)
		{
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
	}
	
	public List<Candidate> getCandidateByIdList(List<Integer> id_list)
	{
		Session session = null;
		Query query = null;
		List<Candidate> candidateList = null;
		try 
		{
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			query = session.createQuery("from Candidate where id in (:id)");
			query.setParameterList("id", id_list);
			candidateList = query.list();
			
			session.getTransaction().commit();
		}
		catch(Exception ex)
		{
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return candidateList;
	}
	
	public List<Bootcamp> getBootcampCounts ()
	{
		Session session = null;
		Query query = null;
		List<Bootcamp> bootcampList = null;
		
		try {
			
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			query = session.createSQLQuery("select count(*) from cms_bootcamp");
			bootcampList = query.list();

			session.getTransaction().commit();
		}
		catch(Exception ex)
		{
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return bootcampList;
	}
	
	public List<Candidate> getCandidateCounts ()
	{
		Session session = null;
		Query query = null;
		List<Candidate> candidateList = null;
		
		try {
			
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			query = session.createSQLQuery("select count(*) from cms_candidate");
			candidateList = query.list();

			session.getTransaction().commit();
		}
		catch(Exception ex)
		{
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return candidateList;
	}
	
	public List<MentorMaster> getMentorMasterCounts ()
	{
		Session session = null;
		Query query = null;
		List<MentorMaster> mentorMasterList = null;
		
		try {
			
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			query = session.createSQLQuery("select count(*) from cms_mentor_master");
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
	
	public List<ClientMaster> getClientMasterCounts ()
	{
		Session session = null;
		Query query = null;
		List<ClientMaster> clientMasterList = null;
		
		try {
			
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			query = session.createSQLQuery("select count(*) from cms_client_master");
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
	
	public List<Candidate> searchAllCandidateByPageId(String keyword, int pageId)
    {
		 Session session = null;
		 Query query = null;
		 List<Candidate> candidatesearchList = null;
		 
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
						str = str + "name like '%" + string + "%'";
					}else
					{
						str = str + "name like '%" + string + "%' or ";
					}
					k++;
				}
				
				String sql = "";
				if(keyword.equalsIgnoreCase("all"))
				{
					sql = "from Candidate where active = 1 order by id desc";
				}
				else
				{
					sql = "from Candidate where "+ str +"  and active = 1 order by id desc";
				}
		
				query = session.createQuery(sql);
				query.setFirstResult(pageId * 10);
				query.setMaxResults(10);
				candidatesearchList = query.list();
	
				session.getTransaction().commit();
		 }
		 catch(Exception ex)
		 {
			session.getTransaction().rollback();
			ex.printStackTrace();
		 }
		 return candidatesearchList;
	 }
	
	public void saveOrUpdateCallSchedule (CallSchedule callSchedule) {
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			session.saveOrUpdate(callSchedule);
			
			session.getTransaction().commit();
		}
		catch(Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
	}
	
	public void saveCandidateFeedback (CandidateFeedback candidateFeedback) {
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			session.save(candidateFeedback);
			
			session.getTransaction().commit();
		}
		catch(Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
	}
	
	public List<CandidateFeedback> getCandidateFeedbackByCandidateId (Integer id)
	{
		Session session = null;
		Query query = null;
		List<CandidateFeedback> candidateFeedbackList = null;
		try 
		{
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			query = session.createQuery("from CandidateFeedback where candidate_id = :id");
			query.setParameter("id", id);
			candidateFeedbackList = query.list();
			
			session.getTransaction().commit();
		}
		catch(Exception ex)
		{
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return candidateFeedbackList;
	}
	
	public List<CallSchedule> getAllCallScheduleByCandidateId (Integer id)
	{
		Session session = null;
		Query query = null;
		List<CallSchedule> callScheduleList = null;
		try 
		{
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			query = session.createQuery("from CallSchedule where candidate_id = :id and active=1");
			query.setParameter("id", id);
			callScheduleList = query.list();
			
			session.getTransaction().commit();
		}
		catch(Exception ex)
		{
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return callScheduleList;
	}
	
	public CallSchedule getCallScheduleById(Integer id)
	{
		Session session = null;
		Query query = null;
		CallSchedule callSchedule = null;
		try 
		{
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			query = session.createQuery("from CallSchedule where id = :id");
			query.setParameter("id", id);
			if(query.list().size() > 0) {
				callSchedule = (CallSchedule) query.list().get(0);
			}
			
			session.getTransaction().commit();
		}
		catch(Exception ex)
		{
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return callSchedule;
	}
	
	public void saveOrUpdateTestResult (TestResults testResults) {
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			session.saveOrUpdate(testResults);
			
			session.getTransaction().commit();
		}
		catch(Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
	}
	
	public List<TestResults> getAllTestResultbyCandidateIt (Integer candidate_id)
	{
		Session session = null;
		Query query = null;
		List<TestResults> testResultsList = null;
		try 
		{
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			query = session.createQuery("from TestResults where candidate_id = :candidate_id");
			query.setParameter("candidate_id", candidate_id);
			testResultsList = query.list();
			
			session.getTransaction().commit();
		}
		catch(Exception ex)
		{
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return testResultsList;
	}
	
	public boolean bulkUploadCandidateDetails(File file) 
	{
		Query query = null;
		Session session = null;
		boolean flag = false;
		
		String name = "";
		String email = "";
		String mobile = "";
		String gender = "";
		String marital_status = "";
		Date date_of_birth = null;
		String current_location = "";
		String preferred_location = "";
		String permanent_address = "";
		String permanent_city = "";
		String permanent_state = "";
		String permanent_country = "";
		String permanent_pincode = "";
		String total_experience = "";
		String curr_company_name = "";
		String curr_company_desigination = "";
		String functional_area = "";
		String role = "";
		String industry = "";
		String key_skills = "";
		String annual_salary = "";
		String notice_period = "";
		String resume_headling = "";
		String summary = "";
		String ug_degree = "";
		String ug_specialization = "";
		String ug_college_name = "";
		String ug_graduation_year = "";
		String pg_degree = "";
		String pg_specialization = "";
		String pg_college_name = "";
		String pg_graduation_year = "";
		String doctorate_degree = "";
		String doctorate_specialization = "";
		String doctorate_university = "";
		String doctorate_graduation_year = "";
		String work_permit_status = "";
		String ts_screening_comment_1 = "";
		String ts_screening_comment_2 = "";
		String ts_screening_comment_3 = "";
		String ts_screening_grade = "";
		String placed_company = "";
		Date placed_date = null;
				
		String filePath = file.getPath();
		String extension = FilenameUtils.getExtension(filePath);
		
		try {
			
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			Calendar cal = Calendar.getInstance();
			Date today = cal.getTime();
			
			HashMap<String, CmsUser> userIDMap = new HashMap<String, CmsUser>();
			
			if(extension.equalsIgnoreCase("xls"))
			{
				InputStream input = new BufferedInputStream(new FileInputStream(filePath));
	       	   	POIFSFileSystem fs = new POIFSFileSystem(input);
	       	   	HSSFWorkbook wb = new HSSFWorkbook(fs);
	       	   	HSSFSheet sheet = wb.getSheetAt(0);
	       	   	Iterator<Row> rows = sheet.rowIterator(); 
	       	   	
	       	   	int count = 0;
	       	   	while( rows.hasNext() ) 
	       	   	{   
		               HSSFRow row = (HSSFRow) rows.next();
		               if(row.getRowNum() == 0)
		               {
		               		continue;
		               }
		               
		               count++;
		               
		               name = "";
			       		email = "";
			       		mobile = "";
			       		gender = "";
			       		marital_status = "";
			       		date_of_birth = null;
			       		current_location = "";
			       		preferred_location = "";
			       		permanent_address = "";
			       		permanent_city = "";
			       		permanent_state = "";
			       		permanent_country = "";
			       		permanent_pincode = "";
			       		total_experience = "";
			       		curr_company_name = "";
			       		curr_company_desigination = "";
			       		functional_area = "";
			       		role = ""; 
			       		industry = "";
			       		key_skills = "";
			       		annual_salary = "";
			       		notice_period = "";
			       		resume_headling = "";
			       		summary = "";
			       		ug_degree = "";
			       		ug_specialization = "";
			       		ug_college_name = "";
			       		ug_graduation_year = "";
			       		pg_degree = "";
			       		pg_specialization = "";
			       		pg_college_name = "";
			       		pg_graduation_year = "";
			       		doctorate_degree = "";
			       		doctorate_specialization = "";
			       		doctorate_university = "";
			       		doctorate_graduation_year = "";
			       		work_permit_status = "";
			       		ts_screening_comment_1 = "";
			       		ts_screening_comment_2 = "";
			       		ts_screening_comment_3 = "";
			       		ts_screening_grade = "";
			       		placed_company = "";
			       		placed_date = null;
		       		
		               Iterator<Cell> cells = row.cellIterator();
		               while(cells.hasNext()) 
		               {
		                   HSSFCell cell = (HSSFCell) cells.next();
		                   if(cell.getColumnIndex() == 0)
		                   {
		                	   name = getCellValue(cell);
		                   }
		                   if(cell.getColumnIndex() == 1)
		                   {
		                	   email = getCellValue(cell);
		                   }
		                   if(cell.getColumnIndex() == 2)
		                   {
		                	   mobile = getCellValue(cell);
		                   }
		                   if(cell.getColumnIndex() == 3)
		                   {
		                	   gender = getCellValue(cell);
		                   }
		                   if(cell.getColumnIndex() == 4)
		                   {
		                	   marital_status = getCellValue(cell);
		                   }
		                   if(cell.getColumnIndex() == 5)
		                   {
		                	   date_of_birth = cell.getDateCellValue();
		                   }
		                   if(cell.getColumnIndex() == 6)
		                   {
		                	   current_location = getCellValue(cell);
		                   }
		                   if(cell.getColumnIndex() == 7)
		                   {
		                	   preferred_location = getCellValue(cell);
		                   }
		                   if(cell.getColumnIndex() == 8)
		                   {
		                	   permanent_address = getCellValue(cell);
		                   }
		                   if(cell.getColumnIndex() == 9)
		                   {
		                	   permanent_city = getCellValue(cell);
		                   }
		                   if(cell.getColumnIndex() == 10)
		                   {
		                	   permanent_state = getCellValue(cell);
		                   }
		                   if(cell.getColumnIndex() == 11)
		                   {
		                	   permanent_country = getCellValue(cell);
		                   }
		                   if(cell.getColumnIndex() == 12)
		                   {
		                	   permanent_pincode = getCellValue(cell);
		                   }
		                   if(cell.getColumnIndex() == 13)
		                   {
		                	   total_experience = getCellValue(cell);
		                   }
		                   if(cell.getColumnIndex() == 14)
		                   {
		                	   curr_company_name = getCellValue(cell);
		                   }
		                   if(cell.getColumnIndex() == 15)
		                   {
		                	   curr_company_desigination = getCellValue(cell);
		                   }
		                   if(cell.getColumnIndex() == 16)
		                   {
		                	   functional_area = getCellValue(cell);
		                   }
		                   if(cell.getColumnIndex() == 17)
		                   {
		                	   role = getCellValue(cell);
		                   }
		                   if(cell.getColumnIndex() == 18)
		                   {
		                	   industry = getCellValue(cell);
		                   }
		                   if(cell.getColumnIndex() == 19)
		                   {
		                	   key_skills = getCellValue(cell);
		                   }
		                   if(cell.getColumnIndex() == 20)
		                   {
		                	   annual_salary = getCellValue(cell);
		                   }
		                   if(cell.getColumnIndex() == 21)
		                   {
		                	   notice_period = getCellValue(cell);
		                   }
		                   if(cell.getColumnIndex() == 22)
		                   {
		                	   resume_headling = getCellValue(cell);
		                   }
		                   if(cell.getColumnIndex() == 23)
		                   {
		                	   summary = getCellValue(cell);
		                   }
		                   if(cell.getColumnIndex() == 24)
		                   {
		                	   ug_degree = getCellValue(cell);
		                   }
		                   if(cell.getColumnIndex() == 25)
		                   {
		                	   ug_specialization = getCellValue(cell);
		                   }
		                   if(cell.getColumnIndex() == 26)
		                   {
		                	   ug_college_name = getCellValue(cell);
		                   }
		                   if(cell.getColumnIndex() == 27)
		                   {
		                	   ug_graduation_year = getCellValue(cell);
		                   }
		                   if(cell.getColumnIndex() == 28)
		                   {
		                	   pg_degree = getCellValue(cell);
		                   }
		                   if(cell.getColumnIndex() == 29)
		                   {
		                	   pg_specialization = getCellValue(cell);
		                   }
		                   if(cell.getColumnIndex() == 30)
		                   {
		                	   pg_college_name = getCellValue(cell);
		                   }
		                   if(cell.getColumnIndex() == 31)
		                   {
		                	   pg_graduation_year = getCellValue(cell);
		                   }
		                   if(cell.getColumnIndex() == 32)
		                   {
		                	   doctorate_degree = getCellValue(cell);
		                   }
		                   if(cell.getColumnIndex() == 33)
		                   {
		                	   doctorate_specialization = getCellValue(cell);
		                   }
		                   if(cell.getColumnIndex() == 34)
		                   {
		                	   doctorate_university = getCellValue(cell);
		                   }
		                   if(cell.getColumnIndex() == 35)
		                   {
		                	   doctorate_graduation_year = getCellValue(cell);
		                   }
		                   if(cell.getColumnIndex() == 36)
		                   {
		                	   work_permit_status = getCellValue(cell);
		                   }
		                   if(cell.getColumnIndex() == 37)
		                   {
		                	   ts_screening_comment_1 = getCellValue(cell);
		                   }
		                   if(cell.getColumnIndex() == 38)
		                   {
		                	   ts_screening_comment_2 = getCellValue(cell);
		                   }
		                   if(cell.getColumnIndex() == 39)
		                   {
		                	   ts_screening_comment_3 = getCellValue(cell);
		                   }
		                   if(cell.getColumnIndex() == 40)
		                   {
		                	   ts_screening_grade = getCellValue(cell);
		                   }
		                   if(cell.getColumnIndex() == 41)
		                   {
		                	   placed_company = getCellValue(cell);
		                   }
		                   if(cell.getColumnIndex() == 42)
		                   {
		                	   placed_date = cell.getDateCellValue();
		                   }
		               }    					
		              
		               Candidate candidate = new Candidate();
		               candidate.setName(name);
		               candidate.setEmail(email);
		               candidate.setMobile(mobile);
		               candidate.setGender(gender);
		               candidate.setDate_of_birth(date_of_birth);
		               candidate.setMarital_status(marital_status);
		               candidate.setCurrent_location(current_location);
		               candidate.setPreferred_location(preferred_location);
		               candidate.setPermanent_address(permanent_address);
		               candidate.setPermanent_city(permanent_city);
		               candidate.setPermanent_state(permanent_state);
		               candidate.setPermanent_country(permanent_country);
		               candidate.setPermanent_pincode(permanent_pincode);
		               candidate.setResume_headling(resume_headling);
		               candidate.setSummary(summary);
		               candidate.setCurr_company_name(curr_company_name);
		               candidate.setCurr_company_desigination(curr_company_desigination);
		               candidate.setFunctional_area(functional_area);
		               candidate.setIndustry(industry);
		               candidate.setTotal_experience(total_experience);
		               candidate.setRole(role);
		               candidate.setKey_skills(key_skills);
		               candidate.setAnnual_salary(annual_salary);
		               candidate.setNotice_period(notice_period);
		               candidate.setWork_permit_status(work_permit_status);
		               candidate.setUg_college_name(ug_college_name);
		               candidate.setUg_degree(ug_degree);
		               candidate.setUg_specialization(ug_specialization);
		               candidate.setUg_graduation_year(ug_graduation_year);
		               candidate.setPg_college_name(pg_college_name);
		               candidate.setPg_degree(pg_degree);
		               candidate.setPg_specialization(pg_specialization);
		               candidate.setPg_graduation_year(pg_graduation_year);
		               candidate.setDoctorate_university(doctorate_university);
		               candidate.setDoctorate_degree(doctorate_degree);
		               candidate.setDoctorate_specialization(doctorate_specialization);
		               candidate.setDoctorate_graduation_year(doctorate_graduation_year);
		               candidate.setTs_screening_comment_1(ts_screening_comment_1);
		               candidate.setTs_screening_comment_2(ts_screening_comment_2);
		               candidate.setTs_screening_comment_3(ts_screening_comment_3);
		               candidate.setPlaced_company(placed_company);
		               candidate.setTs_screening_grade(ts_screening_grade);
		               candidate.setPlaced_date(placed_date);
		               candidate.setCreated_date(new Date());
		               candidate.setActive(true);
		               
		               session.save(candidate);
	                   flag = true;
	       	   	   }	
	       	    }
	       	   	else
				{

					flag = false;
				}       
				session.getTransaction().commit();
			}
		catch(Exception ex)
		{
			flag = false;
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return flag;
	}
	
	public String getCellValue(Cell cell)
	{
		if(cell.getCellType() == Cell.CELL_TYPE_BOOLEAN)
		{
			
			return String.valueOf(cell.getBooleanCellValue()).trim();
		}
		else if(cell.getCellType() == Cell.CELL_TYPE_NUMERIC)
		{
			if (HSSFDateUtil.isCellDateFormatted(cell)) 
			{
				Date cell_date = cell.getDateCellValue();
				SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
				return sdf.format(cell_date).trim();
		    }else{
		    	Double e1Val = cell.getNumericCellValue();
		    	DecimalFormat myFormatter = new DecimalFormat("########################.########################");
	     	   	return myFormatter.format(e1Val).trim();
		    }
		}
		else if(cell.getCellType() == Cell.CELL_TYPE_STRING)
		{
			return cell.getStringCellValue().trim();
		}
		else
		{
			return "";
		}
	}
	
	public void saveOrUpdateCmsUser(CmsUser cmsUser) {
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			session.saveOrUpdate(cmsUser);
			
			session.getTransaction().commit();
		}
		catch(Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
	}
	
	public boolean checkIfMobileEmailAlreadyExist (String mobile, String email) {
		
		Session session = null;
		Query query = null;
		boolean flag = true;
		
		try {
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			query = session.createQuery("from CmsUser where (mobile=:mobile or email=:email)");
			query.setString("mobile", mobile);
			query.setString("email", email);
			List<CmsUser> list = query.list();
			
			if(list != null && list.size() > 0) 
			{
				flag = false;
			}
			
			session.getTransaction().commit();
		}
		catch(Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return flag;
	}
	public int checkEmailAlreadyExistOrNot (String email) {
		
		Session session = null;
		Query query = null;
		Query queryInactive = null;
		Integer res = 0;
		
		try {
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			query = session.createQuery("from CmsUser where email=:email and active = 1");
			query.setString("email", email);
			
			queryInactive = session.createQuery("from CmsUser where email=:email and active = 0");
			queryInactive.setString("email", email);
			
			
			List<CmsUser> list = query.list();
			
			List<CmsUser> inActiveList = queryInactive.list();
			
			if(list != null && list.size() > 0) 
			{
				res = 1;
			}
			else if(inActiveList != null && inActiveList.size() > 0)
			{
				res = 2;
			}
			
			session.getTransaction().commit();
		}
		catch(Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return res;
	}
	public Brand getBrandByName(String brand_name)
	{
		Session session = null;
		Query query = null;
		Brand brand = null;
		try 
		{
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			query = session.createQuery("from Brand where name like "+"'"+brand_name+"'"+"");
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
