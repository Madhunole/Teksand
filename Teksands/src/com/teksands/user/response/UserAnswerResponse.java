package com.teksands.user.response;

import java.util.List;

public class UserAnswerResponse {
	private Integer user_id;
	private Integer test_id;
	private String question_type;
	private Integer question_id;
	private String question;
	private String test_answer;
	private String correct_answer;
	private Integer answer_id;
	private String correct_or_not;
	
	private String option1;
	private String option2;
	private String option3;
	private String option4;
	private String option5;
	private String option6;
	
	
	private List question_ids;
	
	public Integer getUser_id() {
		return user_id;
	}
	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}
	public Integer getTest_id() {
		return test_id;
	}
	public void setTest_id(Integer test_id) {
		this.test_id = test_id;
	}
	
	public String getQuestion_type() {
		return question_type;
	}
	public void setQuestion_type(String question_type) {
		this.question_type = question_type;
	}
	public Integer getQuestion_id() {
		return question_id;
	}
	public void setQuestion_id(Integer question_id) {
		this.question_id = question_id;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getTest_answer() {
		return test_answer;
	}
	public void setTest_answer(String test_answer) {
		this.test_answer = test_answer;
	}
	public String getCorrect_answer() {
		return correct_answer;
	}
	public void setCorrect_answer(String correct_answer) {
		this.correct_answer = correct_answer;
	}
	public Integer getAnswer_id() {
		return answer_id;
	}
	public void setAnswer_id(Integer answer_id) {
		this.answer_id = answer_id;
	}
	public List getQuestion_ids() {
		return question_ids;
	}
	public void setQuestion_ids(List question_ids) {
		this.question_ids = question_ids;
	}
	public String getCorrect_or_not() {
		return correct_or_not;
	}
	public void setCorrect_or_not(String correct_or_not) {
		this.correct_or_not = correct_or_not;
	}
	public String getOption1() {
		return option1;
	}
	public void setOption1(String option1) {
		this.option1 = option1;
	}
	public String getOption2() {
		return option2;
	}
	public void setOption2(String option2) {
		this.option2 = option2;
	}
	public String getOption3() {
		return option3;
	}
	public void setOption3(String option3) {
		this.option3 = option3;
	}
	public String getOption4() {
		return option4;
	}
	public void setOption4(String option4) {
		this.option4 = option4;
	}
	public String getOption5() {
		return option5;
	}
	public void setOption5(String option5) {
		this.option5 = option5;
	}
	public String getOption6() {
		return option6;
	}
	public void setOption6(String option6) {
		this.option6 = option6;
	}	
	
}
