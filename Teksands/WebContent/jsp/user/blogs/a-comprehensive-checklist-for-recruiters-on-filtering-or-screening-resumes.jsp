<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="course-table clearfix">
	<div class="big-title">
		<h2 class="related-title">
			<span>Course Lessons</span>
		</h2>
	</div><!-- end big-title -->
	<table class="table">
		<thead>
			<tr>
				<th>S.No</th>
				<th>Lesson Title</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>1</td>
				<td><h5 class="margin-0"><b><a href="#introduction" style="color: #222222;">Introduction</a></b></h5>
				</td>
			</tr>
            <tr>
				<td>2</td>
				<td><h5 class="margin-0"><b><a href="#Continuously-Updated" style="color: #222222;">Recruiter Education	</a></b></h5></td>
			</tr>
            <tr>
				<td>3</td>
				<td><h5 class="margin-0"><b><a href="#Team-Productivity" style="color: #222222;">Your Checklist</a></b></h5></td>
			</tr>
				<tr>
				<td>4</td>
				<td><h5 class="margin-0"><b><a href="#conclusion" style="color: #222222;">Conclusion</a></b></h5>
				 </td>
			</tr>           
		</tbody>
	</table>
	

	<h3 id="introduction"><b>Introduction</b></h3>
	
	<p style="text-align: justify;">
       The first stop that a Candidate's Resume makes in an organisation in the entire recruitment process is that of the recruiter's desk. And that is probably the most important one as a bad decision there either loses a great candidate or increases candidate evaluation cost, in the worst case, a bad recruitment decision, the cost of which can sometimes be very high. 
    </p>
   
    <h3 id="Continuously-Updated"><b>Recruiter Education</b></h3>
    
    <p style="text-align: justify;">
		Recruitment is a complex and critical function of any organisation and it is a highly skilled one (Techies thought only theirs are the skilled ones). Recruiters need their skills to be constantly upgraded just as the other professionals they hire. Some quick tips on how you must constantly update yourself to spot the right resume from your input stack:         
    </p>
     <ol style="padding-left: 40px;text-align: justify;">
    	<li> As a recruiter, you need to be aware of the relevant skills ecosystems in your hiring space, e.g., if you are an IT/Tech Recruiter, you need to understand the skills within the Full stack ecosystems - MEAN stack, MERN stack - individual technologies within these stacks, what each of these technologies are used for and so on. There are common tech stacks such as Cloud Stacks, DevOps Stacks, etc. Based on what skills you are hiring for you must continuously upgrade yourself to develop a basic understanding of each of these technologies. You need to have a good understanding of which technologies are used in combination, e.g., languages like Java or frameworks like Angular or React, coupled with DevOps elements and Cloud elements that may comprise the Tech Stack of projects. This knowledge will help you spot skills even when the CV is not well written, will enable you to understand the kind of projects the candidates have done and whether they are relevant to the position you are hiring for, etc.</li><br>
    	<li>The above knowledge will also help you understand skill matches with alternate technologies. E.g., if you are hiring an App developer with the Database needed being Oracle, you must be able to decide that a candidate with MySQL or SQL Server could be equally fit. Without a comprehensive understanding of the Tech ecosystems, you will not be able to make such decisions. A good example from my experience is that I was looking for an Optimisation Engineer for a US-based Boutique AI firm. A key skill was IBM CPLEX, a good read through a resume revealed the person being an experienced Optimization Engineer and a call revealed that the person has indeed worked on CPLEX and bingo.</li><br>
    	<li> If you are hiring for positions that involve managing people and teams, managing customer relationships, developing strategy, etc., you must also update yourself with some study on relevant leadership aspects, strategy and case studies. You should study a few similar profiles from public sources like LinkedIn to understand the roles better and be able to create a persona in your mind about the ideal candidate.</li>    	
    </ol>    
    
    <h3 id="Team-Productivity"><b>Your Checklist</b></h3>    
    
    <ol style="padding-left: 40px;text-align: justify;">
    	<li>Quick Scan - Reject candidates who have applied for the wrong position. Mismatch on experience, skill, skill level, role level, etc.</li><br>
    	<li>Quick Scan - Not enough details on the resume to decide - you may want to call the candidate, double check, and ask them to submit an updated resume if he or she is a fit.<br>
    	<li>Quick Scan - Reject job hoppers, however not before giving very careful consideration to their skills and other traits. There could be valid reasons for job-hopping</li><br>
    	<li>As a recruiter, you need to show a lot of respect to the Resume, and not treat it as a piece of paper or a bag of skill terms to scan through. Study it diligently, look for skills but more importantly, look for a character within the Resume. It is a person you are looking at through the resume. Study it as a human being asking questions about another human being to understand him or her better. Create an Image of the person that the candidate is. That way, you will bring out more from a resume than you would by scanning for words.<br>
    	<li>There is instant gratification in hiring someone who can hit the ground running right away but may bleed you in time in many million ways in the longer term. Refrain from pure skill-match and look for other traits and make a holistic decision.</li><br>
    	<li>Look for academic pedigree and place a bit of importance on it. A lot has been said about its demerit citing examples like Bill Gates being a school dropout (Harvard though). There is some correlation between good academics being an indicator of a good candidate. However, you need to keep things in perspective and do it with caution.</li><br>
    	<li>A base assumption by a recruiter should be that the candidates know what position he or she has applied for. However, this is debatable as hope, fancy and wishful thoughts by candidates often take over common sense making a recruiter's job exponentially difficult. Check for suitable skills match.</li><br>
    	<li>SPOTTING FAKES is a critical attribute of a recruiter. This is possible when you understand the Tech Skills ecosystems and can spot anomalies. Reading well through Resumes is a habit which will also help you spot anomalies and fakes. If your habit is word scanning on CVs, you will never be able to understand skill profiles and spot anomalies.</li><br>
    	<li>There are specific Skill areas where there is a massive percentage of fake candidates and I say it as a fact being in this business. E.g., Fake resumes on Machine Learning / Data Science have flooded the market because of reputed Ed-Techs mis-selling courses giving dream ML job assurances. Our customers love us for not sending them fake ML resumes saving their precious interviewing time. As a recruiter, you need to be able to spot these fakes.</li><br>
    	<li>We know of specific companies and location clusters where fake candidates are churned and fraud or assisted interviews take place. As a recruiter, these must be in your general market knowledge and aid your Resume screening.</li><br>
    	<li>HOT-TIP: Cross-check between the CV and the LinkedIn Profile of the candidate. They should match. Also, candidates without a LinkedIn profile should be double-checked with a recruiter conversation.</li><br>
    	<li>HOT-TIP: Verify the current company to be double sure in case of suspicion. There are fradulant companies that let candidates use their names in their Resume for a small fee. A common indicator of a fraudulent company is that a Google Search on its name brings up non-website URL results at the top of search results.</li><br>
    	<li>A good technique for specific Skill searches on CVs is not the number of times they appear, but their positioning and use in the explanation of assignments and projects. However, not everyone writes Resumes well and there is no alternative to a careful read of the entire Resume.</li><br>
    	<li>HOT-TIP: Verify the current company to be double sure in case of suspicion. There are fradulant companies that let candidates use their names in their Resume for a small fee. A common indicator of a fraudulent company is that a Google Search on its name brings up non-website URL results at the top of search results.</li><br>
    	<li>Look for not more than 60-70% fitment. Businesses should be able to accept a candidate with a reasonable degree of fitment and not aim for 100%. The remaining should be covered with an assessment of the person's ability to learn and adapt.</li><br>
    	<li>Initiatives on continuous learning form a significant indicator of a good candidate. Look for certifications, taking part in contests, hackathons, coding challenges, internships, external projects, etc. These prove the hunger for knowledge of the candidate.</li><br>
    	<li>Working on innovations and improvement initiatives also proves a great indicator as they are evidence of a mindset that challenges the status quo.</li><br>
    	<li>Look for the shapes of the skill set of the candidates. Paradigms change and there is a lot of focus on candidates with T-shaped skills. Evidence of such should be carefully understood from the CV.</li>
    </ol>    
  
	<h3 id="conclusion"><b>Conclusion</b></h3>  

	<p style="text-align: justify;">
	   Teksands provides custom solutions to Enterprises' Talent needs encompassing traditional/lateral Tech Talent sourcing, Research-based Niche skills sourcing, <a href="https://teksands.ai/corporate-training"><b>Corporate Training</b></a> and Bootcamps, and Blended solutions such as HTD (Hire-Train-Deploy). Contact us at info@teksands.ai or visit us at https://teksands.ai.    
	<br>

</div><!-- end course-table -->