package com.teksands.admin.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.teksands.dbConfig.HibernateUtils;
import com.teksands.user.model.Article;
import com.teksands.user.model.Blogs;
import com.teksands.user.model.Career;
import com.teksands.user.model.Contactus;
import com.teksands.user.model.Contributor;
import com.teksands.user.model.CorporateEnquiry;
import com.teksands.user.model.Courses;
import com.teksands.user.model.EBPCandidate;
import com.teksands.user.model.Ebooks;
import com.teksands.user.model.EbooksDownload;
import com.teksands.user.model.EbpEmails;
import com.teksands.user.model.Internship;
import com.teksands.user.model.ItStaffing;
import com.teksands.user.model.Jobs;
import com.teksands.user.model.JobsApplications;
import com.teksands.user.model.Leads;
import com.teksands.user.model.Mentors;
import com.teksands.user.model.Trainers;
import com.teksands.user.model.Users;
import com.teksands.user.model.WebinarContacts;
import com.teksands.user.model.Webinars;

public class AdminDAO {
	
	public Users getUserByEmail (String email)
	{
		Session session = null;
		Query query = null;
		Users user = null;
		try 
		{
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			query = session.createQuery("from Users where email = :email");
			query.setParameter("email", email);
			if(query.list().size() > 0) {
				user = (Users) query.list().get(0);
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
	
	public List<Leads> getAllLeads() {
		Session session = null;
		Query query = null;
		List<Leads> leadsList = null;

		try {

			session = HibernateUtils.getSession();
			session.getTransaction().begin();

			query = session.createQuery("from Leads order by id desc");
			leadsList = query.list();

			session.getTransaction().commit();
		} catch (Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return leadsList;
	}

	public Users ValidateLogin(String email, String password_encrypted) {
		Session session = null;
		Users user = null;
		Query query = null;

		try {

			session = HibernateUtils.getSession();
			session.getTransaction().begin();

			query = session.createQuery("from Users where email = :email and password_encrypted = :password_encrypted");
			query.setParameter("email", email);
			query.setParameter("password_encrypted", password_encrypted);
			if (query.list().size() > 0) {
				user = (Users) query.list().get(0);
			}

			session.getTransaction().commit();
		} catch (Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return user;
	}

	public List<Contactus> getAllContacts() {
		Session session = null;
		Query query = null;
		List<Contactus> contactsList = null;

		try {

			session = HibernateUtils.getSession();
			session.getTransaction().begin();

			query = session.createQuery("from Contactus order by id desc");
			contactsList = query.list();

			session.getTransaction().commit();
		} catch (Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return contactsList;
	}

	public List<Contributor> getAllContributor() {
		Session session = null;
		Query query = null;
		List<Contributor> contributorList = null;

		try {

			session = HibernateUtils.getSession();
			session.getTransaction().begin();

			query = session.createQuery("from Contributor order by id desc");
			contributorList = query.list();

			session.getTransaction().commit();
		} catch (Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return contributorList;
	}

	public List<Trainers> getAllTrainers() {
		Session session = null;
		Query query = null;
		List<Trainers> trainersList = null;

		try {

			session = HibernateUtils.getSession();
			session.getTransaction().begin();

			query = session.createQuery("from Trainers order by id desc");
			trainersList = query.list();

			session.getTransaction().commit();
		} catch (Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return trainersList;
	}

	public Trainers getTrainerById(Integer id) {
		Session session = null;
		Query query = null;
		Trainers trainers = null;
		try {
			session = HibernateUtils.getSession();
			session.getTransaction().begin();

			query = session.createQuery("from Trainers where id = :id");
			query.setParameter("id", id);
			if (query.list().size() > 0) {
				trainers = (Trainers) query.list().get(0);
			}

			session.getTransaction().commit();
		} catch (Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return trainers;
	}

	public List<Career> getAllCareer() {
		Session session = null;
		Query query = null;
		List<Career> careerList = null;

		try {

			session = HibernateUtils.getSession();
			session.getTransaction().begin();

			query = session.createQuery("from Career order by id desc");
			careerList = query.list();

			session.getTransaction().commit();
		} catch (Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return careerList;
	}

	public Career getCareersById(Integer id) {
		Session session = null;
		Query query = null;
		Career career = null;
		try {
			session = HibernateUtils.getSession();
			session.getTransaction().begin();

			query = session.createQuery("from Career where id = :id");
			query.setParameter("id", id);

			if (query.list().size() > 0) {
				career = (Career) query.list().get(0);
			}

			session.getTransaction().commit();
		} catch (Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return career;
	}

	public List<Internship> getAllInternship() {
		Session session = null;
		Query query = null;
		List<Internship> internshipList = null;

		try {

			session = HibernateUtils.getSession();
			session.getTransaction().begin();

			query = session.createQuery("from Internship order by id desc");
			internshipList = query.list();

			session.getTransaction().commit();
		} catch (Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return internshipList;
	}

	public Internship getInternshipById(Integer id) {
		Session session = null;
		Query query = null;
		Internship internship = null;
		try {
			session = HibernateUtils.getSession();
			session.getTransaction().begin();

			query = session.createQuery("from Internship where id = :id");
			query.setParameter("id", id);

			if (query.list().size() > 0) {
				internship = (Internship) query.list().get(0);
			}

			session.getTransaction().commit();
		} catch (Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return internship;
	}

	public List<EbooksDownload> getAllEbooksDownload() {
		Session session = null;
		Query query = null;
		List<EbooksDownload> ebooksDownloadList = null;

		try {

			session = HibernateUtils.getSession();
			session.getTransaction().begin();

			query = session.createQuery("from EbooksDownload order by id desc");
			ebooksDownloadList = query.list();

			session.getTransaction().commit();
		} catch (Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return ebooksDownloadList;
	}

	public List<Webinars> getWebinarList() {
		Session session = null;
		Query query = null;
		List<Webinars> webinarsList = null;

		try {

			session = HibernateUtils.getSession();
			session.getTransaction().begin();

			query = session.createQuery("from Webinars order by id asc");
			webinarsList = query.list();

			session.getTransaction().commit();
		} catch (Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return webinarsList;
	}

	public List<WebinarContacts> getWebinarContacts() {
		Session session = null;
		Query query = null;
		List<WebinarContacts> webinarContactList = null;

		try {

			session = HibernateUtils.getSession();
			session.getTransaction().begin();

			query = session.createQuery("from WebinarContacts order by id asc");
			webinarContactList = query.list();

			session.getTransaction().commit();
		} catch (Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return webinarContactList;
	}

	public Boolean saveWebinars(Webinars webinars) {

		Boolean result = false;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			session.getTransaction().begin();

			session.save(webinars);
			result = true;

			session.getTransaction().commit();
		} catch (Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
			return result;
		}
		return result;
	}

	public Webinars getWebinarsById(Integer id) {
		Session session = null;
		Query query = null;
		Webinars webinars = null;
		try {
			session = HibernateUtils.getSession();
			session.getTransaction().begin();

			query = session.createQuery("from Webinars where id = :id");
			query.setParameter("id", id);

			if (query.list().size() > 0) {
				webinars = (Webinars) query.list().get(0);
			}

			session.getTransaction().commit();
		} catch (Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return webinars;
	}

	public Webinars saveWebinarPublish(Integer id, String status) {
		Session session = null;
		Query query = null;
		Webinars webinars = null;
		try {
			session = HibernateUtils.getSession();
			session.getTransaction().begin();

			query = session.createQuery("from Webinars where id = :id");
			query.setParameter("id", id);
			if (query.list().size() > 0) {
				webinars = (Webinars) query.list().get(0);
				webinars.setStatus(status);
			}

			session.getTransaction().commit();
		} catch (Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return webinars;
	}

	public List<JobsApplications> getAllJobsApplication() {
		Session session = null;
		Query query = null;
		List<JobsApplications> jobsApplications = null;

		try {

			session = HibernateUtils.getSession();
			session.getTransaction().begin();

			query = session.createQuery("from JobsApplications order by id asc");
			jobsApplications = query.list();

			session.getTransaction().commit();
		} catch (Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return jobsApplications;
	}

	public List<Jobs> getAllJobsList() {
		Session session = null;
		Query query = null;
		List<Jobs> jobsList = null;

		try {

			session = HibernateUtils.getSession();
			session.getTransaction().begin();

			query = session.createQuery("from Jobs order by id asc");
			jobsList = query.list();

			session.getTransaction().commit();
		} catch (Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return jobsList;
	}

	public Jobs getJobsById(Integer id) {
		Session session = null;
		Query query = null;
		Jobs jobs = null;
		try {
			session = HibernateUtils.getSession();
			session.getTransaction().begin();

			query = session.createQuery("from Jobs where id = :id");
			query.setParameter("id", id);

			if (query.list().size() > 0) {
				jobs = (Jobs) query.list().get(0);
			}

			session.getTransaction().commit();
		} catch (Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return jobs;
	}

	public Jobs saveJobsPublish(Integer id, String active) {
		Session session = null;
		Query query = null;
		Jobs jobs = null;
		try {
			session = HibernateUtils.getSession();
			session.getTransaction().begin();

			query = session.createQuery("from Jobs where id = :id");
			query.setParameter("id", id);
			if (query.list().size() > 0) {
				jobs = (Jobs) query.list().get(0);
				jobs.setActive(active);
			}

			session.getTransaction().commit();
		} catch (Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return jobs;
	}

	public Boolean saveJobs(Jobs jobs) {

		Boolean result = false;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			session.getTransaction().begin();

			session.save(jobs);
			result = true;

			session.getTransaction().commit();
		} catch (Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
			return result;
		}
		return result;
	}

	public Boolean updateJobs(Jobs jobs) {

		Boolean result = false;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			session.getTransaction().begin();

			session.update(jobs);
			result = true;

			session.getTransaction().commit();
		} catch (Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
			return result;
		}
		return result;
	}
	
	public Boolean saveOrUpdateJobs(Jobs jobs) {

		Boolean result = false;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			session.getTransaction().begin();

			session.saveOrUpdate(jobs);;
			result = true;

			session.getTransaction().commit();
		} catch (Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
			return result;
		}
		return result;
	}

	public List<Leads> getLeadsCounts() {
		Session session = null;
		Query query = null;
		List<Leads> leadsList = null;

		try {

			session = HibernateUtils.getSession();
			session.getTransaction().begin();

			query = session.createSQLQuery("select count(*) from leads");
			leadsList = query.list();

			session.getTransaction().commit();
		} catch (Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return leadsList;
	}

	public List<Contactus> getContactsCounts() {
		Session session = null;
		Query query = null;
		List<Contactus> contactusList = null;

		try {

			session = HibernateUtils.getSession();
			session.getTransaction().begin();

			query = session.createSQLQuery("select count(*) from contactus");
			contactusList = query.list();

			session.getTransaction().commit();
		} catch (Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return contactusList;
	}

	public List<Contributor> getContributorCounts() {
		Session session = null;
		Query query = null;
		List<Contributor> contributorList = null;

		try {

			session = HibernateUtils.getSession();
			session.getTransaction().begin();

			query = session.createSQLQuery("select count(*) from contributor");
			contributorList = query.list();

			session.getTransaction().commit();
		} catch (Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return contributorList;
	}

	public List<Trainers> getTrainersCounts() {
		Session session = null;
		Query query = null;
		List<Trainers> trainersList = null;

		try {

			session = HibernateUtils.getSession();
			session.getTransaction().begin();

			query = session.createSQLQuery("select count(*) from trainers");
			trainersList = query.list();

			session.getTransaction().commit();
		} catch (Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return trainersList;
	}

	public List<Career> getCareerCounts() {
		Session session = null;
		Query query = null;
		List<Career> careerList = null;

		try {

			session = HibernateUtils.getSession();
			session.getTransaction().begin();

			query = session.createSQLQuery("select count(*) from career");
			careerList = query.list();

			session.getTransaction().commit();
		} catch (Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return careerList;
	}

	public List<Internship> getInternshipCounts() {
		Session session = null;
		Query query = null;
		List<Internship> internshipList = null;

		try {

			session = HibernateUtils.getSession();
			session.getTransaction().begin();

			query = session.createSQLQuery("select count(*) from internship");
			internshipList = query.list();

			session.getTransaction().commit();
		} catch (Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return internshipList;
	}

	public List<EbooksDownload> getEbooksDownloadCounts() {
		Session session = null;
		Query query = null;
		List<EbooksDownload> ebooksDownloadList = null;

		try {

			session = HibernateUtils.getSession();
			session.getTransaction().begin();

			query = session.createSQLQuery("select count(*) from ebooks_download");
			ebooksDownloadList = query.list();

			session.getTransaction().commit();
		} catch (Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return ebooksDownloadList;
	}

	public List<JobsApplications> getJobsApplicationsCounts() {
		Session session = null;
		Query query = null;
		List<JobsApplications> jobsApplicationsList = null;

		try {

			session = HibernateUtils.getSession();
			session.getTransaction().begin();

			query = session.createSQLQuery("select count(*) from jobs_applications");
			jobsApplicationsList = query.list();

			session.getTransaction().commit();
		} catch (Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return jobsApplicationsList;
	}

	public List<WebinarContacts> getWebinarContactsCounts() {
		Session session = null;
		Query query = null;
		List<WebinarContacts> webinarContactsList = null;

		try {

			session = HibernateUtils.getSession();
			session.getTransaction().begin();

			query = session.createSQLQuery("select count(*) from webinars_contacts");
			webinarContactsList = query.list();

			session.getTransaction().commit();
		} catch (Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return webinarContactsList;
	}

	public List<Blogs> getBlogsCounts() {
		Session session = null;
		Query query = null;
		List<Blogs> blogsList = null;

		try {

			session = HibernateUtils.getSession();
			session.getTransaction().begin();

			query = session.createSQLQuery("select count(*) from blogs");
			blogsList = query.list();

			session.getTransaction().commit();
		} catch (Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return blogsList;
	}

	public List<Article> getArticleCounts() {
		Session session = null;
		Query query = null;
		List<Article> articleList = null;

		try {

			session = HibernateUtils.getSession();
			session.getTransaction().begin();

			query = session.createSQLQuery("select count(*) from short_reads");
			articleList = query.list();

			session.getTransaction().commit();
		} catch (Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return articleList;
	}

	public List<Courses> getCoursesCounts() {
		Session session = null;
		Query query = null;
		List<Courses> coursesList = null;

		try {

			session = HibernateUtils.getSession();
			session.getTransaction().begin();

			query = session.createSQLQuery("select count(*) from courses");
			coursesList = query.list();

			session.getTransaction().commit();
		} catch (Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return coursesList;
	}

	public List<Ebooks> getEbooksCounts() {
		Session session = null;
		Query query = null;
		List<Ebooks> ebooksList = null;

		try {

			session = HibernateUtils.getSession();
			session.getTransaction().begin();

			query = session.createSQLQuery("select count(*) from ebooks");
			ebooksList = query.list();

			session.getTransaction().commit();
		} catch (Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return ebooksList;
	}

	public List<Jobs> getJobsCounts() {
		Session session = null;
		Query query = null;
		List<Jobs> jobsList = null;

		try {

			session = HibernateUtils.getSession();
			session.getTransaction().begin();

			query = session.createSQLQuery("select count(*) from jobs");
			jobsList = query.list();

			session.getTransaction().commit();
		} catch (Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return jobsList;
	}

	public List<Webinars> getWebinarsCounts() {
		Session session = null;
		Query query = null;
		List<Webinars> webinarsList = null;

		try {

			session = HibernateUtils.getSession();
			session.getTransaction().begin();

			query = session.createSQLQuery("select count(*) from webinars where status = 1");
			webinarsList = query.list();

			session.getTransaction().commit();
		} catch (Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return webinarsList;
	}

	public List<Blogs> getAllBlogs() {
		Session session = null;
		Query query = null;
		List<Blogs> techArticleList = null;

		try {

			session = HibernateUtils.getSession();
			session.getTransaction().begin();

			query = session.createQuery("from Blogs order by id desc");
			techArticleList = query.list();

			session.getTransaction().commit();
		} catch (Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return techArticleList;
	}

	public List<Article> getAllArticles() {
		Session session = null;
		Query query = null;
		List<Article> blogArticleList = null;

		try {

			session = HibernateUtils.getSession();
			session.getTransaction().begin();

			query = session.createQuery("from Article order by id desc");
			blogArticleList = query.list();

			session.getTransaction().commit();
		} catch (Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return blogArticleList;
	}

	public List<Courses> getAllCourses() {
		Session session = null;
		Query query = null;
		List<Courses> coursesAllList = null;

		try {

			session = HibernateUtils.getSession();
			session.getTransaction().begin();

			query = session.createQuery("from Courses order by id desc");
			coursesAllList = query.list();

			session.getTransaction().commit();
		} catch (Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return coursesAllList;
	}

	public List<Ebooks> getAllEbooks() {
		Session session = null;
		Query query = null;
		List<Ebooks> ebooksAllList = null;

		try {

			session = HibernateUtils.getSession();
			session.getTransaction().begin();

			query = session.createQuery("from Ebooks order by id desc");
			ebooksAllList = query.list();

			session.getTransaction().commit();
		} catch (Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return ebooksAllList;
	}

	public List<Jobs> getAllJobs() {
		Session session = null;
		Query query = null;
		List<Jobs> jobsAllList = null;

		try {

			session = HibernateUtils.getSession();
			session.getTransaction().begin();

			query = session.createQuery("from Jobs where active = 1 order by id desc");
			jobsAllList = query.list();

			session.getTransaction().commit();
		} catch (Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return jobsAllList;
	}

	public List<Webinars> getAllWebinars() {
		Session session = null;
		Query query = null;
		List<Webinars> webinarsAllList = null;

		try {

			session = HibernateUtils.getSession();
			session.getTransaction().begin();

			query = session.createQuery("from Webinars where status = 1 order by id desc");
			webinarsAllList = query.list();

			session.getTransaction().commit();
		} catch (Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return webinarsAllList;
	}

	public List<CorporateEnquiry> getAllCorporateEnquiry() {
		Session session = null;
		Query query = null;
		List<CorporateEnquiry> corporateEnquiryList = null;

		try {

			session = HibernateUtils.getSession();
			session.getTransaction().begin();

			query = session.createQuery("from CorporateEnquiry order by id desc");
			corporateEnquiryList = query.list();

			session.getTransaction().commit();
		} catch (Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return corporateEnquiryList;
	}

	public List<Mentors> getAllMentors() {
		Session session = null;
		Query query = null;
		List<Mentors> mentorsList = null;

		try {

			session = HibernateUtils.getSession();
			session.getTransaction().begin();

			query = session.createQuery("from Mentors order by id desc");
			mentorsList = query.list();

			session.getTransaction().commit();
		} catch (Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return mentorsList;
	}

	public Mentors getMentorsById(Integer id) {
		Session session = null;
		Query query = null;
		Mentors mentors = null;
		try {
			session = HibernateUtils.getSession();
			session.getTransaction().begin();

			query = session.createQuery("from Mentors where id = :id");
			query.setParameter("id", id);
			if (query.list().size() > 0) {
				mentors = (Mentors) query.list().get(0);
			}

			session.getTransaction().commit();
		} catch (Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return mentors;
	}

	public List<EBPCandidate> getAllEBPCandidate() {
		Session session = null;
		Query query = null;
		List<EBPCandidate> ebpCandidateList = null;

		try {

			session = HibernateUtils.getSession();
			session.getTransaction().begin();

			query = session.createQuery("from EBPCandidate order by id desc");
			ebpCandidateList = query.list();

			session.getTransaction().commit();
		} catch (Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return ebpCandidateList;
	}

	public EBPCandidate getEBPCandidateById(Integer id) {
		Session session = null;
		Query query = null;
		EBPCandidate ebpCandidate = null;
		try {
			session = HibernateUtils.getSession();
			session.getTransaction().begin();

			query = session.createQuery("from EBPCandidate where id = :id");
			query.setParameter("id", id);

			if (query.list().size() > 0) {
				ebpCandidate = (EBPCandidate) query.list().get(0);
			}

			session.getTransaction().commit();
		} catch (Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return ebpCandidate;
	}

	public List<ItStaffing> getAllITStaffing() {
		Session session = null;
		Query query = null;
		List<ItStaffing> itStaffingList = null;

		try {

			session = HibernateUtils.getSession();
			session.getTransaction().begin();

			query = session.createQuery("from ItStaffing order by id desc");
			itStaffingList = query.list();

			session.getTransaction().commit();
		} catch (Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return itStaffingList;
	}
	
	public Jobs getJobsByAuthCode(String auth_code) {
		Session session = null;
		Query query = null;
		Jobs jobs = null;
		try {
			session = HibernateUtils.getSession();
			session.getTransaction().begin();

			query = session.createQuery("from Jobs where auth_code = :auth_code");
			query.setParameter("auth_code", auth_code);
			if (query.list().size() > 0) {
				jobs = (Jobs) query.list().get(0);
			}

			session.getTransaction().commit();
		} catch (Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return jobs;
	}
	
	public List<EbpEmails> getAllEbpEmails() 
	{
		Session session = null;
		Query query = null;
		List<EbpEmails> bebpEmailsList = null;

		try {

			session = HibernateUtils.getSession();
			session.getTransaction().begin();

			query = session.createQuery("from EbpEmails order by id desc");
			bebpEmailsList = query.list();

			session.getTransaction().commit();
		} catch (Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return bebpEmailsList;
	}
}
