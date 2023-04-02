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
				<td><h5 class="margin-0"><b><a href="#overview-of-imbalanced-class-problem" style="color: #222222;">Overview of Imbalanced Class Problem</a></b></h5>
				 </td>
			</tr>
			<tr>
                <td>3</td>
				<td><h5 class="margin-0"><b><a href="#methods-to-tackle-imbalanced-class-problem" style="color: #222222;">Methods to Tackle Imbalanced Class Problem</a></b></h5>
                </td>
			</tr>
            <tr>
                <td>3.1</td>
                <td><span style="margin-left:10px;"><a href="#performance-metric" style="color: #222222;">Performance Metric</a></span></td>
            </tr>
            <tr>
                <td>3.2</td>
                <td><span style="margin-left:10px;"><a href="#random-under-sampling" style="color: #222222;">Random Under Sampling</a></span></td>
            </tr>
            <tr>
                <td>3.3</td>
                <td><span style="margin-left:10px;"><a href="#random-oversampling" style="color: #222222;">Random Oversampling</a></span></td>
            </tr>
            <tr>
                <td>3.4</td>
                <td><span style="margin-left:10px;"><a href="#hyperparameters" style="color: #222222;">Hyperparameters</a></span></td>
            </tr>
            <tr>
                <td>3.5</td>
                <td><span style="margin-left:10px;"><a href="#using-tree-based-models" style="color: #222222;">Using Tree-Based Models</a></span></td>
            </tr>
            <tr>
                <td>3.6</td>
                <td><span style="margin-left:10px;"><a href="#synthetic-minority-oversampling-trachnique(smote)" style="color: #222222;">Synthetic Minority Oversampling Technique(SMOTE)</a></span></td>
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
        Accuracy is a common metric that comes to everyone's mind when we talk about the performance of a model or algorithm on a classification task. But accuracy is not a good metric when we deal with imbalanced data where the distribution of the data points belonging to the classes are not equal sampled or distributed. Imbalanced data problems are commonly seen in the case of classification tasks, image segmentation and need to be addressed at the start of the model-building stage itself. If not taken care of it can lead to models with a large bias towards a particular class. We'll talk more about this in the upcoming sections along with methods to solve imbalance class classification tasks. Let's get started.
    </p>


    <h3 id="overview-of-imbalanced-class-problem"><b>Overview of Imbalanced Class Problem</b></h3>
    <p style="text-align: justify;">
        We all have seen problems where one class has more observations than other classes. This can happen due to many reasons including the rarity of observations of one class, ease of capturing data for a class, etc. Some common examples include fraud detection, cancer detection, spam filtering, advertising clicks, etc. Have a look at the following bar graph drawn using a fraud detection dataset:
    </p>
    <img src="/resources/images/blogs/Handling-Imbalanced-Datasets/handling-imbalanced-datasets-1.png" alt="fraud detection" class="img-responsive" style="margin: 0 auto;">
    <p style="text-align: justify;">
        You can clearly see that the number of fraud classes is very less and such exploratory analysis is very crucial for every classification task. Imbalanced data can hamper the prediction ability of our model resulting in accuracy values that are not credible. This happens because our model can simply predict the majority class every time and get higher accuracy but on most occasions, our purpose is to capture observations from minority class which is not fulfilled here. This happens with imbalanced datasets as most of the algorithms are developed to maximize accuracy and reduce errors.  In the upcoming section, we'll have a  look at different methods to tackle imbalanced class datasets.
    </p>
    <h3 id="methods-to-tackle-imbalanced-class-problem"><b>Methods to tackle Imbalanced Class Problem</b></h3>
    <p style="text-align: justify;">
        There are many ways to handle the imbalanced class problem and we'll start with some common mistakes done while facing imbalanced class problems:
    </p>
    <h4 id="performance-metric" style="margin-top: 20px;"><b>1. Performance Metric</b></h4>
    <p style="text-align: justify;">
        This arguably the most common error done by beginners as they tend to ignore the fact that accuracy is not the suitable metric while dealing with imbalanced class problems. What can go wrong is that the classifier can always predict the frequently appearing class leading to an accuracy score that's high. This issue can be easily resolved by using other metrics such as precision, recall, f1 score, Area Under ROC curve, confusion matrix, etc. We won't go into the details of these metrics in this section but the following is a code snippet to implement roc_auc metric (assume clf is our classification model, X is input feature vector, y is class probabilities):
    </p>
    <pre><code>from sklearn.metrics import roc_auc_score

pred_y = clf.predict_proba(X)
roc_auc_score(y, pred_y)
</code></pre>
    <h4 id="random-under-sampling" style="margin-top: 20px;"><b>2. Random Under Sampling</b></h4>
    <p style="text-align: justify;">
        This method can be used when we have large amounts of data and removing some rows might not lead to loss of information. In this method, some observations from the majority class are removed to reduce the imbalance in the dataset to some extent. Have a look at the following code snippet for the same (assume 'data' is a pandas data frame having class label 0 and 1 in column 'class', also assume 0 label corresponds to minority class):
    </p>
    <pre>from sklearn.utils import resample

#separate class
class_0 = data[data['Class']]== 0]
class_1 = data[data['Class']]== 1]
df_under_1 = resample(class_1, 
                    replace=True,
                    n_samples=n_samples_after_resampling
                )
df_undersampled = pd.concat(
                    [df_under_1,class_0]
                )
    </pre>
    <h4 id="random-oversampling" style="margin-top: 20px;"><b>3. Random Over Sampling</b></h4>
    <p style="text-align: justify;">
        This method is used to increase the observations of the minority classes. There are many ways of doing this but the simplest is by randomly duplicating observations with replacement. Following is the code snippet to do so:
    </p>
    <pre>from sklearn.utils import resample

#separate class
class_0 = data[data['Class']]== 0]
class_1 = data[data['Class']]== 1]
df_over_0 = resample(
                class_0, 
                replace=True,
                n_samples=n_samples_after_resampling
            )
df_oversampled = pd.concat(
                    [df_over_0, class_1]
                )
    </pre>
    <h4 id="hyperparameters" style="margin-top: 20px;"><b>4. Hyperparameters</b></h4>
    <p style="text-align: justify;">
        Many classification algorithms come with hyperparameters that can be set equal to the ratio classes (only for binary classification problems) or to some other value which tells the model that the dataset is imbalanced. For example, in tree-based models, the hyperparameter scal_pos_weight can be set to a ratio of minority to majority classes for imbalanced data. These hyperparameters then add some weight to observations of undersampled class so the model doesn't overlook them while training. Following is an example for the same where we set class_weight of SVM to 'balanced' to tell out model that our dataset is not imbalanced:
    </p>
    <pre><code>from sklearn.svm import SVC

clf = SVC(
    kernel='rbf',
    #telling the model about imbalance
    class_weight = 'balanced',
        probability = True
    )
    </code></pre>
    <h4 id="using-tree-based-models" style="margin-top: 20px;"><b>5. Using Tree-Based Models</b></h4>
    <p style="text-align: justify;">
        It has been shown that tree-based models have a really good performance while handling imbalanced datasets. This happens because they have a hierarchical structure where each split is done based on some feature enabling the trees to learn more about each feature and class even in the case of the imbalanced dataset. When we talk about tree-based models we often talk about ensembles as ensembles outperform a single tree in every use case. Ensemble models like the random forest, gradient boosting trees are very popular tree-based models. Let's have a look at an ensemble model:
    </p>
    <pre><code>from xgboost import XGBClassifier

clf = XGBClassifier(
        n_iterators=200,
        learning_rate = 0.05,
        #telling model about imbalanced classes
        scal_pos_weight = rate_of_minortiy_to_majority_class,
        probability = True 
    )
    </code></pre>

    <h4 id="synthetic-minority-oversampling-trachnique(smote)" style="margin-top: 20px;"><b>6. Synthetic Minority Oversampling Technique (SMOTE)</b></h4>
    <p style="text-align: justify;">  
        This technique uses a KNN based algorithm to select some neighboring points and then sets up some synthetic data points between these neighbors. Following is a step by step explanation of how it works:
    </p>
    <ol style="padding-left: 40px;">
        <li>Take the input and identify the minority class.</li>
        <li>Find K nearest neighbors of a point in the minority class. (number of neighbors to be taken can be specified using k_neighbors hyperparameter)</li>
        <li>Now take this point and the neighbors and start placing synthetic points on a line between the point under consideration and its neighbor.</li>
        <li>Repeat the above steps by choosing a new point from the minority space each time.</li>
    </ol>
    <p style="text-align: justify;">
        Following is a code snippet for the same:
    </p>
    <pre><code>from imblearn.over_sampling import SMOTE
sm = SMOTE()

#getting oversampled datasets from original datasets
x_smote, y_smote = sm.fit_resample(x,y)
    </code></pre>


<!-- ----------------------------------------------------------------------------------------------------------------------------------------------------------- -->


<h3 id="conclusion"><b>Conclusion</b></h3>  

<p style="text-align: justify;">
    With this, we come to the end of this article. We have tried to explain different techniques to handle imbalanced datasets. There are many more techniques but the ones mentioned in this article are the most effective and should be tried before other techniques out there.
    <strong>Happy Learning!</strong></p>
<h4><b>References</b></h4>    

<ol style="padding-left: 40px; text-align: justify;">
    <li style="word-break: break-all"><a href="https://machinelearningmastery.com/tactics-to-combat-imbalanced-classes-in-your-machine-learning-dataset/#:~:text=Imbalanced%20data%20typically%20refers%20to%20a%20problem%20with,the%20remaining%2020%20instances%20are%20labeled%20with%20Class-2" title="">https://machinelearningmastery.com/tactics-to-combat-imbalanced-classes-in-your-machine-learning-dataset/</a></li>
</ol>

<br>

</div><!-- end course-table -->