package com.teksands.bootcamp.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Base64;
import java.util.Base64.Decoder;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.lang.RandomStringUtils;
import org.dhatim.fastexcel.Workbook;
import org.dhatim.fastexcel.Worksheet;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.teksands.bootcamp.dao.LogDAO;
import com.teksands.bootcamp.dao.TestMasterDAO;
import com.teksands.bootcamp.model.Candidate;
import com.teksands.bootcamp.model.Log;
import com.teksands.bootcamp.model.Test;
import com.teksands.bootcamp.model.TestAnswer;
import com.teksands.bootcamp.model.TestComment;
import com.teksands.bootcamp.model.TestQuestion;
import com.teksands.bootcamp.model.TestResults;
import com.teksands.bootcamp.model.TestUser;
import com.teksands.bootcamp.model.TkTestResults;
import com.teksands.bootcamp.response.DownloadTestUserResponse;
import com.teksands.user.model.Trainers;
import com.teksands.user.response.CommonResponse;
import com.teksands.user.response.UserAnswerResponse;
import com.teksands.user.response.UserTestResponse;
import com.teksands.utils.Properties;
import com.teksands.utils.SendEmailUtil;
import com.teksands.utils.StatusMessage;
import com.teksands.utils.UniqueIDProvider;
import com.teksands.utils.Utils;
import com.teksands.utils.ViewHelper;


@Controller
@RequestMapping("/bootcamp")

public class TestMasterController {
	
	@Autowired
	TestMasterDAO testMasterDAO;
	
	@Autowired
	SendEmailUtil sendEmailUtil;
	
	@Autowired
	Properties properties;
	
	@Autowired
	LogDAO logDAO;
	
	private static final String SAVE_DIR = "upload";
		
	@RequestMapping({ "/create-test" })
	public String add_candidate(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HashMap<String, String> accountMap = null;
		try {
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			if(accountMap != null ) {
				
				String test_id = request.getParameter("id");

				Test test = null;

				if (test_id != null) {
					test = testMasterDAO.getTestById(Integer.parseInt(test_id));
					request.setAttribute("test", test);
				}

				request.setAttribute("page", "create-test");
			} else {
				response.sendRedirect("/bootcamp");
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return "bootcamp.exam.createtest";
	}

	@RequestMapping(value="/saveOrUpdateTest")
	public void saveOrUpdateTest(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		CommonResponse commonResponse = null;
		Gson gson = null;	
		Test test = null;
		String authCode = UUID.randomUUID().toString();
		try 
   		{
			commonResponse = new CommonResponse();
    		gson = new Gson();	
    		
    		String id = request.getParameter("id");
    		String test_name = request.getParameter("name");
    		String test_description = request.getParameter("description");
    		String test_topic1 = request.getParameter("topic1");
    		String test_topic2 = request.getParameter("topic2");
    		String test_topic3 = request.getParameter("topic3");
    		String test_time = request.getParameter("test_time");
    		
    		if(id == null) {id ="";}
    		if(test_name == null) {test_name ="";}
    		if(test_description == null) {test_description ="";}
    		if(test_topic1 == null) {test_topic1 ="";}
    		if(test_topic2 == null) {test_topic2 ="";}
    		if(test_topic3 == null) {test_topic3 ="";}
    		if(test_time == null) {test_time ="";}
    		
    		id = id.trim();
    		test_name = test_name.trim();
    		test_description = test_description.trim();
    		test_topic1 = test_topic1.trim();
    		test_topic2 = test_topic2.trim();
    		test_topic3 = test_topic3.trim();
    		test_time = test_time.trim();
    		
    		if (!id.isEmpty()) {
    			
    			test = testMasterDAO.getTestById(Integer.parseInt(id));
    			
    			test.setTest_name(test_name);
        		test.setTest_description(test_description);
        		test.setTest_topic_1(test_topic1);
        		test.setTest_topic_2(test_topic2);
        		test.setTest_topic_3(test_topic3);
        		test.setTest_time(test_time);
        		test.setCreated_date(new Date());
        		test.setActive(true);
        		
        		Boolean result = testMasterDAO.saveOrUpdateTest(test);
        		
        		if(result) {
        			commonResponse.setStatus("Test updated successfully");
        			commonResponse.setStatus_code(200);
        			writer.print(gson.toJson(commonResponse));
        			writer.close();
        			return;
        		} else {
        			commonResponse.setStatus("FAILURE");
        			commonResponse.setStatus_code(400);
        			writer.print(gson.toJson(commonResponse));
        			writer.close();
        			return;
        		}
    		}
    		else {
    			
    			test = new Test();
    			test.setTest_name(test_name);
        		test.setTest_description(test_description);
        		test.setTest_topic_1(test_topic1);
        		test.setTest_topic_2(test_topic2);
        		test.setTest_topic_3(test_topic3);
        		test.setTest_time(test_time);
        		test.setAuth_code(authCode);
        		test.setCreated_date(new Date());
        		test.setActive(true);

        		Boolean result = testMasterDAO.saveOrUpdateTest(test);
        		
        		if(result) {
        			commonResponse.setStatus("Test Saved successfully");
        			commonResponse.setStatus_code(200);
        			writer.print(gson.toJson(commonResponse));
        			writer.close();
        			return;
        		} else {
        			commonResponse.setStatus("FAILURE");
        			commonResponse.setStatus_code(400);
        			writer.print(gson.toJson(commonResponse));
        			writer.close();
        			return;
        		}
    		}
   		}
		catch(Exception ex)
       	{
       		ex.printStackTrace();
       		
       		commonResponse.setStatus("FAILURE");
			commonResponse.setStatus_code(400);
			writer.print(gson.toJson(commonResponse));
			writer.close();
			return;
       	}
	}
	
	@RequestMapping("/list-test")
	public String list_test(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		HashMap<String, String> accountMap = null;
		try
		{	
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			
			if(accountMap != null) {
				
				List<Test> testList = testMasterDAO.getAllActiveTest();
				request.setAttribute("testList", testList);
				
				request.setAttribute("page", "list-test");
				
			} else {
				
				response.sendRedirect("/home");
			}
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return "bootcamp.exam.test.list";
	}
	
	@RequestMapping({"/view-test" })
	public String view_test(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		HashMap<String, String> accountMap = null;
		try
		{	
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			if(accountMap != null) {
				
				String test_id = request.getParameter("id");
				
				Test test = null;
	    		
				if(test_id != null) {
					test = testMasterDAO.getTestById(Integer.parseInt(test_id));
	    			request.setAttribute("test", test);
	    		}
				
				List<TestQuestion> testQuestion = testMasterDAO.getQuestionByTestId(Integer.parseInt(test_id));
				request.setAttribute("testQuestion", testQuestion);
								
				List<TestUser> testUser = testMasterDAO.getUserByTestId(test_id);
				request.setAttribute("testUser", testUser);				
				
				request.setAttribute("page", "view-test");
				
			}
			else {
				response.sendRedirect("/home");
			}
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return "bootcamp.exam.test.view";
	}
	
	@RequestMapping(value="/addTestQuestion")
	public void addTestQuestion(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		CommonResponse commonResponse = null;
		Gson gson = null;	
		Test test = null;
		TestQuestion testqns = null;
		try 
   		{
			commonResponse = new CommonResponse();
    		gson = new Gson();	
    		
    		String test_id = request.getParameter("test_id");
    		String test_qns_type = request.getParameter("test_qns_type");
    		String quest_id = request.getParameter("quest_id");
    		String question = request.getParameter("question");
    		String option1 = request.getParameter("option1");
    		String option2 = request.getParameter("option2");
    		String option3 = request.getParameter("option3");
    		String option4 = request.getParameter("option4");
    		String option5 = request.getParameter("option5");
    		String option6 = request.getParameter("option6");
    		String correct_answer = request.getParameter("correct_answer");
    		
    		if(quest_id == null) {quest_id ="";}
    		if(test_id == null) {test_id ="";}
    		if(test_qns_type == null) {test_qns_type ="";}
    		if(question == null) {question ="";}
    		if(option1 == null) {option1 ="";}
    		if(option2 == null) {option2 ="";}
    		if(option3 == null) {option3 ="";}
    		if(option4 == null) {option4 ="";}
    		if(option5 == null) {option5 ="";}
    		if(option6 == null) {option6 ="";}
    		if(correct_answer == null) {correct_answer ="";}
    		
    		quest_id = quest_id.trim();
    		test_id = test_id.trim();
    		test_qns_type = test_qns_type.trim();
    		question = question.trim();
    		option1 = option1.trim();
    		option2 = option2.trim();
    		option3 = option3.trim();
    		option4 = option4.trim();
    		option5 = option5.trim();
    		option6 = option6.trim();
    		correct_answer = correct_answer.trim();
    		
    		if(!test_id.isEmpty()) {
    			test = testMasterDAO.getTestById(Integer.parseInt(test_id));
    		}
    		
    		if(test ==  null){
    			commonResponse.setStatus("FAILURE");
    			commonResponse.setStatus_code(400);
    			writer.print(gson.toJson(commonResponse));
    			writer.close();
    			return;
    		}    		
			if(!quest_id.isEmpty()) {
						
				testqns = testMasterDAO.getQuestionsById(Integer.parseInt(quest_id));
			}
			if(!quest_id.isEmpty())	
			{
				testqns.setQuestion_type(test_qns_type);
    			testqns.setQuestion(question);
    			testqns.setOption1(option1);
    			testqns.setOption2(option2);
    			testqns.setOption3(option3);
    			testqns.setOption4(option4);
    			testqns.setOption5(option5);
    			testqns.setOption6(option6);
    			testqns.setCorrect_answer(correct_answer);
    			testqns.setCreated_date(new Date());
    			
    			Boolean result = testMasterDAO.saveOrUpdateTestQuestion(testqns);
    			if(result) {
        			commonResponse.setStatus("Test Question Updated successfully");
        			commonResponse.setStatus_code(200);
        			writer.print(gson.toJson(commonResponse));
        			writer.close();
        			return;
        		} else {
        			commonResponse.setStatus("FAILURE");
        			commonResponse.setStatus_code(400);
        			writer.print(gson.toJson(commonResponse));
        			writer.close();
        			return;
        		}
			}			
				
    		else {
    			testqns = new TestQuestion();
    			testqns.setTest_id(Integer.parseInt(test_id));
    			testqns.setTopic("");
    			testqns.setQuestion_type(test_qns_type);
    			testqns.setQuestion(question);
    			testqns.setOption1(option1);
    			testqns.setOption2(option2);
    			testqns.setOption3(option3);
    			testqns.setOption4(option4);
    			testqns.setOption5(option5);
    			testqns.setOption6(option6);
    			testqns.setCorrect_answer(correct_answer);
    			testqns.setCreated_date(new Date());
    			
    			Boolean result = testMasterDAO.saveOrUpdateTestQuestion(testqns);
    			
    			if(result) {
        			commonResponse.setStatus("Test Question Saved successfully");
        			commonResponse.setStatus_code(200);
        			writer.print(gson.toJson(commonResponse));
        			writer.close();
        			return;
        		} else {
        			commonResponse.setStatus("FAILURE");
        			commonResponse.setStatus_code(400);
        			writer.print(gson.toJson(commonResponse));
        			writer.close();
        			return;
        		}
    		}
   		}
		catch(Exception ex)
       	{
       		ex.printStackTrace();
       		
       		commonResponse.setStatus("FAILURE");
			commonResponse.setStatus_code(400);
			writer.print(gson.toJson(commonResponse));
			writer.close();
			return;
       	}
	}
	
	@RequestMapping(value="/deleteQuestion")
	public void deleteQuestion(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		CommonResponse commonResponse = null;
		Gson gson = null;	
		try 
   		{
			commonResponse = new CommonResponse();
    		gson = new Gson();	
    		
    		String question_id = request.getParameter("question_id");
    		
    		if(question_id == null) {question_id ="";}
    		
    		question_id = question_id.trim();
    		
    		Boolean result =  false;
    		
    		if(!question_id.isEmpty()) {
    			result = testMasterDAO.deleteQuestionById(Integer.parseInt(question_id));
    		}
    		
    		if(result) {
    			commonResponse.setMsg("Test Question Deleted successfully");
    			commonResponse.setStatus_code(200);
    			writer.print(gson.toJson(commonResponse));
    			writer.close();
    			return;
    		} else {
    			commonResponse.setStatus("FAILURE");
    			commonResponse.setStatus_code(400);
    			writer.print(gson.toJson(commonResponse));
    			writer.close();
    			return;
    		}
   		}
		catch(Exception ex)
       	{
       		ex.printStackTrace();
       		
       		commonResponse.setStatus("FAILURE");
			commonResponse.setStatus_code(400);
			writer.print(gson.toJson(commonResponse));
			writer.close();
			return;
       	}
	}
	
	@RequestMapping(value="/getQuestionsById")
	public void getQuestionsById(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		CommonResponse commonResponse = null;
		Gson gson = null;	
		try 
   		{
			commonResponse = new CommonResponse();
    		gson = new Gson();	
    		
    		String question_id = request.getParameter("question_id");
    		
    		if(question_id == null) {question_id ="";}
    		
    		question_id = question_id.trim();
    		
    		TestQuestion testQuestion =  null;
    		
    		if(!question_id.isEmpty()) {
    			testQuestion = testMasterDAO.getQuestionsById(Integer.parseInt(question_id));
    		}
    		
    		writer.print(gson.toJson(testQuestion));
			writer.close();
			return;
   		}
		catch(Exception ex)
       	{
       		ex.printStackTrace();
       		
       		commonResponse.setStatus("FAILURE");
			commonResponse.setStatus_code(400);
			writer.print(gson.toJson(commonResponse));
			writer.close();
			return;
       	}
	}
	
	@RequestMapping(value="/generateTestLinkById")
	public void generateTestLinkById(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		CommonResponse commonResponse = null;
		Gson gson = null;	
		try 
   		{
			commonResponse = new CommonResponse();
    		gson = new Gson();	
    		
    		String test_id = request.getParameter("test_id");
    		
    		if(test_id == null) {test_id ="";}
    		
    		test_id = test_id.trim();
    		
    		Test test =  null;
    		String authCode = "";
    		
    		if(!test_id.isEmpty()) {
    			test = testMasterDAO.getTestById(Integer.parseInt(test_id));
    		}
    		
    		if(test != null) {
    			authCode = test.getAuth_code();
    		}
    		
    		String test_link = properties.getHostDomainUrl() + "bootcamp/tk-test-user?authCode="+authCode;
    		
    		test.setTest_link(test_link);
    		testMasterDAO.saveOrUpdateTest(test);
    		
    		commonResponse.setStatus(test_link);
			commonResponse.setStatus_code(200);
    		writer.print(gson.toJson(commonResponse));
			writer.close();
			return;
    		
   		}
		catch(Exception ex)
       	{
       		ex.printStackTrace();
       		
       		commonResponse.setStatus("FAILURE");
			commonResponse.setStatus_code(400);
			writer.print(gson.toJson(commonResponse));
			writer.close();
			return;
       	}
	}
	
	@RequestMapping("/list-test-user")
	public String list_test_user(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		HashMap<String, String> accountMap = null;
		try
		{	
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			
			if(accountMap != null) {
				
				List<TestUser> testuserList = testMasterDAO.getAllTestUser();
				request.setAttribute("testuserList", testuserList);
				request.setAttribute("page", "list-test-user");
				
			} else {
				
				response.sendRedirect("/home");
			}
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return "bootcamp.exam.test.user.list";
	}
	
	@RequestMapping({"/view-user-test-list" })
	public String view_user_test_list(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		HashMap<String, String> accountMap = null;
		try
		{	
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			if(accountMap != null) {	

				String id = request.getParameter("id");
				if(id != null) {		
				List<Object[]> testList = testMasterDAO.getAllTestByUserId(Integer.parseInt(id));
				List<UserTestResponse> testuserList = new ArrayList<UserTestResponse>();
				
				for (Object[] objects : testList) 
    			{
    				String user_id = String.valueOf(objects[0]);
    				String name = String.valueOf(objects[1]);
    				String email = String.valueOf(objects[2]);
    				String test_id = String.valueOf(objects[3]);
    				
    				UserTestResponse testuser = new UserTestResponse();
    				testuser.setUser_id(Integer.parseInt(user_id));
    				testuser.setName(name);
    				testuser.setEmail(email);
    				testuser.setTest_id(test_id);
    				testuserList.add(testuser);    				
    			}						
				request.setAttribute("testList", testuserList);				
				request.setAttribute("page", "view-user-test-list");
				}
			}
			else {
				response.sendRedirect("/home");
			}
		}
		catch(Exception ex)
		{
			ex.printStackTrace();			
		}
		return "bootcamp.exam.test.user.list.view";
	}
	
	@RequestMapping(value="/view-user-answer-list")
	public String view_user_anser_list(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		HashMap<String, String> accountMap = null;	
		try 
   		{
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			if(accountMap != null) {	

				String test_id = request.getParameter("test_id");
	    		String user_id = request.getParameter("user_id");
	    		
	    		if(test_id == null) {test_id ="";}
	    		if(user_id == null) {user_id ="";}
	    		
	    		test_id = test_id.trim();
	    		user_id = user_id.trim();
	    		
	    		
	    		if(!test_id.isEmpty() && !user_id.isEmpty()) {
	    			request.setAttribute("test_id", test_id);
	    			request.setAttribute("user_id", user_id);
	    		}
	    		
	    		TestUser testUser = null;
	    		Test test = null;
	    		
	    		if(user_id != "") {
	    			testUser = testMasterDAO.getUserById(Integer.parseInt(user_id));
	    		}
	    		
	    		if(!test_id.isEmpty()) {
	    			test = testMasterDAO.getTestById(Integer.parseInt(test_id));
	    		}
	    		
	    		if(testUser != null) {
	    			request.setAttribute("testUser", testUser);
	    		}
	    		
	    		List<TestQuestion> mcqQuestionList = testMasterDAO.getMCQTestQuestionByTestId(Integer.parseInt(test_id));
	    		List<TestAnswer> mcqAnswerList = testMasterDAO.getMCQTestAnswersByTestIdAndUserId(Integer.parseInt(test_id),Integer.parseInt(user_id));

	    		Integer total = 0;
	    							
	    		if(mcqQuestionList != null) {
	    			total = mcqQuestionList.size();
	    		}

	    		Integer correct = 0;
	    		Integer wrong = 0;

	    		if(mcqAnswerList != null) 
	    		{
	    			for (TestAnswer testAnswer : mcqAnswerList) 
	    			{
	    				Integer questionId = testAnswer.getQuestion_id();
	    				String user_answer = testAnswer.getCorrect_answer();
	    				
	    				TestQuestion testQuestion = testMasterDAO.getQuestionsById(questionId);
	    				
	    				if(testQuestion.getCorrect_answer().equalsIgnoreCase(user_answer)) {
	    					correct = correct+1;
	    				}else {
	    					wrong = wrong+1;
	    				}
	    			}
	    		}

	    		Integer percetage = 0;

	    		if(!total.equals(0)) {
	    			percetage = (correct*100)/total;
	    		}
	    		
	    		request.setAttribute("mcQtotal", total);
	    		request.setAttribute("mcQcorrect", correct);
	    		request.setAttribute("mcQWrong", wrong);
	    		request.setAttribute("mcPercetage", percetage);
	    		
	    		if(!test_id.isEmpty() && !user_id.isEmpty()) {
	    		
	    			List<Object[]> testanswerList = testMasterDAO.getAnswerByTestUserId(Integer.parseInt(test_id),Integer.parseInt(user_id));
					List<UserAnswerResponse> testuserresponseList = new ArrayList<UserAnswerResponse>();
					
					TestComment testComment = testMasterDAO.getCommentByTestIdAndUserId(Integer.parseInt(test_id),Integer.parseInt(user_id));
					
					for (Object[] objects : testanswerList) 
	    			{
						String testId = String.valueOf(objects[0]);
	    				String userId = String.valueOf(objects[1]);
	    				String question_type = String.valueOf(objects[2]);
	    				String question_id = String.valueOf(objects[3]);
	    				String question = String.valueOf(objects[4]);
	    				String user_answer = String.valueOf(objects[5]);
	    				String correct_answer = String.valueOf(objects[6]);
	    				String answer_id = String.valueOf(objects[7]);
	    				String correct_or_not = String.valueOf(objects[8]);
	    				
	    				UserAnswerResponse testanswer = new UserAnswerResponse();
	    				testanswer.setTest_id(Integer.parseInt(testId));
	    				testanswer.setUser_id(Integer.parseInt(userId));
	    				testanswer.setQuestion_type(question_type);
	    				testanswer.setQuestion_id(Integer.parseInt(question_id));
	    				testanswer.setQuestion(question);
	    				testanswer.setTest_answer(user_answer);    					
	    				testanswer.setCorrect_answer(correct_answer); 
	    				testanswer.setAnswer_id(Integer.parseInt(answer_id));
	    				if(question_type.equalsIgnoreCase("mcq")) {
	    					if(correct_or_not.equalsIgnoreCase("1")) {
		    					testanswer.setCorrect_or_not("Y");
		    				}else {
		    					testanswer.setCorrect_or_not("N");
		    				}
	    				}
	    				testuserresponseList.add(testanswer);
	    			}		
					
					if(test != null) {
						request.setAttribute("testName", test.getTest_name());
					}

					
					request.setAttribute("testComment", testComment);
					request.setAttribute("testanswerList", testuserresponseList);	
					request.setAttribute("page", "view-user-answer-list");    
					
	    		}
			}
			else {
				response.sendRedirect("/home");
			}
   		}
		catch(Exception ex)
       	{
			ex.printStackTrace();
       	}
		return "bootcamp.exam.test.user.answer.list";
	}	
	
	//ExamController
	
	
	
	@RequestMapping({"/tk-test" })
	public String mcq(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{	
		try
		{	
			String authCode = request.getParameter("authCode");
			
			if(authCode == null) {authCode = "";}
			
			authCode = authCode.trim();
			
			Test test =  null;
			
			if(!authCode.isEmpty()) {
				test = testMasterDAO.getTestByAuthCode(authCode);
			}
			
			if(test != null) {
				
				List<TestQuestion> testQuestion = testMasterDAO.getTestQuestionsById(test.getTest_id());
				
				request.setAttribute("test", test);
				request.setAttribute("testQuestion", testQuestion);
				
				TestQuestion question = null;
				
				if(!testQuestion.isEmpty()) {
					question = testQuestion.get(testQuestion.size() - 1);	
				}
				
				if(question != null) {
					Integer last_question_id = question.getQuestion_id();
					
					request.setAttribute("last_question_id", last_question_id);
				}
				
			}else {
				response.sendRedirect("/home");
			}
			
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		
		return "bootcamp.exam.test";
	}
	
	@RequestMapping("/checkTestEmailAlreadyExistsOrNot")
	public void checkTestEmailAlreadyExistsOrNot(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		CommonResponse commonResponse = null;
		Gson gson = null;	
		TestUser testUser = null;
		try 
   		{
			commonResponse = new CommonResponse();
    		gson = new Gson();	    		
    		
    		String test_id = request.getParameter("test_id");
    		String user_email = request.getParameter("user_email");
    		
    		if(test_id == null) {test_id ="";}
    		if(user_email == null) {user_email ="";}
    		
    		test_id = test_id.trim();
    		user_email = user_email.trim();
    		
    		if(Utils.validateEmail(user_email) && !test_id.isEmpty())
			{
    			testUser = testMasterDAO.checkIfEmailAlreadyExistByTestId(user_email, Integer.parseInt(test_id));
				
    			if(testUser != null) {
    				commonResponse.setStatus("old_user");
        			commonResponse.setMsg("You have already taken this Test, Do you want to retest again?");
        			commonResponse.setStatus_code(200);
        			writer.print(gson.toJson(commonResponse));
        			writer.close();
        			return;
    			}else {
    				commonResponse.setStatus("new_user");
        			commonResponse.setMsg("");
        			commonResponse.setStatus_code(200);
        			writer.print(gson.toJson(commonResponse));
        			writer.close();
        			return;
    			}
    			
			}    		   		
    		
   		}
		catch(Exception ex)
       	{
       		ex.printStackTrace();
       		
       		commonResponse.setStatus("FAILURE");
			commonResponse.setStatus_code(400);
			writer.print(gson.toJson(commonResponse));
			writer.close();
			return;
       	}
	}
	
	@RequestMapping("/generateEmailOtpToVerifyUser")
	public void checkEmailAndTestIdExistOrNot(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		CommonResponse commonResponse = null;
		Gson gson = null;	
		TestUser testUser = null;
		try 
   		{
			commonResponse = new CommonResponse();
    		gson = new Gson();	    		
    		
    		String test_id = request.getParameter("test_id");
    		String user_name = request.getParameter("user_name");
    		String user_email = request.getParameter("user_email");
    		
    		if(test_id == null) {test_id ="";}
    		if(user_name == null) {user_name ="";}
    		if(user_email == null) {user_email ="";}
    		
    		test_id = test_id.trim();
    		user_name = user_name.trim();
    		user_email = user_email.trim();
    		
    		if(Utils.validateEmail(user_email))
			{
    			String v_code = UniqueIDProvider.generateUniquePin(6);
				request.getSession().setAttribute("email_code", v_code);
	    		
	    		sendEmailUtil.sendVerificationCode(user_name, user_email, v_code);		    		
				
    			commonResponse.setStatus("new_user");
    			commonResponse.setMsg("Please verify your email by entering the OTP sent to your email");
    			commonResponse.setStatus_code(200);
    			writer.print(gson.toJson(commonResponse));
    			writer.close();
    			return;
			}    		   		
    		
   		}
		catch(Exception ex)
       	{
       		ex.printStackTrace();
       		
       		commonResponse.setStatus("FAILURE");
			commonResponse.setStatus_code(400);
			writer.print(gson.toJson(commonResponse));
			writer.close();
			return;
       	}
	}
	
	@RequestMapping(value="/verifyEmailOtpAndCreateUser")
	public void verifyEmailOtpAndCreateUser(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		CommonResponse commonResponse = null;
		Gson gson = null;	
		TestUser testUser = null;
		try 
   		{
			commonResponse = new CommonResponse();
    		gson = new Gson();	
    		
    		String test_id = request.getParameter("test_id");
    		String user_name = request.getParameter("user_name");
    		String user_email = request.getParameter("user_email");
    		String user_mobile = request.getParameter("user_mobile");
    		String code = request.getParameter("code");
    		
    		if(test_id == null) {test_id ="";}
    		if(user_name == null) {user_name ="";}
    		if(user_email == null) {user_email ="";}
    		if(user_mobile == null) {user_mobile ="";}
    		if(code == null) {code ="";}
    		
    		test_id = test_id.trim();
    		user_name = user_name.trim();
    		user_email = user_email.trim();
    		user_mobile = user_mobile.trim();
    		code = code.trim();
    		
    		if(request.getSession().getAttribute("email_code") != null	&& request.getSession().getAttribute("email_code").toString().equalsIgnoreCase(code))
			{
    			request.getSession().removeAttribute("email_code");    			
    			
    			testUser = new TestUser();    			
    			testUser.setTest_id("");
    			testUser.setName(user_name);
    			testUser.setEmail(user_email);
    			testUser.setMobile(user_mobile);
    			testUser.setEmail_verified(true);
    			testUser.setCreated_date(new Date());
    			testUser.setActive(true);
    			Boolean result = testMasterDAO.saveOrUpdateTestUser(testUser);
    			
    			if(result) {
        			commonResponse.setStatus("new_user");
        			commonResponse.setStatus_code(200);
        			commonResponse.setUser_type_id(testUser.getUser_id());
        			commonResponse.setMsg("Registration Success.");
        			writer.print(gson.toJson(commonResponse));
        			writer.close();
        			return;
        		} else {
        			commonResponse.setStatus("FAILURE");
        			commonResponse.setStatus_code(400);
        			writer.print(gson.toJson(commonResponse));
        			writer.close();
        			return;
        		}
			}
    		
   		}
		catch(Exception ex)
       	{
       		ex.printStackTrace();
       		
       		commonResponse.setStatus("FAILURE");
			commonResponse.setStatus_code(400);
			writer.print(gson.toJson(commonResponse));
			writer.close();
			return;
       	}
	}
	
	@RequestMapping(value="/saveUserInfoAndSendEmailOtp")
	public void saveUserInfoAndSendEmailOtp(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		CommonResponse commonResponse = null;
		Gson gson = null;	
		TestUser testUser = null;
		try 
   		{
			commonResponse = new CommonResponse();
    		gson = new Gson();	
    		
    		String test_id = request.getParameter("test_id");
    		String user_name = request.getParameter("user_name");
    		String user_email = request.getParameter("user_email");
    		String user_mobile = request.getParameter("user_mobile");
    		
    		if(test_id == null) {test_id ="";}
    		if(user_name == null) {user_name ="";}
    		if(user_email == null) {user_email ="";}
    		if(user_mobile == null) {user_mobile ="";}
    		
    		test_id = test_id.trim();
    		user_name = user_name.trim();
    		user_email = user_email.trim();
    		user_mobile = user_mobile.trim();
    		
    		if(!Utils.validateEmail(user_email)) 
			{
    			commonResponse.setStatus("Please provide a Valid Email");
    			commonResponse.setStatus_code(200);
    			writer.print(gson.toJson(commonResponse));
    			writer.close();
    			return;
			}
    		
    		if(Utils.validateEmail(user_email))
			{
    			testUser = testMasterDAO.checkIfEmailAlreadyExist(user_email);
			}
    		
    		if(testUser != null) {
    			commonResponse.setStatus("old_user");
    			commonResponse.setMsg("Account Already Verified, Start a Test");
    			commonResponse.setStatus_code(200);
    			writer.print(gson.toJson(commonResponse));
    			writer.close();
    			return;	
			}else {
				
				String v_code = UniqueIDProvider.generateUniquePin(6);
				request.getSession().setAttribute("email_code", v_code);
	    		
	    		sendEmailUtil.sendVerificationCode(user_name, user_email, v_code);
	    		
				testUser = new TestUser();
    			testUser.setName(user_name);
    			testUser.setEmail(user_email);
    			testUser.setMobile(user_mobile);
    			testUser.setEmail_verified(false);
    			testUser.setCreated_date(new Date());
    			testUser.setActive(true);
    			Boolean result = testMasterDAO.saveOrUpdateTestUser(testUser);
    			
    			if(result) {
        			commonResponse.setStatus("new_user");
        			commonResponse.setMsg("Email Verification Code sent, Please Verify");
        			commonResponse.setStatus_code(200);
        			writer.print(gson.toJson(commonResponse));
        			writer.close();
        			return;
        		} else {
        			commonResponse.setStatus("FAILURE");
        			commonResponse.setStatus_code(400);
        			writer.print(gson.toJson(commonResponse));
        			writer.close();
        			return;
        		}
			}
   		}
		catch(Exception ex)
       	{
       		ex.printStackTrace();
       		
       		commonResponse.setStatus("FAILURE");
			commonResponse.setStatus_code(400);
			writer.print(gson.toJson(commonResponse));
			writer.close();
			return;
       	}
	}
	
	@RequestMapping(value="/addAnswer")
	public void addAnswer(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		CommonResponse commonResponse = null;
		Gson gson = null;
		TestUser testUser = null;
		TestAnswer testAnswer = null;
		try 
   		{
			commonResponse = new CommonResponse();
    		gson = new Gson();	
    		
    		String test_id = request.getParameter("test_id");
    		String user_id = request.getParameter("user_id");
    		String question_id = request.getParameter("question_id");
    		String correct_answer = request.getParameter("correct_answer");
    		String question_type = request.getParameter("question_type");
    		
    		if(user_id == null) {user_id ="";}
    		if(question_id == null) {question_id ="";}
    		if(correct_answer == null) {correct_answer ="";}
    		if(question_type == null) {question_type ="";}
    		
    		user_id = user_id.trim();
    		question_id = question_id.trim();
    		correct_answer = correct_answer.trim();
    		question_type = question_type.trim();
    		
    		System.out.println("user_id = " + user_id);
    		
    		if(!user_id.isEmpty())
    		{
    			testUser = testMasterDAO.getTestUserById(Integer.parseInt(user_id));
    		}
    		
    		String test_user_name = "";
    		String test_ids ="";
    		
    		if(testUser != null) 
    		{
    			test_user_name = testUser.getName();
    			test_ids = testUser.getTest_id();
    		}
    		
    		if(!test_id.isEmpty() && !question_id.isEmpty() && !user_id.isEmpty()) 
    		{
    			testAnswer = testMasterDAO.checkAnswerIsOrNot(Integer.parseInt(test_id),Integer.parseInt(question_id),Integer.parseInt(user_id));
    		}
    		
    		TestQuestion testQuestion = null;
    		
    		if(!question_id.isEmpty()) {
    			testQuestion = testMasterDAO.getQuestionById(Integer.parseInt(question_id));
    		}
    		
    		String audio_file_name = test_id + test_user_name + user_id+"_"+question_id;
    		String audio_path = properties.getAudioDir() + "/" +audio_file_name+ ".mp3";
    		String audio_url = properties.getHostDomainUrl() + "resources/test-audio/" +audio_file_name+ ".mp3";
    		String updtest_ids = "";
    		
    		if(testAnswer == null) 
    		{
    			testAnswer = new TestAnswer();
    			testAnswer.setTest_id(Integer.parseInt(test_id));
    			testAnswer.setQuestion_id(Integer.parseInt(question_id));
    			testAnswer.setUser_id(Integer.parseInt(user_id));
    			testAnswer.setUser_name(test_user_name);
    			testAnswer.setQuestion_type(question_type);
    			
    			if(question_type.equalsIgnoreCase("voice"))
    			{
    				Decoder decoder = Base64.getDecoder();
    				byte[] decodedByte = decoder.decode(correct_answer.split(",")[1]);
    				FileOutputStream fos = new FileOutputStream(audio_path);
    				testAnswer.setCorrect_answer(audio_url);
    				fos.write(decodedByte);
    				fos.close();
    			}else {
    				testAnswer.setCorrect_answer(correct_answer);
    			}
    			
    			
    			System.out.println("question_type = " + question_type);
    			
    			if(question_type.equalsIgnoreCase("mcq")) {
    				
    				if(testQuestion != null) 
    				{
    					System.out.println("testQuestion = " + testQuestion.getCorrect_answer());
    					System.out.println("correct_answer = " + correct_answer);
    					
    					if(testQuestion.getCorrect_answer().equalsIgnoreCase(correct_answer)) {
    						testAnswer.setCorrect_or_not(true);
    					}else {
    						testAnswer.setCorrect_or_not(false);
    					}
    				}
    			}else {
    				testAnswer.setCorrect_or_not(false);
    			}
    			
    			testAnswer.setDate_answered(new Date());
    			testAnswer.setActive(true);
    			
    			Boolean result = testMasterDAO.saveOrUpdateAnswer(testAnswer);
    			
    			if(result)
    			{    		
    				List<String> list = Arrays.asList(test_ids.split(","));
    				
	    			if (list.contains(test_id)) 
	    			{
	    				commonResponse.setUser_type_id(testUser.getUser_id());
	    				commonResponse.setMsg("Answer Added Successfully");
	    				commonResponse.setStatus_code(200);
	        			writer.print(gson.toJson(commonResponse));
	        			writer.close();
	        			return;
	    			}else{
	    				if(!test_ids.isEmpty())
	    				{
	    					updtest_ids = test_ids +","+ test_id;
	    				}else
	    				{
	    					updtest_ids = test_id;
	    				}
    				
	    				if (!user_id.isEmpty()) 
    					{	   	  
	    					testUser = testMasterDAO.getUserById(Integer.parseInt(user_id));	
	    	    			testUser.setTest_id(updtest_ids);
	    	    			testMasterDAO.saveOrUpdateTestUser(testUser);	
    					}    				    				
		    			commonResponse.setStatus("Success");
		    			commonResponse.setUser_type_id(testUser.getUser_id());
		    			commonResponse.setMsg("Answer Added Successfully");
		    			commonResponse.setStatus_code(200);
		    			writer.print(gson.toJson(commonResponse));
		    			writer.close();
		    			return;
	    			}
	    		}
    			else 
    			{
	    			commonResponse.setStatus("FAILURE");
	    			commonResponse.setStatus_code(400);
	    			writer.print(gson.toJson(commonResponse));
	    			writer.close();
	    			return;
	    		}
	    			
    		}else {
    			testAnswer.setTest_id(Integer.parseInt(test_id));
    			testAnswer.setQuestion_id(Integer.parseInt(question_id));
    			testAnswer.setUser_id(Integer.parseInt(user_id));
    			testAnswer.setUser_name(test_user_name);
    			testAnswer.setQuestion_type(question_type);
    			if(question_type.equalsIgnoreCase("voice")) 
    			{
    				Decoder decoder = Base64.getDecoder();
    				byte[] decodedByte = decoder.decode(correct_answer.split(",")[1]);
    				FileOutputStream fos = new FileOutputStream(audio_path);
    				testAnswer.setCorrect_answer(audio_url);
    				fos.write(decodedByte);
    				fos.close();
    			}else {
    				testAnswer.setCorrect_answer(correct_answer);
    			}
    			
    			System.out.println("question_type = " + question_type);
    			
    			
    			if(question_type.equalsIgnoreCase("mcq")) {
    				
    				System.out.println("testQuestion = " + testQuestion.getCorrect_answer());
					System.out.println("correct_answer = " + correct_answer);
    				
    				if(testQuestion != null) {
    					if(testQuestion.getCorrect_answer().equalsIgnoreCase(correct_answer)) {
    						testAnswer.setCorrect_or_not(true);
    					}else {
    						testAnswer.setCorrect_or_not(false);
    					}
    				}
    			}else {
    				testAnswer.setCorrect_or_not(false);
    			}
    			
    			testAnswer.setDate_answered(new Date());
    			testAnswer.setActive(true);
    			
    			Boolean result = testMasterDAO.saveOrUpdateAnswer(testAnswer);
    			
    			if(result)
    			{    				
	    			List<String> list = Arrays.asList(test_ids.split(","));
	    			
	    			if (list.contains(test_id)) 
	    			{
	    				commonResponse.setStatus("test_taken");
	    				commonResponse.setStatus_code(400);
	    				commonResponse.setUser_type_id(testUser.getUser_id());
	    				commonResponse.setMsg("Answer Added Successfully");
	    				commonResponse.setStatus_code(200);
	        			writer.print(gson.toJson(commonResponse));
	        			writer.close();
	        			return;
	    			}else{
	    				if(!test_ids.isEmpty())
	    				{
	    					updtest_ids = test_ids +","+ test_id;
	    				}else
	    				{
	    					updtest_ids = test_id;
	    				}
    				
	    				if (!user_id.isEmpty()) 
    					{	   	  
	    					testUser = testMasterDAO.getUserById(Integer.parseInt(user_id));	
	    	    			testUser.setTest_id(updtest_ids);
	    	    			testMasterDAO.saveOrUpdateTestUser(testUser);	
    					}    				    				
		    			commonResponse.setStatus("Success");
		    			commonResponse.setUser_type_id(testUser.getUser_id());
		    			commonResponse.setMsg("Answer Added Successfully");
		    			commonResponse.setStatus_code(200);
		    			writer.print(gson.toJson(commonResponse));
		    			writer.close();
		    			return;
	    			}
    			}
    		}
    		
   		}
		catch(Exception ex)
       	{
       		ex.printStackTrace();
       		
       		commonResponse.setStatus("FAILURE");
			commonResponse.setStatus_code(400);
			writer.print(gson.toJson(commonResponse));
			writer.close();
			return;
       	}
	}
	
	@RequestMapping("/checkTestUserIsOrNot")
	public void checkTestUserIsOrNot(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		CommonResponse commonResponse = null;
		Gson gson = null;	
		TestUser testUser = null;
		try 
   		{
			commonResponse = new CommonResponse();
    		gson = new Gson();	    		
    		
    		String test_id = request.getParameter("test_id");
    		String user_name = request.getParameter("user_name");
    		String user_email = request.getParameter("user_email");
    		
    		if(test_id == null) {test_id ="";}
    		if(user_name == null) {user_name ="";}
    		if(user_email == null) {user_email ="";}
    		
    		test_id = test_id.trim();
    		user_name = user_name.trim();
    		user_email = user_email.trim();
    		 		   		
    		if(Utils.validateEmail(user_email))
    		{
    			testUser = testMasterDAO.checkIfEmailAlreadyExist(user_email);
    		}
    		
    		if(testUser == null) {
    			commonResponse.setStatus("Success");
				commonResponse.setStatus_code(200);
				commonResponse.setMsg("Please Take a Test");;
    			writer.print(gson.toJson(commonResponse));
    			writer.close();
    			return;
    		}else {
    			commonResponse.setStatus("test_taken");
				commonResponse.setStatus_code(400);
				commonResponse.setMsg("Already Taken the Test");;
    			writer.print(gson.toJson(commonResponse));
    			writer.close();
    			return;
    		}
    		
   		}
		catch(Exception ex)
       	{
       		ex.printStackTrace();
       		
       		commonResponse.setStatus("FAILURE");
			commonResponse.setStatus_code(400);
			writer.print(gson.toJson(commonResponse));
			writer.close();
			return;
       	}
	}

	@RequestMapping(value="/testUserDownloadXL")
	public void testUserDownloadXL(HttpServletRequest request, HttpServletResponse response) throws Exception 
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
			
			String test_id = request.getParameter("id");
			
			if(test_id ==  null) {test_id = "";}
			
			test_id = test_id.trim();
			
			List<TestUser> testUser = null;
			
			if(test_id != "") {
				testUser = testMasterDAO.getUserByTestId(test_id);
			}
			
			response.setContentType("application/vnd.ms-excel");
			response.setHeader("Content-Disposition", "attachment;filename=Teksands-Test-Users.xlsx");
			
			Workbook wb = new Workbook(response.getOutputStream(), "MyApplication", "1.0");
			Worksheet ws = wb.newWorksheet("Teksands Test Users List");
			
			SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
									
			ws.value(0, 0, "Teksands Test Users List");
			ws.range(0, 0, 0, 5).merge();
			ws.range(0, 0, 0, 5).style().horizontalAlignment("center").set();
			ws.style(0, 0).bold().fontSize(11).set(); 

			int i = 1;
			int j = 0;
			for(j = 0; j <= 46; j++) {
				ws.style(i, j).bold().fontSize(9).borderStyle("bold").borderColor("0f76bd").wrapText(true).set();	
			}
			
			ws.value(i, 0, "Id");
	        ws.value(i, 1, "Name");
		    ws.value(i, 2, "Email");
		    ws.value(i, 3, "Mobile");
		    ws.value(i++, 4, "Test Date");
		    
	 		for(TestUser user : testUser)
	 		{
	 			ws.value(i, 0, user.getTest_id());
				ws.style(i, 0).fontSize(9).wrapText(true).set();
				
				ws.value(i, 1, user.getName());
				ws.style(i, 1).fontSize(9).wrapText(true).set();

				ws.value(i, 2, user.getEmail());
				ws.style(i, 2).fontSize(9).wrapText(true).set();
				
				ws.value(i, 3, user.getMobile());
				ws.style(i, 3).fontSize(9).wrapText(true).set();
				
				ws.value(i, 4, sdf.format(user.getCreated_date()));
				ws.style(i++, 4).fontSize(9).wrapText(true).set();
				
	 		}
	 		wb.finish();

	 		Log log = new Log();
	 		log.setUser_id(Integer.parseInt(user_id));
	 		log.setUser_name(user_name);
	 		log.setTitle("Test User Excel Downloaded");
	 		log.setDescription(user_name + " was Downloaded the Test User List");
	 		log.setActivity_time(new Date());
	 		String ipAddr = Utils.getIpAddr(request);
			if(ipAddr == null){ipAddr="";}
	 		log.setIp_addr(ipAddr);
	 		logDAO.saveLog(log);
		} 
		else {
			
			response.sendRedirect("/home");
			}
		}
 		catch(Exception ex)
		{
			ex.printStackTrace();
		}
	}
	
	@RequestMapping(value="/deleteTestById")
	public void deleteTestById(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		CommonResponse commonResponse = null;
		Gson gson = null;	
		try 
   		{
			commonResponse = new CommonResponse();
    		gson = new Gson();	
    		
    		String test_id = request.getParameter("test_id");
    		
    		if(test_id == null) {test_id ="";}
    		
    		test_id = test_id.trim();
    		
    		Boolean result =  false;
    		
    		if(!test_id.isEmpty()) {
    			result = testMasterDAO.deleteTestById(Integer.parseInt(test_id));
    		}
    		
    		if(result) {
    			commonResponse.setMsg("Test Deleted successfully");;
    			commonResponse.setStatus_code(200);
    			writer.print(gson.toJson(commonResponse));
    			writer.close();
    			return;
    		} else {
    			commonResponse.setMsg("FAILURE!, Please try again");;
    			commonResponse.setStatus_code(400);
    			writer.print(gson.toJson(commonResponse));
    			writer.close();
    			return;
    		}
   		}
		catch(Exception ex)
       	{
       		ex.printStackTrace();
       		
       		commonResponse.setStatus("FAILURE");
			commonResponse.setStatus_code(400);
			writer.print(gson.toJson(commonResponse));
			writer.close();
			return;
       	}
	}
	
	@RequestMapping(value="/uploadPhotoImageBase64")
	public void uploadPhotoImageBase64(HttpServletRequest request, HttpServletResponse response) throws IOException 
	{
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		CommonResponse commonResponse = new CommonResponse();
		Gson gson = new Gson();
		TestUser testUser = null;	
		try 
		{
			String user_id = request.getParameter("user_id");
			String user_name = request.getParameter("user_name");
			String base64image = request.getParameter("base64image");
			
			if(user_id == null) {user_id = "";}
				
			String fileName = user_id+"_"+user_name;
			String root_path = properties.getUserProfilePicDir();
			
			byte[] decodedImg = Base64.getDecoder().decode(base64image.getBytes(StandardCharsets.UTF_8));
			Path destinationFile = Paths.get(root_path, fileName+".jpeg");
			Files.write(destinationFile, decodedImg);	
			
			String imagePath = properties.getHostDomainUrl()+"resources/images/profile-images/"+ fileName +".jpeg";
			
			if(!user_id.isEmpty()) {
				testUser = testMasterDAO.getUserById(Integer.parseInt(user_id));
			}
			
			if(testUser != null) {
				testUser.setProfile_picture(imagePath);
				testMasterDAO.saveOrUpdateTestUser(testUser);
				
				commonResponse.setMsg("Image Uploaded Successfully");;
    			commonResponse.setStatus_code(200);
    			writer.print(gson.toJson(commonResponse));
    			writer.close();
    			return;
			}else {
				commonResponse.setMsg("File Upload Failure, Please try again");;
				commonResponse.setStatus_code(400);
				writer.print(gson.toJson(commonResponse));
				writer.close();
				return;
			}
		} 
		catch (Exception ex) 
		{
			ex.printStackTrace();
			commonResponse.setMsg("FAILURE!, File Upload Failure, Please try again");;
			commonResponse.setStatus_code(400);
			writer.print(gson.toJson(commonResponse));
			writer.close();
			return;
		}    
	}
	
	@RequestMapping(value="/uploadPhotoImage")
	public void uploadPhotoImage(HttpServletRequest request, HttpServletResponse response) throws IOException 
	{
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		CommonResponse commonResponse = new CommonResponse();
		Gson gson = new Gson();
		
		TestUser testUser = null;			
				
		try 
		{
			boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		    DiskFileItemFactory factory = new DiskFileItemFactory();
		    ServletFileUpload upload = new ServletFileUpload(factory);
	        try
	        { 
	           List fileItems = upload.parseRequest(request);
	      	   String user_id = request.getParameter("user_id");
	           Iterator i = fileItems.iterator();
	           while ( i.hasNext () ) 
	           {
	              FileItem fi = (FileItem)i.next();
	              if (!fi.isFormField())	
	              {
	            	 String file_name_original = fi.getName();
	            	 String extension = file_name_original.substring(file_name_original.lastIndexOf(".") + 1, file_name_original.length());
	            	 
	            	 if(extension.equalsIgnoreCase("JPEG") || extension.equalsIgnoreCase("JPG") || extension.equalsIgnoreCase("PNG"))
	            	 {	
	            		
	            	 }else {
	            		commonResponse.setStatus_code(400);
	     				commonResponse.setMsg("Please upload an image file with extensions .png, .jpg, etc");	
		     	    	writer.print(gson.toJson(commonResponse));
		     	    	writer.close();
		     	    	return;	
	            	 }
	            	 
	                 boolean isfileSizeCorrect = ViewHelper.checkFileSize(fileItems, 2);
	                 
					 if (!isfileSizeCorrect) 
					 {	
	     	    	   commonResponse.setStatus_code(400);
	     	    	   commonResponse.setMsg("Please upload an image below the size limit of 2 mb");	
	     	    	   writer.print(gson.toJson(commonResponse));
	     	    	   writer.close();
	     	    	   return;
					 }				
	            	 
	            	 if(!user_id.isEmpty()) { 
						  testUser =  testMasterDAO.getUserById(Integer.parseInt(user_id)); 
					 }	
	            	 
	            	 if(testUser != null) 
	            	 {	            		 
		            	 String fileName = user_id+"_" + testUser.getName() + "."+extension;
		            	 String root_path = properties.getUserProfilePicDir();
		        		 String imgFile = ViewHelper.createFile(fi, root_path, fileName);
		        		 String imagePath = properties.getHostDomainUrl()+"resources/images/profile-images/"+ fileName;
		        		 
		        		 testUser.setProfile_picture(imagePath);
						 testMasterDAO.saveOrUpdateTestUser(testUser);	
							
		      		     commonResponse.setStatus_code(StatusMessage.SuccessCode);
		     	    	 commonResponse.setStatus(StatusMessage.SuccessMessage);
		     	    	 commonResponse.setMsg(fileName);	
		     	    	 writer.print(gson.toJson(commonResponse));
		     	    	 writer.close();
		     	    	 return;
	            	 }
	              }
	           }	           
	        }
	        catch(Exception ex)
	        {
				ex.printStackTrace();
				   commonResponse.setStatus_code(StatusMessage.FailureCode);
		    	   commonResponse.setStatus(StatusMessage.FailureMessage);
		    	   commonResponse.setMsg("File Upload Failure");	
		    	   writer.print(gson.toJson(commonResponse));
		    	   writer.close();
		    	   return;
	        }
		} 
		catch (Exception ex) 
		{
			ex.printStackTrace();
			   commonResponse.setStatus_code(StatusMessage.FailureCode);
	    	   commonResponse.setStatus(StatusMessage.FailureMessage);
	    	   commonResponse.setMsg("File Upload Failure");	
	    	   writer.print(gson.toJson(commonResponse));
	    	   writer.close();
	    	   return;
		}
	
	}
	
	@RequestMapping(value="/getAnswerById")
	public void getAnswerById(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		CommonResponse commonResponse = null;
		Gson gson = null;	
		try 
   		{
			commonResponse = new CommonResponse();
    		gson = new Gson();	
    		
    		String answer_id = request.getParameter("answer_id");
    		
    		Integer question_id = null;
    		TestAnswer testAnswer = null;
    		TestQuestion testQuestion = null;
    		
    		testAnswer = testMasterDAO.getAnswerById(Integer.parseInt(answer_id));
    		
    		if(testAnswer != null) {
    			question_id = testAnswer.getQuestion_id();	
    		}
    		
    		if(question_id != null) {
    			testQuestion = testMasterDAO.getQuestionById(question_id);
    		}
    	    
    		if(testAnswer != null) {
    			commonResponse.setStatus(testQuestion.getQuestion());
    			commonResponse.setMsg(testAnswer.getCorrect_answer());
    			writer.print(gson.toJson(commonResponse));
    			writer.close();
    			return;
    		} else {
    			commonResponse.setStatus("FAILURE");
    			commonResponse.setStatus_code(400);
    			writer.print(gson.toJson(commonResponse));
    			writer.close();
    			return;
    		}
   		}
		catch(Exception ex)
       	{
       		ex.printStackTrace();
       		
       		commonResponse.setStatus("FAILURE");
			commonResponse.setStatus_code(400);
			writer.print(gson.toJson(commonResponse));
			writer.close();
			return;
       	}
	}
	
	@RequestMapping(value="/bulkUploadTestQuestionsById")
	public void bulkUploadTestQuestionsById(HttpServletRequest request, HttpServletResponse response) throws IOException 
	{
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		CommonResponse commonResponse = null;
		Gson gson = null;

        String appPath = request.getServletContext().getRealPath("");
        String savePath = appPath + File.separator + SAVE_DIR;
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
				
				String test_id = request.getParameter("test_id");
				
				if(test_id == null) {test_id = "";}
				
				test_id = test_id.trim();
				
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
    	                 
    	                 status = testMasterDAO.bulkUploadTestQuestionsById(file, Integer.parseInt(test_id));
    	                 
    	                 if(status)
    	                 {
    	                	Log log = new Log();
    	 			 		log.setUser_id(Integer.parseInt(user_id));
    	 			 		log.setUser_name(user_name);
    	 			 		log.setTitle("Bulk Test Results Added");
    	 			 		log.setDescription(user_name+" has uploaded the questions list");
    	 			 		log.setActivity_time(new Date());
    	 			 		String ipAddr = Utils.getIpAddr(request);
    	 					if(ipAddr == null){ipAddr="";}
    	 			 		log.setIp_addr(ipAddr);
    	 			 		logDAO.saveLog(log);
    	                	 
    	                	commonResponse.setStatus("SUCCESS");
    	 					commonResponse.setStatus_code(200);
    	 					commonResponse.setMsg("Questions areare Updated Successfully");
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
	
	@RequestMapping(value="/addCommentByUserId")
	public void addCommentByUserId(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		CommonResponse commonResponse = null;
		Gson gson = null;
		TestUser testUser = null;
		try 
   		{
			commonResponse = new CommonResponse();
    		gson = new Gson();	
    		
    		String user_id = request.getParameter("user_id");
    		String test_id = request.getParameter("test_id");
    		String user_test_comment = request.getParameter("user_test_comment");
    		
    		if(user_id == null) {user_id = "";}
    		if(test_id == null) {test_id = "";}
    		if(user_test_comment == null) {user_test_comment = "";}
    		
    		user_id = user_id.trim();
    		test_id = test_id.trim();
    		user_test_comment = user_test_comment.trim();
    		
    		if(user_id.isEmpty()) {
    			commonResponse.setStatus("FAILURE");
    			commonResponse.setStatus_code(400);
    			commonResponse.setMsg("Something Went wrong, please try again");;
    			writer.print(gson.toJson(commonResponse));
    			writer.close();
    			return;
    		}
    		
    		if(test_id.isEmpty()) {
    			commonResponse.setStatus("FAILURE");
    			commonResponse.setStatus_code(400);
    			commonResponse.setMsg("Something Went wrong, please try again");;
    			writer.print(gson.toJson(commonResponse));
    			writer.close();
    			return;
    		}
    		
    		if(!user_id.isEmpty()) {
    			testUser = testMasterDAO.getUserById(Integer.parseInt(user_id));
    		}
    		
    		if(!user_id.isEmpty() && !test_id.isEmpty()) {
    			
    			TestComment testComment = null;
    			Boolean isFirstTimeComment = false;
    			
    			testComment = testMasterDAO.getCommentByTestIdAndUserId(Integer.parseInt(test_id),Integer.parseInt(user_id));
    			
    			if(testComment == null) {
    				testComment = new TestComment();
    				isFirstTimeComment = true;
    				
    				testComment.setUser_id(Integer.parseInt(user_id));
        			testComment.setTest_id(Integer.parseInt(test_id));
        			testComment.setUser_name(testUser.getName());
        			testComment.setComment(user_test_comment);
        			testComment.setMark("");
        			testComment.setCreated_date(new Date());
        			testComment.setResult(false);
        			testComment.setActive(true);
    			}else {
    				testComment.setUser_id(Integer.parseInt(user_id));
        			testComment.setTest_id(Integer.parseInt(test_id));
        			testComment.setUser_name(testUser.getName());
        			testComment.setComment(user_test_comment);
        			testComment.setMark("");
        			testComment.setCreated_date(new Date());
        			if(testComment.getResult().equals(true)) {
        				testComment.setResult(true);
        			}else {
        				testComment.setResult(false);
        			}
        			testComment.setActive(true);
    			}
    			
    			testMasterDAO.saveOrUpdateTestComment(testComment);
    			
    			if(isFirstTimeComment) {
    				commonResponse.setStatus_code(200);;
    				commonResponse.setStatus("Success");
        			commonResponse.setMsg("User Comment Added Successfully");
        			writer.print(gson.toJson(commonResponse));
        			writer.close();
        			return;
    			}else {
    				commonResponse.setStatus_code(200);;
    				commonResponse.setStatus("Success");
        			commonResponse.setMsg("User Comment Updated Successfully");
        			writer.print(gson.toJson(commonResponse));
        			writer.close();
        			return;
    			}
    			
    		}else {
    			commonResponse.setStatus("FAILURE");
    			commonResponse.setStatus_code(400);
    			commonResponse.setMsg("Something went wrong please try again");;
    			writer.print(gson.toJson(commonResponse));
    			writer.close();
    			return;
    		}
   		}
		catch(Exception ex)
       	{
       		ex.printStackTrace();
       		
       		commonResponse.setStatus("FAILURE");
			commonResponse.setStatus_code(400);
			writer.print(gson.toJson(commonResponse));
			writer.close();
			return;
       	}
	}
	
	@RequestMapping(value="/passUserTestByUserIdAndTestId")
	public void passUserTestByUserIdAndTestId(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		CommonResponse commonResponse = null;
		Gson gson = null;
		TestUser testUser = null;
		try 
   		{
			commonResponse = new CommonResponse();
    		gson = new Gson();	
    		
    		String user_id = request.getParameter("user_id");
    		String test_id = request.getParameter("test_id");
    		String result = request.getParameter("result");
    		
    		if(user_id == null) {user_id = "";}
    		if(test_id == null) {test_id = "";}
    		if(result == null) {result = "";}
    		
    		user_id = user_id.trim();
    		test_id = test_id.trim();
    		result = result.trim();
    		
    		if(user_id.isEmpty()) {
    			commonResponse.setStatus("FAILURE");
    			commonResponse.setStatus_code(400);
    			commonResponse.setMsg("Something Went wrong, please try again");;
    			writer.print(gson.toJson(commonResponse));
    			writer.close();
    			return;
    		}
    		
    		if(test_id.isEmpty()) {
    			commonResponse.setStatus("FAILURE");
    			commonResponse.setStatus_code(400);
    			commonResponse.setMsg("Something Went wrong, please try again");;
    			writer.print(gson.toJson(commonResponse));
    			writer.close();
    			return;
    		}
    		
    		if(!user_id.isEmpty()) {
    			testUser = testMasterDAO.getUserById(Integer.parseInt(user_id));
    		}
    		
    		if(!user_id.isEmpty() && !test_id.isEmpty()) {
    			
    			TestComment testComment = null;
    			
    			testComment = testMasterDAO.getCommentByTestIdAndUserId(Integer.parseInt(test_id),Integer.parseInt(user_id));
    			
    			
    			if(testComment == null) {
    				testComment  = new TestComment();
    				testComment.setTest_id(Integer.parseInt(test_id));
    				testComment.setUser_id(Integer.parseInt(user_id));
    				testComment.setUser_name(testUser.getName());
    				testComment.setComment("");
    				testComment.setMark("");
    				if(result.equalsIgnoreCase("true")) {
        				testComment.setResult(true);
        			}else {
        				testComment.setResult(false);
        			}
    				testComment.setCreated_date(new Date());
    				testComment.setActive(true);
    				
    			}else {
    				if(result.equalsIgnoreCase("true")) {
        				testComment.setResult(true);
        			}else {
        				testComment.setResult(false);
        			}
    			}
    			
    			testMasterDAO.saveOrUpdateTestComment(testComment);
    			
    			commonResponse.setStatus_code(200);;
				commonResponse.setStatus("Success");
    			commonResponse.setMsg("User Comment Added Successfully");
    			writer.print(gson.toJson(commonResponse));
    			writer.close();
    			return;
    			
    		}else {
    			commonResponse.setStatus("FAILURE");
    			commonResponse.setStatus_code(400);
    			commonResponse.setMsg("Something went wrong please try again");;
    			writer.print(gson.toJson(commonResponse));
    			writer.close();
    			return;
    		}
   		}
		catch(Exception ex)
       	{
       		ex.printStackTrace();
       		
       		commonResponse.setStatus("FAILURE");
			commonResponse.setStatus_code(400);
			writer.print(gson.toJson(commonResponse));
			writer.close();
			return;
       	}
	}
	
	@RequestMapping(value="/downloadUserAnswerByUserIdAndTestId")
	public void downloadUserAnswerByUserIdAndTestId(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		HashMap<String, String> accountMap = null;
		try 
		{
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			if(accountMap != null && (accountMap.get("user_id").equalsIgnoreCase(Utils.adminId.toString()))) {
				
			String user_id = request.getParameter("user_id");
    		String test_id = request.getParameter("test_id");
    		
    		if(user_id == null) {user_id = "";}
    		if(test_id == null) {test_id = "";}
    		
    		user_id = user_id.trim();
    		test_id = test_id.trim();
    		
    		Test test = testMasterDAO.getTestById(Integer.parseInt(test_id));
    		TestUser testUser = testMasterDAO.getUserById(Integer.parseInt(user_id));
    		TestComment testComment = testMasterDAO.getCommentByTestIdAndUserId(Integer.parseInt(test_id),Integer.parseInt(user_id));
    		List<Object[]> testanswerList = testMasterDAO.getAnswerByTestUserId(Integer.parseInt(test_id),Integer.parseInt(user_id));
    		
    		List<TestQuestion> mcqQuestionList = testMasterDAO.getMCQTestQuestionByTestId(Integer.parseInt(test_id));
    		List<TestAnswer> mcqAnswerList = testMasterDAO.getMCQTestAnswersByTestIdAndUserId(Integer.parseInt(test_id),Integer.parseInt(user_id));
    		
    		Integer total = 0;
    		
    		if(mcqQuestionList != null) {
    			total = mcqQuestionList.size();
    		}
    		Integer correct = 0;
    		Integer wrong = 0;
    		
    		for (TestAnswer testAnswer : mcqAnswerList) {
				
    			Integer questionId = testAnswer.getQuestion_id();
    			String user_answer = testAnswer.getCorrect_answer();
    			
    			TestQuestion testQuestion = testMasterDAO.getQuestionsById(questionId);
    			
    			if(testQuestion.getCorrect_answer().equalsIgnoreCase(user_answer)) {
    				correct = correct+1;
    			}else {
    				wrong = wrong+1;
    			}
			}
    		
    		Integer percetage = 0;
    		
    		if(!total.equals(0)) {
    			percetage = (correct*100)/total;
    		}
    		
    		if(testComment ==  null) {
    			testComment = new TestComment();
    			testComment.setTest_id(Integer.parseInt(test_id));
    			testComment.setUser_id(Integer.parseInt(user_id));
    			testComment.setUser_name(testUser.getName());
    			testComment.setComment("");
    			testComment.setResult(false);
    			testComment.setMark(percetage.toString());
    			testComment.setCreated_date(new Date());
    			testComment.setActive(true);
    		}else {
    			testComment.setMark(percetage.toString());
    		}
    	    
    		testMasterDAO.saveOrUpdateTestComment(testComment);
    		
    		String testPass = "";
    		
    		if(testComment.getResult().equals(true)) {
    			testPass = "Pass";
    		}else {
    			testPass = "Not Added";
    		}
			
			response.setContentType("application/vnd.ms-excel");
			response.setHeader("Content-Disposition", "attachment;filename=Teksands-Test-Answer.xlsx");
			
			Workbook wb = new Workbook(response.getOutputStream(), "MyApplication", "1.0");
			Worksheet ws = wb.newWorksheet("Teksands Test Users Answer");
			
			SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
									
			ws.value(0, 0, "Teksands Test Users Answer");
			ws.range(0, 0, 0, 3).merge();
			ws.range(0, 0, 0, 0).style().set();
			ws.style(0, 0).bold().fontSize(11).set();
			
			ws.value(1, 0, "Name :");
			ws.style(1, 0).bold().fontSize(11).fontColor("2262c6").set();
			
			ws.value(1, 1, testUser.getName());
			ws.style(1, 1).bold().fontSize(11).set();
			
			ws.value(2, 0, "Email :");
			ws.style(2, 0).bold().fontSize(11).fontColor("2262c6").set();
			
			ws.value(2, 1, testUser.getEmail());
			ws.style(2, 1).bold().fontSize(11).set();
			
			ws.value(3, 0, "Mobile :");
			ws.style(3, 0).bold().fontSize(11).fontColor("2262c6").set();
			
			ws.value(3, 1, testUser.getMobile());
			ws.style(3, 1).bold().fontSize(11).set();
			
			ws.value(4, 0, "Pass: ");
			ws.style(4, 0).bold().fontSize(11).fontColor("2262c6").set();
			
			ws.value(4, 1, testPass);
			ws.style(4, 1).bold().fontSize(11).set();
			
			ws.value(5, 0, "Test Title: ");
			ws.style(5, 0).bold().fontSize(11).fontColor("2262c6").set();
			
			ws.value(5, 1, test.getTest_name());
			ws.style(5, 1).bold().fontSize(11).set();
			
			ws.value(6, 0, "Comment: ");
			ws.style(6, 0).bold().fontSize(11).fontColor("2262c6").set();
			
			ws.value(6, 1, testComment.getComment());
			ws.style(6, 1).bold().fontSize(11).set();
			
			ws.value(7, 0, "Mark (%): ");
			ws.style(7, 0).bold().fontSize(11).fontColor("2262c6").set();
			
			ws.value(7, 1, percetage+"%");
			ws.style(7, 1).bold().fontSize(11).set();
			
			int i = 8;
			int j = 0;
			for(j = 0; j <= 46; j++) {
				ws.style(i, j).bold().fontSize(9).borderStyle("bold").borderColor("0f76bd").wrapText(true).fontColor("2262c6").set();	
			}
			
			ws.value(i, 0, "Question");
			ws.value(i, 1, "Question Type");
	        ws.value(i, 2, "Answer");
		    ws.value(i++, 3, "Correct Answer");
		    
		    for (Object[] objects : testanswerList) 
			{
				String question_type = String.valueOf(objects[2]);
				String question = String.valueOf(objects[4]);
				String user_answer = String.valueOf(objects[5]);
				String correct_answer = String.valueOf(objects[6]);
				
				ws.value(i, 0, question);
				ws.style(i, 0).fontSize(9).wrapText(true).set();
				
				ws.value(i, 1, question_type);
				ws.style(i, 1).fontSize(9).wrapText(true).set();
				
				ws.value(i, 2, user_answer);
				ws.style(i, 2).fontSize(9).wrapText(true).set();
				
				if(question_type.equalsIgnoreCase("mcq")) {
					ws.value(i, 3, correct_answer);
					ws.style(i++, 3).fontSize(9).wrapText(true).set();
				}else {
					ws.value(i, 3, "");
					ws.style(i++, 3).fontSize(9).wrapText(true).set();
				}
			}
		    
	 		wb.finish();

		} 
		else {
			
			response.sendRedirect("/home");
			}
		}
 		catch(Exception ex)
		{
			ex.printStackTrace();
		}
	}
	
	@RequestMapping(value="/downloadXLAllTestUsersAnswerByTestId")
	public void newTestUserDownloadXL(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		HashMap<String, String> accountMap = null;
		try 
		{
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			if(accountMap != null && (accountMap.get("user_id").equalsIgnoreCase(Utils.adminId.toString()))) 
			{
				String test_id = request.getParameter("test_id");
				
				if(test_id ==  null) {test_id = "";}
				
				test_id = test_id.trim();
				
				System.out.println("test_id = " + test_id);
				
				Test test = testMasterDAO.getTestById(Integer.parseInt(test_id));
				List<TestUser> testUserList = testMasterDAO.getUserByTestId(test_id);
				List<TestQuestion> testQuestions = testMasterDAO.getQuestionByTestId(Integer.parseInt(test_id));
				
				Date date = new Date();  
			    SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");  
			    String strDate = formatter.format(date);
			    formatter = new SimpleDateFormat("dd-MMMM-yyyy");  
			    strDate = formatter.format(date); 
			    
			    response.setContentType("application/vnd.ms-excel");
				response.setHeader("Content-Disposition", "attachment;filename=Teksands-"+test.getTest_name()+"-"+strDate+".xlsx");
				
				Workbook wb = new Workbook(response.getOutputStream(), "MyApplication", "1.0");
				Worksheet ws = wb.newWorksheet("Teksands Test Users List");
				
				//SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
				SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
				
				ws.value(0, 0, test.getTest_name());
				ws.range(0, 0, 0, 5).merge();
				ws.range(0, 0, 0, 5).style().horizontalAlignment("center").set();
				ws.style(0, 0).bold().fontSize(11).set(); 
				
				int i = 1;
				int j = 0;
				for(j = 0; j <= 500; j++) {
					ws.style(i, j).bold().fontSize(9).borderStyle("bold").borderColor("0f76bd").wrapText(true).set();	
				}
				
				ws.value(i, 0, "Submitted Date");
			    ws.value(i, 1, "Name");
			    ws.value(i, 2, "Email");
			    ws.value(i, 3, "Mobile");
			    ws.value(i, 4, "Total Number of MCQs");
		    	ws.value(i, 5, "Total Correct MCQs");
		    	ws.value(i, 6, "Percentage");
		    	
		    	int k = 7;
		    	for (TestQuestion testQuestion : testQuestions) 
		    	{
		    		ws.value(i, k++, testQuestion.getQuestion());
			    	ws.value(i, k++, "Question Type");
			    	if(testQuestion.getQuestion_type().equalsIgnoreCase("mcq")) {
			    		ws.value(i, k++, "Correct Answer");
			    		ws.value(i, k++, "Right or Not");
			    	}
				}
		    	i++;
		    	
		    	List<UserAnswerResponse> testuserresponseList = new ArrayList<UserAnswerResponse>();
		    	
		    	List<Integer> questionIdList = new ArrayList<Integer>();
		    	
		    	for (TestQuestion question : testQuestions) {
		    		questionIdList.add(question.getQuestion_id());
				}
		    	
		    	for (TestUser testUser : testUserList) {
		    		
		    		UserAnswerResponse testanswer = new UserAnswerResponse();
		    		testanswer.setUser_id(testUser.getUser_id());
		    		testanswer.setTest_id(Integer.parseInt(test_id));
		    		testanswer.setQuestion_ids(questionIdList);
		    		testuserresponseList.add(testanswer);
				}
		    	
		    	for (UserAnswerResponse userAnswerResponse : testuserresponseList) 
		    	{
		    		
		    		List<TestQuestion> mcqQuestionList = testMasterDAO.getMCQTestQuestionByTestId(Integer.parseInt(test_id));
					List<TestAnswer> mcqAnswerList = testMasterDAO.getMCQTestAnswersByTestIdAndUserId(Integer.parseInt(test_id),userAnswerResponse.getUser_id());
					
		    		TestUser testUser = testMasterDAO.getTestUserById(userAnswerResponse.getUser_id());
		    		
		    		List<Object[]> testList = testMasterDAO.getUserListAndAnswerListByTestIdAndUserId(userAnswerResponse.getTest_id(),userAnswerResponse.getUser_id());
		    		
		    		List<UserAnswerResponse> testuserList = new ArrayList<UserAnswerResponse>();
		    		
		    		for (Object[] objects : testList) 
	    			{
	    				String testQuestion = String.valueOf(objects[0]);
	    				String correctAnswer = String.valueOf(objects[1]);
	    				String questionType = String.valueOf(objects[2]);
	    				String userAnswer = String.valueOf(objects[3]);
	    				String correct_or_not = String.valueOf(objects[4]);
	    				
	    				UserAnswerResponse userResponse = new UserAnswerResponse();
	    				
	    				userResponse.setQuestion(testQuestion);
	    				userResponse.setQuestion_type(questionType);
	    				userResponse.setCorrect_answer(correctAnswer);
	    				userResponse.setTest_answer(userAnswer);
	    				userResponse.setCorrect_or_not(correct_or_not);
	    				testuserList.add(userResponse);
	    			}	
		    		
		    		Integer total = 0;
					
					if(mcqQuestionList != null) {
						total = mcqQuestionList.size();
					}
					
					Integer correct = 0;
					Integer wrong = 0;
					
					if(mcqAnswerList != null) 
					{
						for (TestAnswer testAnswer : mcqAnswerList) 
						{
							Integer questionId = testAnswer.getQuestion_id();
							String user_answer = testAnswer.getCorrect_answer();
							
							TestQuestion testQuestion = testMasterDAO.getQuestionsById(questionId);
							
							if(testQuestion.getCorrect_answer().equalsIgnoreCase(user_answer)) {
								correct = correct+1;
							}else {
								wrong = wrong+1;
							}
						}
					}
					
					Integer percetage = 0;

					if(!total.equals(0)) {
						percetage = (correct*100)/total;
					}
					
					ws.value(i, 0, sdf.format(testUser.getCreated_date()));
					ws.style(i, 0).fontSize(9).wrapText(true).set();
					
					ws.value(i, 1, testUser.getName());
					ws.style(i, 1).fontSize(9).wrapText(true).set();
					
					ws.value(i, 2, testUser.getEmail());
					ws.style(i, 2).fontSize(9).wrapText(true).set();
					
					ws.value(i, 3, testUser.getMobile());
					ws.style(i, 3).fontSize(9).wrapText(true).set();
					
					if(!total.equals(0)) {
						ws.value(i, 4, total);
						ws.style(i, 4).fontSize(9).wrapText(true).set();
					}else {
						ws.value(i, 4, "-");
						ws.style(i, 4).fontSize(9).wrapText(true).set();
					}
					
					if(!total.equals(0)) {
						ws.value(i, 5, correct);
						ws.style(i, 5).fontSize(9).wrapText(true).set();
					}else {
						ws.value(i, 5, "-");
						ws.style(i, 5).fontSize(9).wrapText(true).set();
					}
					
					if(!total.equals(0)) {
						ws.value(i, 6, percetage+"%");
						ws.style(i, 6).fontSize(9).wrapText(true).set();
					}else {
						ws.value(i, 6, "-");
						ws.style(i, 6).fontSize(9).wrapText(true).set();
					}
					
					int l = 7;
					
					for (UserAnswerResponse userResponseTest : testuserList) 
					{
						if(!userResponseTest.getTest_answer().isEmpty()) {
							ws.value(i, l, userResponseTest.getTest_answer());
							ws.style(i, l++).fontSize(9).wrapText(true).set();
						}else {
							ws.value(i, l, "-");
							ws.style(i, l++).fontSize(9).wrapText(true).set();
						}
						
						if(!userResponseTest.getQuestion_type().isEmpty()) {
							ws.value(i, l, userResponseTest.getQuestion_type());
							ws.style(i, l++).fontSize(9).wrapText(true).set();
						}else {
							ws.value(i, l, "-");
							ws.style(i, l++).fontSize(9).wrapText(true).set();
						}
						
						if(!userResponseTest.getCorrect_answer().isEmpty()) 
						{
							if(userResponseTest.getQuestion_type().equalsIgnoreCase("mcq")) 
							{
								if(!userResponseTest.getCorrect_answer().isEmpty()) {
									ws.value(i, l, userResponseTest.getCorrect_answer());
									ws.style(i, l++).fontSize(9).wrapText(true).set();
								}else {
									ws.value(i, l, "-");
									ws.style(i, l++).fontSize(9).wrapText(true).set();
								}
								
								if(userResponseTest.getCorrect_or_not().equalsIgnoreCase("1")) {
									ws.value(i, l, "Yes");
									ws.style(i, l++).fontSize(9).wrapText(true).set();
								}else {
									ws.value(i, l, "NO");
									ws.style(i, l++).fontSize(9).wrapText(true).set();
								}
							}
						}
						
					}
					i++;
				}
		    	
		    	wb.finish();
				
			}else {
				response.sendRedirect("/bootcamp");
			}
		}
 		catch(Exception ex)
		{
			ex.printStackTrace();
		}
	}
	
	/*@RequestMapping(value="/downloadXLAllTestUsersAnswerByTestId")
	public void newTestUserDownloadXL(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		HashMap<String, String> accountMap = null;
		try 
		{
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			if(accountMap != null && (accountMap.get("user_id").equalsIgnoreCase(Utils.adminId.toString()))) 
			{
			
				String test_id = request.getParameter("test_id");
				
				if(test_id ==  null) {test_id = "";}
				
				test_id = test_id.trim();
				
				Test test = testMasterDAO.getTestById(Integer.parseInt(test_id));
				List<TestUser> testUserList = testMasterDAO.getUserByTestId(test_id);
				List<TestQuestion> testQuestions = testMasterDAO.getQuestionByTestId(Integer.parseInt(test_id));
				
				Date date = new Date();  
				SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");  
				String strDate = formatter.format(date);
			   
				formatter = new SimpleDateFormat("dd-MMMM-yyyy");  
				strDate = formatter.format(date); 
				
				response.setContentType("application/vnd.ms-excel");
				response.setHeader("Content-Disposition", "attachment;filename=Teksands-"+test.getTest_name()+"-"+strDate+".xlsx");
				
				Workbook wb = new Workbook(response.getOutputStream(), "MyApplication", "1.0");
				Worksheet ws = wb.newWorksheet("Teksands Test Users List");
				
				SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
										
				ws.value(0, 0, test.getTest_name());
				ws.range(0, 0, 0, 5).merge();
				ws.range(0, 0, 0, 5).style().horizontalAlignment("center").set();
				ws.style(0, 0).bold().fontSize(11).set(); 

				int i = 1;
				int j = 0;
				for(j = 0; j <= 500; j++) {
					ws.style(i, j).bold().fontSize(9).borderStyle("bold").borderColor("0f76bd").wrapText(true).set();	
				}
				
				ws.value(i, 0, "Submitted Date");
				ws.value(i, 1, "Name");
				ws.value(i, 2, "Email");
				ws.value(i, 3, "Mobile");
				ws.value(i, 4, "Total Number of MCQs");
				ws.value(i, 5, "Total Correct MCQs");
				ws.value(i, 6, "Percentage");
				
				int k = 7;
				for (TestQuestion testQuestion : testQuestions) 
				{
					ws.value(i, k++, "Question");
					ws.value(i, k++, "Question Type");
					ws.value(i, k++, "Correct Answer");
					ws.value(i, k++, "Right or Not");
				}
				i++;
				
				List<UserAnswerResponse> testuserresponseList = new ArrayList<UserAnswerResponse>();
				
				List<Integer> questionIdList = new ArrayList<Integer>();
				
				for (TestQuestion question : testQuestions) {
					questionIdList.add(question.getQuestion_id());
				}
				
				for (TestUser testUser : testUserList) {
					
					UserAnswerResponse testanswer = new UserAnswerResponse();
					testanswer.setUser_id(testUser.getUser_id());
					testanswer.setTest_id(Integer.parseInt(test_id));
					testanswer.setQuestion_ids(questionIdList);
					testuserresponseList.add(testanswer);
				}
				
				for (UserAnswerResponse userAnswerResponse : testuserresponseList) 
				{
					List<TestQuestion> mcqQuestionList = testMasterDAO.getMCQTestQuestionByTestId(Integer.parseInt(test_id));
					List<TestAnswer> mcqAnswerList = testMasterDAO.getMCQTestAnswersByTestIdAndUserId(Integer.parseInt(test_id),userAnswerResponse.getUser_id());
					
					TestUser testUser = testMasterDAO.getTestUserById(userAnswerResponse.getUser_id());
					
					List<Object[]> testList = testMasterDAO.getUserListAndAnswerListByTestIdAndUserId(userAnswerResponse.getTest_id(),userAnswerResponse.getUser_id());
					
					List<UserAnswerResponse> testuserList = new ArrayList<UserAnswerResponse>();
					
					for (Object[] objects : testList) 
					{
						String testQuestion = String.valueOf(objects[0]);
						String questionType = String.valueOf(objects[1]);
						String correctAnswer = String.valueOf(objects[2]);
						String correct_or_not = String.valueOf(objects[3]);
						
						UserAnswerResponse userResponse = new UserAnswerResponse();
						userResponse.setQuestion(testQuestion);
						userResponse.setQuestion_type(questionType);
						userResponse.setCorrect_answer(correctAnswer);
						userResponse.setTest_answer(correct_or_not);
						testuserList.add(userResponse);
					}	
					
					Integer total = 0;
					
					if(mcqQuestionList != null) {
						total = mcqQuestionList.size();
					}
					
					Integer correct = 0;
					Integer wrong = 0;
					
					if(mcqAnswerList != null) 
					{
						for (TestAnswer testAnswer : mcqAnswerList) 
						{
							Integer questionId = testAnswer.getQuestion_id();
							String user_answer = testAnswer.getCorrect_answer();
							
							TestQuestion testQuestion = testMasterDAO.getQuestionsById(questionId);
							
							if(testQuestion.getCorrect_answer().equalsIgnoreCase(user_answer)) {
								correct = correct+1;
							}else {
								wrong = wrong+1;
							}
						}
					}
					
					Integer percetage = 0;

					if(!total.equals(0)) {
						percetage = (correct*100)/total;
					}
					
					ws.value(i, 0, sdf.format(testUser.getCreated_date()));
					ws.style(i, 0).fontSize(9).wrapText(true).set();
					
					ws.value(i, 1, testUser.getName());
					ws.style(i, 1).fontSize(9).wrapText(true).set();
					
					ws.value(i, 2, testUser.getEmail());
					ws.style(i, 2).fontSize(9).wrapText(true).set();
					
					ws.value(i, 3, testUser.getMobile());
					ws.style(i, 3).fontSize(9).wrapText(true).set();
					
					if(!total.equals(0)) {
						ws.value(i, 4, total);
						ws.style(i, 4).fontSize(9).wrapText(true).set();
					}else {
						ws.value(i, 4, "-");
						ws.style(i, 4).fontSize(9).wrapText(true).set();
					}
					
					if(!total.equals(0)) {
						ws.value(i, 5, correct);
						ws.style(i, 5).fontSize(9).wrapText(true).set();
					}else {
						ws.value(i, 5, "-");
						ws.style(i, 5).fontSize(9).wrapText(true).set();
					}
					
					if(!total.equals(0)) {
						ws.value(i, 6, percetage+"%");
						ws.style(i, 6).fontSize(9).wrapText(true).set();
					}else {
						ws.value(i, 6, "-");
						ws.style(i, 6).fontSize(9).wrapText(true).set();
					}
					
					
					int l = 7;
					
					for (UserAnswerResponse userResponseTest : testuserList) 
					{
						ws.value(i, l, userResponseTest.getQuestion());
						ws.style(i, l++).fontSize(9).wrapText(true).set();
						
						ws.value(i, l, userResponseTest.getQuestion_type());
						ws.style(i, l++).fontSize(9).wrapText(true).set();
						
						if(!userResponseTest.getCorrect_answer().isEmpty()) {
							ws.value(i, l, userResponseTest.getCorrect_answer());
							ws.style(i, l++).fontSize(9).wrapText(true).set();
						}else {
							ws.value(i, l, "-");
							ws.style(i, l++).fontSize(9).wrapText(true).set();
						}
						
						if(!userResponseTest.getTest_answer().isEmpty()) 
						{
							if(userResponseTest.getQuestion_type().equalsIgnoreCase("mcq")) {
								if(userResponseTest.getTest_answer().equalsIgnoreCase("1")) {
									ws.value(i, l, "Y");
									ws.style(i, l++).fontSize(9).wrapText(true).set();
								}else {
									ws.value(i, l, "N");
									ws.style(i, l++).fontSize(9).wrapText(true).set();
								}
							}else {
								ws.value(i, l, "-");
								ws.style(i, l++).fontSize(9).wrapText(true).set();
							}
						}else {
							ws.value(i, l, "-");
							ws.style(i, l++).fontSize(9).wrapText(true).set();
						}
					}
					i++;
				}
				
				wb.finish();
			}else {
				response.sendRedirect("/bootcamp");
			}
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
	}*/
	
	/*New Test Module Stared Here*/
	
	@RequestMapping({"/tk-test-user" })
	public String tk_test_user(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{	
		try
		{	
			String authCode = request.getParameter("authCode");
			
			if(authCode == null) {authCode = "";}
			
			authCode = authCode.trim();
			
			Test test =  null;
			
			if(!authCode.isEmpty()) {
				test = testMasterDAO.getTestByAuthCode(authCode);
			}
			
			String domainName = properties.getHostDomainUrl();
			
			request.setAttribute("domainName", domainName);
			
			if(test != null) {
				
				List<TestQuestion> testQuestion = testMasterDAO.getTestQuestionsById(test.getTest_id());
				
				request.setAttribute("test", test);
				request.setAttribute("testQuestion", testQuestion);
				
				TestQuestion question = null;
				
				if(!testQuestion.isEmpty()) {
					question = testQuestion.get(testQuestion.size() - 1);	
				}
				
				if(question != null) {
					Integer last_question_id = question.getQuestion_id();
					
					request.setAttribute("last_question_id", last_question_id);
				}
				
			}else {
				response.sendRedirect("/home");
			}
			
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		
		return "bootcamp.exam.test.user";
	}
	
	@RequestMapping(value="/verifyEmailOtpAndCreateUserByTestId")
	public void verifyEmailOtpAndCreateUserByTestId(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		CommonResponse commonResponse = null;
		Gson gson = null;	
		TestUser testUser = null;
		String authCode = RandomStringUtils.random(8, "0123456789abcdef");
		try 
   		{
			commonResponse = new CommonResponse();
    		gson = new Gson();	
    		
    		String test_id = request.getParameter("test_id");
    		String user_name = request.getParameter("user_name");
    		String user_email = request.getParameter("user_email");
    		String user_mobile = request.getParameter("user_mobile");
    		String code = request.getParameter("code");
    		
    		if(test_id == null) {test_id ="";}
    		if(user_name == null) {user_name ="";}
    		if(user_email == null) {user_email ="";}
    		if(user_mobile == null) {user_mobile ="";}
    		if(code == null) {code ="";}
    		
    		test_id = test_id.trim();
    		user_name = user_name.trim();
    		user_email = user_email.trim();
    		user_mobile = user_mobile.trim();
    		code = code.trim();
    		
    		if(request.getSession().getAttribute("email_code") != null	&& request.getSession().getAttribute("email_code").toString().equalsIgnoreCase(code))
			{
    			request.getSession().removeAttribute("email_code");    			
    			
    			testUser = new TestUser();    			
    			testUser.setTest_id(test_id);
    			testUser.setName(user_name);
    			testUser.setEmail(user_email);
    			testUser.setMobile(user_mobile);
    			testUser.setEmail_verified(true);
    			testUser.setCreated_date(new Date());
    			testUser.setAuth_code(authCode);
    			testUser.setActive(true);
    			Boolean result = testMasterDAO.saveOrUpdateTestUser(testUser);
    			
    			List<TestQuestion> testQuestionList = testMasterDAO.getTestQuestionsById(Integer.parseInt(test_id));
				
				for (TestQuestion testQuestion : testQuestionList) 
				{
					TestAnswer testAnswer = new TestAnswer();
					testAnswer.setTest_id(Integer.parseInt(test_id));
					testAnswer.setQuestion_id(testQuestion.getQuestion_id());
					testAnswer.setUser_id(testUser.getUser_id());
					testAnswer.setUser_name(testUser.getName());
					testAnswer.setQuestion_type(testQuestion.getQuestion_type());
					testAnswer.setCorrect_answer("");
					testAnswer.setCorrect_or_not(false);
					testAnswer.setDate_answered(new Date());
					testAnswer.setActive(true);
					testMasterDAO.saveOrUpdateAnswer(testAnswer);
				}
    			
    			if(result) {
        			commonResponse.setStatus("new_user");
        			commonResponse.setStatus_code(200);
        			commonResponse.setUser_type_id(testUser.getUser_id());
        			commonResponse.setMsg(testUser.getAuth_code());
        			writer.print(gson.toJson(commonResponse));
        			writer.close();
        			return;
        		} else {
        			commonResponse.setStatus("FAILURE");
        			commonResponse.setStatus_code(400);
        			writer.print(gson.toJson(commonResponse));
        			writer.close();
        			return;
        		}
			}
    		
   		}
		catch(Exception ex)
       	{
       		ex.printStackTrace();
       		
       		commonResponse.setStatus("FAILURE");
			commonResponse.setStatus_code(400);
			writer.print(gson.toJson(commonResponse));
			writer.close();
			return;
       	}
	}
	
	@RequestMapping({"/tk-online-test" })
	public String tk_online_test(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{	
		try
		{	
			String testAuthCode = request.getParameter("7e1081a9");
			String userAuthCode = request.getParameter("64fca0f5");
			
			if(testAuthCode == null) {testAuthCode = "";}
			if(userAuthCode == null) {userAuthCode = "";}
			
			testAuthCode = testAuthCode.trim();
			userAuthCode = userAuthCode.trim();
			
			Test test =  null;
			TestUser testUser = null;
			
			if(!testAuthCode.isEmpty()) {
				test = testMasterDAO.getTestByAuthCode(testAuthCode);
			}
			
			if(!userAuthCode.isEmpty()) {
				testUser = testMasterDAO.getUserByAuthCode(userAuthCode);
			}
			
			if(test != null && testUser != null) {
				
				List<TestQuestion> testQuestionList = testMasterDAO.getTestQuestionsById(test.getTest_id());				
			
				request.setAttribute("test", test);
				request.setAttribute("testQuestion", testQuestionList);
				
				TestQuestion question = null;
				
				if(!testQuestionList.isEmpty()) {
					question = testQuestionList.get(testQuestionList.size() - 1);	
				}
				
				if(question != null) {
					Integer last_question_id = question.getQuestion_id();
					
					request.setAttribute("last_question_id", last_question_id);
				}
				
				request.setAttribute("user_id", testUser.getUser_id());
				
			}else {
				response.sendRedirect("/home");
			}
			
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		
		return "bootcamp.test.online.link";
	}
	
	@RequestMapping(value="/addAnswerByQuestionIdAndUserIdAndTestId")
	public void addAnswerByQuestionIdAndUserIdAndTestId(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		CommonResponse commonResponse = null;
		Gson gson = null;
		TestUser testUser = null;
		TestAnswer testAnswer = null;
		try 
   		{
			commonResponse = new CommonResponse();
    		gson = new Gson();	
    		
    		String test_id = request.getParameter("test_id");
    		String user_id = request.getParameter("user_id");
    		String question_id = request.getParameter("question_id");
    		String correct_answer = request.getParameter("correct_answer");
    		String question_type = request.getParameter("question_type");
    		
    		if(test_id == null) {test_id ="";}
    		if(user_id == null) {user_id ="";}
    		if(question_id == null) {question_id ="";}
    		if(correct_answer == null) {correct_answer ="";}
    		if(question_type == null) {question_type ="";}
    		
    		test_id = test_id.trim();
    		user_id = user_id.trim();
    		question_id = question_id.trim();
    		correct_answer = correct_answer.trim();
    		question_type = question_type.trim();
    		
    		if(!user_id.isEmpty())
    		{
    			testUser = testMasterDAO.getTestUserById(Integer.parseInt(user_id));
    		}
    		
    		String test_user_name = "";
    		String test_ids ="";
    		
    		if(testUser != null) 
    		{
    			test_user_name = testUser.getName();
    			test_ids = testUser.getTest_id();
    		}
    		
    		TestQuestion testQuestion = null;
    		
    		if(!question_id.isEmpty()) {
    			testQuestion = testMasterDAO.getQuestionById(Integer.parseInt(question_id));
    		}
    		
    		if(!test_id.isEmpty() && !question_id.isEmpty() && !user_id.isEmpty()) 
    		{
    			testAnswer = testMasterDAO.getAnswerByTestIdAndUserIdAndQuestionId(Integer.parseInt(test_id),Integer.parseInt(question_id),Integer.parseInt(user_id));
    		}
    		
    		String audio_file_name = test_id + test_user_name + user_id+"_"+question_id;
    		String audio_path = properties.getAudioDir() + "/" +audio_file_name+ ".mp3";
    		String audio_url = properties.getHostDomainUrl() + "resources/test-audio/" +audio_file_name+ ".mp3";
    		String updtest_ids = "";
    		
    		if(testAnswer != null) {
    			if(question_type.equalsIgnoreCase("voice")) 
    			{
    				Decoder decoder = Base64.getDecoder();
    				byte[] decodedByte = decoder.decode(correct_answer.split(",")[1]);
    				FileOutputStream fos = new FileOutputStream(audio_path);
    				testAnswer.setCorrect_answer(audio_url);
    				fos.write(decodedByte);
    				fos.close();
    			}else {
    				testAnswer.setCorrect_answer(correct_answer);
    			}
    			
    			if(question_type.equalsIgnoreCase("mcq")) {
    				
    				if(testQuestion != null) 
    				{
    					System.out.println("testQuestion = " + testQuestion.getCorrect_answer());
    					System.out.println("correct_answer = " + correct_answer);
    					
    					if(testQuestion.getCorrect_answer().equalsIgnoreCase(correct_answer)) {
    						testAnswer.setCorrect_or_not(true);
    					}else {
    						testAnswer.setCorrect_or_not(false);
    					}
    				}
    			}else {
    				testAnswer.setCorrect_or_not(false);
    			}
    			
    			testAnswer.setDate_answered(new Date());
    			testAnswer.setActive(true);
    			
    			Boolean result = testMasterDAO.saveOrUpdateAnswer(testAnswer);
    			
    			if(result)
    			{    				
	    			List<String> list = Arrays.asList(test_ids.split(","));
	    			
	    			if (list.contains(test_id)) 
	    			{
	    				commonResponse.setStatus("test_taken");
	    				commonResponse.setStatus_code(400);
	    				commonResponse.setUser_type_id(testUser.getUser_id());
	    				commonResponse.setMsg("Answer Added Successfully");
	    				commonResponse.setStatus_code(200);
	        			writer.print(gson.toJson(commonResponse));
	        			writer.close();
	        			return;
	    			}else{
	    				if(!test_ids.isEmpty())
	    				{
	    					updtest_ids = test_ids +","+ test_id;
	    				}else
	    				{
	    					updtest_ids = test_id;
	    				}
    				
	    				if (!user_id.isEmpty()) 
    					{	   	  
	    					testUser = testMasterDAO.getUserById(Integer.parseInt(user_id));	
	    	    			testUser.setTest_id(updtest_ids);
	    	    			testMasterDAO.saveOrUpdateTestUser(testUser);	
    					}    				    				
		    			commonResponse.setStatus("Success");
		    			commonResponse.setUser_type_id(testUser.getUser_id());
		    			commonResponse.setMsg("Answer Added Successfully");
		    			commonResponse.setStatus_code(200);
		    			writer.print(gson.toJson(commonResponse));
		    			writer.close();
		    			return;
	    			}
    			}
    		}
    		
   		}
		catch(Exception ex)
       	{
       		ex.printStackTrace();
       		
       		commonResponse.setStatus("FAILURE");
			commonResponse.setStatus_code(400);
			writer.print(gson.toJson(commonResponse));
			writer.close();
			return;
       	}
	}
	
	@RequestMapping(value="/bulkUploadTestQuestionsByTestId")
	public void bulkUploadTestQuestionsByTestId(HttpServletRequest request, HttpServletResponse response) throws IOException 
	{   		 
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		HashMap<String, String> accountMap = null;
		CommonResponse commonResponse = null;
		Gson gson = null;
        String appPath = request.getServletContext().getRealPath("");
        String savePath = appPath + File.separator + SAVE_DIR;
        
        File fileSaveDir = new File(savePath);
        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdir();
        }
        
		try 
		{
			commonResponse = new CommonResponse();
    		gson = new Gson();	
    		
		    boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		    DiskFileItemFactory factory = new DiskFileItemFactory();
		    ServletFileUpload upload = new ServletFileUpload(factory);
	        try
	        { 
	        	accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
				if(accountMap != null && (accountMap.get("user_type_id").equalsIgnoreCase(Utils.adminId.toString())) ) 
				{
					
					String user_id = accountMap.get("user_id");
					String user_email = accountMap.get("user_email");
					String user_name = accountMap.get("user_name");
					String user_type_id = accountMap.get("user_type_id");
					
					
					String test_id = request.getParameter("test_id");
					
					if(test_id == null) {test_id = "";}
					
					test_id = test_id.trim();
					
					List fileItems = upload.parseRequest(request);
					Iterator i = fileItems.iterator();
					while ( i.hasNext () ) 
					{
						FileItem fi = (FileItem)i.next();
						if (!fi.isFormField())	
						{
							String fileName = fi.getName();
							String filePath = savePath + File.separator + fileName;
							File file = new File(filePath);
							fi.write(file);
							
							boolean status = false;
							
							System.out.println("filePath = "+ filePath );
							System.out.println("fileName = "+ fileName );
							System.out.println("test_id = "+ test_id );
		                 
							status = testMasterDAO.bulkUploadTestQuestionsByTestId(filePath, fileName,Integer.parseInt(test_id));
		                 
							if(status)
	   	                 	{
								Log log = new Log();
	   	 			 			log.setUser_id(Integer.parseInt(user_id));
	   	 			 			log.setUser_name(user_name);
	   	 			 			log.setTitle("Bulk Test Results Added");
	   	 			 			log.setDescription(user_name+" has uploaded the questions list");
	   	 			 			log.setActivity_time(new Date());
	   	 			 			String ipAddr = Utils.getIpAddr(request);
	   	 			 			if(ipAddr == null){ipAddr="";}
	   	 			 			log.setIp_addr(ipAddr);
	   	 			 			logDAO.saveLog(log);
	   	                	 
	   	 			 			commonResponse.setStatus("SUCCESS");
	   	 			 			commonResponse.setStatus_code(200);
	   	 			 			commonResponse.setMsg("Questions areare Updated Successfully");
	   	 			 			writer.print(gson.toJson(commonResponse));
	   	 			 			writer.close();
	   	 			 			return;
	   	                 	}else{
	   	                 		commonResponse.setStatus("SUCCESS");
	    	 					commonResponse.setStatus_code(400);
	    	 					commonResponse.setMsg("File Upload Failure");
	    	 					writer.print(gson.toJson(commonResponse));
	    	 					writer.close();
	    	 					return;
	   	                 	}
						}
					}
				}else {
					response.sendRedirect("/bootcamp");
				}
	        	
				
	        }
	        catch(Exception ex)
	        {
	    	   ex.printStackTrace();
	    	   writer.print("File Uplaod Failure");
               writer.close();
	        }
		} 
		catch (Exception ex) 
		{
			ex.printStackTrace();
			writer.print("File Uplaod Error");
            writer.close();
		}    
	}
	
	@RequestMapping({"/nagarajan-test-link" })
	public String nagarajan_test_link(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{	
		try
		{	
			
			
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		
		return "nagarajan.test.link";
	}
		
	@RequestMapping({"/addTestResult" })
	public void addTestResult(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{	
		
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		CommonResponse commonResponse = null;
		Gson gson = null;	
		TkTestResults testResults = null;
		Test test = null;
		try
		{	
			commonResponse = new CommonResponse();
    		gson = new Gson();	
    		
			String test_id = request.getParameter("test_id");
			String user_id = request.getParameter("user_id");
			String remaining_time = request.getParameter("remaining_time");
			
			if(test_id == null) {test_id = "";}
			if(user_id == null) {user_id = "";}
			
			test_id = test_id.trim();
			user_id = user_id.trim();
			
			System.out.println("view result auth code"+test_id);
			System.out.println("view result user_id" + user_id);
			    		    		   		
    		TestUser testUser = null;    		
    		
    		if(user_id != "") {
    			testUser = testMasterDAO.getUserById(Integer.parseInt(user_id));
    		}
    		
    		if(!test_id.isEmpty()) {
    			test = testMasterDAO.getTestById(Integer.parseInt(test_id));
    		}
    		
    		if(!test_id.isEmpty() && !user_id.isEmpty()) {
    			request.setAttribute("test_id", test_id);
    			request.setAttribute("user_id", user_id);    		
    			request.setAttribute("authCode",test.getAuth_code());
    			request.setAttribute("test_name",test.getTest_name());
    			request.setAttribute("test_date",test.getCreated_date());
				request.setAttribute("test_time", test.getTest_time());
    		}
    		if(testUser != null) {
    			request.setAttribute("testUser", testUser);
    		}
    		
    		List<TestQuestion> mcqQuestionList = testMasterDAO.getMCQTestQuestionByTestId(test.getTest_id());
    		List<TestAnswer> mcqAnswerList = testMasterDAO.getMCQTestAnswersByTestIdAndUserId(test.getTest_id(),Integer.parseInt(user_id));

    		Integer total = 0;
    							
    		if(mcqQuestionList != null) {
    			total = mcqQuestionList.size();
    		}

    		Integer correct = 0;
    		Integer wrong = 0;

    		if(mcqAnswerList != null) 
    		{
    			for (TestAnswer testAnswer : mcqAnswerList) 
    			{
    				Integer questionId = testAnswer.getQuestion_id();
    				String user_answer = testAnswer.getCorrect_answer();
    				
    				TestQuestion testQuestion = testMasterDAO.getQuestionsById(questionId);
    				
    				if(testQuestion.getCorrect_answer().equalsIgnoreCase(user_answer)) {
    					correct = correct+1;
    				}else {
    					wrong = wrong+1;
    				}
    			}
    		}

    		Integer percentage = 0;

    		if(!total.equals(0)) {
    			percentage = (correct*100)/total;
    		}
    	
    		testResults = new TkTestResults();
    		testResults.setTest_id(Integer.parseInt(test_id));
    		testResults.setUser_id(Integer.parseInt(user_id));
    		testResults.setUser_name(testUser.getName());
    		testResults.setUser_email(testUser.getEmail());
    		testResults.setUser_mobile(testUser.getMobile());    		
    		testResults.setTotal_marks(total);
    		testResults.setMarks_scored(correct);
    		testResults.setTotal_no_mcq_questions(mcqQuestionList.size());
    		testResults.setNo_of_mcq_qus_attempt(mcqAnswerList.size());
    		testResults.setNo_of_mcq_answer_correct(correct);
    		testResults.setNo_of_mcq_answer_incorrect(wrong);
    		testResults.setTest_start_time(test.getTest_time());
    		testResults.setTest_end_time(remaining_time);
    		testResults.setPercentage(percentage.toString());
    		testResults.setSubmitted_date(new Date());
    		testResults.setActive(true);

    		Boolean result = testMasterDAO.saveOrUpdateTestResult(testResults);
    		
    		if(result) {
    			commonResponse.setStatus("Test Results Saved successfully");
    			commonResponse.setStatus_code(200);
    			writer.print(gson.toJson(commonResponse));
    			writer.close();
    			return;
    		} else {
    			commonResponse.setStatus("FAILURE");
    			commonResponse.setStatus_code(400);
    			writer.print(gson.toJson(commonResponse));
    			writer.close();
    			return;
    		}		
		
	}
	catch(Exception ex)
   	{
   		ex.printStackTrace();
   		
   		commonResponse.setStatus("FAILURE");
		commonResponse.setStatus_code(400);
		writer.print(gson.toJson(commonResponse));
		writer.close();
		return;
   	}
	}
	@RequestMapping({"/view-result" })
	public String view_result(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{	
		Test test = null;
		TkTestResults testResults = null; 
		try
		{	
			String authCode = request.getParameter("authCode");
			String user_id = request.getParameter("user_id");
			
			if(authCode == null) {authCode = "";}
			if(user_id == null) {user_id = "";}
			
			authCode = authCode.trim();
			user_id = user_id.trim();
			
			System.out.println("view result auth code"+authCode);
			System.out.println("view result user_id" + user_id);
			    		    		   		
    		TestUser testUser = null;    		
    		
    		if(user_id != "") {
    			testUser = testMasterDAO.getUserById(Integer.parseInt(user_id));
    		}
    		
    		if(!authCode.isEmpty()) {
    			test = testMasterDAO.getTestByAuthCode(authCode);
    			testResults =  testMasterDAO.getTestByTestwithUserId(test.getTest_id(),Integer.parseInt(user_id));
    		}
    		
    		if(!authCode.isEmpty() && !user_id.isEmpty()) {
    			request.setAttribute("authCode", authCode);
    			request.setAttribute("user_id", user_id);    		
    			request.setAttribute("test_id",testResults.getTest_id());
    			request.setAttribute("test_name",test.getTest_name());
    			request.setAttribute("test_date",testResults.getSubmitted_date());
    			SimpleDateFormat start_time = new SimpleDateFormat("mm");
    			Date dt = start_time.parse(testResults.getTest_start_time());
    			start_time = new SimpleDateFormat("HH:mm:ss");
				request.setAttribute("start_time", start_time.format(dt));
				request.setAttribute("end_time", testResults.getTest_end_time());
    		}
    		if(testUser != null) {
    			request.setAttribute("testUser", testUser);
    		}
    		
    		List<TestQuestion> mcqQuestionList = testMasterDAO.getMCQTestQuestionByTestId(test.getTest_id());
    		List<TestAnswer> mcqAnswerList = testMasterDAO.getMCQTestAnswersByTestIdAndUserId(test.getTest_id(),Integer.parseInt(user_id));

    		Integer total = 0;
    							
    		if(mcqQuestionList != null) {
    			total = mcqQuestionList.size();
    		}

    		Integer correct = 0;
    		Integer wrong = 0;

    		if(mcqAnswerList != null) 
    		{
    			for (TestAnswer testAnswer : mcqAnswerList) 
    			{
    				Integer questionId = testAnswer.getQuestion_id();
    				String user_answer = testAnswer.getCorrect_answer();
    				
    				TestQuestion testQuestion = testMasterDAO.getQuestionsById(questionId);
    				
    				if(testQuestion.getCorrect_answer().equalsIgnoreCase(user_answer)) {
    					correct = correct+1;
    				}else {
    					wrong = wrong+1;
    				}
    			}
    		}

    		Integer percetage = 0;

    		if(!total.equals(0)) {
    			percetage = (correct*100)/total;
    		}
    		
    		request.setAttribute("mcQtotal", total);
    		request.setAttribute("mcQcorrect", correct);
    		request.setAttribute("mcQWrong", wrong);
    		request.setAttribute("mcPercetage", percetage);
    		
    		System.out.println("mcQtotal = " + total);
    		if(!user_id.isEmpty()) {
    		
    			List<Object[]> testanswerList = testMasterDAO.getAnswerByTestUserIdMcq(test.getTest_id(),Integer.parseInt(user_id));
				List<UserAnswerResponse> testuserresponseList = new ArrayList<UserAnswerResponse>();
				
				TestComment testComment = testMasterDAO.getCommentByTestIdAndUserId(test.getTest_id(),Integer.parseInt(user_id));
				
				for (Object[] objects : testanswerList) 
    			{
					String testId = String.valueOf(objects[0]);
    				String userId = String.valueOf(objects[1]);
    				String question_type = String.valueOf(objects[2]);
    				String question_id = String.valueOf(objects[3]);
    				String question = String.valueOf(objects[4]);
    				String user_answer = String.valueOf(objects[5]);
    				String correct_answer = String.valueOf(objects[6]);
    				String answer_id = String.valueOf(objects[7]);
    				String correct_or_not = String.valueOf(objects[8]);
    				
    				String option1 = String.valueOf(objects[9]);
    				String option2 = String.valueOf(objects[10]);    				
    				String option3 = String.valueOf(objects[11]);
    				String option4 = String.valueOf(objects[12]);
    				String option5 = String.valueOf(objects[13]);
    				String option6 = String.valueOf(objects[14]);    				
    				
    				UserAnswerResponse testanswer = new UserAnswerResponse();    				
    				testanswer.setTest_id(Integer.parseInt(testId));
    				testanswer.setUser_id(Integer.parseInt(userId));
    				testanswer.setQuestion_id(Integer.parseInt(question_id));
    				testanswer.setQuestion(question);
    				testanswer.setTest_answer(user_answer);    					
    				testanswer.setCorrect_answer(correct_answer); 
    				testanswer.setAnswer_id(Integer.parseInt(answer_id));    			
    					if(correct_or_not.equalsIgnoreCase("1")) {
	    					testanswer.setCorrect_or_not("Y");
	    				}else {
	    					testanswer.setCorrect_or_not("N");
	    				}
    					testanswer.setOption1(option1);
        				testanswer.setOption2(option2);
        				testanswer.setOption3(option3);
        				testanswer.setOption4(option4);
        				testanswer.setOption5(option5);
        				testanswer.setOption6(option6);
    				testuserresponseList.add(testanswer);
    			}		
				
				
				sendEmailUtil.sendTestResult(testUser.getName(),testUser.getEmail(), test.getTest_name(), test.getCreated_date(), total, correct, wrong, percetage,testuserresponseList);
				request.setAttribute("testComment", testComment);
				request.setAttribute("testanswerList", testuserresponseList);	
				request.setAttribute("page", "view-user-answer-list");    
				
    		}
		
		}
	catch(Exception ex)
   	{
		ex.printStackTrace();
   	}
	return "bootcamp.exam.view.result";
	}
	
}
