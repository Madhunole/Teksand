<!DOCTYPE HTML>
<html>
<head>
<style>
body {
	color: #000;
}
.table-striped > tbody > tr:nth-of-type(2n+1) {
    background-color: #f9f9f9;
}
.table-striped > tbody > tr:nth-of-type(2n) {
    background-color: #e9e9e9;
}
.table-striped > tbody > tr > td {
	padding: 0px 3px;
}
.table-striped > thead > tr > th {
	font-size: 8px;
	font-weight: normal;
}
.f-weight-600 {
	font-weight: 600;
}
#footer {
	position: running(footer);
}
@page {
	@bottom-center {
		content: element(footer);
	}
}


.comment-header {
	padding: 0 0 10px 15px !important;
    margin-bottom: 0 !important;
    background-color: #fff !important;
    border-bottom: 1px solid #e3e6f0 !important;
    font-size: 17px !important;
    font-weight: bold !important;
    color: #51abdf !important;
}
.cardmt
{
	margin-top : 34px;
}
#testRes th
{
	color: white !important;
}
.wrapper{
		background-size: auto;
	}
	.exam_report{
		margin: 10% 0 0 !important;
		background-color: #fff;
		border: 2px solid #0000002b;
	}
	.questions_answered{
		margin: 5% 0 !important;
		background-color: #fff;
		border: 2px solid #0000002b;
	}
	.fail{
		color: red;
		font-weight: 600;
	}
	.pass{
		color: green;
		font-weight: 600;
	}
	.no-ul-list{
		list-style-type:none; 
		padding: 0;
	}
	.ques_header{
		border: 1px solid #d9cccc;
		width: 100%;
		padding: 8px;
		background-color: #03b97c;
		font-weight:600;
		color:#000
	}
	.checkbox_container{
		width: 100%;
		padding: 8px 16px;
		font-weight:600;
		color:#000
	}
	.question-answer{
		width: 100%;
		padding: 0;
		font-weight:600;
		color:#000;
		justify-content: center;
	}
	.paragraph{
		padding: 8px;
		font-weight:600;
		color:#073f5a;
	}
	.question{
		width: 100%;
		padding: 8px 16px;
		font-weight:600;
		color:#000;
		background-color:#03b97c;
	}
	.options{
		padding: 16px 16px 8px;
	}
	.quest_num{
		color: #aa3838;
	    font-size: 12px;
	    margin: 8px;
	    font-weight: 800;
	}
 	
	.hide_text{
		display: none;
	}
	.answerKeyHead{
		cursor: pointer;
	}
</style>    
<script>
	function answerKeyView(){
	
	$('.hide_text').toggle()
	$('.show_text').toggle()
}
</script>
</head>
<body>
<div style="font-size: 8px; color: #000; margin-top:-10px;">
	<section>
	<div class="container cardmt">
    <div class="card shadow mb-4">    
        <div class="card-body">
       		<div class="container-fluid">
					<div class="col-lg-12 col-md-12 col-sm-12" style="margin-bottom: 0px">
						<div class="row" style="margin-top:1rem">
							<div style="text-align: center;">
								<h2 class="text-uppercase float-start" style="padding:8px;font-size:18px;margin:12px 0;color: #319bd3;font-weight:600;text-align:center;text-transform: uppercase;">${testName}</h2>
							</div>
						</div>
					</div>					
					<div class="col-lg-12 col-md-12 col-sm-12 " style="padding-top: 2px">
						<div class="row" style="width: auto !important">
							<div class="col-lg-6 col-md-6 col-sm-12" style="color: #000000; font-size: 12px; font-weight: 600;">
								<ul style="list-style-type:none;padding: 0px !important">
							  		<li>
							  			<div class="row">
							  				<div class="col-lg-6 col-md-6 col-sm-6 text-left">Candidate Name : <span style="color: #319bd3; margin-left: 16px">${name}</span></div>
							  			</div> 								  		
							  		</li>
							  		<li>
							  			<div class="row">
							  				<div class="col-lg-6 col-md-6 col-sm-6 text-left">Email : <span style="color: #319bd3; margin-left: 16px">${email}</span> </div>
							  			</div> 
							  		</li>
							  		<li>
							  			<div class="row">
							  				<div class="col-lg-6 col-md-6 col-sm-6 text-left">Test Name : <span style="color: #319bd3; margin-left: 16px">${testName}</span> </div>
							  			</div> 
							  		</li>
								</ul>
							</div>
							<div class="col-lg-6 col-md-6 col-sm-12" style="color: #000000; font-size: 12px; font-weight: 600;">
								<ul style="list-style-type:none;padding: 0px !important">
							  		<li>
							  			<div class="row">
							  				<div class="col-lg-6 col-md-6 col-sm-6 text-left">Examination Date : <span style="color: #319bd3; margin-left: 16px">${test_date?datetime?string('dd-MMM-yyyy')}</span></div>
							  			</div> 
							  		</li>
							  		
							  		<li>
							  			<div class="row">
							  				<div class="col-lg-6 col-md-6 col-sm-6 text-left">Exam Start Time : <span style="color: #319bd3; margin-left: 16px">16:13:54</span></div>
							  			</div> 
							  		</li>
							  		
							  		<li>
							  			<div class="row">
							  				<div class="col-lg-6 col-md-6 col-sm-6 text-left">Exam End Time : <span style="color: #319bd3; margin-left: 16px">16:14:11</span></div>
							  			</div> 
							  		</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="col-lg-12 col-md-12 col-sm-12" style="padding-right: 6px; padding-left: 6px;">
						<div class="table-responsive" > 
							<table class="table table-bordered" id = "testRes" style="font-size: 12px;width: 100%;text-align: center;">
								<thead class="thead-dark" style="background: -webkit-linear-gradient(#379ed7, #379ed7);">
								  <tr>
								    <th class="text-left">Total Number of MCQs:</th>
								    <th class="text-center">Total Correct:</th>
								    <th class="text-center">Total Wrong:</th>		
								      <th class="text-center">Percentage:</th>								   
								  </tr>
								</thead>
								<tbody>
								  <tr style="font-weight:900">
								    <td class="text-left">${mcQtotal}</td>
									<td class="text-center">${mcQcorrect}</td>	
									<td class="text-center">${mcQWrong}</td>		
									<td class="text-center">${mcPercetage}</td>										
								  </tr>
								</tbody>
							</table>
						</div>
					</div>					
				</div>
        	        <div class="multisteps_form position-relative">
				<div class="col-lg-12 col-md-12 col-sm-12">
					<div>
						<#if (mcQtotal > 0)>		
							<div style="padding:8px;font-size: 17px;margin:12px 0;color: #319bd2;font-weight:600;text-align:center">
								<span> Answer Key </span>
							</div>
						
						<div id="viewAnswers" style=" padding: 16px 0; color: #000000; font-size: 12px; font-weight: 600;">
							<div>		
							  	<#list testanswerList as obj>
									<div class="question-answer">
										<input type="hidden" id="txt_ques_id${obj.question_id}" value="${obj.question_id}">
										<div class="question"><span class="quest_num"> </span> <span>${obj.question}</span></div>
										<div class="options">
													<ul class= "no-ul-list">
														<#if obj.option1?has_content>	
															<li>																
																<#if obj.option1 == obj.test_answer>																		
																	<input id="a1-${obj.question_id}" class="checkbox-custom" checked="checked" type="radio" name='option${obj.question_id}' value='${obj.option1}'>  ${obj.option1}																
																<#else>
																	<input id="a1-${obj.question_id}" class="checkbox-custom" disabled type="radio" name='option${obj.question_id}' value='${obj.option1}'> ${obj.option1}
																</#if>
															</li>
														</#if>
														<#if obj.option2?has_content>
															<li>
																<#if obj.option2 == obj.test_answer>	
																	<input id="a2-${obj.question_id}" class="checkbox-custom" checked="checked" type="radio" name='option${obj.question_id}' value='${obj.option2}'>  ${obj.option2}
																
																<#else>
																	<input id="a2-${obj.question_id}" class="checkbox-custom" disabled type="radio" name='option${obj.question_id}' value='${obj.option2}'>  ${obj.option2}																	
																</#if>
															</li>
														</#if>	
														<#if obj.option3?has_content>
															<li>												
																<#if obj.option3 == obj.test_answer>																			
																	<input id="a3-${obj.question_id}" class="checkbox-custom" checked="checked" type="radio" name='option${obj.question_id}' value='${obj.option3}'>  ${obj.option3}
																
																<#else>
																	<input id="a3-${obj.question_id}" class="checkbox-custom" disabled type="radio" name='option${obj.question_id}' value='${obj.option3}'>  ${obj.option3}
																</#if>
															</li>
														</#if>	
														<#if obj.option4?has_content>															
															<li>	
																<#if obj.option4 == obj.test_answer>																			
																	<input id="a4-${obj.question_id}" class="checkbox-custom" checked="checked" type="radio" name='option${obj.question_id}' value='${obj.option4}'>  ${obj.option4}
																
																<#else>
																	<input id="a4-${obj.question_id}" class="checkbox-custom" disabled type="radio" name='option${obj.question_id}' value='${obj.option4}'>  ${obj.option4}
																</#if>
															</li>
														</#if>	
														<#if obj.option5?has_content>	
															<li>	
																<#if obj.option5 == obj.test_answer>	
																	<input id="a4-${obj.question_id}" class="checkbox-custom" checked="checked" type="radio" name='option${obj.question_id}' value='${obj.option5}'>  ${obj.option5}
																
																<#else>
																	<input id="a4-${obj.question_id}" class="checkbox-custom" disabled type="radio" name='option${obj.question_id}' value='${obj.option5}'>  ${obj.option5}
																</#if>
															</li>
														</#if>	
														<#if obj.option6?has_content>														
															<li>	
																<#if obj.option6 == obj.test_answer>	
																	<input id="a4-${obj.question_id}" class="checkbox-custom" checked="checked" type="radio" name='option${obj.question_id}' value='${obj.option6}'>  ${obj.option6}
																
																<#else>
																	<input id="a4-${obj.question_id}" class="checkbox-custom" disabled type="radio" name='option${obj.question_id}' value='${obj.option6}'>  ${obj.option6}
																</#if>
															</li>
														</#if>			
													</ul>
												</div>
												<#if obj.correct_or_not == 'N'>														
													<div style="color: red; ; font-weight: 600; padding: 0px 16px 8px;">WRONG ANSWER</div>
													<div style="color: #3cab3c; font-weight: 600; padding: 0px 16px 8px;">CORRECT ANSWER IS : ${obj.correct_answer}</div>
												
												<#else>
													<div style="color: #3cab3c; font-weight: 600; padding: 0px 16px 8px;">CORRECT ANSWER</div>
												</#if>
									</div>																
								</#list>
							</div>
						</div>
						</#if>
					</div>
				</div>
			</div>
        </div>
    </div>
</div>
	</section>
</div>
</body>
</html>