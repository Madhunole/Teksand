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
				<td><h5 class="margin-0"><b><a href="#why-semi-supervised-learning" style="color: #222222;">Why Semi-Supervised Learning?</a></b></h5>
				</td>
			</tr>
            <tr>
				<td>3</td>
				<td><h5 class="margin-0"><b><a href="#assumptions-and-characteristics-of-data-used-for-semi-supervised-learning" style="color: #222222;">Assumptions and Characteristics of Data used for Semi-Supervised Learning</a></b></h5>
				</td>
			</tr>
            <tr>
				<td>4</td>
				<td><h5 class="margin-0"><b><a href="#techniques-used-for-semi-supervised-learning" style="color: #222222;">Techniques used for Semi-Supervised Learning</a></b></h5>
				</td>
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
        Most of the machine learning algorithms are based on supervised and unsupervised machine learning techniques. The major difference between both techniques is that in the case of supervised learning you have labeled data and in the case of unsupervised learning, the data is not labeled leaving the model to learn on its own to find patterns in data. The idea of allowing the model to learn from its own mistakes leads us to the domain of reinforcement learning, where there is no data and the model learns from the experience and rewards it gets from the learning environment. Then comes semi-supervised learning that is thought to be a fine line between reinforcement learning and unsupervised learning. This looks true at first but when you look closely you'll find striking differences between reinforcement learning and semi-supervised learning. In this article, we'll try to have a look at the different aspects of semi-supervised learning to get a deeper knowledge about this aspect of machine learning.
    </p>
    <img class="img-responsive" style='margin: 0 auto;' src="/resources/images/blogs/semi-supervised-learning/semi-supervised-learning-1.png" alt="Semi-Supervised Learning">

    <h3 id='why-semi-supervised-learning'><b>Why Semi-Supervised Learning?</b></h3>
    <p style="text-align: justify;">
        The most important difference between semi-supervised learning and other <a href="https://teksands.ai/blog/introduction-to-automated-machine-learning" target="_blank"><b>machine learning</b></a> techniques is that it learns using a minimal amount of labeled training data. This also makes it different from reinforcement learning where there is no labeled data involved. But what was the need for semi-supervised learning when we already have supervised learning to learn from labeled data?
    </p>
    <p style="text-align: justify;">
        The answer lies behind the fact that to train a supervised learning model a large amount of data is needed. This data which is labeled is called annotated data. The process of data annotation is a time-consuming and laborious task when done manually as it requires humans to review each training example before assigning a label to them. This has led to the rise of an entirely new market of labeled data where startups such as LabelBox, ScaleAI, etc. leverage technology to annotate data without any human interference. This looks like a good thing but there's a small catch.
    </p>
    <p style="text-align: justify;">
        With the increasing popularity of machine learning and demand for labeled data the price of labeled data has increased which has led to machine learning techniques like semi-supervised learning which uses less amount of data to train a ML model. Semi-supervised learning automates the data labeling process when there is a small amount of labeled data by providing labels to unlabeled data with the help of some techniques that take into consideration the distribution of labeled data. The idea of automating labeling is not that straightforward and includes some assumptions on the labeled data at hand. We'll discuss it more in the next section.
    </p>

    <h3 id='assumptions-and-characteristics-of-data-used-for-semi-supervised-learning'><b>Assumptions and Characteristics of Data used for Semi-Supervised Learning</b></h3>
    <p style="text-align: justify;">
        The classic example of a semi-supervised learning scenario is where the amount labeled data is around fourth or fifth of the total data. Before applying the semi-supervised technique to any kind of data there are a few characteristics that a data scientist should keep in mind:
    </p>
    <ol style="padding-left: 40px;">
        <li>
            <strong>Size of unlabeled portion:</strong> Use semi-supervised learning when only a small portion of data is labeled. There isn't an exact ratio to decide when to go for supervised or semi-supervised learning but it can be based on intuition and the type of model that'll be used in both cases. Some supervised learning models like the naïve bayes classifier give good results even for a small dataset.
        </li>
        <li>
            <strong>Input-Output Proximity:</strong> In supervised learning, the basic approach by many algorithms is to provide a label for an unlabeled input by looking at the labeled data points that are close to it. This means that if the input data points without label lie in a cluster of data points with a particular label then they will be assigned that label. If the labeled data portion has low density then the accuracy of the semi-supervised learning model is affected. Have a look at the following figure to have a better understanding of how the data points for a dataset that can be used for semi-supervised learning look like.
        </li>
        <img class="img-responsive" style='margin: 0 auto;' src="/resources/images/blogs/semi-supervised-learning/semi-supervised-learning-2.png" alt="">
        <li>
            <strong>Simplicity/ Complexity of labeling:</strong> If the data is very complex in any aspect then it becomes really difficult to assign labels to data points without a label. This situation can arise when there are a large number of attributes or the number of distinct class labels is high.
        </li>
        <li>
            <ul style="list-style: none">
                <li>
                    <strong>Inductive and Transductive Learning:</strong> There are two common approaches to learning when there's a mixed set of a label and unlabeled values. The first one is the method of 'induction'.
                </li>
                <li>
                    The inductive method of learning is based on the idea that it studies the labeled data and creates a general rule for classification based on reasoning from observations from data. Then all the test cases are included under these general classifications.
                </li>
                <li>
                    The idea behind transductive learning is to draw reasoning from specific training cases and then apply it to specific test cases. Transductive learning has been supported by the inventor of SVM's Vladimir Vapnik and he gives the reasoning that "Try to get the answer you really need, instead of a general one".
                </li>
            </ul>
        </li>
    </ol>
    <p style="text-align: justify;">
        These were a few characteristics about the data or the learning method which should be looked at before applying semi-supervised learning. Let's have a look at few assumptions that are necessary for the structure of data provided:
    </p>
    <ol style="padding-left: 40px;">
        <li>
            <strong>Continuity assumption:</strong> Points that are close to each other always have a higher chance of sharing the same label. This gives us geometrically simple decision boundaries. The data is assumed to be continuous in the sense that all the points in the close vicinity of a point are assumed to have the same label.
        </li>
        <li>
            <strong>Cluster assumption:</strong> It is assumed that data points form clusters with each discrete cluster belonging to one class. This can be considered as a special case of smoothness
        </li>
        <li>
            <strong>Manifold assumption:</strong> Sometimes the data lies in higher dimensions and it becomes difficult to forms clusters or map the data in those dimensions. In such a case manifold assumption can be used where the data is assumed to be in lower dimensions which makes it easier for our model to learn the data.
        </li>
    </ol>
    <p style="text-align: justify;">
        These basic assumptions and characteristics make it easy to deal with data used for semi-supervised learning models. In the following section, we'll have a look at the different techniques used for semi-supervised learning.
    </p>

    <h3 id='techniques-used-for-semi-supervised-learning'><b>Techniques used for Semi-Supervised Learning</b></h3>
    <p style="text-align: justify;">
        There are many techniques or ideas used for semi-supervised learning tasks and here we'll discuss some common ones used:
    </p>
    <ol style="padding-left: 40px;">
        <li>
            <strong>Pseudo Labeling:</strong> The idea behind pseudo labeling is simple. Take a training dataset that follows all the assumptions/characteristics and train a model based on this data. Now take some test cases and label them using this model. These labels assigned to the test case might not be accurate and are also known as pseudo labels. Next time is to combine the actual training data and data with pseudo labels to train a model again from scratch.
        </li>
        <img class="img-responsive" style='margin: 0 auto;' src="/resources/images/blogs/semi-supervised-learning/semi-supervised-learning-3.png" alt="Semi-Supervised Learning Model">
        <li>
            <ul style="list-style: none;">
                <li>
                    <strong>Generative Learning:</strong> The idea behind generative learning is to first estimate the distribution of data points belonging to each class. Semi-supervised learning with a generative approach can be seen as an extension of unsupervised learning (clustering plus some labels) or an extension of supervised learning (classification plus information about probability).
                </li>
                <li>
                    Generative models assume that distributions take the form p(x|y,&#x398;) parameterized by the parameter &#x398;. If these assumptions are incorrect then the unlabeled data can reduce the accuracy of the model which it would have got by only using labeled data. But if assumptions are correct they will necessarily improve the performance.
                </li>
                <li>
                    The unlabeled data are distributed according to a mixture of individual-class distributions. In order to learn the mixture distribution from the unlabeled data, it must be identifiable, that is, different parameters must yield different summed distributions. Gaussian mixture distributions are identifiable and commonly used for generative models.
                </li>
            </ul>
        </li>
        <li>
            Another major class of methods attempts to place boundaries in regions with few data points (labeled or unlabeled). One of the most commonly used algorithms is the transductive support vector machine, or TSVM (which, despite its name, may be used for inductive learning as well). Whereas support vector machines for supervised learning seek a decision boundary with a maximal margin over the labeled data, the goal of TSVM is a labeling of the unlabeled data such that the decision boundary has maximal margin over all of the data.
        </li>
    </ol>
    <p style="text-align: justify;">
        There are many more techniques that can be used for semi-supervised learning. We have discussed the most commonly used ones to give a basic idea about how semi-supervised learning algorithms work.
    </p>
<!-- -------------------------------------------------------------- -->

<h3 id="conclusion"><b>Conclusion</b></h3>  

<p style="text-align: justify;">
    Semi-supervised learning comprises techniques whose knowledge can help our models in doing their job with a low amount of labeled data which leads to cost reduction and improvement in training time. One should be careful before applying semi-supervised learning as sometimes supervised models might end up giving better accuracy for the same amount of training data. Happy learning!
</p>

<h4><b>References</b></h4>    

<ol style="padding-left: 40px; text-align: justify;">
    <li style="word-break: break-all"><a href="https://mitpress.universitypressscholarship.com/view/10.7551/mitpress/9780262033589.001.0001/upso-9780262033589-chapter-1">https://mitpress.universitypressscholarship.com/view/10.7551/mitpress/9780262033589.001.0001/upso-9780262033589-chapter-1</a></li>
    <li style="word-break: break-all"><a href="http://pages.cs.wisc.edu/~jerryzhu/pub/sslicml07.pdf">http://pages.cs.wisc.edu/~jerryzhu/pub/sslicml07.pdf</a></li>
</ol>
<br>

</div><!-- end course-table -->
