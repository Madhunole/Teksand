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
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.internal.util.StringHelper;

import com.teksands.bootcamp.model.CmsUser;
import com.teksands.bootcamp.model.Test;
import com.teksands.bootcamp.model.TestAnswer;
import com.teksands.bootcamp.model.TestComment;
import com.teksands.bootcamp.model.TestQuestion;
import com.teksands.bootcamp.model.TestUser;
import com.teksands.bootcamp.model.TkTestResults;
import com.teksands.dbConfig.HibernateUtils;

public class TestMasterDAO {

	public Boolean saveOrUpdateTest(Test test) {

		Boolean result = false;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			session.getTransaction().begin();

			session.saveOrUpdate(test);
			result = true;

			session.getTransaction().commit();
		} catch (Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
			return result;
		}
		return result;
	}

	public Test getTestById(Integer id) {
		Session session = null;
		Query query = null;
		Test test = null;
		try {
			session = HibernateUtils.getSession();
			session.getTransaction().begin();

			query = session.createQuery("from Test where test_id = :test_id");
			query.setParameter("test_id", id);
			if (query.list().size() > 0) {
				test = (Test) query.list().get(0);
			}

			session.getTransaction().commit();
		} catch (Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return test;
	}
	public TkTestResults getTestByTestwithUserId(Integer test_id, Integer user_id) {
		Session session = null;
		Query query = null;
		TkTestResults testResult = null;
		try {
			session = HibernateUtils.getSession();
			session.getTransaction().begin();

			query = session.createQuery("from TkTestResults where test_id = :test_id and user_id = :user_id");
			query.setParameter("test_id", test_id);
			query.setParameter("user_id", user_id);
			if (query.list().size() > 0) {
				testResult = (TkTestResults) query.list().get(0);
			}

			session.getTransaction().commit();
		} catch (Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return testResult;
	}
	
	public Test getTestByAuthCode(String authcode) {
		Session session = null;
		Query query = null;
		Test test = null;
		try {
			session = HibernateUtils.getSession();
			session.getTransaction().begin();

			query = session.createQuery("from Test where auth_code = :auth_code");
			query.setParameter("auth_code", authcode);
			if (query.list().size() > 0) {
				test = (Test) query.list().get(0);
			}

			session.getTransaction().commit();
		} catch (Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return test;
	}
	
	public List<Test> getAllActiveTest() {
		Session session = null;
		Query query = null;
		List<Test> testList = null;

		try {

			session = HibernateUtils.getSession();
			session.getTransaction().begin();

			query = session.createQuery("from Test where active = 1 order by test_id desc");
			testList = query.list();

			session.getTransaction().commit();
		} catch (Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return testList;
	}
	
	public Boolean saveOrUpdateTestQuestion(TestQuestion testQuestion) {

		Boolean result = false;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			session.getTransaction().begin();

			session.saveOrUpdate(testQuestion);
			result = true;

			session.getTransaction().commit();
		} catch (Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
			return result;
		}
		return result;
	}
	
	public List<TestQuestion> getAllTestQuestions() {
		Session session = null;
		Query query = null;
		List<TestQuestion> testQuestionList = null;

		try {

			session = HibernateUtils.getSession();
			session.getTransaction().begin();

			query = session.createQuery("from TestQuestion order by question_id asc");
			testQuestionList = query.list();

			session.getTransaction().commit();
		} catch (Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return testQuestionList;
	}
	
	public List<TestQuestion> getTestQuestionsById(Integer id) {
		Session session = null;
		Query query = null;
		List<TestQuestion> testQuestionList = null;

		try {

			session = HibernateUtils.getSession();
			session.getTransaction().begin();

			query = session.createQuery("from TestQuestion where test_id = :test_id order by question_id asc");
			query.setParameter("test_id", id);
			testQuestionList = query.list();

			session.getTransaction().commit();
		} catch (Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return testQuestionList;
	}
	
	public Boolean deleteQuestionById(Integer id) {
		Boolean result = false;
		Session session = null;
		Query query = null;
		try {
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			System.out.println("id = " + id);
	
			query = session.createQuery("DELETE FROM TestQuestion where question_id = :question_id");
			query.setParameter("question_id", id);
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
	
	public TestQuestion getQuestionsById(Integer id) {
		Session session = null;
		Query query = null;
		TestQuestion testQuestion = null;
		try {
			session = HibernateUtils.getSession();
			session.getTransaction().begin();

			query = session.createQuery("from TestQuestion where question_id = :question_id");
			query.setParameter("question_id", id);
			if (query.list().size() > 0) {
				testQuestion = (TestQuestion) query.list().get(0);
			}

			session.getTransaction().commit();
		} catch (Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return testQuestion;
	}
	public List<TestUser> getAllTestUser() {
		Session session = null;
		Query query = null;
		List<TestUser> testuserList = null;

		try {

			session = HibernateUtils.getSession();
			session.getTransaction().begin();

			query = session.createQuery("from TestUser where active = 1 order by user_id desc");
			testuserList = query.list();

			session.getTransaction().commit();
		} catch (Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return testuserList;
	}		
	public List<Object[]> getAllTestByUserId(Integer user_id) {
		Session session = null;
		Query query = null;
		List<Object[]> testList = null;

		try {

			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			String queryelss = "";
			queryelss += "select t.user_id,t.name,t.email,j.test_id ";
			queryelss += "from tk_test_user t ";
			queryelss += "join json_table(  replace(json_array(t.test_id), ',', '\",\"'),  '$[*]' columns (test_id varchar(50) path '$')) j where t.user_id="+user_id+"";
			query = session.createSQLQuery(queryelss);
			//query = session.createSQLQuery(("select user_id,name,email,test_id from tk_test_user join json_table(  replace(json_array(t.test_id), ',', '","'),  '$[*]' columns (test_id varchar(50) path '$')) j  where t.user_id= 10"));
			//query = session.createSQLQuery("from tk_test_user where user_id= 10");
			testList = query.list();		
			System.out.println("testList size  = "+ testList.size());			
			session.getTransaction().commit();
		} catch (Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return testList;
	}
	public List<Object[]> getAnswerByTestUserId(Integer testId, Integer userId) {
		Session session = null;
		Query query = null;
		List<Object[]> testanswerList = null;

		try {

			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			query = session.createSQLQuery("SELECT tk_test_answer.test_id,tk_test_answer.user_id, tk_test_questions.question_type,tk_test_answer.question_id, tk_test_questions.question, tk_test_answer.correct_answer as user_answer,teksands.tk_test_questions.correct_answer,tk_test_answer.answer_id,tk_test_answer.correct_or_not FROM tk_test_answer INNER JOIN tk_test_questions ON tk_test_answer.question_id = tk_test_questions.question_id\r\n" + 
					"					where tk_test_answer.test_id = '"+testId+"' and tk_test_answer.user_id = '"+userId+"' and tk_test_answer.active = 1 order by tk_test_answer.question_id asc ;\r\n" + 
					"			");
			testanswerList = query.list();

			session.getTransaction().commit();
		} catch (Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return testanswerList;
	}
	
	public List<Object[]> getAnswerByTestUserIdMcq(Integer testId, Integer userId) {
		Session session = null;
		Query query = null;
		List<Object[]> testanswerList = null;

		try {

			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			query = session.createSQLQuery("SELECT tk_test_answer.test_id,tk_test_answer.user_id, tk_test_questions.question_type,tk_test_answer.question_id, tk_test_questions.question, tk_test_answer.correct_answer as user_answer,teksands.tk_test_questions.correct_answer,tk_test_answer.answer_id,tk_test_answer.correct_or_not,tk_test_questions.option1,tk_test_questions.option2,tk_test_questions.option3,tk_test_questions.option4,tk_test_questions.option5,tk_test_questions.option6 FROM tk_test_answer INNER JOIN tk_test_questions ON tk_test_answer.question_id = tk_test_questions.question_id\r\n" + 
					"					where tk_test_answer.test_id = '"+testId+"' and tk_test_answer.user_id = '"+userId+"' and tk_test_questions.question_type = 'mcq' and tk_test_answer.active = 1 order by tk_test_answer.question_id asc ;\r\n" + 
					"			");
			testanswerList = query.list();

			session.getTransaction().commit();
		} catch (Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return testanswerList;
	}
	
	public List<Object[]> getUserListAndAnswerListByTestIdAndUserId(Integer test_id, Integer user_id) {
		Session session = null;
		Query query = null;
		List<Object[]> testanswerList = null;

		try {

			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			query = session.createSQLQuery("SELECT (SELECT question from tk_test_questions where tk_test_questions.question_id = tk_test_answer.question_id ),(SELECT correct_answer from tk_test_questions where tk_test_questions.question_id = tk_test_answer.question_id ),tk_test_answer.question_type,tk_test_answer.correct_answer,tk_test_answer.correct_or_not FROM tk_test_answer where test_id="+test_id+" and user_id="+user_id+" order by tk_test_answer.question_id asc");
			
			testanswerList = query.list();

			session.getTransaction().commit();
		} catch (Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return testanswerList;
	}
	
	public List<TestQuestion> getQuestionByTestId(Integer id) {
		Session session = null;
		Query query = null;
		List<TestQuestion> testQuestion = null;

		try {

			session = HibernateUtils.getSession();
			session.getTransaction().begin();

			query = session.createQuery("from TestQuestion where test_id = :test_id order by question_id asc");
			query.setParameter("test_id", id);
			testQuestion = query.list();

			session.getTransaction().commit();
		} catch (Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return testQuestion;
	}
	
	public List<TestUser> getUserByTestId(String id) {
		Session session = null;
		Query query = null;
		List<TestUser> testUser = null;
		try {
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			query = session.createQuery("from TestUser where test_id like '%"+id+"%' order by created_date desc");
			testUser = query.list();
			session.getTransaction().commit();
		} catch (Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return testUser;
	}
	
	//ExamDAO
	public Boolean saveOrUpdateTestUser(TestUser testUser) {

		Boolean result = false;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			session.getTransaction().begin();

			session.saveOrUpdate(testUser);
			result = true;

			session.getTransaction().commit();
		} catch (Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
			return result;
		}
		return result;
	}
	
	public TestUser getUserById(Integer user_id) {
		Session session = null;
		Query query = null;
		TestUser testUser = null;
		try {
			session = HibernateUtils.getSession();
			session.getTransaction().begin();

			query = session.createQuery("from TestUser where user_id = :user_id");
			query.setParameter("user_id", user_id);
			if (query.list().size() > 0) {
				testUser = (TestUser) query.list().get(0);
			}

			session.getTransaction().commit();
		} catch (Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return testUser;
	}
	
	public TestUser checkIfEmailAlreadyExist(String email) {
		Session session = null;
		Query query = null;
		TestUser testUser = null;
		try {
			session = HibernateUtils.getSession();
			session.getTransaction().begin();

			query = session.createQuery("from TestUser where email = :email");
			query.setParameter("email", email);
			if (query.list().size() > 0) {
				testUser = (TestUser) query.list().get(0);
			}

			session.getTransaction().commit();
		} catch (Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return testUser;
	}
	
	public TestUser checkIfEmailAlreadyExistByTestId(String email,Integer test_id) {
		Session session = null;
		Query query = null;
		TestUser testUser = null;
		try {
			session = HibernateUtils.getSession();
			session.getTransaction().begin();

			query = session.createQuery("from TestUser where email = :email and test_id like '%"+test_id+"%'");
			query.setParameter("email", email);
			
			if (query.list().size() > 0) {
				testUser = (TestUser) query.list().get(0);
			}

			session.getTransaction().commit();
		} catch (Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return testUser;
	}
	
	public TestUser getTestUserById(Integer id) {
		Session session = null;
		Query query = null;
		TestUser testUser = null;
		try {
			session = HibernateUtils.getSession();
			session.getTransaction().begin();

			query = session.createQuery("from TestUser where user_id = :user_id");
			query.setParameter("user_id", id);
			if (query.list().size() > 0) {
				testUser = (TestUser) query.list().get(0);
			}

			session.getTransaction().commit();
		} catch (Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return testUser;
	}
	
	public TestQuestion getQuestionById(Integer id) {
		Session session = null;
		Query query = null;
		TestQuestion testQuestion = null;
		try {
			session = HibernateUtils.getSession();
			session.getTransaction().begin();

			query = session.createQuery("from TestQuestion where question_id = :question_id");
			query.setParameter("question_id", id);
			if (query.list().size() > 0) {
				testQuestion = (TestQuestion) query.list().get(0);
			}

			session.getTransaction().commit();
		} catch (Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return testQuestion;
	}
	
	public TestAnswer checkAnswerIsOrNot(Integer test_id, Integer question_id, Integer user_id) {
		Session session = null;
		Query query = null;
		TestAnswer testAnswer = null;
		try {
			session = HibernateUtils.getSession();
			session.getTransaction().begin();

			query = session.createQuery("from TestAnswer where test_id = :test_id and question_id = :question_id and user_id = :user_id and active=1");
			query.setParameter("test_id", test_id);
			query.setParameter("question_id", question_id);
			query.setParameter("user_id", user_id);
			if (query.list().size() > 0) {
				testAnswer = (TestAnswer) query.list().get(0);
			}

			session.getTransaction().commit();
		} catch (Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return testAnswer;
	}
	
	public Boolean saveOrUpdateAnswer(TestAnswer testAnswer) {

		Boolean result = false;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			session.getTransaction().begin();

			session.saveOrUpdate(testAnswer);
			result = true;

			session.getTransaction().commit();
		} catch (Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
			return result;
		}
		return result;
	}
	
	public Boolean deleteTestById(Integer id) {
		Boolean result = false;
		Session session = null;
		Query query = null;
		try {
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			query = session.createQuery("DELETE FROM Test where test_id = :test_id");
			query.setParameter("test_id", id);
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
	
	public TestAnswer getAnswerById(Integer answer_id) {
		Session session = null;
		Query query = null;
		TestAnswer testAnswer = null;
		try {
			session = HibernateUtils.getSession();
			session.getTransaction().begin();

			query = session.createQuery("from TestAnswer where answer_id = :answer_id");
			query.setParameter("answer_id", answer_id);
			if (query.list().size() > 0) {
				testAnswer = (TestAnswer) query.list().get(0);
			}

			session.getTransaction().commit();
		} catch (Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return testAnswer;
	}
	
	public boolean bulkUploadTestQuestionsByTestId(String filepath, String filename,Integer test_id) throws Exception
	{
		Session session = null;
		TestQuestion testQuestion = null;
		
		String topic = "";
		String question_type = "";
		String question = "";
		String option1 = "";
		String option2 = "";
		String option3 = "";
		String option4 = "";
		String option5 = "";
		String option6 = "";
		String correct_answer = "";
		String mark = "";
		
		try
		{
			session = HibernateUtils.getSession();
			session.getTransaction().begin();

			FileInputStream fis = new FileInputStream(filepath);
			Workbook workbook = null;
			if(filename.toLowerCase().endsWith("xlsx")){
				workbook = new XSSFWorkbook(fis);
			}else if(filename.toLowerCase().endsWith("xls")){
				workbook = new HSSFWorkbook(fis);
			}
			
			Sheet sheet = workbook.getSheetAt(0);
			
			Iterator<Row> rows = sheet.rowIterator(); 
			while( rows.hasNext() ) 
			{   
			   Row row = rows.next();
			   
			   if(row.getRowNum() == 0)
			   {
					continue;
			   }
			   
			   topic = "";
			   question_type = "";
			   question = "";
			   option1 = "";
			   option2 = "";
			   option3 = "";
			   option4 = "";
			   option5 = "";
			   option6 = "";
			   correct_answer = "";
			   mark = "";
			   
			   Iterator<Cell> cells = row.cellIterator();
			   
			   while( cells.hasNext() ) 
			   {
				   Cell cell = cells.next();
				   
				   if(cell.getColumnIndex() == 0)
                   {
                	   topic = getCellValue(cell);
                   }
                   if(cell.getColumnIndex() == 1)
                   {
                	   question_type = getCellValue(cell);
                   }
                   if(cell.getColumnIndex() == 2)
                   {
                	   question = getCellValue(cell);
                   }
                   if(cell.getColumnIndex() == 3)
                   {
                	   option1 = getCellValue(cell);
                   }
                   if(cell.getColumnIndex() == 4)
                   {
                	   option2 = getCellValue(cell);
                   }
                   if(cell.getColumnIndex() == 5)
                   {
                	   option3 = getCellValue(cell);
                   }
                   if(cell.getColumnIndex() == 6)
                   {
                	   option4 = getCellValue(cell);
                   }
                   if(cell.getColumnIndex() == 7)
                   {
                	   option5 = getCellValue(cell);
                   }
                   if(cell.getColumnIndex() == 8)
                   {
                	   option6 = getCellValue(cell);
                   }
                   if(cell.getColumnIndex() == 9)
                   {
                	   correct_answer = getCellValue(cell);
                   }
                   if(cell.getColumnIndex() == 10)
                   {
                	   mark = getCellValue(cell);
                   }
			   }
			   
			   if(StringHelper.isEmpty(question))
			   {
					continue;
			   }
			   
			   testQuestion = new TestQuestion();
               testQuestion.setTest_id(test_id);
               testQuestion.setTopic(topic);
               testQuestion.setQuestion_type(question_type);
               testQuestion.setQuestion(question);
               testQuestion.setOption1(option1);
               testQuestion.setOption2(option2);
               testQuestion.setOption3(option3);
               testQuestion.setOption4(option4);
               testQuestion.setOption5(option5);
               testQuestion.setOption6(option6);
               testQuestion.setCorrect_answer(correct_answer);
               if(mark == "") {
            	   testQuestion.setMark(0);
               }else {
            	   testQuestion.setMark(Integer.parseInt(mark));
               }
               testQuestion.setCreated_date(new Date());
               
               
               System.out.println("test_id = " + test_id);
               System.out.println("topic = " + topic);
               System.out.println("question_type = " + question_type);
               System.out.println("question = " + question);
               System.out.println("option1 = " + option1);
               System.out.println("option2 = " + option2);
               System.out.println("option3 = " + option3);
               System.out.println("option4 = " + option4);
               System.out.println("option5 = " + option5);
               System.out.println("option6 = " + option6);
               System.out.println("correct_answer = " + correct_answer);
               System.out.println("mark = " + mark);
               
               session.save(testQuestion);
			}
			
			session.getTransaction().commit();
			return true;
		}
		catch(Exception ex)
		{
			session.getTransaction().rollback();
			ex.printStackTrace();
			return false;
		}
	}
	
	public boolean bulkUploadTestQuestionsById(File file, Integer test_id) 
	{
		Query query = null;
		Session session = null;
		boolean flag = false;
		
		String topic = "";
		String question_type = "";
		String question = "";
		String option1 = "";
		String option2 = "";
		String option3 = "";
		String option4 = "";
		String option5 = "";
		String option6 = "";
		String correct_answer = "";
		String mark = "";
				
		String filePath = file.getPath();
		String extension = FilenameUtils.getExtension(filePath);
		
		try {
			
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			Calendar cal = Calendar.getInstance();
			Date today = cal.getTime();
			
			HashMap<String, CmsUser> userIDMap = new HashMap<String, CmsUser>();
			
			if(extension.equalsIgnoreCase("xls") || extension.equalsIgnoreCase("xlsx"))
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
		               
		               	topic = "";
		       			question_type = "";
		       			question = "";
		       			option1 = "";
		       			option2 = "";
		       			option3 = "";
		       			option4 = "";
		       			option5 = "";
		       			option6 = "";
		       			correct_answer = "";
		       			mark = "";
		               
		               Iterator<Cell> cells = row.cellIterator();
		               while(cells.hasNext()) 
		               {
		                   HSSFCell cell = (HSSFCell) cells.next();
		                   if(cell.getColumnIndex() == 0)
		                   {
		                	   topic = getCellValue(cell);
		                   }
		                   if(cell.getColumnIndex() == 1)
		                   {
		                	   question_type = getCellValue(cell);
		                   }
		                   if(cell.getColumnIndex() == 2)
		                   {
		                	   question = getCellValue(cell);
		                   }
		                   if(cell.getColumnIndex() == 3)
		                   {
		                	   option1 = getCellValue(cell);
		                   }
		                   if(cell.getColumnIndex() == 4)
		                   {
		                	   option2 = getCellValue(cell);
		                   }
		                   if(cell.getColumnIndex() == 5)
		                   {
		                	   option3 = getCellValue(cell);
		                   }
		                   if(cell.getColumnIndex() == 6)
		                   {
		                	   option4 = getCellValue(cell);
		                   }
		                   if(cell.getColumnIndex() == 7)
		                   {
		                	   option5 = getCellValue(cell);
		                   }
		                   if(cell.getColumnIndex() == 8)
		                   {
		                	   option6 = getCellValue(cell);
		                   }
		                   if(cell.getColumnIndex() == 9)
		                   {
		                	   correct_answer = getCellValue(cell);
		                   }
		                   if(cell.getColumnIndex() == 10)
		                   {
		                	   mark = getCellValue(cell);
		                   }
		               }    
		               
		               TestQuestion testQuestion = new TestQuestion();
		               testQuestion.setTest_id(test_id);
		               testQuestion.setTopic(topic);
		               testQuestion.setQuestion_type(question_type);
		               testQuestion.setQuestion(question);
		               testQuestion.setOption1(option1);
		               testQuestion.setOption2(option2);
		               testQuestion.setOption3(option3);
		               testQuestion.setOption4(option4);
		               testQuestion.setOption5(option5);
		               testQuestion.setOption6(option6);
		               testQuestion.setCorrect_answer(correct_answer);
		               if(mark == "") {
		            	   testQuestion.setMark(0);
		               }else {
		            	   testQuestion.setMark(Integer.parseInt(mark));
		               }
		               testQuestion.setCreated_date(new Date());
		               
		               session.save(testQuestion);
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
	
	public TestComment getCommentByTestIdAndUserId(Integer test_id, Integer user_id)
	{
		Session session = null;
		Query query = null;
		TestComment testComment = null;
		try 
		{
			session = HibernateUtils.getSession();
			session.getTransaction().begin();
			
			query = session.createQuery("from TestComment where user_id = "+user_id+" and test_id = "+test_id+"");
			
			if(query.list().size() > 0) {
				testComment = (TestComment) query.list().get(0);
			}
			
			session.getTransaction().commit();
		}
		catch(Exception ex)
		{
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return testComment;
	}
	
	public Boolean saveOrUpdateTestComment(TestComment testComment) {

		Boolean result = false;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			session.getTransaction().begin();

			session.saveOrUpdate(testComment);
			result = true;

			session.getTransaction().commit();
		} catch (Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
			return result;
		}
		return result;
	}
	
	public List<TestQuestion> getMCQTestQuestionByTestId(Integer test_id) {
		Session session = null;
		Query query = null;
		List<TestQuestion> mcqQuestionList = null;

		try {

			session = HibernateUtils.getSession();
			session.getTransaction().begin();

			query = session.createQuery("from TestQuestion where test_id= :test_id and question_type = 'mcq'");
			query.setParameter("test_id", test_id);
			mcqQuestionList = query.list();

			session.getTransaction().commit();
		} catch (Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return mcqQuestionList;
	}
	
	public List<TestAnswer> getMCQTestAnswersByTestIdAndUserId(Integer test_id, Integer user_id) {
		Session session = null;
		Query query = null;
		List<TestAnswer> mcqAnswerList = null;

		try {

			session = HibernateUtils.getSession();
			session.getTransaction().begin();

			query = session.createQuery("from TestAnswer where test_id = :test_id and user_id= :user_id and question_type = 'mcq'");
			query.setParameter("test_id", test_id);
			query.setParameter("user_id", user_id);
			mcqAnswerList = query.list();

			session.getTransaction().commit();
		} catch (Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return mcqAnswerList;
	}
	
	public TestUser getUserByAuthCode(String auth_code) {
		Session session = null;
		Query query = null;
		TestUser testUser = null;
		try {
			session = HibernateUtils.getSession();
			session.getTransaction().begin();

			query = session.createQuery("from TestUser where auth_code = :auth_code");
			query.setParameter("auth_code", auth_code);
			if (query.list().size() > 0) {
				testUser = (TestUser) query.list().get(0);
			}

			session.getTransaction().commit();
		} catch (Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return testUser;
	}
	
	public TestAnswer getAnswerByTestIdAndUserIdAndQuestionId(Integer test_id, Integer question_id, Integer user_id) {
		Session session = null;
		Query query = null;
		TestAnswer testAnswer = null;
		try {
			session = HibernateUtils.getSession();
			session.getTransaction().begin();

			query = session.createQuery("from TestAnswer where test_id = :test_id and question_id = :question_id and user_id = :user_id");
			query.setParameter("test_id", test_id);
			query.setParameter("question_id", question_id);
			query.setParameter("user_id", user_id);
			if (query.list().size() > 0) {
				testAnswer = (TestAnswer) query.list().get(0);
			}

			session.getTransaction().commit();
		} catch (Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
		}
		return testAnswer;
	}
	public Boolean saveOrUpdateTestResult(TkTestResults testResults) {

		Boolean result = false;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			session.getTransaction().begin();

			session.saveOrUpdate(testResults);
			result = true;

			session.getTransaction().commit();
		} catch (Exception ex) {
			session.getTransaction().rollback();
			ex.printStackTrace();
			return result;
		}
		return result;
	}

}
