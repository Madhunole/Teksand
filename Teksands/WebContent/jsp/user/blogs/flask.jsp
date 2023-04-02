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
				<td>1.1</td>
				<td><span style="margin-left:10px;"><a href="#what-is-model-deployment" style="color: #222222;">What is Model Deployment?</a></span></td>
			</tr>
            <tr>
				<td>1.2</td>
				<td><span style="margin-left:10px;"><a href="#what-is-flask" style="color: #222222;">What is Flask?</a></span></td>
			</tr>
            <tr>
				<td>1.3</td>
				<td><span style="margin-left:10px;"><a href="#installing-flask-on-your-machine" style="color: #222222;">Installing Flask on your Machine</a></span></td>
			</tr>
			<tr>
				<td>2</td>
				<td><h5 class="margin-0"><b><a href="#implementation" style="color: #222222;">Implementation</a></b></h5>
				 </td>
			</tr>
            <tr>
				<td>2.1</td>
				<td><span style="margin-left:10px;"><a href="#importing-libraries" style="color: #222222;">Importing Libraries</a></span></td>
			</tr>
            <tr>
				<td>2.2</td>
				<td><span style="margin-left:10px;"><a href="#importing-dataset" style="color: #222222;">Importing Dataset</a></span></td>
			</tr>
            <tr>
				<td>2.3</td>
				<td><span style="margin-left:10px;"><a href="#label-encoding" style="color: #222222;">Label Encoding</a></span></td>
			</tr>
            <tr>
				<td>2.4</td>
				<td><span style="margin-left:10px;"><a href="#model" style="color: #222222;">Model</a></span></td>
			</tr>
            <tr>
				<td>2.5</td>
				<td><span style="margin-left:10px;"><a href="#saving" style="color: #222222;">Saving</a></span></td>
			</tr>
            <tr>
				<td>2.6</td>
				<td><span style="margin-left:10px;"><a href="#template" style="color: #222222;">Template</a></span></td>
			</tr>
            <tr>
				<td>2.7</td>
				<td><span style="margin-left:10px;"><a href="#flask-deployment" style="color: #222222;">Flask Deployment</a></span></td>
			</tr>
			<tr>
				<td>3</td>
				<td><h5 class="margin-0"><b><a href="#conclusion" style="color: #222222;">Conclusion</a></b></h5>
				 </td>
			</tr>
			
		</tbody>
	</table>
	

	<h3 id="introduction"><b>Introduction</b></h3>
	<p style="text-align: justify;">
        We are all interested in solving the real-life, challenging problem with machine learning and deep learning, but most of the time our solution will remain in terms of code, which most of the time the end-users will not understand or may feel difficult to use. This is where the flask comes into the picture.  Flask will provide a way to embed an ML model into the Web Application. 
    </p>
    <img class="img-responsive" style="margin:0 auto;" src="/resources/images/blogs/flask/flask-1.png" alt="flask">
    <h4 id="what-is-model-deployment" style="margin-top: 20px;"><b>What is Model Deployment?</b></h4>
    <p style="text-align: justify;">
        Generally, in any data science project, we begin with defining the problem statement, followed by data collection, data preparation, exploratory data analysis, and model building by choosing an appropriate algorithm. Finally, we want our model to be available for the end-users so that they can make use of it. Deploying the model is the last stage of any data science project.
    </p>
    
    <h4 id="what-is-flask"><b>What is Flask?</b></h4>
    <p style="text-align: justify;">
        Flask is a web application framework which is written in python. It has many modules in it which makes it easier for a web developer to make an application, without worrying much about the details such as protocol management etc. Flask gives a variety of choices for developing web applications and it gives us the necessary tools and libraries that allow us to build a web application.
    </p>
    <img class="img-responsive" style="margin:0 auto;" src="/resources/images/blogs/flask/flask-2.png" alt="flask logo">
    <h4 id="installing-flask-on-your-machine" style="margin-top: 20px;"><b>Installing Flask on your Machine</b></h4>
    <p style="text-align: justify;">
        Installing Flask is simple and straightforward. Here, I am assuming you already have Python 3 and pip installed. To install Flask, you need to run the following command:
    </p>
    <pre>sudo apt-get install python3-flask</pre>
    <p style="text-align: justify;">
        Now we can start deploying our machine learning models using flask.
    </p>

    <h3 id="implementation"><b>Implementation</b></h3>
    <p style="text-align: justify;">
        Let us now create a Body Mass Index calculator using Flask.
    </p>
    <h4 id="importing-libraries" style="margin-top: 20px;"><b>Importing Libraries</b></h4>
    <p style="text-align: justify;">
        We will first create a machine learning model which will be able to calculate BMI using Height, Weight and Gender and then we will deploy that model using flask.
    </p>
    <pre><code>#Here we are importing the libraries that we need for this project
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import pickle
</code></pre>
    <h4 id="importing-dataset" style="margin-top: 20px;"><b>Importing Dataset</b></h4>
    <p style="text-align: justify;">
        Now that we have imported all the necessary libraries, let us now import our dataset.
    </p>
    <pre><code>#Here we are importing our dataset and storing it in a variable called df. Then we are viewing the first 5 rows of that dataset.

df=pd.read_csv('500_Person_Gender_Height_Weight_Index.csv')
df.head()
</code></pre>
    <p style="text-align: justify;">
        Output:
    </p>
    <div style="overflow-x:auto;">
        <table class="table table-bordered table-striped table-responsive ">
      <thead>
        <tr>
              <th style="text-align: center;background-color: #fff;border-right: 1px solid #ddd;"></th>
              <th style="text-align: center;background-color: #fff;border-right: 1px solid #ddd;">Gender</th>
              <th style="text-align: center;background-color: #fff;border-right: 1px solid #ddd;">Height</th>
              <th style="text-align: center;background-color: #fff;border-right: 1px solid #ddd;">Weight</th>
              <th style="text-align: center;background-color: #fff;border-right: 1px solid #ddd;">Index</th>
        </tr>
      </thead>
      <tbody style="text-align: center;">
          <tr>
              <td>0</td>
              <td>Male</td>
              <td>174</td>
              <td>96</td>
              <td>4</td>
          </tr>
          <tr>
              <td>1</td>
              <td>Male</td>
              <td>189</td>
              <td>87</td>
              <td>2</td>
          </tr>
          <tr>
              <td>2</td>
              <td>Female</td>
              <td>185</td>
              <td>110</td>
              <td>4</td>
          </tr>
          <tr>
              <td>3</td>
              <td>Female</td>
              <td>195</td>
              <td>104</td>
              <td>3</td>
          </tr>
          <tr>
            <td>4</td>
            <td>Male</td>
            <td>149</td>
            <td>61</td>
            <td>3</td>
        </tr>
      </tbody>
      </table>
        
    </div>
    <p style="text-align: justify;">
        As we can see, we have 3 independent variables which are Gender, Height and Weight and one dependent variable which is Index.
    </p>
    <h4 id="label-encoding" style="margin-top: 20px;"><b>Label Encoding</b></h4>
    <p style="text-align: justify;">
        We can see that the Gender variable is in string format, so we need to convert it to numbers. We will do this using the LabelEncoder library in sklearn.
    </p>
    <p style="text-align: justify;">
        Let us now encode our Gender variable.
    </p>
    <pre><code>#Here we are encoding the Gender variable.

from sklearn import preprocessing
le = preprocessing.LabelEncoder()
df.Gender=le.fit_transform(df.Gender)
df.head()
</code></pre>
    <p style="text-align: justify;">
        Output:
    </p>
    <div style="overflow-x:auto;">
        <table class="table table-bordered table-striped table-responsive ">
      <thead>
        <tr>
              <th style="text-align: center;background-color: #fff;border-right: 1px solid #ddd;"></th>
              <th style="text-align: center;background-color: #fff;border-right: 1px solid #ddd;">Gender</th>
              <th style="text-align: center;background-color: #fff;border-right: 1px solid #ddd;">Height</th>
              <th style="text-align: center;background-color: #fff;border-right: 1px solid #ddd;">Weight</th>
              <th style="text-align: center;background-color: #fff;border-right: 1px solid #ddd;">Index</th>
        </tr>
      </thead>
      <tbody style="text-align: center;">
          <tr>
              <td>0</td>
              <td>1</td>
              <td>174</td>
              <td>96</td>
              <td>4</td>
          </tr>
          <tr>
              <td>1</td>
              <td>1</td>
              <td>189</td>
              <td>87</td>
              <td>2</td>
          </tr>
          <tr>
              <td>2</td>
              <td>0</td>
              <td>185</td>
              <td>110</td>
              <td>4</td>
          </tr>
          <tr>
              <td>3</td>
              <td>0</td>
              <td>195</td>
              <td>104</td>
              <td>3</td>
          </tr>
          <tr>
            <td>4</td>
            <td>1</td>
            <td>149</td>
            <td>61</td>
            <td>3</td>
        </tr>
      </tbody>
      </table>
        
    </div>
    <p style="text-align: justify;">
        As we can see that the Gender variable is now encoded. Male has been assigned the code 1 and female has been assigned the code 0.
    </p>
    <h4 id="model" style="margin-top: 20px;"><b>Model</b></h4>
    <p style="text-align: justify;">
        Let us now create our model. For the purposes of this demonstration of flask, we will use a linear regression model.
    </p>
    <pre><code>#Here we are creating, training and testing a very simple LinearRegression model.

from sklearn.linear_model import LinearRegression
reg = LinearRegression().fit(df.drop(['Index'],axis=1),df['Index'])
reg.score(df.drop(['Index'],axis=1),df['Index'])
</code></pre>
    <p style="text-align: justify;">
        Output:
    </p>
    <pre>0.8260932372756102</pre>
    <p style="text-align: justify;">
        As we can see that we have achieved a score of 82.609%.
    </p>
    <h4 id="saving" style="margin-top: 20px;"><b>Saving</b></h4>
    <p style="text-align: justify;">
        Let us now save our model. For this we will be using the pickle library.
    </p>
    <pre><code>#Here we are saving our model

import pickle
pickle.dump(reg,open('model.pkl','wb'))
</code></pre>
    <p style="text-align: justify;">
        We have now saved our model. The name of the model file is model.pkl.
    </p>
    <p style="text-align: justify;">
        Let us now deploy this using flask.
    </p>
    <h4 id="template" style="margin-top: 20px;"><b>Template</b></h4>
    <p style="text-align: justify;">
        Firstly let us create the website.
    </p>
    <p style="text-align: justify;">
        The below HTML code shows the layout of our website. This is a very simple layout. We have created 3 inputs which are weight, height and gender. This will be entered by the user.
    </p>
    <pre><code>&lt;!DOCTYPE html&gt;
&lt;html&gt;
&lt;head&gt;
    
    &lt;title&gt;BMI&lt;/title&gt;
&lt;/head&gt;

&lt;body&gt;
    &lt;h1&gt;&lt;b&gt;&lt;i&gt;&lt;em&gt;BMI&lt;/em&gt;&lt;/i&gt;&lt;/b&gt;&lt;/h1&gt;
&lt;form method="POST",action="/"&gt;
    
    &lt;div&gt;
    &lt;div&gt;
        &lt;h3&gt;Enter Your Weight &lt;/h3&gt;
    &lt;input type="number" name="weight" placeholder="Weight" &gt;
    &lt;/div&gt;
    &lt;div &gt;
        &lt;h3&gt;Enter Your Height&lt;/h3&gt;
    &lt;input type="number" name="height" placeholder="Height"&gt;
    &lt;/div&gt;
    &lt;div &gt;
        &lt;h3&gt;Enter Your Gender: 1 for Male and 0 for female &lt;/h3&gt;
    &lt;input type="number" name="gender" placeholder="Gender" &gt;
    &lt;/div&gt;
    &lt;/div&gt;
    
    
    &lt;div&gt;
    &lt;input type="submit"&gt;
    &lt;/div&gt;
    
    {% if bmi %} 
        &lt;h2&gt; Your BMI Is: {{bmi}} &lt;/h2&gt;
    {% endif %}
&lt;/form&gt;
&lt;/body&gt;
&lt;/html&gt;
</code></pre>
    <p style="text-align: justify;">
        Now our html file is created. We are saving it with the name 'index.html'. A requirement of flask is that all our templates, which are the html files, need to be moved in a folder called 'templates'.
    </p>
    <h4 id="flask-deployment" style="margin-top: 20px;"><b>Flask Deployment</b></h4>
    <p style="text-align: justify">
        Now that we have created our template, let us deploy our model using flask.
    </p>
    <p style="text-align: justify;">
        We will create a python file.
    </p>
    <pre><code>#Here we are importing flask

from flask import Flask, request, render_template

import sklearn
import joblib
import pandas as pd
import numpy as np

#We are creating an object of Flask with the name 'app'
app = Flask(__name__)

#Here we are loading our regression model using joblib.
model = joblib.load("model.pkl")


@app.route("/")
def home():
    return render_template("index.html")

@app.route("/",methods=["POST"])
def predict():
    if request.method=="POST":
        Weight=request.form['weight']
        Height=request.form['height']
        Gender=request.form['gender']
        
        prediction=model.predict([[Gender,Height,Weight]])
        output=round(prediction[0],2)
    return render_template("index.html",bmi=prediction[0])

if __name__ == "__main__":
    app.run(debug=True)
</code></pre>
    <p style="text-align: justify;">
        At every stage we need to define the route that we need to take in flask. This is done using the route function. So, when we open our webpage we are going to render the index.html template.
    </p>
    <p style="text-align: justify;">
        Now, when the form is submitted we are going to fetch the inputs entered by the user and store it in 3 varia.bles. After that we are going to predict the BMI index based on the input.
    </p>
    <img class="img-responsive" style="margin:0 auto;" src="/resources/images/blogs/flask/flask-3.png" alt="deployed output">
    <p style="text-align: justify;">
        This is how we can deploy our machine learning model into production in the browser by using the flask framework.
    </p>
<!-- -------------------------------------------------------------- -->

<h3 id="conclusion"><b>Conclusion</b></h3>  

<p style="text-align: justify;">
    In this article, we have seen how to deploy a model using the flask library. Also, we have demonstrated how to use the flask library to deploy the machine learning model. We hope this tutorial will help deploy your projects.
    <strong>Happy Learning!</strong></p>
<br>

</div><!-- end course-table -->