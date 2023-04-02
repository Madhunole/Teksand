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
				<td><span style="margin-left:10px;"><a href="#applications" style="color: #222222;">Applications</a></span></td>
			</tr>
            <tr>
				<td>1.2</td>
				<td><span style="margin-left:10px;"><a href="#need-for-dbscan" style="color: #222222;">Need for DBSCAN</a></span></td>
			</tr>
			<tr>
				<td>2</td>
				<td><h5 class="margin-0"><b><a href="#human-brain" style="color: #222222;">Human Brain</a></b></h5>
				 </td>
			</tr>
            <tr>
				<td>2.1</td>
				<td><span style="margin-left:10px;"><a href="#parameters" style="color: #222222;">Parameters</a></span></td>
			</tr>
            <tr>
				<td>2.2</td>
				<td><span style="margin-left:10px;"><a href="#working-of-dbscan" style="color: #222222;">Working of DBSCAN</a></span></td>
			</tr>
            <tr>
				<td>2.3</td>
				<td><span style="margin-left:10px;"><a href="#parameter-selection-in-dbscan-clustering" style="color: #222222;">Parameter Selection in DBSCAN Clustering</a></span></td>
			</tr>
            <tr>
                <td>3</td>
                <td>
                    <h5 class="margin-0"><b><a href="#implementation" style="color: #222222;">Implementation</a></b></h5>
                </td>
            </tr>
            <tr>
				<td>3.1</td>
				<td><span style="margin-left:10px;"><a href="#importing-and-preprocessing-dataset" style="color: #222222;">Importing and Preprocessing Dataset</a></span></td>
			</tr>
            <tr>
				<td>3.2</td>
				<td><span style="margin-left:10px;"><a href="#model-creation" style="color: #222222;">Model Creation</a></span></td>
			</tr>
            <tr>
                <td>4</td>
                <td>
                    <h5 class="margin-0"><b><a href="#advantages-and-disadvantages-of-dbscan" style="color: #222222;">Advantages and Disadvantages of DBSCAN</a></b></h5>
                </td>
            </tr>
            <tr>
				<td>4.1</td>
				<td><span style="margin-left:10px;"><a href="#advantages" style="color: #222222;">Advantages</a></span></td>
			</tr>
            <tr>
				<td>4.2</td>
				<td><span style="margin-left:10px;"><a href="#disadvantages" style="color: #222222;">Disadvantages</a></span></td>
			</tr>
			<tr>
				<td>5</td>
				<td><h5 class="margin-0"><b><a href="#conclusion" style="color: #222222;">Conclusion</a></b></h5>
				 </td>
			</tr>
			
		</tbody>
	</table>
	
	<h3 id="introduction"><b>Introduction</b></h3>
    <p style="text-align: justify">
        Clustering is an unsupervised learning technique where we attempt to cluster the points together on the basis of some characteristics. There are several clustering algorithms. Amongst them, Hierarchical and K-Means clustering are widely used. 
    </p>
    <h4 id="applications" style="margin-top: 20px;"><b>Applications</b></h4>
    <p style="text-align: justify;">
        Below is a list of some of the applications of clustering:
    </p>
    <ul style="padding-left: 40px;">
        <li>Document Classification</li>
        <li>Recommendation Engine</li>
        <li>Image Segmentation</li>
        <li>Market Segmentation</li>
        <li>Search Result Grouping</li>
        <li>Anomaly Detection</li>
    </ul>
    <p style="text-align: justify;">
        All the above problems require clustering to solve them. Hence it is necessary to understand the concept of clustering.
    </p>

    <h4 id="need-for-dbscan" style="margin-top: 20px;"><b>Need for DBSCAN</b></h4>
    <p style="text-align: justify;">
        K-Means and Hierarchical Clustering cannot create clusters of random shapes. They are unable to perform clustering wherein densities vary. This is the reason that we need DBSCAN clustering. Below is an example that will help us understand why we need DBSCAN. We have data points that are densely present in the form of concentric circles.
    </p>
    <img class="img-responsive" style="margin: 0 auto; max-width: 480px;" src="/resources/images/blogs/DBSCAN/dbscan-1.png" alt="datapoints densely present in the form of concentric circles">
    <p style="text-align: justify;">
        We can clearly see that there are three different clusters which are in the form of concentric circles. Let us now run K-Means and Hierarchical clustering algorithms and will see how well they can cluster this data.
    </p>
    <img class="img-responsive" style="margin: 0 auto;" src="/resources/images/blogs/DBSCAN/dbscan-2.png" alt="K-means clustering and Hierarchical clustering fails to cluster in concentric circles">
    <br>
    <p style="text-align: justify;">
        The data has noise and we have given a unique color to it. We can clearly see that both K-Means and Hierarchical clustering fail to cluster our data in the form of concentric circles and they are unable to separate the noise from the data. Now let us see how DBSCAN performs.
    </p>
    <img class="img-responsive" style="margin: 0 auto;max-width: 480px;" src="/resources/images/blogs/DBSCAN/dbscan-3.png" alt="DBSCAN accurately clustes the data points including noise">
    <p style="text-align: justify;">
        We can notice that DBSCAN accurately clusters the data points including the noise.
    </p>
    <h3><b>DBSCAN Clustering</b></h3>
    <p style="text-align: justify;">
        DBSCAN stands for Density-Based Spatial Clustering of Applications with Noise. DBSCAN is a density-based clustering algorithm and it works on the assumption that clusters are dense regions that are surrounded by less dense regions. It tries to group the data points which are densely packed together into a single cluster. DBSCAN is able to detect clusters in a large spatial dataset, by looking at the local density of the data points. DBSCAN can also handle outliers. Unlike K-Means we do not need to provide the number of clusters beforehand.
    </p>

    <br>
    <h4 id="parameters" style="margin-top: 20px;"><b>Parameters</b></h4>
    <p style="text-align: justify;">
        We only need to define 2 parameters in DBSCAN which are epsilon and minPoints.
    </p>
    <p style="text-align: justify;">
        <strong>epsilon: </strong>It is the radius of the circle which is to be formed around each point so that we can check the density.
    </p>
    <p style="text-align: justify;">
        <strong>minPoints: </strong>It is the minimum number of data points that are required to be inside the circle so that the data point can be classified as a core point.
    </p>

    <h4 id="working-of-dbscan" style="margin-top: 20px;"><b>Working of DBSCAN</b></h4>
    <p style="text-align: justify;">
        Let us understand how DBSCAN works using the below example.
    </p>
    <img class="img-responsive" style="margin: 0 auto;" src="/resources/images/blogs/DBSCAN/dbscan-4.png" alt="some data points">
    <p style="text-align: justify;">
        Here, we have some data points. Let us understand how DBSCAN will cluster these points.
    </p>
    <p style="text-align: justify;">
        DBSCAN will create a circle that will have a radius of epsilon around every data point and it will classify them into core point, border point, and noise. A data point is classified as a core point if the circle which is formed around it contains at least a 'minPoints' number of points. If the number of points is less than minPoints, then it is classified as border Point, and if there are no other data points around any data point within epsilon radius, then it treated as noise.
    </p>
    <img class="img-responsive" style="margin: 0 auto;" src="/resources/images/blogs/DBSCAN/dbscan-5.png" alt="clusters created using DBSCAN with minPoints = 3">
    <p style="text-align: justify;">
        In the above figure, we can see the clusters created using DBSCAN with minPoints = 3. Here, we have drawn a circle of radius=epsilon around every data point. Using these 2 parameters spatial clusters are created.
    </p>
    <p style="text-align: justify;">
        All the data points which have at least 3 points in the circle including itself are categorized as core points. The core points are represented using red color. All the data points which have less than 3 but more than 1 point in the circle including itself are categorized as border points. All the border points are represented using yellow color. The data points with no point other than itself present inside the circle are considered as noise. The noise is represented by the purple color. For finding the data points, DBSCAN uses Euclidean Distance.
    </p>

    <h4 id="parameter-selection-in-dbscan-clustering"  style="margin-top: 20px;"><b>Parameter Selection in DBSCAN Clustering</b></h4>
    <p style="text-align: justify;">
        DBSCAN is sensitive to the values of epsilon and minPoints. Hence, we need to choose these parameters carefully.  The value of minPoints should be at least one more than the number of dimensions of the dataset, i.e., 
    </p>
    <pre>minPoints >= Dimensions+1</pre>
    <p style="text-align: justify;">
        It is not logical to take minPoints as 1 as it will lead to each point is a separate cluster. Therefore, it should at least be 3. In most cases, it is taken as twice the number of dimensions. But domain knowledge also decides its value.
    </p>
    <p style="text-align: justify;">
        We can decide the value of epsilon using the K-distance graph. The point which has the maximum curvature in the graph will be the value of epsilon. If the value of epsilon that we have chosen is too small then more clusters will be created. But, if we take an epsilon value that is too big then many small clusters might merge into a big cluster.
    </p>
    <h3 id="implementation"><b>Implementation</b></h3>
    <p style="text-align: justify;">
        Here we are creating a sample dataset using scikit-learn. After creating this dataset we will normalize our data. It is important to normalize our data as it makes it easier to find an appropriate epsilon value.
    </p>
    <h4 id="importing-and-preprocessing-dataset" style="margin-top: 20px;"><b>Importing and Preprocessing Dataset</b></h4>
    <p style="text-align: justify;">
        Let us import the libraries we need for this.
    </p>
    <pre><code>#Here we are importing all the libraries that we need in order to implement DBSCAN.

import numpy as np
from sklearn.datasets import make_blobs
from sklearn.preprocessing import StandardScaler
import matplotlib.pyplot as plt
%matplotlib inline
</code></pre>
    <p style="text-align: justify;">
        We will be creating a dataset that would have 3 clusters with and a standard deviation of 0.5 for each cluster. We are taking 400 samples and we also assign three points as the center of the clusters. 
    </p>
    <pre><code>#Here we are visualizing our dataset

plt.figure(figsize=(10,6))
plt.scatter(X[:,0], X[:,1], c=y, cmap='Paired')
plt.show()
</code></pre>
    <img class="img-responsive" style="margin: 0 auto;" src="/resources/images/blogs/DBSCAN/dbscan-6.png" alt="3 clusters formed">
    <h4 id="model-creation" style="margin-top: 20px;"><b>Model Creation</b></h4>
    <p style="text-align: justify;">
        Now we can create our DBSCAN model in order to determine our clusters.
    </p>
    <pre><code>#Here we are importing the DBSCAN model from sklearn. We using the epsilon value as 0.4 and min_samples values as 20

from sklearn.cluster import DBSCAN
db = DBSCAN(eps=0.4, min_samples=20)
db.fit(X)
</code></pre>
    <p style="text-align: justify;">
        We only have to define eps and min_samples parameters. We do not have to specify the number of clusters like in K-Means.
    </p>
    <p style="text-align: justify;">
        Let us now visualize the clusters which were determined by DBSCAN:
    </p>
    <pre><code>#Here we are plotting the clusters which were made determined using DBSCAN

y_pred = db.fit_predict(X)
plt.figure(figsize=(10,6))
plt.scatter(X[:,0], X[:,1],c=y_pred, cmap='Paired')
plt.title("Clusters determined by DBSCAN")
plt.show()
</code></pre>
    <img class="img-responsive" style="margin: 0 auto;" src="/resources/images/blogs/DBSCAN/dbscan-7.png" alt="clusters determined by DBSCAN">
    <p style="text-align: justify;">
        DBSCAN was able to accurately detect the outliers which are marked with blue color. We can see the labels of data points using the labels attribute. Noise is given a -1 label. Let us see the number of outliers in our dataset:
    </p>
    <pre><code>#Here we are seeing how many outliers we have in our dataset

db.labels_[db.labels_ == -1].size
</code></pre>
    <pre>Output: 18</pre>
    <p style="text-align: justify;">
        As we can see that DBSCAN performed very well at finding the outliers which would not be an easy task if we used a partition-based algorithm like K-Means.
    </p>
    <h3 id="advantages-and-disadvantages-of-dbscan"><b>Advantages and Disadvantages of DBSCAN</b></h3>
    <h4 id="advantages" style="margin-top: 20px;"><b>Advantages</b></h4>
    <ul style="padding-left:40px;text-align: justify;">
        <li>In DBSCAN, we do not have to give the number of clusters that we want to form.</li>
        <li>This algorithm performs well with clusters of arbitrary shapes.</li>
        <li>DBSCAN is able to detect outliers.</li>
    </ul>
    <h4 id="disadvantages" style="margin-top: 20px;"><b>Disadvantages</b></h4>
    <ul style="padding-left:40px;text-align: justify;">
        <li>It is not an easy task to find the right number of neighborhoods(eps) and it also requires domain knowledge.</li>
        <li>If the clusters have very different densities then DBSCAN is not well suited to define those clusters. The clusters are defined using the combination of eps and minPts parameters. Since we have to pass one eps and minPts combination to our algorithms, it is not able to generalize the clusters which have very different densities</li>
    </ul>


<!-- -------------------------------------------------------------- -->

<h3 id="conclusion"><b>Conclusion</b></h3>  

<p style="text-align: justify;">
    In this article, we have gone through the working of the DBSCAN algorithm. We have also understood and compared the significance of the DBSCAN algorithm with other clustering algorithms such as K-Means. Further, we have implemented and demonstrated the efficacy of the  DBSCAN algorithm using sklearn.
</p>

<br>

</div><!-- end course-table -->