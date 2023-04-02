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
				<td><span style="margin-left: 10px;"><a href="#applications-of-clustering-in-real-world-scenarios" style="color: #222222;">Applications of Clustering in Real-World Scenarios</a></span>
				 </td>
			</tr>
            <tr>
				<td>2</td>
				<td>
                    <h5 class="margin-0"><b><a href="#properties-of-clusters" style="color: #222222;" >Properties of Clusters</a></b></h5>
				</td>
			</tr>
            <tr>
				<td>2.1</td>
				<td><span style="margin-left: 10px;"><a href="#property-1" style="color: #222222;">Property 1</a></span>
				 </td>
			</tr>
            <tr>
				<td>2.2</td>
				<td><span style="margin-left: 10px;"><a href="#property-2" style="color: #222222;">Property 2</a></span>
				 </td>
			</tr>
            <tr>
				<td>3</td>
				<td>
                    <h5 class="margin-0"><b><a href="#" style="color: #222222;">Introduction to K-Means CLustering</a></b></h5>
				</td>
			</tr>
            <tr>
				<td>3.1</td>
				<td><span style="margin-left: 10px;"><a href="#step-1" style="color: #222222;">Step 1</a></span>
				</td>
			</tr>
            <tr>
				<td>3.2</td>
				<td><span style="margin-left: 10px;"><a href="#step-2" style="color: #222222;">Step 2</a></span>
				</td>
			</tr>
            <tr>
				<td>3.3</td>
				<td><span style="margin-left: 10px;"><a href="#step-3" style="color: #222222;">Step 3</a></span>
				</td>
			</tr>
            <tr>
				<td>3.4</td>
				<td><span style="margin-left: 10px;"><a href="#step-4" style="color: #222222;">Step 4</a></span>
				 </td>
			</tr>
            <tr>
				<td>3.5</td>
				<td><span style="margin-left: 10px;"><a href="#step-5" style="color: #222222;">Step 5</a></span>
				 </td>
			</tr>
            <tr>
				<td>3.6</td>
				<td><span style="margin-left: 10px;"><a href="#stopping-criteria-for-k-means-clustering" style="color: #222222;">Stopping Criteria for K-Means Clustering</a></span>
				 </td>
			</tr>
            <tr>
				<td>4</td>
				<td>
                    <h5 class="margin-0"><b><a href="#" style="color: #222222;">K-Means++</a></b></h5>
				</td>
			</tr>
            <tr>
				<td>4.1</td>
				<td><span style="margin-left: 10px;"><a href="#steps-to-initialize" style="color: #222222;">Steps to Initialize</a></span>
				 </td>
			</tr>
            <tr>
				<td>5</td>
				<td>
                    <h5 class="margin-0"><b><a href="#" style="color: #222222;">Implementing K-Means Clustering in Python</a></b></h5>
				</td>
			</tr>
            <tr>
				<td>5.1</td>
				<td><span style="margin-left: 10px;"><a href="#exploratory-data-analysis" style="color: #222222;">Exploratory Data Analysis</a></span>
				 </td>
			</tr>
            <tr>
				<td>5.2</td>
				<td><span style="margin-left: 10px;"><a href="#k-means" style="color: #222222;">K-Means</a></span>
				 </td>
			</tr>
            <tr>
				<td>5.3</td>
				<td><span style="margin-left: 10px;"><a href="#finding-optimum-clusters" style="color: #222222;">Finidng Optimum Clusters</a></span>
				</td>
			</tr>
            <tr>
				<td>6</td>
				<td>
                    <h5 class="margin-0"><b><a href="#conclusion" style="color: #222222;">Conclusion</a></b></h5>
				</td>
			</tr>
		</tbody>
	</table>
	

	<br>
	<h3 id="introduction"><b>Introduction</b></h3>
    <p style="text-align: justify">
        Let's say that we have a dataset where each example has a certain number of features but has no labels. The most important task that we can do on a dataset that does not have labels is to find the data elements of nature and forming a groiup. These are called clusters. K-Means is one of the most popular clustering algorithms. In K-Means we store k-centers which define our clusters. A point is considered to belong to a particular cluster if it is closer to that cluster's center than any other center.
    </p>
    <p style="text-align: justify">
        K-Means finds the best centers for every single point in our dataset by going back and forth between (1) assigning data points to clusters based on the current centers (2) choosing centers based on the current assignment of data points to clusters.
    </p>
    <img style="margin: 0 auto;" src="/resources/images/blogs/understanding-k-means/k-means-1.png" alt="Clusters" class="img-responsive">
    <h4 id="applications-of-clustering-in-real-world-scenarios" style="margin-top: 20px;"><b>Applications of Clustering in Real-World Scenarios</b></h4>
    <ul style="margin-left: 40px;">
        <li>Customer Segmentation</li>
        <li>Document Clustering</li>
        <li>Image Segmentation</li>
        <li>Recommendation Engines</li>
    </ul>

    <br>
    <h3 id="properties-of-clusters"><b>Properties of Clusters</b></h3>
    <p style="text-align: justify;">
        Let's understand the properties of clusters using the example of the below dataset. In this dataset, we have to predict where a person will get a loan or not.
    </p>
    <div style="overflow-x:auto;">
        <table class="table table-bordered table-striped table-responsive">
            <thead>
                <tr>
                    <th style="text-align: center;background-color: #fff;border-right: 1px solid #ddd;">Loan_ID</th>
                    <th style="text-align: center;background-color: #fff;border-right: 1px solid #ddd;">Gender</th>
                    <th style="text-align: center;background-color: #fff;border-right: 1px solid #ddd;">Married</th>
                    <th style="text-align: center;background-color: #fff;border-right: 1px solid #ddd;">Applicant_Income</th>
                    <th style="text-align: center;background-color: #fff;border-right: 1px solid #ddd;">Loan_Amount</th>
                    <th style="text-align: center;background-color: #fff;border-right: 1px solid #ddd;">Loan_Status</th>
                </tr>
            </thead>
            <tbody style="text-align: center;">
                <tr>
                    <td>LP001002</td>
                    <td>Male</td>
                    <td>No</td>
                    <td>5849</td>
                    <td>130.0</td>
                    <td>Y</td>
                </tr>
                <tr>
                    <td>LP001003</td>
                    <td>Male</td>
                    <td>Yes</td>
                    <td>4583</td>
                    <td>128.0</td>
                    <td>N</td>
                </tr>
                <tr>
                    <td>LP001005</td>
                    <td>Male</td>
                    <td>Yes</td>
                    <td>3000</td>
                    <td>66.0</td>
                    <td>Y</td>
                </tr>
                <tr>
                    <td>LP001006</td>
                    <td>Male</td>
                    <td>Yes</td>
                    <td>2583</td>
                    <td>120.0</td>
                    <td>Y</td>
                </tr>
                <tr>
                    <td>LP001008</td>
                    <td>Male</td>
                    <td>No</td>
                    <td>6000</td>
                    <td>141.0</td>
                    <td>Y</td>
                </tr>
            </tbody>
        </table>
    </div>
    <br>
    <img style="margin: 0 auto;" src="/resources/images/blogs/understanding-k-means/k-means-2.png" alt="debt and income graph" class="img-responsive">
    <p style="text-align: justify;">
        Here we can see that on the x-axis we have income and on the y-axis we have debt. In the below diagram we can clearly see the four clusters formed.
    </p>
    <br>
    <img style="margin: 0 auto;" src="/resources/images/blogs/understanding-k-means/k-means-3.png" alt="four clusters are formed" class="img-responsive">
    <h4 id="property-1" style="margin-top: 20px;"><b>Property 1</b></h4>
    <div class="section-title-2 text-center" style="padding: 0 0 0;">
		<p class="lead"><b>
            All the points belonging to a particular cluster should be similar to each other.
        </b></p>
		<hr><br>
	</div>
    <img style="margin: 0 auto;" src="/resources/images/blogs/understanding-k-means/k-means-4.png" alt="similar points are clustered" class="img-responsive">
    <h4 id="property-2" style="margin-top: 20px;"><b>Property 2</b></h4>
    <div class="section-title-2 text-center" style="padding: 0 0 0;">
		<p class="lead"><b>
            The points of different clusters should be as different as possible.
        </b></p>
		<hr><br>
	</div>
    <img style="margin: 0 auto;" src="/resources/images/blogs/understanding-k-means/k-means-5.png" alt="different clusters are clustered differently" class="img-responsive">
    <p style="text-align: justify;">
        Here we have 2 different clusters. In case 1 the clusters are not much apart. This means that the data points are a bit similar in case 1. But in case 2, the clusters are as far apart as possible. This means that the bank would be able to target customers better in case 2.
    </p>

    <br>
    <h3 id="introduction-to-k-means-clustering"><b>Introduction to K-Means Clustering</b></h3>
    <p style="text-align: justify;">
        K-Means is a centroid-based algorithm, in which we calculate the distance of each point from every cluster and assign the point to the cluster which is the closest. The aim of K-Means is to minimize the sum of distances between the points and their respective cluster centers.
    </p>
    <p style="text-align: justify;">
        Let us now understand how K-Means works with the help of an example:
    </p>
    <img style="margin: 0 auto;" src="/resources/images/blogs/understanding-k-means/k-means-6.png" alt="k-means working" class="img-responsive">
    <p style="text-align: justify;">
        Here we have 8 data points and we want to apply K-Means so that we can make clusters for these points. Below are the steps that we need to perform in order to apply K-Means on these points.
    </p>
    <h4 id="step-1" style="margin-top: 20px;"><b>Step 1</b></h4>
    <div class="section-title-2 text-center" style="padding: 0 0 0;">
		<p class="lead"><b>
            Choose the number of clusters.
        </b></p>
		<br>
	</div>
    <p style="text-align: justify;">
        The first step in performing K-Means is that we need to choose the number of clusters, k.
    </p>
    <h4 id="step-2" style="margin-top: 20px;"><b>Step 2</b></h4>
    <div class="section-title-2 text-center" style="padding: 0 0 0;">
		<p class="lead"><b>
            Select k random points from the dataset to make them cluster centers.
        </b></p>
		<br>
	</div>
    <p style="text-align: justify;">
        After selecting the number of clusters we will make, we have to select any k random points in our dataset and make them our cluster centers. Let's say k is 2.
    </p>
    <img style="margin: 0 auto;" src="/resources/images/blogs/understanding-k-means/k-means-7.png" alt="step 2" class="img-responsive">
    <h4 id="step-3" style="margin-top: 20px;"><b>Step 3</b></h4>
    <div class="section-title-2 text-center" style="padding: 0 0 0;">
		<p class="lead"><b>
            Assign all the points to the closest cluster centroid
        </b></p>
		<br>
	</div>
    <p style="text-align: justify;">
        Once we have initialized the centroids, we assign each point to the closest cluster centroid
    </p>
    <img style="margin: 0 auto;" src="/resources/images/blogs/understanding-k-means/k-means-8.png" alt="step 3" class="img-responsive">
    <h4 id="step-4" style="margin-top: 20px;"><b>Step 4</b></h4>
    <div class="section-title-2 text-center" style="padding: 0 0 0;">
		<p class="lead"><b>
            Re-compute the centroids of newly formed clusters
        </b></p>
		<br>
	</div>
    <p style="text-align: justify;">
        Now, once we have assigned all of the points to either cluster, the next step is to compute the centroids of newly formed clusters.
    </p>
    <img style="margin: 0 auto;" src="/resources/images/blogs/understanding-k-means/k-means-9.png" alt="step 4" class="img-responsive">
    <p style="text-align: justify;">
        Here, the red and green crosses are the new centroids.
    </p>
    <h4 id="step-5" style="margin-top: 20px;"><b>Step 5</b></h4>
    <div class="section-title-2 text-center" style="padding: 0 0 0;">
		<p class="lead"><b>
            Repeating steps 3 and 4
        </b></p>
		<br>
	</div>
    <p style="text-align: justify;">
        We then repeat steps 3 and 4.
    </p>
    <img style="margin: 0 auto;" src="/resources/images/blogs/understanding-k-means/k-means-10.png" alt="step 5" class="img-responsive">
    <h4 id="stopping-criteria-for-k-means-clustering" style="margin-top: 20px;"><b>Stopping Criteria for K-Means Clustering</b></h4>
    <p style="text-align: justify;">
        Below are the three stopping criteria for stopping K-Means:
    </p>
    <ol style="padding-left: 40px;">
        <li>Centroids of newly formed clusters do not change</li>
        <li>Points remain in the same cluster</li>
        <li>The maximum number of iterations are reached</li>
    </ol>
    <br>
    <h3><b>K-Means++</b></h3>
    <p style="text-align: justify;">
        K-Means is very sensitive to center initialization. If the cluster center initialization is not appropriate then the clustering is not appropriate. In some cases, the cluster center can get stuck in local minima, and then inappropriate clusters will be formed. This is where K-Means++ helps. K-Means++ gives a method to initialize the cluster centers before moving forward with the standard K-Means clustering algorithm.
    </p>
    <h4 id="steps-to-initialize" style="margin-top: 20px;"><b>Steps to Initialize</b></h4>
    <p style="text-align: justify;">
        The steps to initialize the cluster centers using K-Means++ are:
    </p>
    <ol style="padding-left:40px">
        <li>The first cluster is chosen uniformly at random from the data points that we want to cluster.</li>
        <li>Now, we compute the distance of each data point from the cluster center that has already been chosen.</li>
        <li>Then, we choose the new cluster center from the data points with the probability of the data point being proportional to the square of the distance of the data point from the cluster center.</li>
        <li>We then repeat steps 2 and 3 until k clusters have been chosen.</li>
    </ol>
    <p style="text-align: justify;">
        The K-Means library in sklearn uses K-Means++ for initializing the cluster centers.
    </p>
    <h3 id="implementing-k-means-clustering-in-python"><b>Implementing K-Means Clustering in Python</b></h3>
    <p style="text-align: justify;">
        Now we will see a demo of the K-Means algorithm. In this problem, we will be working on a wholesale customer segmentation problem. The goal of this problem is to divide the clients of a wholesale market on the basis of their annual spending on different product categories, like grocery, milk, etc.
    </p>
    <h4 id="exploratory-data-analysis"><b>Exploratory Data Analysis</b></h4>
    <p style="text-align: justify;">
        We will first import the required libraries:
    </p>
    <pre><code># Here we are importing all the required libraries
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
%matplotlib inline
from sklearn.cluster import K-Means
</code></pre>
    <p style="text-align: justify;">
        Next, let us look at the data of the first five rows:
    </p>
    <pre><code># Here we are reading the csv file using pandas and storing it in a variable called data.

data=pd.read_csv("Wholesale customers data.csv")
data.head()
</code></pre>
    <p style="text-align: justify;"> 
        Output:
    </p>
    <div style="overflow-x:auto;">
        <table class="table table-bordered table-striped table-responsive">
            <thead>
                <tr>
                    <th style="text-align: center;background-color: #fff;border-right: 1px solid #ddd;">Channel</th>
                    <th style="text-align: center;background-color: #fff;border-right: 1px solid #ddd;">Region</th>
                    <th style="text-align: center;background-color: #fff;border-right: 1px solid #ddd;">Fresh</th>
                    <th style="text-align: center;background-color: #fff;border-right: 1px solid #ddd;">Milk</th>
                    <th style="text-align: center;background-color: #fff;border-right: 1px solid #ddd;">Grocery</th>
                    <th style="text-align: center;background-color: #fff;border-right: 1px solid #ddd;">Frozen</th>
                    <th style="text-align: center;background-color: #fff;border-right: 1px solid #ddd;">Detergents_Paper</th>
                    <th style="text-align: center;background-color: #fff;border-right: 1px solid #ddd;" colspan="2">Delicassen</th>
                </tr>
            </thead>
            <tbody style="text-align: center;">
                <tr>
                    <td>count</td>
                    <td>440</td>
                    <td>440</td>
                    <td>440</td>
                    <td>440</td>
                    <td>440</td>
                    <td>440</td>
                    <td>440</td>
                    <td>440</td>
                </tr>
                <tr>
                    <td>mean</td>
                    <td>1.322727</td>
                    <td>2.543182</td>
                    <td>12000.3</td>
                    <td>5796.266</td>
                    <td>7951.277</td>
                    <td>3071.932</td>
                    <td>2881.493</td>
                    <td>1524.87</td>
                </tr>
                <tr>
                    <td>std</td>
                    <td>0.468052</td>
                    <td>0.774272</td>
                    <td>12647.33</td>
                    <td>7380.377</td>
                    <td>9503.163</td>
                    <td>4854.673</td>
                    <td>4767.854</td>
                    <td>2820.106</td>
                </tr>
                <tr>
                    <td>min</td>
                    <td>1</td>
                    <td>1</td>
                    <td>3</td>
                    <td>55</td>
                    <td>3</td>
                    <td>25</td>
                    <td>3</td>
                    <td>3</td>
                </tr>
                <tr>
                    <td>25%</td>
                    <td>1</td>
                    <td>2</td>
                    <td>3127.75</td>
                    <td>1533</td>
                    <td>2153</td>
                    <td>742.25</td>
                    <td>256.75</td>
                    <td>408.25</td>
                </tr>
                <tr>
                    <td>50%</td>
                    <td>1</td>
                    <td>3</td>
                    <td>8504</td>
                    <td>3627</td>
                    <td>4755.5</td>
                    <td>1526</td>
                    <td>816.5</td>
                    <td>965.5</td>
                </tr>
                <tr>
                    <td>75%</td>
                    <td>2</td>
                    <td>3</td>
                    <td>16933.75</td>
                    <td>7190.25</td>
                    <td>10655.75</td>
                    <td>3554.25</td>
                    <td>3922</td>
                    <td>1820.25</td>
                </tr>
                <tr>
                    <td>max</td>
                    <td>2</td>
                    <td>3</td>
                    <td>112151</td>
                    <td>73498</td>
                    <td>92780</td>
                    <td>60869</td>
                    <td>40827</td>
                    <td>47943</td>
                </tr>
            </tbody>
        </table>
    </div>
    <p style="text-align: justify;">
        Here, we can see that we have a lot of variation in the magnitude of the data. We can see that attributes like Channel and Region have low magnitude whereas variables like Fresh, Milk, Grocery, etc. have a high magnitude. This shows that there is a lot of variation in our data.
    </p>
    <p style="text-align: justify;">
        Since K-Means is a distance-based algorithm, this difference of magnitude can create a problem. So let's first bring all the variables to the same magnitude:
    </p>
    <pre><code># Here we are standardizing the data using StandardScaler in sklearn
from sklearn.preprocessing import StandardScaler
scaler = StandardScaler()
data_scaled = scaler.fit_transform(data)

# statistics of scaled data
pd.DataFrame(data_scaled).describe()
</code></pre>
    <p style="text-align: justify;">
        Output:
    </p>
    <div style="overflow-x:auto;">
        <table class="table table-bordered table-striped table-responsive">
            <thead>
                <tr>
                    <th style="text-align: center;background-color: #fff;border-right: 1px solid #ddd;">0</th>
                    <th style="text-align: center;background-color: #fff;border-right: 1px solid #ddd;">1</th>
                    <th style="text-align: center;background-color: #fff;border-right: 1px solid #ddd;">2</th>
                    <th style="text-align: center;background-color: #fff;border-right: 1px solid #ddd;">3</th>
                    <th style="text-align: center;background-color: #fff;border-right: 1px solid #ddd;">4</th>
                    <th style="text-align: center;background-color: #fff;border-right: 1px solid #ddd;">5</th>
                    <th style="text-align: center;background-color: #fff;border-right: 1px solid #ddd;">6</th>
                    <th style="text-align: center;background-color: #fff;border-right: 1px solid #ddd;" colspan="2">7</th>
                </tr>
            </thead>
            <tbody style="text-align: center;">
                <tr>
                    <td>count</td>
                    <td>4.40E+02</td>
                    <td>4.40E+02</td>
                    <td>4.40E+02</td>
                    <td>440</td>
                    <td>4.40E+02</td>
                    <td>4.40E+02</td>
                    <td>4.40E+02</td>
                    <td>4.40E+02</td>
                </tr>
                <tr>
                    <td>mean</td>
                    <td>1.61E-17</td>
                    <td>3.44E-16</td>
                    <td>-3.43E-17</td>
                    <td>0</td>             
                    <td>-4.04E-17</td>
                    <td>3.63E-17</td>                    
                    <td>2.42E-17</td>                    
                    <td>-8.07E-18</td>
                </tr>
                <tr>
                    <td>std</td>
                    <td>1.00E+00</td>
                    <td>1.00E+00</td>
                    <td>1.00E+00</td>
                    <td>1.001138</td>
                    <td>1.00E+00</td>
                    <td>1.00E+00</td>
                    <td>1.00E+00</td>
                    <td>1.00E+00</td>
                </tr>
                <tr>
                    <td>min</td>
                    <td>-6.90E-01</td>
                    <td>########</td>                    
                    <td>-9.50E-01</td>
                    <td>-0.7788</td>                   
                    <td>-8.37E-01</td>
                    <td>-6.28E-01</td>
                    <td>-6.04E-01</td>
                    <td>-5.40E-01</td>                    
                </tr>
                <tr>
                    <td>25%</td>
                    <td>-6.90E-01</td>
                    <td>-7.02E-01</td>
                    <td>-7.02E-01</td>
                    <td>-0.57831</td>                    
                    <td>-6.11E-01</td>
                    <td>-4.80E-01</td>
                    <td>-5.51E-01</td>
                    <td>-3.96E-01</td>                    
                </tr>
                <tr>
                    <td>50%</td>
                    <td>-6.90E-01</td>
                    <td>5.91E-01</td> 
                    <td>-2.77E-01</td>
                    <td>-0.29426</td>                    
                    <td>-3.37E-01</td>
                    <td>-3.19E-01</td>
                    <td>-4.34E-01</td>
                    <td>-1.99E-01</td>                    
                </tr>
                <tr>
                    <td>75%</td>
                    <td>1.45E+00</td>
                    <td>5.91E-01</td>
                    <td>3.91E-01</td>
                    <td>0.189092</td>
                    <td>2.85E-01</td>
                    <td>9.95E-02</td>
                    <td>2.18E-01</td>
                    <td>1.05E-01</td>
                </tr>
                <tr>
                    <td>max</td>
                    <td>1.45E+00</td>
                    <td>5.91E-01</td>
                    <td>7.93E+00</td>
                    <td>9.18365</td>                    
                    <td>8.94E+00</td>
                    <td>1.19E+01</td>
                    <td>7.97E+00</td>
                    <td>1.65E+01</td>
                </tr>
            </tbody>
        </table>
    </div>
    <h4 id="k-means" style="margin-top: 20px;"><b>K-Means</b></h4>
    <p style="text-align: justify;">
        The magnitude looks similar now. Next, let's create a K-Means function and fit it on the data:
    </p>
    <pre><code># Here we are defining our K-Means function and we are initializing our cluster centres using K-Means++

K-Means = K-Means(n_clusters=2, init='K-Means++')

# fitting the k means algorithm on scaled data
K-Means.fit(data_scaled)
</code></pre>
    <p style="text-align: justify;">
        We have initialized two clusters. We have used the K-Means++ initialization which gives better results. Let's evaluate our clusters. To do that, we will calculate the inertia of the clusters. Inertia is the distance between the points in a cluster.
    </p>
    <pre><code>#inertia on the data
K-means.inertia_
    </code></pre>
    <p style="text-align: justify;">
        We got an inertia value of almost 2600.
    </p>

    <h4 id="finding-optimum-clusters" style="margin-top: 20px;"><b>Finding Optimum Clusters</b></h4>
    <p style="text-align: justify;">
        Now we will find the optimum number of clusters.
    </p>
    <p style="text-align: justify;">
        We will first fit multiple K-Means models and in each model, we will increase the number of clusters. We will store the inertia value of each model in a variable and then we will plot the result to find the optimum number of clusters.
    </p>
    <pre><code># fitting multiple K-Means algorithms and storing the values in an empty list
SSE = []
for cluster in range(1,20):
    K-Means = K-Means(n_jobs = -1, n_clusters = cluster, init='K-Means++')
    K-Means.fit(data_scaled)
    SSE.append(K-Means.inertia_)

# converting the results into a dataframe and plotting them
frame = pd.DataFrame({'Cluster':range(1,20), 'SSE':SSE})
plt.figure(figsize=(12,6))
plt.plot(frame['Cluster'], frame['SSE'], marker='o')
plt.xlabel('Number of clusters')
plt.ylabel('Inertia')
</code></pre>
    <p style="text-align: justify;">
        Output:
    </p>
    <img style="margin: 0 auto;" src="/resources/images/blogs/understanding-k-means/k-means-11.png" alt="ineritia vs number of clusters graph" class="img-responsive">
    <p style="text-align: justify;">
        From the curve, we can see that the optimum number of clusters
    </p>
    <pre><code># Now we are making our final K-Means function and initializing our cluster centres using K-Means++

K-Means = K-Means(n_jobs = -1, n_clusters = 5, init='K-Means++')
K-Means.fit(data_scaled)
pred = K-Means.predict(data_scaled)
</code></pre>
    <p style="text-align: justify;">
        Finally, let's look at the value count of points in each of the above-formed clusters:
    </p>
    <pre><code>frame = pd.DataFrame(data_scaled)
frame['cluster'] = pred
frame['cluster'].value_counts()
</code></pre>
    <p style="text-align: justify;"> 
        Output:
    </p>
    <pre>
1    209
0    126
3     91
2     12
4      2
Name: cluster, dtype: int64</pre>
    <p style="text-align: justify;">
        We can see that there are 126 data points belonging to cluster 1 (index 0), then 209 points in cluster 2 (index 1), and so on. We have now implemented K-Means Clustering in Python.
    </p>


<!-- -------------------------------------------------------------- -->

<br>
<h3 id="conclusion"><b>Conclusion</b></h3>  

<p style="text-align: justify;">
    In this article, we learned about the K-Means clustering algorithm. We saw that where K-Means can be used in real life and we also saw how K-Means works. Then we learned about the initialization problem in K-Means which led us to know about K-Means++. Finally, we saw how clustering can be implemented using sklearn.
</p>

<!-- <h4><b>References</b></h4>    

<ol style="padding-left: 40px; text-align: justify;">
<li style="word-break: break-all"><a href="https://www.cs.colostate.edu/~dwhite54/InceptionNetworkOverview.pdf" title="">https://www.cs.colostate.edu/~dwhite54/InceptionNetworkOverview.pdf</a></li>
<li><a href="https://www.coursera.org/lecture/convolutional-neural-networks/inception-network-piR0x" title="">https://www.coursera.org/lecture/convolutional-neural-networks/inception-network-piR0x</a></li>
</ol> -->
<br>

</div><!-- end course-table -->