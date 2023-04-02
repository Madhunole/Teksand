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
				<td><span style="margin-left:10px;"><a href="#applications-of-classification" style="color: #222222;">Applications of Classification</a></span></td>
			</tr>
			<tr>
				<td>2</td>
				<td><h5 class="margin-0"><b><a href="#types-of-classifiers" style="color: #222222;">Types of Classifiers</a></b></h5>
				 </td>
			</tr>
            <tr>
				<td>2.1</td>
				<td><span style="margin-left:10px;"><a href="#naive-bayes-classifier" style="color: #222222;">Naive Bayes Classifier</a></span></td>
			</tr>
            <tr>
				<td>2.2</td>
				<td><span style="margin-left:10px;"><a href="#support-vector-machine" style="color: #222222;">Support Vector Machine</a></span></td>
			</tr>
            <tr>
				<td>2.3</td>
				<td><span style="margin-left:10px;"><a href="#k-nearest-neighbours(knn)" style="color: #222222;">K-Nearest Neighbours (KNN)</a></span></td>
			</tr>
            <tr>
				<td>2.4</td>
				<td><span style="margin-left:10px;"><a href="#decision-tree" style="color: #222222;">Decision Tree</a></span></td>
			</tr>
            <tr>
				<td>2.5</td>
				<td><span style="margin-left:10px;"><a href="#random-forest" style="color: #222222;">Random Forest</a></span></td>
			</tr>
			<tr>
				<td>3</td>
				<td><h5 class="margin-0"><b><a href="#performance" style="color: #222222;">Performance</a></b></h5>
				 </td>
			</tr>
			<tr>
				<td>3.1</td>
				<td><span style="margin-left:10px;"><a href="#preprocessing" style="color: #222222;">Preprocessing</a></span></td>
			</tr>
            <tr>
				<td>3.2</td>
				<td><span style="margin-left:10px;"><a href="#calculating-performance-of-different-classifiers" style="color: #222222;">Calculating Performance of Different Classifiers</a></span></td>
			</tr>
            <tr>
				<td>4</td>
				<td><h5 class="margin-0"><b><a href="#conclusion" style="color: #222222;">Conclusion</a></b></h5>
				</td>
			</tr>
		</tbody>
	</table>
	<h3 id="introduction"><b>Introduction</b></h3>
    <p style="text-align: justify">
        Classification is an essential ability of human beings involving recognizing the shared features or the similarities between the elements. The research community is trying its level best to introduce various classification algorithms to solve a day-to-day challenging classification problem. In this article, we will introduce and compare some of the prominent classification algorithms.
    </p>
    <h4 id="applications-of-classification" style="margin-top: 20px;"><b>Applications of Classification</b></h4>
    <ul style="padding-left: 40px;">
        <li>speech recognition</li>
        <li>handwriting recognition and so on.</li>
    </ul>
	<h3 id="types-of-classifiers"><b>Types of Classifiers</b></h3>
    <p style="text-align: justify;">
        <span style="text-decoration: underline;">Binary Classifiers</span>
        : Classification with just 2 different classes. For eg: Male and Female, Spam and Non-spam mail, Positive and Negative sentiment, etc.
    </p>
    <p style="text-align: justify;">
        <span style="text-decoration: underline;">Multi-Class classifiers</span>
        : Classification involving more than  two classes. For eg: Types of soil, Types of music, etc.
    </p>
    <p style="text-align: justify;">
        Here we will look at 5 different classifiers. We will also see their performance on the digits dataset from sklearn. The classifiers we will see are, K-Nearest Neighbours, Naive Bayes, Random Forest, Decision Trees and Support Vector Machines.
    </p>

    <h4 id="naive-bayes-classifier" style="margin-top: 20px;"><b>Naive Bayes Classifier</b></h4>
    <p style="text-align:justify">
        Naive Bayes is a probabilistic classifier which was inspired by the Bayes hypothesis. Under a straightforward suspicion which is the properties are restrictively free.
    </p>
    <img class="img-responsive" style="margin: 0 auto;" src="/resources/images/blogs/Comparison-Of-Classification-Algorithms/comparion-of-classification-algorithms-1.png" alt="Naives Bayes Classifier">
    <p style="text-align: justify;">
        The classification is led by deriving the maximum posterior which is the maximal P(Ci|X) with the above assumption applying to Bayes hypothesis. This assumption enormously diminishes the computational expense by just tallying the class dissemination. Even though the assumption is not valid in most cases as the features are dependent, Naive Bayes is able to perform very well. It is a simple algorithm to implement. It can be scaled to be applied on large datasets since it takes linear time.
    </p>
    <p style="text-align: justify;">
        Naive Bayes tends to suffer from a problem called the zero probability problem. This occurs when the conditional probability is zero for a particular feature. In such cases, the classifier is not able to give a valid prediction. This can be fixed using a Laplacian estimator.
    </p>
    <p style="text-align: justify;">
        <strong>Advantages:</strong> Naive Bayes classifier requires small amount of training data and it is extremely fast as compared to more complex classifiers.
    </p>
    <p style="text-align: justify;">
        <strong>Disadvantages:</strong> Naive Bayes is not a good estimator.
    </p>
    <h4 id="support-vector-machine" style="margin-top: 20px;"><b>Support Vector Machine</b></h4>
    <p style="text-align:justify;">
        Support Vector Machine (SVM) is a supervised machine learning algorithm which can be used for both classification or regression challenges. However, it is mostly used in classification problems. In the SVM algorithm, we plot each data item as a point in n-dimensional space (where n is number of features we have) with the value of each feature being the value of a particular coordinate. Then, we perform classification by finding the hyper-plane that differentiates the two classes very well.
    </p>
    <p style="text-align: justify">
        <strong>Advantages:</strong>  SVM is good for both linearly and nonlinearly separable data. It is effective in high dimensional spaces and it is also memory efficient.
    </p>
    <p style="text-align: justify;">
        <strong>Disadvantages:</strong> SVM does not provide probability estimates directly. They are calculated using five-fold-cross validation.
    </p>
    <img class="img-responsive" style="margin: 0 auto;" src="/resources/images/blogs/Comparison-Of-Classification-Algorithms/comparion-of-classification-algorithms-2.png" alt="SVM">
    <p style="text-align: justify;">
        In the above diagram, H1 is not a good hyperplane as it does not separate the classes. H2 separates both the classes but it has a small margin. H3 is the maximum margin hyperplane.
    </p>
    <p style="text-align: justify;">
        <strong>Parameters of SVM:</strong> There are 3 main parameters which we could tune while constructing a SVM classifier. They are: Type of kerner, Gamma value and C value.
    </p>

    <h4 id="k-nearest-neighbours(knn)" style="margin-top: 20px;"><b>K-Nearest Neighbours(KNN)</b></h4>
    <p style="text-align:justify;">
        KNN classifies an object by taking a majority vote of the object's neighbours. The object is then assigned to the class which is most common among its k nearest neighbour, where k is the integer explicitly defined.
    </p>
    <p style="text-align:justify;">
        KNN is a non-parametric, lazy algorithm. It is non-parametric because it does not make any assumption on data distribution (which means that the data does not have to be normally distributed). It is lazy because it does not learn any model and make generalization of the data, meaning it does not train on any data.
    </p>
    <img class="img-responsive" style="margin: 0 auto;" src="/resources/images/blogs/Comparison-Of-Classification-Algorithms/comparion-of-classification-algorithms-3.png" alt="K nearest neighbours">
    <p style="text-align:justify;">
        Our query point is classified by taking a majority vote of the K nearest neighbours of each point.
    </p>
    <p style="text-align: justify;">
        <strong>Advantages:</strong> KNN is easy to implement, it is can handle noise in data, and it is effective if the data is large.
    </p>
    <p style="text-align: justify;"> 
        <strong>Disadvantages:</strong> We need to determine the optimum value of K and that is computationally expensive.
    </p>

    <h4 id="decision-tree" style="margin-top: 20px;"><b>Decision Tree</b></h4>
    <p style="text-align:justify;">
        Decision Tree, makes decisions using a tree-like model. It splits our dataset into two or more homogeneous sets (or leaves) based on the most significant differentiators in your input variables. In order to pick a differentiator, the decision tree considers all features and does a binary split on them. It will then pick the one with the least cost (i.e. highest accuracy), and repeats recursively, until it successfully splits the data in all leaves (or reaches the maximum depth).
    </p>
    <img class="img-responsive" style="margin: 0 auto;" src="/resources/images/blogs/Comparison-Of-Classification-Algorithms/comparion-of-classification-algorithms-4.png" alt="Decision Tree">
    <p style="text-align: justify;">
        <strong>Advantages:</strong> Decision Tree is easy to understand and visualise, it requires less data preparation, and it can handle both numerical and categorical data.
    </p>
    <p style="text-align: justify;">
        <strong>Disadvantages:</strong> Decision tree can become complex trees which do not generalise well, and they can be unstable as small variations in the data might result in a completely different tree being generated.
    </p>

    <h4 id="random-forest" style="margin-top: 20px;"><b>Random Forest</b></h4>
    <p style="text-align: justify;">
        Random forest is an ensemble model which creates multiple trees and classifies objects based on the "votes" of all the trees. i.e. An object is assigned to a class which has most votes from all the trees. This helps to reduce the problem of overfitting.
    </p>
    <img class="img-responsive" style="margin: 0 auto;" src="/resources/images/blogs/Comparison-Of-Classification-Algorithms/comparion-of-classification-algorithms-5.png" alt="Random forest">
    <p style="text-align: justify;">
        Random forest classifier fits a certain number of decision trees on various samples of datasets and computes their average to improve the predictive accuracy of the model and controls over-fitting. The sub-sample size is always the same as the original input sample size but the samples are drawn with replacement.
    </p>
    <p style="text-align: justify;">
        <strong>Advantages:</strong> Random forest classifier is more accurate than decision trees in most cases and it reduces overfitting.
    </p>
    <p style="text-align: justify;">
        <strong>Disadvantages:</strong> It has slow prediction time.
    </p>

    <h3 id="performance"><b>Performance</b></h3>
    <p style="text-align: justify;">
        Now let us look at how these classifiers perform. We will use the digits dataset in sklearn and we are going to train each classifier on that data. After that we will compute the performance of each classifier.
    </p>
    <pre>#Here we have imported all the libraries required for our analysis
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from sklearn.datasets import load_digits
</pre>
    <p style="text-align: justify;">
        We have imported all the basic libraries that we need for our analysis. Our next step is to import the dataset.
    </p>
    
    <h4 id="preprocessing" style="margin-top: 20px;"><b>Preprocessing</b></h4>
    <pre><code>digits = load_digits()
X = digits.data
Y = digits.target
print(X.shape)
print(Y.shape)
from sklearn.model_selection import train_test_split

X_train, X_test, y_train, y_test = train_test_split(X, Y, test_size=0.5, random_state=0)
</code></pre>
    <p style="text-align: justify;">
        Output:
    </p>
    <pre>(1797, 64)
(1797,64)</pre>
    <p style="text-align: justify;">
        As we can see we have 1797 samples in our dataset. Each sample has 64 features. We will now visualize one of the samples.
    </p>
    <pre>plt.imshow(X[1].reshape(8,8),cmap='gray')
plt.show()
print(Y[1])</pre>
    <p style="text-align: justify;">
        Output:
    </p>
    <img class="img-responsive" style="margin: 0 auto;" src="/resources/images/blogs/Comparison-Of-Classification-Algorithms/comparion-of-classification-algorithms-6.png" alt="Output : 1">
    <p style="text-align: justify;">
        As we can see the image is of the digit 1.
    </p>
    <h4 id="calculating-performance-of-different-classifiers" style="margin-top: 20px;"><b>Calculating Performance of Different Classifiers</b></h4>
    <p style="text-align: justify;">
        We will now train each model on this dataset.
    </p>
    <pre>#Here we are importing KNN classifier from  sklearn and we are training the model on our dataset. Finally we are outputting the score that our model achieved on the test datset.
from sklearn.neighbors import KNeighborsClassifier
neigh = KNeighborsClassifier()
neigh.fit(X_train,y_train)
neigh.score(X_test,y_test)
</pre>
    <p style="text-align: justify;">
        Output:
    </p>
    <pre> 0.9777530589543938</pre>
    <p style="text-align: justify;">
        As we can see, the KNN classifier got an accuracy of 97.75%.
    </p>
    <p style="text-align: justify;">
        Now we will create a Naive Bayes classifier.
    </p>
    <pre>#Here we are importing Gaussian Naive Bayes classifier from  sklearn and we are training the model on our dataset. Finally we are outputting the score that our model achieved on the test datset.

from sklearn.naive_bayes import GaussianNB
gnb = GaussianNB()
gnb.fit(X_train,y_train)
gnb.score(X_test,y_test)
</pre>
    <p style="text-align: justify;">
        Output:
    </p>
    <pre>0.8342602892102335</pre>
    <p style="text-align: justify;">
        As we can see, the Naive Bayes classifier got an accuracy of 83.42%.
    </p>
    <pre>#Here we are importing Decision Tree classifier from  sklearn and we are training the model on our dataset. Finally we are outputting the score that our model achieved on the test datset.

from sklearn.tree import DecisionTreeClassifier
clf = DecisionTreeClassifier()
clf.fit(X_train,y_train)
clf.score(X_test,y_test)
</pre>
    <p style="text-align: justify;">
        Output:
    </p>
    <pre> 0.8331479421579533</pre>
    <p style="text-align: justify;">
        As we can see, the Decision Tree classifier got an accuracy of 83.31%.
    </p>
    <pre>#Here we are importing Random Forest classifier from  sklearn and we are training the model on our dataset. Finally we are outputting the score that our model achieved on the test datset.

        from sklearn.ensemble import RandomForestClassifier
clf = RandomForestClassifier()
clf.fit(X_train, y_train)
clf.score(X_test,y_test)
</pre>
    <p style="text-align: justify;">
        Output:
    </p>
    <pre> 0.967741935483871</pre>
    <p style="text-align: justify;">
        As we can see, the Random Forest classifier got an accuracy of 96.77%.
    </p>
    <pre>#Here we are importing SVM classifier from  sklearn and we are training the model on our dataset. Finally we are outputting the score that our model achieved on the test datset.

from sklearn.svm import SVC
clf =SVC()
clf.fit(X_train, y_train)
clf.score(X_test,y_test)
</pre>
    <p style="text-align: justify;">
        Output:
    </p>
    <pre> 0.9877641824249166</pre>
    <p style="text-align: justify;">
        As we can see, the SVM classifier got an accuracy of 98.77%.
    </p>
<!-- -------------------------------------------------------------- -->

<h3 id="conclusion"><b>Conclusion</b></h3>  

<p style="text-align: justify;">
    We have now seen the performance of all the classifiers that we have discussed and we can clearly see that the SVM classifier has the highest accuracy. It is important to note here that we have used the base model of each classifier. We have not performed any hyperparameter tuning. There is a chance that the performance of each classifier will change after performing hyperparameter tuning.
</p>
<br>

</div><!-- end course-table -->