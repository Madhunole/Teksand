package com.teksands.bootcamp.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.io.Writer;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.nio.file.FileSystem;
import java.nio.file.FileSystems;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;
import org.dhatim.fastexcel.Workbook;
import org.dhatim.fastexcel.Worksheet;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;
import com.teksands.bootcamp.dao.BootcampDAO;
import com.teksands.bootcamp.dao.CandidateDAO;
import com.teksands.bootcamp.dao.ClientMasterDAO;
import com.teksands.bootcamp.dao.InterviewDAO;
import com.teksands.bootcamp.dao.JobMasterDAO;
import com.teksands.bootcamp.dao.LogDAO;
import com.teksands.bootcamp.dao.MentorMasterDAO;
import com.teksands.bootcamp.model.Bootcamp;
import com.teksands.bootcamp.model.CallSchedule;
import com.teksands.bootcamp.model.Candidate;
import com.teksands.bootcamp.model.CandidateFeedback;
import com.teksands.bootcamp.model.ClientMaster;
import com.teksands.bootcamp.model.Interview;
import com.teksands.bootcamp.model.JobMaster;
import com.teksands.bootcamp.model.Log;
import com.teksands.bootcamp.model.MentorMaster;
import com.teksands.bootcamp.model.Pincode;
import com.teksands.bootcamp.model.TestResults;
import com.teksands.user.model.Contactus;
import com.teksands.user.model.Jobs;
import com.teksands.user.model.Leads;
import com.teksands.user.model.Webinars;
import com.teksands.user.response.CommonResponse;
import com.teksands.utils.Properties;
import com.teksands.utils.SendEmailUtil;
import com.teksands.utils.StatusMessage;
import com.teksands.utils.Utils;
import com.teksands.utils.ViewHelper;

@Controller

@RequestMapping("/bootcamp")
public class CandidateController {

	@Autowired
	CandidateDAO candidateDAO;

	@Autowired
	BootcampDAO bootcampDAO;

	@Autowired
	SendEmailUtil sendEmailUtil;

	@Autowired
	ClientMasterDAO clientMasterDAO;

	@Autowired
	MentorMasterDAO mentorMasterDAO;
	
	@Autowired
	InterviewDAO interviewDAO;
	
	@Autowired
	JobMasterDAO jobMasterDAO;
	
	@Autowired
	Properties properties;
	
	@Autowired
	LogDAO logDAO;
	
	private static final String SAVE_DIR = "upload";

	@RequestMapping({ "/candidate-list" })
	public String candidate(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HashMap<String, String> accountMap = null;
		try {
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			if(accountMap != null && (accountMap.get("user_id").equalsIgnoreCase(Utils.adminId.toString()))) {

				List<Candidate> candidateList = candidateDAO.getAllCandidate();
				request.setAttribute("candidateList", candidateList);
				
				List<MentorMaster> mentorMasterList = mentorMasterDAO.getAllMentorMaster();
				request.setAttribute("mentorMasterList", mentorMasterList);
				
				request.setAttribute("page", "candidate");

			} else {
				response.sendRedirect("/bootcamp");
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return "bootcamp.candidate";
	}

	@RequestMapping(value = "/getCityStateForPincode", method = RequestMethod.POST)
	public void getCityStateForPincode(HttpServletRequest request, HttpServletResponse response) throws Exception {
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		Gson gson = new Gson();

		try {
			String pincode = request.getParameter("pincode");
			if (pincode == null) {
				pincode = "";
			}
			;
			pincode = pincode.trim();

			Pincode pin = candidateDAO.getCityStateForPincode(pincode);

			writer.print(gson.toJson(pin));
			writer.close();
		} catch (Exception ex) {
			writer.print("");
			writer.close();
			ex.printStackTrace();
		}
	}

	@RequestMapping({ "/add-update-candidate" })
	public String add_candidate(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HashMap<String, String> accountMap = null;
		try {
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			if(accountMap != null && (accountMap.get("user_id").equalsIgnoreCase(Utils.adminId.toString()))) {

				String domain = properties.getHostDomainUrl();
				request.setAttribute("resume_path",  domain + "resources/cms/img/candidate-resumes/");

				String id = request.getParameter("id");
				String source = request.getParameter("source");
				
				request.setAttribute("source",source);
				Candidate candidate = null;

				if (id != null) {
					candidate = candidateDAO.getCandidateById(Integer.parseInt(id));
					request.setAttribute("candidate", candidate);
				}

				List<ClientMaster> clientMasterList = clientMasterDAO.getAllClientMaster();
				request.setAttribute("clientMasterList", clientMasterList);

				request.setAttribute("page", "add-candidate");

			} else {
				response.sendRedirect("/bootcamp");
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return "bootcamp.add.candidate";
	}

	@RequestMapping(value = "/addOrUpdateCandidate")
	public void addEditCandidate(HttpServletRequest request, HttpServletResponse response) throws Exception {
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		CommonResponse commonResponse = null;
		Gson gson = null;

		HashMap<String, String> accountMap = null;
		try {

			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			if(accountMap != null && (accountMap.get("user_id").equalsIgnoreCase(Utils.adminId.toString()))) {
				
				String user_id = accountMap.get("user_id");
				String user_email = accountMap.get("user_email");
				String user_name = accountMap.get("user_name");
				String user_type_id = accountMap.get("user_type_id");
				String user_type = accountMap.get("user_type");

				commonResponse = new CommonResponse();
				gson = new Gson();

				String id = request.getParameter("id");
				String name = request.getParameter("name");
				String mobile = request.getParameter("mobile");
				String email = request.getParameter("email");
				String gender = request.getParameter("gender");
				String birth_of_date = request.getParameter("birth_of_date");
				String marital_status = request.getParameter("marital_status");
				String curr_location = request.getParameter("curr_location");
				String pre_location = request.getParameter("pre_location");
				String permanent_address = request.getParameter("permanent_address");
				String permanent_pincode = request.getParameter("permanent_picode");
				String permanent_city = request.getParameter("permanent_city");
				String permanent_state = request.getParameter("permanent_state");
				String permanent_country = request.getParameter("permanent_country");

				String resume_heading = request.getParameter("resume_heading");
				String summary = request.getParameter("summary");
				String current_company_name = request.getParameter("current_company_name");
				String current_designation = request.getParameter("current_designation");
				String functional_area = request.getParameter("functional_area");
				String industry = request.getParameter("industry");
				String total_experience = request.getParameter("total_experience");
				String role = request.getParameter("role");
				String key_skills = request.getParameter("key_skills");
				String annual_salary = request.getParameter("annual_salary");
				String notice_period = request.getParameter("notice_period");
				String work_permit_status = request.getParameter("work_permit_status");

				String ug_college_name = request.getParameter("ug_college_name");
				String ug_degree = request.getParameter("ug_degree");
				String ug_specialization = request.getParameter("ug_specialization");
				String ug_graduation_year = request.getParameter("ug_graduation_year");
				String pg_college_name = request.getParameter("pg_college_name");
				String pg_degree = request.getParameter("pg_degree");
				String pg_specialization = request.getParameter("pg_specialization");
				String pg_graduation_year = request.getParameter("pg_graduation_year");
				String doctorate_university = request.getParameter("doctorate_university");
				String doctorate_degree = request.getParameter("doctorate_degree");
				String doctorate_specialization = request.getParameter("doctorate_specialization");
				String doctorate_graduation_year = request.getParameter("doctorate_graduation_year");

				String ts_screening_1 = request.getParameter("ts_screening_1");
				String ts_screening_2 = request.getParameter("ts_screening_2");
				String ts_screening_3 = request.getParameter("ts_screening_3");
				String placed_company = request.getParameter("placed_company");
				String ts_screening_grade = request.getParameter("ts_screening_grade");
				String placed = request.getParameter("placed");
				String placed_date = request.getParameter("placed_date");
				String resume = request.getParameter("resume");

				String active = request.getParameter("active");

				if (id == null) {id = "";}

				Date birth_date = null;

				if (birth_of_date != null && !birth_of_date.isEmpty()) {
					birth_date = new SimpleDateFormat("yyyy-MM-dd").parse(birth_of_date);
				}

				Candidate candidate = null;
				Boolean isCandidateRegisteringForFirstTime = false;

				if (!id.isEmpty()) {
					candidate = candidateDAO.getCandidateById(Integer.parseInt(id));
				}

				if (candidate == null) {
					candidate = new Candidate();
					isCandidateRegisteringForFirstTime = true;
				}
				
				candidate.setBootcamp_ids("0");
				candidate.setBootcamp_name("");
				candidate.setName(name);
				candidate.setEmail(email);
				candidate.setMobile(mobile);
				candidate.setGender(gender);
				candidate.setDate_of_birth(birth_date);
				candidate.setMarital_status(marital_status);
				candidate.setCurrent_location(curr_location);
				candidate.setPreferred_location(pre_location);
				candidate.setPermanent_address(permanent_address);
				candidate.setPermanent_city(permanent_city);
				candidate.setPermanent_state(permanent_state);
				candidate.setPermanent_country(permanent_country);
				candidate.setPermanent_pincode(permanent_pincode);

				candidate.setResume_headling(resume_heading);
				candidate.setSummary(summary);
				candidate.setCurr_company_name(current_company_name);
				candidate.setCurr_company_desigination(current_designation);
				candidate.setFunctional_area(functional_area);
				candidate.setIndustry(industry);

				if (total_experience != null && !total_experience.isEmpty()) {
					candidate.setTotal_experience(total_experience);
				} else {
					candidate.setTotal_experience("");
				}

				candidate.setRole(role);
				candidate.setKey_skills(key_skills);
				candidate.setAnnual_salary(annual_salary);
				candidate.setNotice_period(notice_period);
				candidate.setWork_permit_status(work_permit_status);

				candidate.setUg_college_name(ug_college_name);
				candidate.setUg_degree(ug_degree);
				candidate.setUg_specialization(ug_specialization);

				if (ug_graduation_year != null && !ug_graduation_year.isEmpty()) {
					candidate.setUg_graduation_year(ug_graduation_year);
				} else {
					candidate.setUg_graduation_year("");
				}

				candidate.setPg_college_name(pg_college_name);
				candidate.setPg_degree(pg_degree);
				candidate.setPg_specialization(pg_specialization);

				if (pg_graduation_year != null && !pg_graduation_year.isEmpty()) {
					candidate.setPg_graduation_year(pg_graduation_year);
				} else {
					candidate.setPg_graduation_year("");
				}

				candidate.setDoctorate_university(doctorate_university);
				candidate.setDoctorate_degree(doctorate_degree);
				candidate.setDoctorate_specialization(doctorate_specialization);

				if (doctorate_graduation_year != null && !doctorate_graduation_year.isEmpty()) {
					candidate.setDoctorate_graduation_year(doctorate_graduation_year);
				} else {
					candidate.setDoctorate_graduation_year("");
				}

				candidate.setTs_screening_comment_1(ts_screening_1);
				candidate.setTs_screening_comment_2(ts_screening_2);
				candidate.setTs_screening_comment_3(ts_screening_3);

				candidate.setPlaced_company(placed_company);
				candidate.setTs_screening_grade(ts_screening_grade);
				candidate.setResume(resume);

				if (placed.equalsIgnoreCase("Yes")) {
					candidate.setPlaced(true);
				} else {
					candidate.setPlaced(false);
				}

				Date date_of_placed = null;

				if (placed_date != null && !placed_date.isEmpty()) {
					date_of_placed = new SimpleDateFormat("yyyy-MM-dd").parse(placed_date);
					candidate.setPlaced_date(date_of_placed);
				} else {
					candidate.setPlaced_date(null);
				}

				candidate.setCreated_date(new Date());

				if (active.equalsIgnoreCase("1")) {
					candidate.setInactive_reason("");
					candidate.setActive(true);
				} else {
					String rejection_reason = request.getParameter("rejection_reason");
					candidate.setInactive_reason(rejection_reason);
					candidate.setActive(false);
				}

				candidateDAO.saveOrUpdateCandidate(candidate);

				if (isCandidateRegisteringForFirstTime) {
					Log log = new Log();
			 		log.setUser_id(Integer.parseInt(user_id));
			 		log.setUser_name(user_name);
			 		log.setTitle("New Candidate Created");
			 		log.setDescription(user_name+" has created the new candidate ("+name+")");
			 		log.setActivity_time(new Date());
			 		String ipAddr = Utils.getIpAddr(request);
					if(ipAddr == null){ipAddr="";}
			 		log.setIp_addr(ipAddr);
			 		logDAO.saveLog(log);

					commonResponse.setStatus("SUCCESS");
					commonResponse.setStatus_code(200);
					commonResponse.setMsg("The New Candidate Added Successfully.");
					writer.print(gson.toJson(commonResponse));
					writer.close();
					return;

				} else {
					Log log = new Log();
			 		log.setUser_id(Integer.parseInt(user_id));
			 		log.setUser_name(user_name);
			 		log.setTitle("New Candidate Details Updated");
			 		log.setDescription(user_name+" has updated details to the following candidate ("+name+")");
			 		log.setActivity_time(new Date());
			 		String ipAddr = Utils.getIpAddr(request);
					if(ipAddr == null){ipAddr="";}
			 		log.setIp_addr(ipAddr);
			 		logDAO.saveLog(log);
			 		
					commonResponse.setStatus("SUCCESS");
					commonResponse.setStatus_code(200);
					commonResponse.setMsg("The Candidate Details are Updated Successfully.");
					writer.print(gson.toJson(commonResponse));
					writer.close();
					return;
				}
			} else {
				response.sendRedirect("/bootcamp");
			}
		} catch (Exception ex) {
			ex.printStackTrace();

			commonResponse.setStatus("FAILURE");
			commonResponse.setStatus_code(400);
			writer.print(gson.toJson(commonResponse));
			writer.close();
			return;
		}
	}

	@RequestMapping({ "/view-candidate" })
	public String view_candidate(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HashMap<String, String> accountMap = null;
		try {
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			if(accountMap != null && (accountMap.get("user_id").equalsIgnoreCase(Utils.adminId.toString()))) {

				String id = request.getParameter("id");
				String jobId = request.getParameter("jobId");

				Candidate candidate = null;

				if (id != null) {
					candidate = candidateDAO.getCandidateById(Integer.parseInt(id));
					request.setAttribute("candidate", candidate);
				}
				
				if(id != null) {
					List<CandidateFeedback> candidateFeedbackList = candidateDAO.getCandidateFeedbackByCandidateId(Integer.parseInt(id));
					request.setAttribute("candidateFeedbackList", candidateFeedbackList);
				}

				if (id != null) {
					List<CallSchedule> callScheduleList = candidateDAO.getAllCallScheduleByCandidateId(Integer.parseInt(id));
					request.setAttribute("callScheduleList", callScheduleList);
				}
				
				if (id != null) {
					List<TestResults> testResultsList = candidateDAO.getAllTestResultbyCandidateIt(Integer.parseInt(id));
					request.setAttribute("testResultsList", testResultsList);
				}
				
				if (id != null) {
					List<Interview> activeInterviewList = interviewDAO.getAllInterviewbyCandidateId(Integer.parseInt(id));
					request.setAttribute("activeInterviewList", activeInterviewList);
				}

				request.setAttribute("page", "view-candidate");
				request.setAttribute("jobId", jobId);

			} else {
				response.sendRedirect("/bootcamp");
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return "bootcamp.view.candidate";
	}

	@RequestMapping(value = "/activateDeactivateCandidate")
	public void activateDeactivateCandidate(HttpServletRequest request, HttpServletResponse response) throws Exception {
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		CommonResponse commonResponse = null;
		Gson gson = null;

		HashMap<String, String> accountMap = null;
		try {

			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			if(accountMap != null && (accountMap.get("user_id").equalsIgnoreCase(Utils.adminId.toString()))) {
				
				String user_id = accountMap.get("user_id");
				String user_email = accountMap.get("user_email");
				String user_name = accountMap.get("user_name");
				String user_type_id = accountMap.get("user_type_id");
				String user_type = accountMap.get("user_type");

				commonResponse = new CommonResponse();
				gson = new Gson();

				String id = request.getParameter("id");

				Candidate candidate = null;
				Boolean activateDeactivateCandidate = false;

				if (!id.isEmpty()) {
					candidate = candidateDAO.getCandidateById(Integer.parseInt(id));
				}

				Boolean active = candidate.getActive();

				if (active == true) {
					candidate.setActive(false);
				} else {
					candidate.setActive(true);
				}

				candidateDAO.saveOrUpdateCandidate(candidate);

				if (active == true) {
					
					Log log = new Log();
			 		log.setUser_id(Integer.parseInt(user_id));
			 		log.setUser_name(user_name);
			 		log.setTitle("Candidate Deactivated");
			 		log.setDescription(user_name+" has deactivated the following candidate ("+candidate.getName()+")");
			 		log.setActivity_time(new Date());
			 		String ipAddr = Utils.getIpAddr(request);
					if(ipAddr == null){ipAddr="";}
			 		log.setIp_addr(ipAddr);
			 		logDAO.saveLog(log);

					commonResponse.setStatus("SUCCESS");
					commonResponse.setStatus_code(200);
					commonResponse.setMsg("The Candidate Deactivated Successfully");
					writer.print(gson.toJson(commonResponse));
					writer.close();
					return;

				} else {
					Log log = new Log();
			 		log.setUser_id(Integer.parseInt(user_id));
			 		log.setUser_name(user_name);
			 		log.setTitle("Candidate Activated");
			 		log.setDescription(user_name+" has activated the following candidate ("+candidate.getName()+")");
			 		log.setActivity_time(new Date());
			 		String ipAddr = Utils.getIpAddr(request);
					if(ipAddr == null){ipAddr="";}
			 		log.setIp_addr(ipAddr);
			 		logDAO.saveLog(log);
			 		
					commonResponse.setStatus("SUCCESS");
					commonResponse.setStatus_code(200);
					commonResponse.setMsg("The Candidate Activated Successfully.");
					writer.print(gson.toJson(commonResponse));
					writer.close();
					return;
				}
			} else {
				response.sendRedirect("/bootcamp");
			}
		} catch (Exception ex) {
			ex.printStackTrace();

			commonResponse.setStatus("FAILURE");
			commonResponse.setStatus_code(400);
			writer.print(gson.toJson(commonResponse));
			writer.close();
			return;
		}
	}

	@RequestMapping({ "/interview-feedbacks" })
	public String interview_feedbacks(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HashMap<String, String> accountMap = null;
		try {
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			if (accountMap != null && accountMap.get("user_type_id").equalsIgnoreCase(Utils.adminId.toString())) {

				String user_id = accountMap.get("user_id");
				String user_email = accountMap.get("user_email");
				String user_name = accountMap.get("user_name");
				String user_type_id = accountMap.get("user_type_id");
				String user_type = accountMap.get("user_type");

				List<Candidate> candidateList = candidateDAO.getAllCandidate();
				request.setAttribute("candidateList", candidateList);

				request.setAttribute("page", "interview-feedbacks");

			} else {
				response.sendRedirect("/bootcamp");
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return "bootcamp.interview.feedbacks";
	}

	@RequestMapping({ "/update-interview-feedback" })
	public String update_interview_feedback(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HashMap<String, String> accountMap = null;
		try {
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			if (accountMap != null && accountMap.get("user_type_id").equalsIgnoreCase(Utils.adminId.toString())) {

				String id = request.getParameter("id");

				Candidate candidate = null;

				if (id != null) {
					candidate = candidateDAO.getCandidateById(Integer.parseInt(id));
					request.setAttribute("candidate", candidate);
				}
				
				List<ClientMaster> clientMasterList = clientMasterDAO.getAllClientMaster();
				request.setAttribute("clientMasterList", clientMasterList);

				request.setAttribute("page", "update-interview-feedback");

			} else {
				response.sendRedirect("/bootcamp");
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return "bootcamp.update.interview.feedback";
	}

	@RequestMapping(value = "/updateCandidateFeedback")
	public void updateCandidateFeedback(HttpServletRequest request, HttpServletResponse response) throws Exception {
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		CommonResponse commonResponse = null;
		Gson gson = null;

		HashMap<String, String> accountMap = null;
		try {
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			if(accountMap != null && (accountMap.get("user_id").equalsIgnoreCase(Utils.adminId.toString()))) {
				
				String user_id = accountMap.get("user_id");
				String user_email = accountMap.get("user_email");
				String user_name = accountMap.get("user_name");
				String user_type_id = accountMap.get("user_type_id");
				String user_type = accountMap.get("user_type");

				commonResponse = new CommonResponse();
				gson = new Gson();

				String id = request.getParameter("id");
				String interview_type = request.getParameter("interview_type");
				String mentor_id = request.getParameter("mentor_id");
				String ts_screening_grade = request.getParameter("ts_screening_grade");
				String feedback = request.getParameter("feedback");

				if (id == null || id == "") {
					commonResponse.setStatus("FAILURE");
					commonResponse.setStatus_code(400);
					commonResponse.setMsg("Candidate Not Found");
					writer.print(gson.toJson(commonResponse));
					writer.close();
					return;
				}

				if (!id.isEmpty()) {
					Candidate candidate = candidateDAO.getCandidateById(Integer.parseInt(id));
					MentorMaster mentorMaster = mentorMasterDAO.getMentorMasterById(Integer.parseInt(mentor_id));

					CandidateFeedback candidateFeedback = new CandidateFeedback();
					candidateFeedback.setCandidate_id(Integer.parseInt(id));
					candidateFeedback.setCandidate_name(candidate.getName());
					candidateFeedback.setMentor_id(Integer.parseInt(mentor_id));
					candidateFeedback.setMentor_name(mentorMaster.getFirst_name() + " " + mentorMaster.getLast_name());
					candidateFeedback.setInterview_type(interview_type);
					candidateFeedback.setTs_grade(Integer.parseInt(ts_screening_grade));
					candidateFeedback.setFeedback(feedback);
					candidateFeedback.setCreated_date(new Date());
					candidateFeedback.setActive(true);

					candidateDAO.saveCandidateFeedback(candidateFeedback);
					
					Log log = new Log();
			 		log.setUser_id(Integer.parseInt(user_id));
			 		log.setUser_name(user_name);
			 		log.setTitle("Candidate Feedback Created");
			 		log.setDescription(user_name+" has created feedback to the following candidate ("+candidate.getName()+")");
			 		log.setActivity_time(new Date());
			 		String ipAddr = Utils.getIpAddr(request);
					if(ipAddr == null){ipAddr="";}
			 		log.setIp_addr(ipAddr);
			 		logDAO.saveLog(log);

					commonResponse.setStatus("SUCCESS");
					commonResponse.setStatus_code(200);
					commonResponse.setMsg("The Candidate Interview Feedback are Saved Successfully.");
					writer.print(gson.toJson(commonResponse));
					writer.close();
					return;
				}
			} else {
				response.sendRedirect("/bootcamp");
			}
		} catch (Exception ex) {
			ex.printStackTrace();

			commonResponse.setStatus("FAILURE");
			commonResponse.setStatus_code(400);
			commonResponse.setMsg("Something Error, Please Try Again");
			writer.print(gson.toJson(commonResponse));
			writer.close();
			return;
		}
	}

	@RequestMapping(value = "/search")
	public String candidate_search(@RequestParam(value = "pageid", required = false) String pageid,
			HttpServletRequest request, HttpServletResponse response) {
		HashMap<String, String> accountMap = null;
		try {
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			if (accountMap != null && accountMap.get("user_type_id").equalsIgnoreCase(Utils.adminId.toString())) {

				String keyword = "";

				keyword = request.getParameter("keyword");

				if (keyword == null || keyword.isEmpty()) {
					keyword = "all";
				}
				request.setAttribute("keyword", keyword);

				if (pageid == null) {
					pageid = "1";
				}

				List<Candidate> candidatesearchList = candidateDAO.searchAllCandidateByPageId(keyword,
						Integer.parseInt(pageid) - 1);
				request.setAttribute("candidatesearchList", candidatesearchList);

				request.setAttribute("page", "update-interview-feedback");

			} else {
				response.sendRedirect("/bootcamp");
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return "bootcamp.candidate.search";
	}

	@RequestMapping(value = "/scheduleCallToCandidate")
	public void scheduleCallToCandidate(HttpServletRequest request, HttpServletResponse response) throws Exception {
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		CommonResponse commonResponse = null;
		Gson gson = null;

		HashMap<String, String> accountMap = null;
		try {
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			if(accountMap != null && (accountMap.get("user_id").equalsIgnoreCase(Utils.adminId.toString()))) {
				
				String user_id = accountMap.get("user_id");
				String user_email = accountMap.get("user_email");
				String user_name = accountMap.get("user_name");
				String user_type_id = accountMap.get("user_type_id");
				String user_type = accountMap.get("user_type");

				commonResponse = new CommonResponse();
				gson = new Gson();

				String candidate_id = request.getParameter("candidate_id");
				String call_dat_Str = request.getParameter("call_date");
				String call_time = request.getParameter("call_time");
				String call_reason = request.getParameter("call_reason");

				Date call_date = null;
				
				if(call_dat_Str != null && !call_dat_Str.isEmpty()) {
					call_date = new SimpleDateFormat("yyyy-MM-dd").parse(call_dat_Str);
				}

				DateFormat f1 = new SimpleDateFormat("HH:mm");
				Date d = f1.parse(call_time);
				DateFormat f2 = new SimpleDateFormat("h:mma");
				f2.format(d).toLowerCase();

				if (candidate_id == null || candidate_id == "") {
					commonResponse.setStatus("FAILURE");
					commonResponse.setStatus_code(400);
					commonResponse.setMsg("Candidate Not Found");
					writer.print(gson.toJson(commonResponse));
					writer.close();
					return;
				}

				if (!candidate_id.isEmpty()) {
					
					Candidate candidate = candidateDAO.getCandidateById(Integer.parseInt(candidate_id));

					String candidate_name = candidate.getName();
					String candidate_email = candidate.getEmail();
					String call_timeStr = f2.format(d).toLowerCase();

					sendEmailUtil.schedulecallToCandidate(candidate_name, candidate_email, call_dat_Str, call_timeStr,call_reason);

					CallSchedule callSchedule = new CallSchedule();
					callSchedule.setCandidate_id(Integer.parseInt(candidate_id));
					callSchedule.setCandidate_name(candidate.getName());
					callSchedule.setCall_time(f2.format(d).toLowerCase());
					callSchedule.setCall_date(call_date);
					callSchedule.setCall_reason(call_reason);
					callSchedule.setMail_status(true);
					callSchedule.setCreated_date(new Date());
					callSchedule.setActive(true);
					candidateDAO.saveOrUpdateCallSchedule(callSchedule);
					
					if(candidate != null) {
						candidate.setCall_schedule_id(callSchedule.getId());
						candidate.setCall_schedule_status(true);
						candidateDAO.saveOrUpdateCandidate(candidate);
					}
					
					Log log = new Log();
			 		log.setUser_id(Integer.parseInt(user_id));
			 		log.setUser_name(user_name);
			 		log.setTitle("Call Scheduled to Candidate");
			 		log.setDescription(user_name+" has scheduled a call to the following candidate ("+candidate.getName()+")");
			 		log.setActivity_time(new Date());
			 		String ipAddr = Utils.getIpAddr(request);
					if(ipAddr == null){ipAddr="";}
			 		log.setIp_addr(ipAddr);
			 		logDAO.saveLog(log);
			 		
					commonResponse.setStatus("SUCCESS");
					commonResponse.setStatus_code(200);
					commonResponse.setMsg("Call Scheduled Successfully.");
					writer.print(gson.toJson(commonResponse));
					writer.close();
					return;
				}
			} else {
				response.sendRedirect("/bootcamp");
			}
		} catch (Exception ex) {
			ex.printStackTrace();

			commonResponse.setStatus("FAILURE");
			commonResponse.setStatus_code(400);
			commonResponse.setMsg("Something Error, Please Try Again");
			writer.print(gson.toJson(commonResponse));
			writer.close();
			return;
		}
	}

	@RequestMapping(value = "/uploadCandidateCVDocument")
	public void uploadCVDocument(HttpServletRequest request, HttpServletResponse response) throws IOException {
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		CommonResponse commonResponse = new CommonResponse();
		Gson gson = new Gson();

		try {
			String candidate_mobile = "";

			boolean isMultipart = ServletFileUpload.isMultipartContent(request);
			DiskFileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(factory);
			try {
				List fileItems = upload.parseRequest(request);
				Iterator i = fileItems.iterator();
				while (i.hasNext()) {
					FileItem fi = (FileItem) i.next();
					if (!fi.isFormField()) {
						System.out.println("candidate_mobile--->" + candidate_mobile);

						String file_name_original = fi.getName();
						
						System.out.println("file_name_original--->" + file_name_original);
						
						String extension = file_name_original.substring(file_name_original.lastIndexOf(".") + 1, file_name_original.length());
						
						System.out.println("extension--->" + extension);						
						
						if(extension.equalsIgnoreCase("pdf") || extension.equalsIgnoreCase("docx") || extension.equalsIgnoreCase("doc"))
						{
							
						}else {
							commonResponse.setStatus_code(StatusMessage.FailureCode);
							commonResponse.setMsg("File format not supported. You can upload a DOCX or PDF only.");	
							writer.print(gson.toJson(commonResponse));
							writer.close();
							return;
						}
						
						boolean isfileSizeCorrect = ViewHelper.checkFileSize(fileItems, 1);
						if (!isfileSizeCorrect) 
						{	
		   	     	    	commonResponse.setStatus_code(StatusMessage.FailureCode);
							commonResponse.setMsg("File size is too large. Maximum accepted size is 1MB");	
							writer.print(gson.toJson(commonResponse));
							writer.close();
							return;
	   					}else {
	   						
	   						long timeMilli = new Date().getTime();

	   						System.out.println(timeMilli);
	   						
	   						String fileName = "resume_" + timeMilli + "." + extension;
							
							System.out.println("fileName--->" + fileName);
							
							String root_path = properties.getCandidateResume();
							
							System.out.println("root_path--->" + root_path);
							
							String imagePath = ViewHelper.createFile(fi, root_path, fileName);
							
							System.out.println("imagePath--->" + imagePath);

							commonResponse.setStatus_code(StatusMessage.SuccessCode);
							commonResponse.setStatus(StatusMessage.SuccessMessage);
							commonResponse.setMsg(fileName);
							writer.print(gson.toJson(commonResponse));
							writer.close();
							return;
	   					}
					} else {
						String fieldName = fi.getFieldName();
						if (fieldName.equalsIgnoreCase("txt_candidate_mobile")) {
							candidate_mobile = fi.getString().trim();
						}
					}
				}
			} catch (Exception ex) {
				ex.printStackTrace();
				commonResponse.setStatus_code(StatusMessage.FailureCode);
				commonResponse.setStatus(StatusMessage.FailureMessage);
				commonResponse.setMsg("File Upload Failure");
				writer.print(gson.toJson(commonResponse));
				writer.close();
				return;
			}
		} catch (Exception ex) {
			ex.printStackTrace();
			commonResponse.setStatus_code(StatusMessage.FailureCode);
			commonResponse.setStatus(StatusMessage.FailureMessage);
			commonResponse.setMsg("File Upload Failure");
			writer.print(gson.toJson(commonResponse));
			writer.close();
			return;
		}
	}
	
	@RequestMapping(value = "/activateDeactivateCalls")
	public void activateDeactivateCalls(HttpServletRequest request, HttpServletResponse response) throws Exception {
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		CommonResponse commonResponse = null;
		Gson gson = null;

		HashMap<String, String> accountMap = null;
		try {

			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			if(accountMap != null && (accountMap.get("user_id").equalsIgnoreCase(Utils.adminId.toString()))) {

				String user_id = accountMap.get("user_id");
				String user_email = accountMap.get("user_email");
				String user_name = accountMap.get("user_name");
				String user_type_id = accountMap.get("user_type_id");
				String user_type = accountMap.get("user_type");
				
				commonResponse = new CommonResponse();
				gson = new Gson();

				String id = request.getParameter("id");

				Candidate candidate = null;
				CallSchedule callSchedule = null;
				
				if (!id.isEmpty()) {
					callSchedule = candidateDAO.getCallScheduleById(Integer.parseInt(id));
				}
				
				if (id != null) {
					Integer candidate_id = callSchedule.getCandidate_id();
					candidate = candidateDAO.getCandidateById(candidate_id);
					candidate.setCall_schedule_status(false);
					candidateDAO.saveOrUpdateCandidate(candidate);
					
					String candidate_name = candidate.getName();
					String candidate_email = candidate.getEmail();
					
					sendEmailUtil.candidateCallCancelled(candidate_name, candidate_email);
				}
				
				Boolean active = callSchedule.getActive();

				if (active == true) {
					callSchedule.setActive(false);
				}

				candidateDAO.saveOrUpdateCallSchedule(callSchedule);

				if (active == true) {
					
					Log log = new Log();
			 		log.setUser_id(Integer.parseInt(user_id));
			 		log.setUser_name(user_name);
			 		log.setTitle("Candidate Call Cancelled");
			 		log.setDescription(user_name+" has cancelled a call to the following candidate ("+candidate.getName()+")");
			 		log.setActivity_time(new Date());
			 		String ipAddr = Utils.getIpAddr(request);
					if(ipAddr == null){ipAddr="";}
			 		log.setIp_addr(ipAddr);
			 		logDAO.saveLog(log);
			 		
					commonResponse.setStatus("SUCCESS");
					commonResponse.setStatus_code(200);
					commonResponse.setMsg("The Candidate Call Cancelled Successfully");
					writer.print(gson.toJson(commonResponse));
					writer.close();
					return;

				}
			} else {
				response.sendRedirect("/bootcamp");
			}
		} catch (Exception ex) {
			ex.printStackTrace();

			commonResponse.setStatus("FAILURE");
			commonResponse.setStatus_code(400);
			writer.print(gson.toJson(commonResponse));
			writer.close();
			return;
		}
	}
	
	@RequestMapping(value = "/addTestResultToCandidate")
	public void addTestResultToCandidate(HttpServletRequest request, HttpServletResponse response) throws Exception {
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		CommonResponse commonResponse = null;
		Gson gson = null;

		HashMap<String, String> accountMap = null;
		try {
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			if(accountMap != null && (accountMap.get("user_id").equalsIgnoreCase(Utils.adminId.toString()))) {

				String user_id = accountMap.get("user_id");
				String user_email = accountMap.get("user_email");
				String user_name = accountMap.get("user_name");
				String user_type_id = accountMap.get("user_type_id");
				String user_type = accountMap.get("user_type");
				
				commonResponse = new CommonResponse();
				gson = new Gson();

				String candidate_id = request.getParameter("candidate_id");
				String test_name = request.getParameter("test_name");
				String test_topics = request.getParameter("test_topics");
				String test_total_marks = request.getParameter("test_total_marks");
				String test_marks_scored = request.getParameter("test_marks_scored");

				if (candidate_id == null || candidate_id == "") {
					commonResponse.setStatus("FAILURE");
					commonResponse.setStatus_code(400);
					commonResponse.setMsg("Candidate Not Found");
					writer.print(gson.toJson(commonResponse));
					writer.close();
					return;
				}

				if (!candidate_id.isEmpty()) {
					
					Candidate candidate = candidateDAO.getCandidateById(Integer.parseInt(candidate_id));

					String candidate_name = candidate.getName();

					TestResults testResults = new TestResults();
					testResults.setCandidate_id(Integer.parseInt(candidate_id));
					testResults.setCandidate_name(candidate_name);
					testResults.setTest_name(test_name);
					testResults.setTest_topic(test_topics);
					testResults.setTotal_marks(Integer.parseInt(test_total_marks));
					testResults.setMarks_scores(Integer.parseInt(test_marks_scored));
					testResults.setCreated_date(new Date());
					testResults.setActive(true);
					
					candidateDAO.saveOrUpdateTestResult(testResults);
					
					Log log = new Log();
			 		log.setUser_id(Integer.parseInt(user_id));
			 		log.setUser_name(user_name);
			 		log.setTitle("Candidate Test Results Added");
			 		log.setDescription(user_name+" has added test result to the following candidate ("+candidate.getName()+")");
			 		log.setActivity_time(new Date());
			 		String ipAddr = Utils.getIpAddr(request);
					if(ipAddr == null){ipAddr="";}
			 		log.setIp_addr(ipAddr);
			 		logDAO.saveLog(log);
					
					commonResponse.setStatus("SUCCESS");
					commonResponse.setStatus_code(200);
					commonResponse.setMsg("Test Results are Saved Successfully");
					writer.print(gson.toJson(commonResponse));
					writer.close();
					return;
				}
			} else {
				response.sendRedirect("/bootcamp");
			}
		} catch (Exception ex) {
			ex.printStackTrace();

			commonResponse.setStatus("FAILURE");
			commonResponse.setStatus_code(400);
			commonResponse.setMsg("Something Error, Please Try Again");
			writer.print(gson.toJson(commonResponse));
			writer.close();
			return;
		}
	}
	
	@RequestMapping(value="/bulkUploadCandidateDetails")
	public void upload_insurance_report(HttpServletRequest request, HttpServletResponse response) throws IOException 
	{
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		CommonResponse commonResponse = null;
		Gson gson = null;

        String appPath = request.getServletContext().getRealPath("");
        System.out.println("appPath---->" + appPath);
        String savePath = appPath + File.separator + SAVE_DIR;
        System.out.println("savePath---->" + savePath);
        String file_name = "";

        File fileSaveDir = new File(savePath);
        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdir();
        }
		
		try 
		{
			HashMap<String, String> accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			if(accountMap != null && (accountMap.get("user_id").equalsIgnoreCase(Utils.adminId.toString()))) {
				
            	String user_id = accountMap.get("user_id");
				String user_email = accountMap.get("user_email");
				String user_name = accountMap.get("user_name");
				String user_type_id = accountMap.get("user_type_id");
				String user_type = accountMap.get("user_type");
				
            	commonResponse = new CommonResponse();
				gson = new Gson();
				
            	boolean isMultipart = ServletFileUpload.isMultipartContent(request);
    		    DiskFileItemFactory factory = new DiskFileItemFactory();
    		    ServletFileUpload upload = new ServletFileUpload(factory);
    	        try
    	        { 
    	           List fileItems = upload.parseRequest(request);
    	           Iterator i = fileItems.iterator();
    	           
    	           while ( i.hasNext () ) 
    	           {
    	              FileItem fi = (FileItem)i.next();
    	              if (!fi.isFormField())	
    	              {
    	                 String fileName = fi.getName();
    	                 System.out.println("fileName---->" + fileName);
    	                 String filePath = savePath + File.separator + fileName;
    	                 System.out.println("filePath---->" + filePath);
    	                 File file = new File(filePath);
    	                 fi.write(file);
    	                 boolean status = true;
    	                 
    	                 System.out.println("file---->" + file);
    	                 
    	                 status = candidateDAO.bulkUploadCandidateDetails(file);
    	                 
    	                 if(status)
    	                 {
    	                	Log log = new Log();
    	 			 		log.setUser_id(Integer.parseInt(user_id));
    	 			 		log.setUser_name(user_name);
    	 			 		log.setTitle("Candidate Test Results Added");
    	 			 		log.setDescription(user_name+" has uploaded the candidate's list");
    	 			 		log.setActivity_time(new Date());
    	 			 		String ipAddr = Utils.getIpAddr(request);
    	 					if(ipAddr == null){ipAddr="";}
    	 			 		log.setIp_addr(ipAddr);
    	 			 		logDAO.saveLog(log);
    	                	 
    	                	commonResponse.setStatus("SUCCESS");
    	 					commonResponse.setStatus_code(200);
    	 					commonResponse.setMsg("Candiate Details are Updated Successfully");
    	 					writer.print(gson.toJson(commonResponse));
    	 					writer.close();
    	 					return;
    	                 }
    	                 else
    	                 {
    	                	commonResponse.setStatus("SUCCESS");
     	 					commonResponse.setStatus_code(400);
     	 					commonResponse.setMsg("File Upload Failure");
     	 					writer.print(gson.toJson(commonResponse));
     	 					writer.close();
     	 					return;
    	                 }
    	              }
    	              else
    	              {
    	            	  
    	              }
    	           }
    	        }
    	        catch(Exception ex)
    	        {
    	        	ex.printStackTrace();
    	        	commonResponse.setStatus("FAILURE");
					commonResponse.setStatus_code(400);
					commonResponse.setMsg("File Upload Failure");
					writer.print(gson.toJson(commonResponse));
					writer.close();
					return;
    	        }
			
			 }
		} 
		catch (Exception ex) 
		{
			ex.printStackTrace();
            commonResponse.setStatus("FAILURE");
			commonResponse.setStatus_code(400);
			commonResponse.setMsg("File Uplaod Error");
			writer.print(gson.toJson(commonResponse));
			writer.close();
			return;
		}    
	}
	
	@RequestMapping(value="/downloadXLForAppliedCandidatesByJobID")
	public void downloadXLForAppliedCandidatesByJobID(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		HashMap<String, String> accountMap = null;
		try 
		{
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			if(accountMap != null && (accountMap.get("user_id").equalsIgnoreCase(Utils.adminId.toString()))) {
				
			String user_id = accountMap.get("user_id");
			String user_email = accountMap.get("user_email");
			String user_name = accountMap.get("user_name");
			String user_type_id = accountMap.get("user_type_id");
			
			String job_id = request.getParameter("job_id");
			
			if(job_id == null) {job_id = "";}
			
			job_id = job_id.trim();
			
			List<Candidate> candidateList = null;
			JobMaster jobMaster = null;
			
			if(!job_id.isEmpty()) {
				candidateList = candidateDAO.getAllCandidatesByJobId(Integer.parseInt(job_id));
				jobMaster = jobMasterDAO.getJobsById(Integer.parseInt(job_id));
			}
			
			Date date = new Date();  
		    SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");  
		    String strDate = formatter.format(date);
		   
		    formatter = new SimpleDateFormat("dd-MMMM-yyyy");  
		    strDate = formatter.format(date); 
		    
			response.setContentType("application/vnd.ms-excel");
			response.setHeader("Content-Disposition", "attachment;filename=Application-List-"+strDate+"-"+jobMaster.getRole_name()+".xlsx");
			
			Workbook wb = new Workbook(response.getOutputStream(), "MyApplication", "1.0");
			Worksheet ws = wb.newWorksheet("Teksands Applied Candidate List");
			
			SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
									
			ws.value(0, 0, jobMaster.getRole_name());
			ws.range(0, 0, 0, 5).merge();
			ws.range(0, 0, 0, 5).style().horizontalAlignment("center").set();
			ws.style(0, 0).bold().fontSize(11).set(); 

			int i = 1;
			int j = 0;
			for(j = 0; j <= 48; j++) {
				ws.style(i, j).bold().fontSize(9).borderStyle("bold").borderColor("0f76bd").wrapText(true).set();	
			}
			
			ws.value(i, 0, "Date of Application.");
			ws.value(i, 1, "Id");
			ws.value(i, 2, "Job Title");
	        ws.value(i, 3, "Name");
		    ws.value(i, 4, "Email");
		    ws.value(i, 5, "Mobile");
		    ws.value(i, 6, "Gender");
		    ws.value(i, 7, "Marital Status");
		    ws.value(i, 8, "Home Town");
		    ws.value(i, 9, "Date of Birth");
		    ws.value(i, 10, "Current Location");
		    ws.value(i, 11, "Preferred Location");
		    ws.value(i, 12, "Permanent Address");
		    ws.value(i, 13, "Permanent City");
		    ws.value(i, 14, "Permanent State");
		    ws.value(i, 15, "Permanent Country");
		    ws.value(i, 16, "Pincode");
		    ws.value(i, 17, "Resume");
		    ws.value(i, 18, "Total Experience");
		    ws.value(i, 19, "Current Company Name");
		    ws.value(i, 20, "Current Company Resigination");
		    ws.value(i, 21, "Functional Area");
		    ws.value(i, 22, "Role");
		    ws.value(i, 23, "Industry");
		    ws.value(i, 24, "Key Skills");
		    ws.value(i, 25, "Annual Salary");
		    ws.value(i, 26, "Notice Period");
		    ws.value(i, 27, "Last Working Day");
		    ws.value(i, 28, "Resume Heading");
		    ws.value(i, 29, "Summary");
		    ws.value(i, 30, "UG Degree");
		    ws.value(i, 31, "UG Specialization");
		    ws.value(i, 32, "UG College Name");
		    ws.value(i, 33, "UG Graduation Year");
		    ws.value(i, 34, "PG Degree");
		    ws.value(i, 35, "PG Specialization");
		    ws.value(i, 36, "PG College Name");
		    ws.value(i, 37, "PG Graduation Year");
		    ws.value(i, 38, "Doctorate Degree");
		    ws.value(i, 39, "Doctorate Specialization");
		    ws.value(i, 40, "Doctorate College Name");
		    ws.value(i, 41, "Doctorate Graduation Year");
		    ws.value(i, 42, "Work Permit Status");
		    ws.value(i, 43, "TS Screening Comment 1");
		    ws.value(i, 44, "TS Screening Comment 2");
		    ws.value(i, 45, "TS Screening Comment 3");
		    ws.value(i, 46, "TS Grade");
		    ws.value(i, 47, "Placed Company");
		    ws.value(i, 48, "Placed Date");
		    ws.value(i++, 49, "Inactive Reason");
		    
	 		for(Candidate downloadCanidateList : candidateList)
	 		{
	 			if(downloadCanidateList.getCreated_date() != null) {
					ws.value(i, 0, sdf.format(downloadCanidateList.getCreated_date()));
					ws.style(i, 0).fontSize(9).wrapText(true).set();
				}else {
					ws.value(i, 0, "--");
					ws.style(i, 0).fontSize(9).wrapText(true).set();
				}
	 			
	 			ws.value(i, 1, downloadCanidateList.getId());
				ws.style(i, 1).fontSize(9).wrapText(true).set();
				
				ws.value(i, 2, downloadCanidateList.getJob_title());
				ws.style(i, 2).fontSize(9).wrapText(true).set();

				ws.value(i, 3, downloadCanidateList.getName());
				ws.style(i, 3).fontSize(9).wrapText(true).set();
				
				ws.value(i, 4, downloadCanidateList.getEmail());
				ws.style(i, 4).fontSize(9).wrapText(true).set();
				
				ws.value(i, 5, downloadCanidateList.getMobile());
				ws.style(i, 5).fontSize(9).wrapText(true).set();
				
				ws.value(i, 6, downloadCanidateList.getGender());
				ws.style(i, 6).fontSize(9).wrapText(true).set();
				
				ws.value(i, 7, downloadCanidateList.getMarital_status());
				ws.style(i, 7).fontSize(9).wrapText(true).set();
				
				ws.value(i, 8, downloadCanidateList.getHome_town());
				ws.style(i, 8).fontSize(9).wrapText(true).set();
				
				if(downloadCanidateList.getDate_of_birth() != null) {
					ws.value(i, 9, sdf.format(downloadCanidateList.getDate_of_birth()));
					ws.style(i, 9).fontSize(9).wrapText(true).set();
				}else {
					ws.value(i, 9, "--");
					ws.style(i, 9).fontSize(9).wrapText(true).set();
				}
				
				ws.value(i, 10, downloadCanidateList.getCurrent_location());
				ws.style(i, 10).fontSize(9).wrapText(true).set();
				
				ws.value(i, 11, downloadCanidateList.getPreferred_location());
				ws.style(i, 11).fontSize(9).wrapText(true).set();

				ws.value(i, 12, downloadCanidateList.getPermanent_address());
				ws.style(i, 12).fontSize(9).wrapText(true).set();
				
				ws.value(i, 13, downloadCanidateList.getPermanent_city());
				ws.style(i, 13).fontSize(9).wrapText(true).set();
				
				ws.value(i, 14, downloadCanidateList.getPermanent_state());
				ws.style(i, 14).fontSize(9).wrapText(true).set();
				
				ws.value(i, 15, downloadCanidateList.getPermanent_country());
				ws.style(i, 15).fontSize(9).wrapText(true).set();
				
				ws.value(i, 16, downloadCanidateList.getPermanent_pincode());
				ws.style(i, 16).fontSize(9).wrapText(true).set();
				
				ws.value(i, 17, downloadCanidateList.getResume());
				ws.style(i, 17).fontSize(9).wrapText(true).set();
				
				ws.value(i, 18, downloadCanidateList.getTotal_experience());
				ws.style(i, 18).fontSize(9).wrapText(true).set();
				
				ws.value(i, 19, downloadCanidateList.getCurr_company_name());
				ws.style(i, 19).fontSize(9).wrapText(true).set();
				
				ws.value(i, 20, downloadCanidateList.getCurr_company_desigination());
				ws.style(i, 20).fontSize(9).wrapText(true).set();
				
				ws.value(i, 21, downloadCanidateList.getFunctional_area());
				ws.style(i, 21).fontSize(9).wrapText(true).set();
				
				ws.value(i, 22, downloadCanidateList.getRole());
				ws.style(i, 22).fontSize(9).wrapText(true).set();
				
				ws.value(i, 23, downloadCanidateList.getIndustry());
				ws.style(i, 23).fontSize(9).wrapText(true).set();
				
				ws.value(i, 24, downloadCanidateList.getKey_skills());
				ws.style(i, 24).fontSize(9).wrapText(true).set();
				
				ws.value(i, 25, downloadCanidateList.getAnnual_salary());
				ws.style(i, 25).fontSize(9).wrapText(true).set();
				
				ws.value(i, 26, downloadCanidateList.getNotice_period());
				ws.style(i, 26).fontSize(9).wrapText(true).set();
				
				
				if(downloadCanidateList.getLast_working_day() != null) {
					ws.value(i, 27, sdf.format(downloadCanidateList.getLast_working_day()));
					ws.style(i, 27).fontSize(9).wrapText(true).set();
				}else {
					ws.value(i, 27, "--");
					ws.style(i, 27).fontSize(9).wrapText(true).set();
				}
				
				ws.value(i, 28, downloadCanidateList.getResume_headling());
				ws.style(i, 28).fontSize(9).wrapText(true).set();
				
				ws.value(i, 29, downloadCanidateList.getSummary());
				ws.style(i, 29).fontSize(9).wrapText(true).set();
				
				ws.value(i, 30, downloadCanidateList.getUg_degree());
				ws.style(i, 30).fontSize(9).wrapText(true).set();
				
				ws.value(i, 31, downloadCanidateList.getUg_specialization());
				ws.style(i, 31).fontSize(9).wrapText(true).set();
				
				ws.value(i, 32, downloadCanidateList.getUg_college_name());
				ws.style(i, 32).fontSize(9).wrapText(true).set();
				
				ws.value(i, 33, downloadCanidateList.getUg_graduation_year());
				ws.style(i, 33).fontSize(9).wrapText(true).set();
				
				ws.value(i, 34, downloadCanidateList.getPg_degree());
				ws.style(i, 34).fontSize(9).wrapText(true).set();
				
				ws.value(i, 35, downloadCanidateList.getPg_specialization());
				ws.style(i, 35).fontSize(9).wrapText(true).set();
				
				ws.value(i, 36, downloadCanidateList.getPg_college_name());
				ws.style(i, 36).fontSize(9).wrapText(true).set();
				
				ws.value(i, 37, downloadCanidateList.getPg_graduation_year());
				ws.style(i, 37).fontSize(9).wrapText(true).set();
				
				ws.value(i, 38, downloadCanidateList.getDoctorate_degree());
				ws.style(i, 38).fontSize(9).wrapText(true).set();
				
				ws.value(i, 39, downloadCanidateList.getDoctorate_specialization());
				ws.style(i, 39).fontSize(9).wrapText(true).set();
				
				ws.value(i, 40, downloadCanidateList.getDoctorate_university());
				ws.style(i, 40).fontSize(9).wrapText(true).set();
				
				ws.value(i, 41, downloadCanidateList.getDoctorate_graduation_year());
				ws.style(i, 41).fontSize(9).wrapText(true).set();
				
				ws.value(i, 42, downloadCanidateList.getWork_permit_status());
				ws.style(i, 42).fontSize(9).wrapText(true).set();
				
				ws.value(i, 43, downloadCanidateList.getTs_screening_comment_1());
				ws.style(i, 43).fontSize(9).wrapText(true).set();
				
				ws.value(i, 44, downloadCanidateList.getTs_screening_comment_2());
				ws.style(i, 44).fontSize(9).wrapText(true).set();
				
				ws.value(i, 45, downloadCanidateList.getTs_screening_comment_3());
				ws.style(i, 45).fontSize(9).wrapText(true).set();
				
				ws.value(i, 46, downloadCanidateList.getTs_screening_grade());
				ws.style(i, 46).fontSize(9).wrapText(true).set();

				ws.value(i, 47, downloadCanidateList.getPlaced_company());
				ws.style(i, 47).fontSize(9).wrapText(true).set();
				
				if(downloadCanidateList.getPlaced_date() != null) {
					ws.value(i, 48, sdf.format(downloadCanidateList.getPlaced_date()));
					ws.style(i, 48).fontSize(9).wrapText(true).set();
				}else {
					ws.value(i, 48, "--");
					ws.style(i, 48).fontSize(9).wrapText(true).set();
				}
				
				ws.value(i, 49, downloadCanidateList.getInactive_reason());
				ws.style(i++, 49).fontSize(9).wrapText(true).set();
				
	 		}
	 		wb.finish();

	 		Log log = new Log();
	 		log.setUser_id(Integer.parseInt(user_id));
	 		log.setUser_name(user_name);
	 		log.setTitle("Candidate Excell Downloaded");
	 		log.setDescription(user_name + " was Downloaded the Candidate List");
	 		log.setActivity_time(new Date());
	 		String ipAddr = Utils.getIpAddr(request);
			if(ipAddr == null){ipAddr="";}
	 		log.setIp_addr(ipAddr);
	 		logDAO.saveLog(log);
		} 
		else {
			
			response.sendRedirect("/bootcamp");
			}
		}
 		catch(Exception ex)
		{
			ex.printStackTrace();
		}
	}
	
	@RequestMapping(value="/canidateDownloadXL")
	public void canidateDownloadXL(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		HashMap<String, String> accountMap = null;
		try 
		{
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			if(accountMap != null && (accountMap.get("user_id").equalsIgnoreCase(Utils.adminId.toString()))) {
				
			String user_id = accountMap.get("user_id");
			String user_email = accountMap.get("user_email");
			String user_name = accountMap.get("user_name");
			String user_type_id = accountMap.get("user_type_id");
				
			List<Candidate> memberList = candidateDAO.getAllCandidate();
			request.setAttribute("memberList", memberList);
	 		
	 		response.setContentType("application/vnd.ms-excel");
			response.setHeader("Content-Disposition", "attachment;filename=Teksands-Candidate-List.xlsx");
			
			Workbook wb = new Workbook(response.getOutputStream(), "MyApplication", "1.0");
			Worksheet ws = wb.newWorksheet("Teksands Candidate List");
			
			SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
									
			ws.value(0, 0, "Teksands Candidate List");
			ws.range(0, 0, 0, 5).merge();
			ws.range(0, 0, 0, 5).style().horizontalAlignment("center").set();
			ws.style(0, 0).bold().fontSize(11).set(); 

			int i = 1;
			int j = 0;
			for(j = 0; j <= 48; j++) {
				ws.style(i, j).bold().fontSize(9).borderStyle("bold").borderColor("0f76bd").wrapText(true).set();	
			}
			
			ws.value(i, 0, "Id");
			ws.value(i, 1, "Job Title");
	        ws.value(i, 2, "Name");
		    ws.value(i, 3, "Email");
		    ws.value(i, 4, "Mobile");
		    ws.value(i, 5, "Gender");
		    ws.value(i, 6, "Marital Status");
		    ws.value(i, 7, "Home Town");
		    ws.value(i, 8, "Date of Birth");
		    ws.value(i, 9, "Current Location");
		    ws.value(i, 10, "Preferred Location");
		    ws.value(i, 11, "Permanent Address");
		    ws.value(i, 12, "Permanent City");
		    ws.value(i, 13, "Permanent State");
		    ws.value(i, 14, "Permanent Country");
		    ws.value(i, 15, "Pincode");
		    ws.value(i, 16, "Resume");
		    ws.value(i, 17, "Total Experience");
		    ws.value(i, 18, "Current Company Name");
		    ws.value(i, 19, "Current Company Resigination");
		    ws.value(i, 20, "Functional Area");
		    ws.value(i, 21, "Role");
		    ws.value(i, 22, "Industry");
		    ws.value(i, 23, "Key Skills");
		    ws.value(i, 24, "Annual Salary");
		    ws.value(i, 25, "Notice Period");
		    ws.value(i, 26, "Last Working Day");
		    ws.value(i, 27, "Resume Heading");
		    ws.value(i, 28, "Summary");
		    ws.value(i, 29, "UG Degree");
		    ws.value(i, 30, "UG Specialization");
		    ws.value(i, 31, "UG College Name");
		    ws.value(i, 32, "UG Graduation Year");
		    ws.value(i, 33, "PG Degree");
		    ws.value(i, 34, "PG Specialization");
		    ws.value(i, 35, "PG College Name");
		    ws.value(i, 36, "PG Graduation Year");
		    ws.value(i, 37, "Doctorate Degree");
		    ws.value(i, 38, "Doctorate Specialization");
		    ws.value(i, 39, "Doctorate College Name");
		    ws.value(i, 40, "Doctorate Graduation Year");
		    ws.value(i, 41, "Work Permit Status");
		    ws.value(i, 42, "TS Screening Comment 1");
		    ws.value(i, 43, "TS Screening Comment 2");
		    ws.value(i, 44, "TS Screening Comment 3");
		    ws.value(i, 45, "TS Grade");
		    ws.value(i, 46, "Placed Company");
		    ws.value(i, 47, "Placed Date");
		    ws.value(i++, 48, "Inactive Reason");
		    
	 		for(Candidate downloadCanidateList : candidateDAO.getAllCandidate())
	 		{
	 			ws.value(i, 0, downloadCanidateList.getId());
				ws.style(i, 0).fontSize(9).wrapText(true).set();
				
				ws.value(i, 1, downloadCanidateList.getJob_title());
				ws.style(i, 1).fontSize(9).wrapText(true).set();

				ws.value(i, 2, downloadCanidateList.getName());
				ws.style(i, 2).fontSize(9).wrapText(true).set();
				
				ws.value(i, 3, downloadCanidateList.getEmail());
				ws.style(i, 3).fontSize(9).wrapText(true).set();
				
				ws.value(i, 4, downloadCanidateList.getMobile());
				ws.style(i, 4).fontSize(9).wrapText(true).set();
				
				ws.value(i, 5, downloadCanidateList.getGender());
				ws.style(i, 5).fontSize(9).wrapText(true).set();
				
				ws.value(i, 6, downloadCanidateList.getMarital_status());
				ws.style(i, 6).fontSize(9).wrapText(true).set();
				
				ws.value(i, 7, downloadCanidateList.getHome_town());
				ws.style(i, 7).fontSize(9).wrapText(true).set();
				
				if(downloadCanidateList.getDate_of_birth() != null) {
					ws.value(i, 8, sdf.format(downloadCanidateList.getDate_of_birth()));
					ws.style(i, 8).fontSize(9).wrapText(true).set();
				}else {
					ws.value(i, 8, "--");
					ws.style(i, 8).fontSize(9).wrapText(true).set();
				}
				
				ws.value(i, 9, downloadCanidateList.getCurrent_location());
				ws.style(i, 9).fontSize(9).wrapText(true).set();
				
				ws.value(i, 10, downloadCanidateList.getPreferred_location());
				ws.style(i, 10).fontSize(9).wrapText(true).set();

				ws.value(i, 11, downloadCanidateList.getPermanent_address());
				ws.style(i, 11).fontSize(9).wrapText(true).set();
				
				ws.value(i, 12, downloadCanidateList.getPermanent_city());
				ws.style(i, 12).fontSize(9).wrapText(true).set();
				
				ws.value(i, 13, downloadCanidateList.getPermanent_state());
				ws.style(i, 13).fontSize(9).wrapText(true).set();
				
				ws.value(i, 14, downloadCanidateList.getPermanent_country());
				ws.style(i, 14).fontSize(9).wrapText(true).set();
				
				ws.value(i, 15, downloadCanidateList.getPermanent_pincode());
				ws.style(i, 15).fontSize(9).wrapText(true).set();
				
				ws.value(i, 16, downloadCanidateList.getResume());
				ws.style(i, 16).fontSize(9).wrapText(true).set();
				
				ws.value(i, 17, downloadCanidateList.getTotal_experience());
				ws.style(i, 17).fontSize(9).wrapText(true).set();
				
				ws.value(i, 18, downloadCanidateList.getCurr_company_name());
				ws.style(i, 18).fontSize(9).wrapText(true).set();
				
				ws.value(i, 19, downloadCanidateList.getCurr_company_desigination());
				ws.style(i, 19).fontSize(9).wrapText(true).set();
				
				ws.value(i, 20, downloadCanidateList.getFunctional_area());
				ws.style(i, 20).fontSize(9).wrapText(true).set();
				
				ws.value(i, 21, downloadCanidateList.getRole());
				ws.style(i, 21).fontSize(9).wrapText(true).set();
				
				ws.value(i, 22, downloadCanidateList.getIndustry());
				ws.style(i, 22).fontSize(9).wrapText(true).set();
				
				ws.value(i, 23, downloadCanidateList.getKey_skills());
				ws.style(i, 23).fontSize(9).wrapText(true).set();
				
				ws.value(i, 24, downloadCanidateList.getAnnual_salary());
				ws.style(i, 24).fontSize(9).wrapText(true).set();
				
				ws.value(i, 25, downloadCanidateList.getNotice_period());
				ws.style(i, 25).fontSize(9).wrapText(true).set();
				
				
				if(downloadCanidateList.getLast_working_day() != null) {
					ws.value(i, 26, sdf.format(downloadCanidateList.getLast_working_day()));
					ws.style(i, 26).fontSize(9).wrapText(true).set();
				}else {
					ws.value(i, 26, "--");
					ws.style(i, 26).fontSize(9).wrapText(true).set();
				}
				
				ws.value(i, 27, downloadCanidateList.getResume_headling());
				ws.style(i, 27).fontSize(9).wrapText(true).set();
				
				ws.value(i, 28, downloadCanidateList.getSummary());
				ws.style(i, 28).fontSize(9).wrapText(true).set();
				
				ws.value(i, 29, downloadCanidateList.getUg_degree());
				ws.style(i, 29).fontSize(9).wrapText(true).set();
				
				ws.value(i, 30, downloadCanidateList.getUg_specialization());
				ws.style(i, 30).fontSize(9).wrapText(true).set();
				
				ws.value(i, 31, downloadCanidateList.getUg_college_name());
				ws.style(i, 31).fontSize(9).wrapText(true).set();
				
				ws.value(i, 32, downloadCanidateList.getUg_graduation_year());
				ws.style(i, 32).fontSize(9).wrapText(true).set();
				
				ws.value(i, 33, downloadCanidateList.getPg_degree());
				ws.style(i, 33).fontSize(9).wrapText(true).set();
				
				ws.value(i, 34, downloadCanidateList.getPg_specialization());
				ws.style(i, 34).fontSize(9).wrapText(true).set();
				
				ws.value(i, 35, downloadCanidateList.getPg_college_name());
				ws.style(i, 35).fontSize(9).wrapText(true).set();
				
				ws.value(i, 36, downloadCanidateList.getPg_graduation_year());
				ws.style(i, 36).fontSize(9).wrapText(true).set();
				
				ws.value(i, 37, downloadCanidateList.getDoctorate_degree());
				ws.style(i, 37).fontSize(9).wrapText(true).set();
				
				ws.value(i, 38, downloadCanidateList.getDoctorate_specialization());
				ws.style(i, 38).fontSize(9).wrapText(true).set();
				
				ws.value(i, 39, downloadCanidateList.getDoctorate_university());
				ws.style(i, 39).fontSize(9).wrapText(true).set();
				
				ws.value(i, 40, downloadCanidateList.getDoctorate_graduation_year());
				ws.style(i, 40).fontSize(9).wrapText(true).set();
				
				ws.value(i, 41, downloadCanidateList.getWork_permit_status());
				ws.style(i, 41).fontSize(9).wrapText(true).set();
				
				ws.value(i, 42, downloadCanidateList.getTs_screening_comment_1());
				ws.style(i, 42).fontSize(9).wrapText(true).set();
				
				ws.value(i, 43, downloadCanidateList.getTs_screening_comment_2());
				ws.style(i, 43).fontSize(9).wrapText(true).set();
				
				ws.value(i, 44, downloadCanidateList.getTs_screening_comment_3());
				ws.style(i, 44).fontSize(9).wrapText(true).set();
				
				ws.value(i, 45, downloadCanidateList.getTs_screening_grade());
				ws.style(i, 45).fontSize(9).wrapText(true).set();

				ws.value(i, 46, downloadCanidateList.getPlaced_company());
				ws.style(i, 46).fontSize(9).wrapText(true).set();
				
				if(downloadCanidateList.getPlaced_date() != null) {
					ws.value(i, 47, sdf.format(downloadCanidateList.getPlaced_date()));
					ws.style(i, 47).fontSize(9).wrapText(true).set();
				}else {
					ws.value(i, 47, "--");
					ws.style(i, 47).fontSize(9).wrapText(true).set();
				}
				
				ws.value(i, 48, downloadCanidateList.getInactive_reason());
				ws.style(i++, 48).fontSize(9).wrapText(true).set();
				
	 		}
	 		wb.finish();

	 		Log log = new Log();
	 		log.setUser_id(Integer.parseInt(user_id));
	 		log.setUser_name(user_name);
	 		log.setTitle("Candidate Excell Downloaded");
	 		log.setDescription(user_name + " was Downloaded the Candidate List");
	 		log.setActivity_time(new Date());
	 		String ipAddr = Utils.getIpAddr(request);
			if(ipAddr == null){ipAddr="";}
	 		log.setIp_addr(ipAddr);
	 		logDAO.saveLog(log);
		} 
		else {
			
			response.sendRedirect("/bootcamp");
			}
		}
 		catch(Exception ex)
		{
			ex.printStackTrace();
		}
	}
	
	@RequestMapping(value="/getAllAppliedCandidateCvAndZipAndDownload")
	public void zipAndDownloadCVForAppliedCandidatesByJobID(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		HashMap<String, String> accountMap = null;
		
		try 
		{
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			if(accountMap != null && (accountMap.get("user_id").equalsIgnoreCase(Utils.adminId.toString()))) 
			{
				String user_id = accountMap.get("user_id");
				String user_email = accountMap.get("user_email");
				String user_name = accountMap.get("user_name");
				String user_type_id = accountMap.get("user_type_id");
				
				String job_id = request.getParameter("job_id");
				
				if(job_id == null) {job_id = "";}
				
				job_id = job_id.trim();
				
				List<Candidate> candidateList = null;
				
				if(!job_id.isEmpty()) {
					candidateList = candidateDAO.getAllCandidatesByJobId(Integer.parseInt(job_id));
				}
		 		
				response.setContentType("application/zip");
		        response.setHeader("Content-Disposition", "attachment; filename=Canidate-Resumes.zip");
		        
		        try ( ZipOutputStream zos = new ZipOutputStream(response.getOutputStream()) ) 
		        {
		        	String path = properties.getCandidateResume();
		    		
		    		List<String> srcFiles = new ArrayList<>();

		    		for (Candidate candidate : candidateList) {
		    			
		    			URL url = null;
		    			
		    			if(!candidate.getResume().isEmpty()) {
		    				url = new URL(candidate.getResume());
		    			}

		    			String fileName = null;
		    			
		    			if(url != null) {
		    				fileName = FilenameUtils.getName(url.getPath());
		    			}
		    	        
		    	        File file  = null;
		    	        
		    	        if(fileName != null) {
		    	        	file = new File(path+"/"+fileName);
		    	        }
		    			
		    	        if(file != null) {
		    				if(file.exists()) {
			    				srcFiles.add(path +"/"+ fileName);
			    			}
		    			}
					}
		            
		    		srcFiles = srcFiles.stream().distinct().collect(Collectors.toList()); //duplicate remove
		    		
		    		for (String srcFile : srcFiles) {
		                File fileToZip = new File(srcFile);
		                FileInputStream fis = new FileInputStream(fileToZip);
		                ZipEntry zipEntry = new ZipEntry(fileToZip.getName());
		                zos.putNextEntry(zipEntry);

		                byte[] bytes = new byte[1024];
		                int length;
		                while((length = fis.read(bytes)) >= 0) {
		                	zos.write(bytes, 0, length);
		                }
		                fis.close();
		            }
		    		zos.close();
		    		
		    		Log log = new Log();
			 		log.setUser_id(Integer.parseInt(user_id));
			 		log.setUser_name(user_name);
			 		log.setTitle("Candidate Resumes Downloaded");
			 		log.setDescription(user_name + " was Downloaded the Candidate Resumes");
			 		log.setActivity_time(new Date());
			 		String ipAddr = Utils.getIpAddr(request);
					if(ipAddr == null){ipAddr="";}
			 		log.setIp_addr(ipAddr);
			 		logDAO.saveLog(log);
		        }
		        
			}else {
				response.sendRedirect("/bootcamp");
			}
		}
 		catch(Exception ex)
		{
			ex.printStackTrace();
		}
	}
}
