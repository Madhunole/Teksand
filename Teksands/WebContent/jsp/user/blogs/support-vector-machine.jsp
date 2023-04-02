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
				<td><h5 class="margin-0"><b><a href="#comparison-of-svm-with-other-ml-algorithms" style="color: #222222;">Residual Block</a></b></h5>
				 </td>
			</tr>
            <tr>
				<td>2.1</td>
				<td><span style="margin-left:10px;"><a href="#svm-vs-naive-bayes" style="color: #222222;">SVM vs Naïve Bayes</a></span></td>
			</tr>
            <tr>
				<td>2.2</td>
				<td><span style="margin-left:10px;"><a href="#svm-vs-logistic-regression" style="color: #222222;">SVM vs Logistic Regression</a></span></td>
			</tr>
            <tr>
				<td>2.3</td>
				<td><span style="margin-left:10px;"><a href="#svm-vs-knn" style="color: #222222;">SVM vs KNN</a></span></td>
			</tr>
			<tr>
				<td>3</td>
				<td>
                    <h5 class="margin-0"><b><a href="#svm" style="color: #222222;" >SVM</a></b></h5>
				</td>
			</tr>
            <tr>
				<td>3.1</td>
				<td><span style="margin-left:10px;"><a href="#hyperplane" style="color: #222222;">Hyperplane</a></span></td>
			</tr>
            <tr>
				<td>3.2</td>
				<td><span style="margin-left:10px;"><a href="#linearly-vs-non-linearly-separable-data" style="color: #222222;">Linearly vs Non-Linearly separable data</a></span></td>
			</tr>
            <tr>
				<td>3.3</td>
				<td><span style="margin-left:10px;"><a href="#support-vectors" style="color: #222222;">Support Vectors</a></span></td>
			</tr>
            <tr>
				<td>3.4</td>
				<td><span style="margin-left:10px;"><a href="#maximum-margin-hyperplane" style="color: #222222;">Maximum Margin Hyperplane</a></span></td>
			</tr>
            <tr>
				<td>3.5</td>
				<td><span style="margin-left:10px;"><a href="#c-value" style="color: #222222;">C value</a></span></td>
			</tr>
            <tr>
				<td>3.6</td>
				<td><span style="margin-left:10px;"><a href="#kernel-trick-in-svm" style="color: #222222;">Kernel Trick in SVM</a></span></td>
			</tr>
            <tr>
                <td>4</td>
                <td>
                    <h5 class="margin-0"><b><a href="#steps-involved-in-making-a-svm-model" style="color: #222222;">Steps involved in making a SVM model</a></b></h5>
                </td>
            </tr>
            <tr>
				<td>4.1</td>
				<td><span style="margin-left:10px;"><a href="#step-1" style="color: #222222;">Step 1</a></span></td>
			</tr>
            <tr>
				<td>4.2</td>
				<td><span style="margin-left:10px;"><a href="#step-2" style="color: #222222;">Step 2</a></span></td>
			</tr>
            <tr>
				<td>4.3</td>
				<td><span style="margin-left:10px;"><a href="#step-3" style="color: #222222;">Step 3</a></span></td>
			</tr>
            <tr>
				<td>4.4</td>
				<td><span style="margin-left:10px;"><a href="#step-4" style="color: #222222;">Step 4</a></span></td>
			</tr>
            <tr>
				<td>4.5</td>
				<td><span style="margin-left:10px;"><a href="#step-5" style="color: #222222;">Step 5</a></span></td>
			</tr>
            <tr>
				<td>4.6</td>
				<td><span style="margin-left:10px;"><a href="#parameters-inside-svm-of-sklearn" style="color: #222222;">Parameters inside SVM of Sklearn</a></span></td>
			</tr>
            <tr>
                <td>5</td>
                <td>
                    <h5 class="margin-0"><b><a href="#project-using-svm" style="color: #222222;">Project using SVM</a></b></h5>
                </td>
            </tr>
            <tr>
				<td>5.1</td>
				<td><span style="margin-left:10px;"><a href="#importing-and-preprocessing-data" style="color: #222222;">Importing and Preproecessing Data</a></span></td>
			</tr>
            <tr>
				<td>5.2</td>
				<td><span style="margin-left:10px;"><a href="#creating-model" style="color: #222222;">Creating Model</a></span></td>
			</tr>
            <tr>
				<td>5.3</td>
				<td><span style="margin-left:10px;"><a href="#hyperparameter-tuning" style="color: #222222;">Hyperparameter Tuning</a></span></td>
			</tr>
			<tr>
				<td>6</td>
				<td><h5 class="margin-0"><b><a href="#conclusion" style="color: #222222;">Conclusion</a></b></h5>
				 </td>
			</tr>
		</tbody>
	</table>
	

	<br>
	<h3 id="introduction"><b>Introduction</b></h3>
	
    <p style="text-align: justify">
        Support Vector Machine or SVM is a popular supervised machine learning algorithm introduced by Vladimir Vapnik and his colleagues in the late '90s. SVMs are considered to be one of the most robust prediction techniques, which is based on statistical analysis. SVMs can be used for both classification and classification tasks. In the SVM algorithm, we plot each training example (having n features) as a point in an n-1 dimensional hyperplane wherein each feature acts as a value for a particular coordinate. SVM works well for both linearly and nonlinearly separable data. The optimum hyperplane is found using the help of support vectors.
    </p>
    <p style="text-align: justify;">
        There are many applications of SVM. One of them is the Facial Expression classifier. Using SVM we can make a classifier that can detect whether a person is happy or sad by training on such images. Here, all the images will be converted to features and our SVM model would train on those images to classify happy and sad images.
    </p>
	<p style="text-align: justify;">
        Another application of SVM is Handwriting classification. SVM model would be able to differentiate between the handwriting of two people. In such a problem our dataset would contain images of the handwriting of two people. We will train our SVM model on these images and it would be able to draw a hyperplane between the two classes.
    </p>

    <br>
	<h3 id="comparison-of-svm-with-other-ml-algorithms"><b>Comparison of SVM with other machine learning algorithms</b></h3>
	
    <h4 style="margin-top: 20px;" id="svm-vs-naive-bayes"><b>SVM VS Naïve Bayes</b></h4>
	<p style="text-align: justify;">
        The difference between the SVM and the Naïve Bayes classifier is from a features point of view. Naïve Bayes treats every feature as independent, whereas SVM sees the interaction between the features to some degree with the help of non-linear kernels (Gaussian, RBF, Poly, etc.). Since SVMs kernels can handle non-linearities in the data, they perform better than Naïve Bayes.
    </p>
    <br>
    <h4 style="margin-top: 20px;" id="svm-vs-logistic-regression"><b>SVM VS Logistic Regression</b></h4>
    <p style="text-align: justify;">
        SVM is a better choice than logistic regression because SVM tries to find the best margin that separates the two classes which reduces the risk of error, while logistic regression does not do that, instead, it can have different decision boundaries with different weights that are near the optimal point. Also, the risk of overfitting is less in SVM as compared to logistic regression.
    </p>
    <br>
    <h4 style="margin-top: 20px;" id="svm-vs-knn"><b>SVM vs KNN</b></h4>
    <p style="text-align: justify;">
        SVM takes care of outliers better than KNN. If there are a large number of features and less training data then SVM is a better classifier.
    </p>
    <br>
    <h3><b>SVM</b></h3>
    <h4 style="margin-top: 20px;" id="hyperplane"><b>Hyperplane</b></h4>
    <p style="text-align: justify;">
        A hyperplane is a plane of n-1 dimensions in an n-dimensional feature space that is used to separate 2 classes. If the number of features in our dataset is 2 then our hyperplane will only be a line, but if the number of features becomes 3 then we would need a 2-dimensional plane to separate the classes. So in this case, our hyperplane will be a 2D plane.
    </p>
    <p style="text-align: justify;">
        Let us look at the below figure to get a better understanding of the hyperplane.
    </p>
    <img src="/resources/images/blogs/support-vector-machine/SVM1.png" a style="max-width: 340px; margin: 0 auto;" alt="Support Vector Machines" class="img-responsive">
    <p style="text-align: justify;">
        This is a dataset that has 2 classes of data. It has 2 features hence it is plotted on a 2-dimensional plane. To classify between them we need a hyperplane (which in this case is a line) that passes between the two classes.
    </p>
    <img src="/resources/images/blogs/support-vector-machine/SVM2.png" alt="support vector machine" style="max-width: 340px; margin: 0 auto;"lt="Hyperplane passing between 2 classes" class="img-responsive">
    <p style="text-align: justify;">
        This is a dataset that has 2 classes of data. It has 3 features hence it is plotted on a 3-dimensional plane. To classify between them we need a hyperplane (which in this case is a plane) that passes between the two classes.
    </p>
    <p style="text-align: justify;">
        Hyperplanes with 3 or more dimensions are difficult to portray or visualize.
    </p>

    <h4 style="margin-top: 20px;" id="linearly-vs-non-linearly-separable-data"><b>Linearly vs Non-Linearly separable data</b></h4>
    <p style="text-align: justify;">
        A dataset is said to be linearly separable if we can draw a straight hyperplane to classify the classes and a dataset where the classes can not separate by a straight line is referred to as non-linear data.
    </p>
    <p style="text-align: justify;">
        Now we will try to visualize linearly and nonlinearly separable datasets. To visualize linearly separable data we will use the make_blobs method inside the sklearn library and to visualize the non-linearly separable data, we will use the make circles method inside sklearn. SVM can find a decision boundary for non-linearly separable very accurately, which is because of the presence of kernels in SVM.
    </p>
    <br>
<pre>
<code>
# Let us make a linearly separable data. The make_blobs library helps to make 
#clusters of data points

from sklearn.datasets import make_blobs
import matplotlib.pyplot as plt

# Here we are making 2 clusters which can be seen by the 'centers' parameter.
# Every data point will have 2 features.
#500 such points will be generated with equal number of data points belonging to 
#each class.

x,y  = make_blobs(n_samples=500,n_features=2,centers=2,random_state=3)

#Now that the clusters are made we can plot them using scatter funtion in matplotlib.
# The first parameter is the first feature in x matrix and second argument is the 
#second feature in the x matrix.
# color of each cluster is going to be decided using the total number of classes, i.e 2 

plt.scatter(x[:,0],x[:,1],c=y,cmap=plt.cm.Accent)
plt.show()

</code>
</pre>
    <p style="text-align: justify;">
        Output:
    </p>
    <img src="/resources/images/blogs/support-vector-machine/SVM1-1.png" style="max-width: 340px; margin: 0 auto;" alt="Linearly separable data" class="img-responsive">
    <p style="text-align: justify;">
        This is linearly separable data as it can be separated using a linear hyperplane (in this case a line).
    </p>
<pre>
<code>
# Let us now make a non- linearly separable data. The make_circles library helps to make concentric of data points

from sklearn.datasets import make_circles
import matplotlib.pyplot as plt

# Here we are making 2 concentric circles 
#500 such points will be generated with equal number of data points belonging to each class.

x,y  = make_circles(n_samples=500, shuffle=True, noise=0.2, random_state=1, factor=0.2)


#Now that the circles are made we can plot them using scatter funtion in matplotlib.
# The first parameter is the first feature in x matrix and second argument is the second feature in the x matrix.
# color of each concentric circle is going to be decided using the total number of classes, i.e 2 

plt.scatter(x[:,0],x[:,1],c=y,cmap=plt.cm.Accent)
plt.show()

</code>
</pre>
    <p style="text-align: justify;">
        Output:
    </p>
    <img src="/resources/images/blogs/support-vector-machine/SVM2-1.png" style="max-width: 340px; margin: 0 auto;" alt="Non-Linearly separable data" class="img-responsive">
    <p style="text-align: justify;">
        This is non-linearly separable data and we can not draw a linear hyperplane to classify these points. In this case, our hyperplane needs to be a circle.
    </p>

    <h4 style="margin-top: 20px;" id="support-vectors"><b>Support Vectors</b></h4>
    <p style="text-align: justify;">
        Support vectors are the points that are closest to the hyperplane. They play a major role in deciding the position and orientation of the hyperplane. Support vectors help to maximize the margin of the classifier.
    </p>

    <h4 style="margin-top: 20px;" id="maximum-margin-hyperplane"><b>Maximum Margin Hyperplane</b></h4>
    <p style="text-align: justify;">
        The goal in SVM is to find the maximum margin hyperplane. It means we have to find a hyperplane, which is farthest from the closest points of both the classes.
    </p>
    <img src="/resources/images/blogs/support-vector-machine/SVM1-2.png" style="max-width: 340px; margin: 0 auto;" alt="Margin hyperplanes" class="img-responsive">
    <p style="text-align: justify;">
        In this figure, line 3 is the maximum margin hyperplane as it is farthest from the support vectors of both the classes.
    </p>
    <p style="text-align: justify;">
        We want our predictions to be confident and correct.Meaning of confidence can be understood from below example.
    </p>
    <p style="text-align: justify;">
        Let a,b,c, be 3 points from a hyperplane. <br>D1= Distance of point 'a' from hyperplane <br>D2= Distance of point 'b' from hyperplane <br>D3= Distance of point 'c' from hyperplane <br>And D1 = 1 unit, D2 = 2 units and D3  = 3 units. <br> So, we are more confident about D3 as it is the farthest from the hyperplane.
    </p>

    <h4 style="margin-top: 20px;" id="c-value"><b>C Value</b></h4>
    <p style="text-align: justify;">
        To get a better classification SVM looks for a maximum margin hyperplane. That is where <strong>'C'</strong> comes into the picture. <strong>'C'</strong> is the penalty parameter of the error term. A small value of C gives a large margin, which means that there will be some misclassification but it will result in higher accuracy on our test data. A large value of C gives a small margin, which means that there will be little to no misclassification, but it will result in lower accuracy on our test data. In general, we should keep our C value low. The optimum value of C for a particular project is decided using hyperparameter tuning.
    </p>

    <h4 style="margin-top: 20px;" id="kernel-trick-in-svm"><b>Kernel Trick in SVM</b></h4>
    <p style="text-align: justify;">
        One of the main advantages that make SVM stand out from other classifiers is that the different kernels it offers. Kernels allow us to project our n-dimensional data on a higher feature space while still operating on the n-dimensional feature space. It means that with the help of kernels we can project 2d data to 3 or more dimensions which makes it easier for the classifier to find an optimum hyperplane, particularly for non-linearly separable data.
    </p>
    <p style="text-align: justify;">
        Below are the list of some of the kernels that SVM has:
    </p>
    <ul style="text-align: justify; padding-left: 40px;list-style: none;">
        <li>
        <strong>Linear Kernel:</strong> A linear kernel is used when we have linearly separable data. It is one of the most commonly used kernels and is mostly used when there are a large number of features in a particular dataset.
        </li>
        <li>
            <strong>Polynomial Kernel:</strong> It transforms our dataset into a higher degree polynomial.
        </li>
        <li>
            <strong>RBF Kernel:</strong> Radial basis function (RBF) kernel is used mainly when data is non-linearly separable.
        </li>
    </ul>
    <p style="text-align: justify;">
        Now let us look at the svm classifier in sklearn.
    </p>
<pre>
<code>
# Here we are making a dataset belonging to 2 classes which are 0 and 1. 
# The dataset has 1000 training points which can be seen from n_samples parameter.
#Every point has 2 features which can be seen from the n_featues parameter


from sklearn.datasets import make_classification 
import matplotlib.pyplot as plt

X,Y=make_classification(n_samples=1000,n_classes=2,n_features=2,n_informative=2,n_redundant=0,random_state=1)
</code>
</pre>
    <br>
    <h3 id="steps-involved-in-making-a-svm-model"><b>Steps involved in making a SVM Model</b></h3>
    <h4 style="margin-top: 20px;" id="step-1"><b>Step 1:</b></h4>
    <p style="text-align: justify;">
        We have to start by importing the dataset, and this can be in the form of a CSV file, excel sheet, or even text file. In this example, we are creating a dummy dataset using the sklearn make_classification method.
    </p>

    <h4 style="margin-top: 20px;" id="step-2"><b>Step 2:</b></h4>
    <p style="text-align:justify">
        We have to perform Exploratory Data Analysis or EDA. In this we visualize the data, clean the data and check for imbalances in the data among other things. Since in this example we have just generated dummy data so we don't have to clean the data or check for any imbalances. We can just visualize it.
    </p>
    <pre><code>
# Here we are visualising our dataset using scatter method in matplotlib.pyplot
# The first parameter is the x coordinate of our graph and the second parameter is the y coordinate. 
# color of each class is going to be decided using the number of classes in Y matrix, i.e 2

plt.scatter(X[:,0],X[:,1],c=Y,cmap=plt.cm.Accent)
plt.plot()
    </code>
    </pre>
    <p style="text-align: justify;">
        Output:
    </p>
    <img src="/resources/images/blogs/support-vector-machine/SVM2-2.png" style="max-width: 340px; margin: 0 auto;" alt="visualising data" class="img-responsive">

    <h4 style="margin-top: 20px;" id="step-3"><b>Step 3:</b></h4>
    <p style="text-align: justify;">
        Now we make a SVM classifier.
    </p>
    <pre><code># Here we are importing the svm classifier from sklearn

from sklearn import svm

# SVC stands for Support Vector Classifier. 
# Here we aren't specifying any parameters inside SVC object. By default SVC has C values as 1.0 and kernel is 'rbf'

svc= svm.SVC()

# Now we are training our classifier on our dummy dataset. 

svc.fit(X,Y)</code></pre>
    <p style="text-align: justify;">
        Output:
    </p>
    <pre> SVC(C=1.0, break_ties=False, cache_size=200, class_weight=None, coef0=0.0,
        decision_function_shape='ovr', degree=3, gamma='scale', kernel='rbf',
        max_iter=-1, probability=False, random_state=None, shrinking=True,
        tol=0.001, verbose=False)</pre>
    <p style="text-align: justify;">
        Our model is now trained.
    </p>

    <h4 style="margin-top: 20px;" id="step-4"><b>Step 4:</b></h4>
    <p style="text-align: justify;">
        Now we will test our classifier.
    </p>
    <pre><code># we are testing our classifier for a dummy point (0,0).
z=svc.predict([[0,0]])
print(z)</code></pre>
    <p style="text-align: justify;">
        Output:
    </p>
    <pre>[0]</pre>
    <p style="text-align: justify;">
        The classifier is predicting that it belongs to 0th class and we can also visualise this prediction.
    </p>
    <pre><code># Here we are visualising our original dataset  along with the test point (0,0).
#The test point will have red color

plt.scatter(X[:,0],X[:,1],c=Y,cmap=plt.cm.Accent)
plt.scatter(0,0,c='red')
plt.plot()</code></pre>
    
    <p style="text-align: justify;">
        Output:
    </p>
    <img src="/resources/images/blogs/support-vector-machine/SVM1-3.png" style="max-width: 340px; margin: 0 auto;" alt="visualising dataset with test point" class="img-responsive">
    
    <h4 style="margin-top: 20px;" id="step-5"><b>Step 5:</b></h4>
    <p style="text-align: justify;">
        After we have made a base model we can start improving our accuracy using hyperparameter tuning.
    </p>

    <br>
    <h4 id="parameters-inside-svm-of-sklearn" style="margin-top: 20px;"><b>Parameters inside SVM of SKLearn</b></h4>

    <p style="text-align:justify">
        NOw we will learn about all the parameters inside SVM classifier of sklearn
    </p>
    <ul style="list-style: none;">
        <li><strong>C:</strong>  It is a regularization parameter. It must be strictly positive. It's default value is 1.0</li>
        <li><strong>Kernel:</strong> This parameter specifies the kernel that should be used in the classifier. Its default value is 'rbf'.</li>
        <li><strong>degree:</strong> It provides the degree of polynomial kernel. It's default value is 3. It is ignored by all other kernels</li>
        <li><strong>gamma:</strong> It provides the kernel coefficient for 'rbf' 'poly' and 'sigmoid' kernels. If gamma='scale' which is the default value then it used 1/(n_features*X.var()) as gamma. If it's auto then it uses 1/n_features.</li>
        <li><strong>coef0:</strong> It is the independent term in the kernel function. It is only significant for 'poly' and 'sigmoid' kernels. Its default value is 0.0</li>
        <li><strong>shrinking:</strong> It is a boolean variable and defines whether to use the shrinking heuristic. Its default value is True.</li>
        <li><strong>probability:</strong> It is a boolean value and it defines whether to enable the probability estimates. Its default value is False. This must be enabled prior to calling fit function.</li>
        <li><strong>tol:</strong> It is the tolerance for stopping criterion. It's default value is 1e-3.</li>
        <li><strong>cache_size:</strong> It specifies the size of the kernel cache (in MB). It's default value is 200.</li>
        <li><strong>class_weight<em>dict</em> or 'balanced', default = None :</strong> It sets the parameter C of class i to class_weight[i]*C for SVC. If not given, all classes are supposed to have weight one. Its default value is None.</li>
        <li><strong>verbose:</strong> It is a boolean variable which enables the verbose output. Its default value is False.</li>
        <li><strong>max_iter:</strong> It is the hard limit on iterations. Its default value is -1.</li>
        <li><strong>decision_function_shape:</strong> This parameter states whether to return a one-vs-rest ('ovr') decision function of shape (n_samples, n_classes) as all other classifiers, or one-vs-one ('ovo') decision function which has shape (n_samples, n_classes * (n_classes - 1) / 2). Its default value is 'ovr' and is ignored for binary classification.</li>
        <li><strong>random_state:</strong> It controls the pseudo random number generation for shuffling the data for probability estimates. Its default value is None.</li>
    </ul>

    <br>
    <h3 id="project-using-svm"><b>Project using SVM</b></h3>
    <p style="text-align: justify;">
        We will now see a Classification problem is solved using an SVM model. In this example, we will be predicting whether a given person has Parkinson's disease or not. In this, we have a dataset of 195 patients having many attributes. The final attribute is status which is our target variable. The status has 2 values 0(patient does not have Parkinson's disease) or 1(patient has Parkinson's disease). This is a binary classification problem.
    </p>
    
    <h4 style="margin-top: 20px;" id="importing-and-preprocessing-data"><b>Importing and Preproecessing Data</b></h4>
    <p style="text-align: justify;">
        We will start by importing all the libraries we need for this project.
    </p>
    <pre><code># Here we are importing all the necessary libraries for our project

import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

# The train_test_split from sklearn library helps us to divide our data into training and test set

from sklearn.model_selection import train_test_split

#Here we are importing the SVM model from sklearn

from sklearn import svm

# GridSearchCV will help us in hyperparameter tuning

from sklearn.model_selection import GridSearchCV</code></pre>

    <p style="text-align: justify;">
        Using the above code we have imported all the libraries that we needed. Now we will import our data which is available in .csv format and store it in a Pandas dataframe.
    </p>
    <pre><code># Here we are reading our data which is in .csv format
#and we are making a Pandas dataframe out of it 
#and storing it in a variable named df.

df=pd.read_csv('parkinsons2.csv')</code></pre>
    <pre><code># This will show the first 5 rows of our dataset, unless specified otherwise

df.head()</code></pre>

    <p style="text-align: justify;">
        Output:
    </p>

    <div style="overflow-x:auto;">
        <table class="table table-bordered table-striped table-responsive">
            <thead>
                <tr>
                    <th style="text-align: center;background-color: #fff;border-right: 1px solid #ddd;">MDVP:Fo(Hz)</th>
                    <th style="text-align: center;background-color: #fff;border-right: 1px solid #ddd;">MDVP:Fhi(Hz)</th>
                    <th style="text-align: center;background-color: #fff;border-right: 1px solid #ddd;">MDVP:Flo(Hz)</th>
                    <th style="text-align: center;background-color: #fff;border-right: 1px solid #ddd;">MDVP:Jitter(%)</th>
                    <th style="text-align: center;background-color: #fff;border-right: 1px solid #ddd;">MDVP:Jitter(Abs)</th>
                    <th style="text-align: center;background-color: #fff;border-right: 1px solid #ddd;">MDVP:RAP</th>
                    <th style="text-align: center;background-color: #fff;border-right: 1px solid #ddd;">MDVP:PPQ</th>
                </tr>
            </thead>
            <tbody style="text-align: center;">
                <tr>
                    <td>119.992</td>
                    <td>157.302</td>
                    <td>74.997</td>
                    <td>0.00784</td>
                    <td>0.00007</td>
                    <td>0.0037</td>
                    <td>0.00554</td>
                </tr>
                <tr>
                    <td>122.4</td>
                    <td>148.65</td>
                    <td>113.819</td>
                    <td>0.00968</td>
                    <td>0.00008</td>
                    <td>0.00465</td>
                    <td>0.00696</td>
                </tr>
                <tr>
                    <td>116.682</td>
                    <td>131.111</td>
                    <td>111.555</td>
                    <td>0.0105</td>
                    <td>0.00009</td>
                    <td>0.00544</td>
                    <td>0.00781</td>
                </tr>
                <tr>
                    <td>116.676</td>
                    <td>137.871</td>
                    <td>111.366</td>
                    <td>0.00997</td>
                    <td>0.00009</td>
                    <td>0.00502</td>
                    <td>0.00698</td>
                </tr>
                <tr>
                    <td>116.014</td>
                    <td>141.781</td>
                    <td>110.655</td>
                    <td>0.01284</td>
                    <td>0.00011</td>
                    <td>0.00655</td>
                    <td>0.00908</td>
                </tr>
            </tbody>
        </table>
    </div>
    <p style="text-align: justify;">
        As we can see our dataset has 23 attributes. The last attribute is our target variable which is status. We will move our target variable out of the dataset and into a separate variable
    </p>
    <p style="text-align: justify;">
        Let us now display the type of columns present in our dataset.
    </p>
    <pre><code># This will display information about all the columns in our dataset.

df.info()</code></pre>
    <p style="text-align: justify;">
        Output:
    </p>
<pre>
&lt;class 'pandas.core.frame.DataFrame'&gt;
RangeIndex: 195 entries, 0 to 194
Data columns (total 23 columns):
MDVP:Fo(Hz)         195 non-null float64
MDVP:Fhi(Hz)        195 non-null float64
MDVP:Flo(Hz)        195 non-null float64
MDVP:Jitter(%)      195 non-null float64
MDVP:Jitter(Abs)    195 non-null float64
MDVP:RAP            195 non-null float64
MDVP:PPQ            195 non-null float64
Jitter:DDP          195 non-null float64
MDVP:Shimmer        195 non-null float64
MDVP:Shimmer(dB)    195 non-null float64
Shimmer:APQ3        195 non-null float64
Shimmer:APQ5        195 non-null float64
MDVP:APQ            195 non-null float64
Shimmer:DDA         195 non-null float64
NHR                 195 non-null float64
HNR                 195 non-null float64
RPDE                195 non-null float64
DFA                 195 non-null float64
spread1             195 non-null float64
spread2             195 non-null float64
D2                  195 non-null float64
PPE                 195 non-null float64
status              195 non-null int64
dtypes: float64(22), int64(1)
memory usage: 35.2 KB
</pre>

    <p style="text-align: justify;">
        From the output we have the following observations:
    </p>
    <ol style="padding-left: 40px;">
        <li>There are 195 data points in our dataset.</li>
        <li>All the attributes are of type float64</li>
        <li>The target variable, i.e. 'status' is of type int64</li>
        <li>There are no null values in our dataset which means that the data is already cleaned. So we can directly start building our model.</li>
    </ol>
    <p style="text-align: justify;">
        We will now move our target variable in a separate variable.
    </p>
    <pre><code># Here we are moving our status variable which is our target variable into a separate variable

y=df.status

#Here we are dropping out the status variable from the DataFrame.

df.drop(['status'],axis=1,inplace=True)
</code></pre>
    <p style="text-align: justify;">
        We have now moved our target variable i.e, status, in a separate variable 'y' and we have dropped the status variable from our dataframe.
    </p>
    <p style="text-align: justify;">
        Now we will find the correlation matrix and will plot the heatmap to see the relationship between variables.
    </p>
<pre><code>#Here we are creating a correlation matrix and a heatmap

corr = df.corr()
plt.subplots(figsize=(30,10))
sns.heatmap( corr, square=True, annot=True,fmt=".1f")
</code></pre>
    <p style="text-align: justify;">
        Output:
    </p>
    <img src="/resources/images/blogs/support-vector-machine/SVM1-4.png" alt="correlation matrix and heatmap" class="img-responsive">
    <p style="text-align: justify;">
        The blocks that are shaded lighter mean that they have higher degree of relation.
    </p>
    <p style="text-align: justify;">
        We will now split our data into training and test sets.
    </p>
<pre><code># Here we are splitting our dataset into training and test sets. 33% of our data will be in the test set and the rest of the data will be used for training

X_train, X_test, y_train, y_test = train_test_split(df, 
                                                    y, 
                                                    test_size=0.33, 
                                                    random_state=42)
</code></pre>

    <h4 style="margin-top: 20px;" id="creating-model"><b>Creating Model</b></h4>
    <p style="text-align: justify;">
        The next step is to create a SVM model and train our data.
    </p>
<pre><code>#Here we are making a SVM classifier. We haven't defined any parameter in our classifier, so the default values will be taken for training  which is C=1.0 and kernel='rbf'.
svc = svm.SVC()
svc.fit(X_train,y_train)
</code></pre>
    <p style="text-align: justify;">
        Output:
    </p>
    <pre>SVC(C=1.0, break_ties=False, cache_size=200, class_weight=None, coef0=0.0,
        decision_function_shape='ovr', degree=3, gamma='scale', kernel='rbf',
        max_iter=-1, probability=False, random_state=None, shrinking=True,
        tol=0.001, verbose=False)
    </pre>
    <p style="text-align: justify;">
        As we can see our model is now trained with C=1.0 and kernel='rbf'
    </p>
    <p style="text-align: justify;">
        Now we have to test our model.
    </p>
    <pre><code># Here we are calculating the score of our model with the help of our test data.

svc.score(X_test,y_test)
</code></pre>
    <p style="text-align: justify;">Output:</p>
    <pre>0.7846153846153846</pre>
    <p style="text-align: justify;">
        The model achieved a score of 78.46% on the test data. 
    </p>
    <h4 style="margin-top: 20px;" id="hyperparameter-tuning"><b>Hyperparameter Tuning</b></h4>
    <p style="text-align: justify;">
        This is our base model. We will now use hyperparameter tuning to get better accuracy. The hyperparameters that we are going to tune are kernel and C values. We are going to use GridSearchCV to tune our parameters. For the kernel, we are taking 'linear', 'rbf', 'poly', and 'sigmoid' kernels. For C value we are taking 0.1, 0.2, 0.5, 1.0, 2.0, 5.0.
    </p>
    <pre><code># Here we are defining a list of parameters that we are going to be tuning using GridSearchCV
# for kernel we are taking 'linear','rbf','poly' and 'sigmoid'
#for C value we are taking 0.1, 0.2, 0.5, 1.0, 2.0, 5.0 
#GridSearchCV will explore all the possible combinations of these parameter and will give us the model which performed the best

params = [
    {
        'kernel':['linear','rbf','poly','sigmoid'],
        'C':[0.1,0.2,0.5,1.0,2.0,5.0]
    }   
]
</code></pre>
    <p style="text-align: justify;">Output:</p>
    <pre>8</pre>
    <p style="text-align: justify;">
        From the output we can see that we have 8 CPUs which means that we can run 8 jobs in parallel
    </p>
    <p style="text-align: justify;">
        Now we will find the best hyperparameters using GridSearchCV.
    </p>
    <pre><code>#Here we are finding the best hyperparameters.
#Our estimator is the SVM object.
# The parameters are the grid defined above.
# We are performing 5 fold cross validation.

gs = GridSearchCV(estimator=svm.SVC(),param_grid=params,scoring="accuracy",cv=5,n_jobs = cpus)

#Here we are training our GridSearchCV model.

gs.fit(X_train,y_train)

# Here we are outputting the parameter of the best estimator

gs.best_estimator_</code></pre>

    <p style="text-align: justify;">
        Output:
    </p>
    <pre>SVC(C=0.5, break_ties=False, cache_size=200, class_weight=None, coef0=0.0,
        decision_function_shape='ovr', degree=3, gamma='scale', kernel='linear',
        max_iter=-1, probability=False, random_state=None, shrinking=True,
        tol=0.001, verbose=False)
    </pre>
    <p style="text-align: justify;">
        Using GridSearchCV we have found the best parameters for our SVM model.As we can see the best accuracy is achieved when we have C=0.5 and kernel='linear'.So, now let us make another SVM object with the above parameters.
    </p>
    <pre><code>#Now we are making a new SVM classifier with C=0.5 and kernel='linear' as these were the values which we calculated by GridSearchCV to have the best result for our classifier.

svc=svm.SVC(C=0.5,kernel='linear')

#Here we are training our model

svc.fit(X_train,y_train)
</code></pre>
    <p style="text-align: justify;">
        Output:
    </p>
    <pre>SVC(C=0.5, break_ties=False, cache_size=200, class_weight=None, coef0=0.0,
        decision_function_shape='ovr', degree=3, gamma='scale', kernel='linear',
        max_iter=-1, probability=False, random_state=None, shrinking=True,
        tol=0.001, verbose=False)
    </pre>
    <p style="text-align: justify;">
        As we can see that our model is now trained after hyperparameter tuning. As calculated by GridSearchCV we have used C=0.5 and kernel='linear'.
    </p>
    <p style="text-align: justify;">
        Now we will test our model and see if our accuracy has improved or not.
    </p>
    <pre><code>svc.score(X_test, y_test)</code></pre>
    <p>Output:</p>
    <pre>0.8461538461538461</pre>
    <p style="text-align: justify;">
        As we can see that using the Hyperparameters as found by GridSearchCV we were able to increase our accuracy from 78.46% to 84.61%.
    </p>
<!-- -------------------------------------------------------------- -->

<br>
<h3 id="conclusion"><b>Conclusion</b></h3>  
<p style="text-align: justify;">
    In this article, we have studied the working of an SVM classifier. We saw its comparison with some other popular machine learning algorithms. We learned how to create and plot linearly and non-linearly separable data using sklearn. We learned about different kernels in SVM. Finally, we made an SVM model which can detect whether a person has Parkinson's disease or not, in which we learned how to use GridSearchCV to find the best hyperparameter for our SVM classifier.
</p>
<h4><b>References</b></h4>    

<ol style="padding-left: 40px; text-align: justify;">
<li style="word-break: break-all"><a href="https://en.wikipedia.org/wiki/Support-vector_machine" title="">https://en.wikipedia.org/wiki/Support-vector_machine</a></li>
</ol>
<br>

</div><!-- end course-table -->