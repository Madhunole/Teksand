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
				<td><h5 class="margin-0"><b><a href="#overfitting-in-neural-networks" style="color: #222222;">Overfitting in Neural Networks</a></b></h5>
				</td>
			</tr>
			<tr>
				<td>3</td>
				<td>
                    <h5 class="margin-0"><b><a href="#why-do-we-need-regularization" style="color: #222222;" >Why do we need Regularization?</a></b></h5>
				</td>
			</tr>
            <tr>
				<td>4</td>
				<td>
                    <h5 class="margin-0"><b><a href="#types-of-regularization-techniques" style="color: #222222;" >Types of Regularization Techniques</a></b></h5>
				</td>
			</tr>
            <tr>
				<td>4.1</td>
				<td><span style="margin-left:10px;"><a href="#number-of-hidden-layers-and-hidden-neurons" style="color: #222222;">Number of Hidden layers and Hidden Neurons</a></span></td>
			</tr>
            <tr>
				<td>4.2</td>
				<td><span style="margin-left:10px;"><a href="#weight-decay" style="color: #222222;">Weight Decay</a></span></td>
			</tr>
            <tr>
				<td>4.3</td>
				<td><span style="margin-left:10px;"><a href="#batch-normalization" style="color: #222222;">Batch Normalization</a></span></td>
			</tr>
            <tr>
				<td>4.4</td>
				<td><span style="margin-left:10px;"><a href="#dropout" style="color: #222222;">DropOut</a></span></td>
			</tr>
            <tr>
				<td>4.5</td>
				<td><span style="margin-left:10px;"><a href="#early-stopping" style="color: #222222;">Early Stopping</a></span></td>
			</tr>
            <tr>
				<td>4.6</td>
				<td><span style="margin-left:10px;"><a href="#data-augmentation" style="color: #222222;">Data Augmentation</a></span></td>
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
        <strong>"Data is the new oil."</strong> - This is a very common phrase nowadays and you must have heard or read it somewhere. But why is it so? What problems does it create? Let us try to understand.
    </p>
    <p style="text-align: justify;">
        Almost all applications today include complex models such as <a href="https://teksands.ai/blog/introduction-to-neural-networks" target="_blank"><b>neural networks</b></a>, machine learning models, etc. But training complex models which can generalize better is a challenging problem. A model trained on a small dataset will fail to learn the problem, so we need large data and therefore "Data is the new oil" makes sense. But models trained on a large dataset give small training errors but large validation errors and consequently large test errors
    </p>

    <h3 id="overfitting-in-neural-networks"><b>Overfitting in Neural Networks</b></h3>
    <p style="text-align: justify;">
        Before moving on to the overfitting problem, let us understand a basic neural network. Neural Networks consist of an input layer, hidden layer, and an output layer. These layers contain information in the form of neurons which are generally known as nodes. All the nodes in the adjacent layers are connected to each other.
    </p>
    <p style="text-align: justify;">
        Below I have attached an image of a simple neural network with 2 input neurons, 4 hidden neurons, and 1 output neuron. Here I will recommend you to read an article on neural networks to get a big picture of the neural network.
    </p>
    <img class="img-responsive" style="margin:0 auto;" src="/resources/images/blogs/various-regularization-techniques-in-nn/regularisation-techniques-in-nn-1.png" alt="Simple Neural Network">
    <p style="text-align: justify;">
        Neural Networks are successful because of the amount of data that we have. But with a large amount of data, there are high chances of noise which will result in high variance and consequently overfitting. As a result, our model will give accurate results on the training data but will fail on the validation and test data. Here is the illustration which is explained in detail below.
    </p>
    <img class="img-responsive" style="margin:0 auto;" src="/resources/images/blogs/various-regularization-techniques-in-nn/regularisation-techniques-in-nn-2.png" alt="Overfitting">
    <p style="text-align: justify;">
        In the above picture, we want to learn a sinusoidal curve using the given sine values. But our model learns the red polynomial curve, which essentially gives low error on the blue training points but will fail on the validation and test points. As the dataset is large, I want you to point out the noise in the above illustration.
    </p>
    <p style="text-align: justify;">
        If you understood my point, the blue points which are not on the green sinusoidal curve are noise in our dataset. And this noise leads to high variance. We call this problem an Overfitting problem. The failure of neural networks on large data sets leads us towards regularization techniques.
    </p>

    <h3 id="why-do-we-need-regularization"><b>Why do we need Regularization?</b></h3>
    <p style="text-align: justify;">
        In the above picture, we want to learn a sinusoidal curve using the given sine values. But our model learns the red polynomial curve, which essentially gives low error on the blue training points but will fail on the validation and test points. As the dataset is large, I want you to point out the noise in the above illustration.
    </p>
    <p style="text-align: justify;">
        If you understood my point, the blue points which are not on the green sinusoidal curve are noise in our dataset. And this noise leads to high variance. We call this problem an Overfitting problem. The failure of neural networks on large data sets leads us towards regularization techniques.
    </p>

    <h3 id="types-of-regularization-techniques"><b>Types of Regularization Techniques</b></h3>
    <p style="text-align: justify;">
        With the introduction of neural networks, the next big problem was the generalization of neural networks. In this section, we will learn about different regularization techniques which are used for better generalization of neural networks.
    </p>
    <h4 id="number-of-hidden-layers-and-hidden-neurons" style="margin-top: 20px;"><b>Number of Hidden Layers and Hidden Neurons</b></h4>
    <p style="text-align: justify;">
        In a Neural Network, input and output nodes are determined by the dimensionality of the dataset. So, these nodes are fixed and cannot be changed. But the nodes in the hidden layers are free parameters and can be adjusted to give the best performance. So, consider a sinusoidal regression problem where the error is the mean squared error. In this regression problem, our aim is to try different numbers of hidden neurons and plot the output to see the best setting for our neuron. So, as you can see, when the numbers of hidden neurons are less, the curve is underfitting and as we increase the number of hidden neurons, the curve starts overfitting. The best setting is obtained at the number of hidden neurons to be equal to 8. So, careful initialization is important to prevent overfitting. We can plot such a graph to see if our model is overfitting.
    </p>
    <img class="img-responsive" style="margin:0 auto;" src="/resources/images/blogs/various-regularization-techniques-in-nn/regularisation-techniques-in-nn-3.png" alt="2-layer network trained on 10 data points drawn from the sinusoidal data set. The graphs show the result of fitting networks having M =1, 3, 10 hidden units, respectively, by minimizing a sum-of-squares error function using a scaled conjugate-gradient algorithm.">

    <h4 id="weight-decay" style="margin-top: 20px;"><b>Weight Decay</b></h4>
    <p style="text-align: justify;">
        Another method of regularization is to start with a large number of hidden neurons and add a regularization term in the loss function. The regularization terms can be L2 regularization or L1 regularization.
    </p>
    <p style="text-align: justify;">
        Error function with L2 Regularization 
    </p>
    <p style="text-align: center; font-size: 1.2em;">
        <span>E(w)<span style="position: relative;bottom: 10px;right: 31px;letter-spacing:-3px">&hyphen;&hyphen;</span></span> = E(w) + &lambda;/2(W<sup>T</sup>W)
    </p>
    <p style="text-align: justify;">
        Error function with L1 Regularization 
    </p>
    <p style="text-align: center; font-size: 1.2em;">
        <span>E(w)<span style="position: relative;bottom: 10px;right: 31px;letter-spacing:-3px">&hyphen;&hyphen;</span></span> = E(w) + &lambda; &parallel;w&parallel;
    </p>
    <p style="text-align: justify;">
        The effective model complexity is now determined by the choice of regularization coefficient lambda(&lambda;). L1 Regularization brings sparsity to our model. For example, if we are predicting house prices from a number of features. It is highly likely that some of those features do not affect our house price prediction and some of the features may be highly correlated. L1 regularization pushes their weights towards 0 so that they do not affect our model predictions.  While L2 Regularization results in non-sparse solutions. The features whose weights are pushed towards zero by L1 Regularization may have some effect on the house price prediction. So L2 Regularization pushes weights to be small rather than zero. 
    </p>

    <h4 id="batch-normalization" style="margin-top: 20px;"><b>Batch Normalization</b></h4>
    <p style="text-align: justify;">
        We divide our data into mini-batches and then pass it into the neural network.
    </p>
    <p style="text-align: justify;">
        With a slight change in the distribution of mini-batch input, it will result in large and larger changes in the successive layers. When the network is deeper, then the change in the deeper layers will also be very large. Since the small change gets multiplied by various weights as well as is passed through the activation functions multiple times. So with a small change in two batches, the successive layers will see these batches to be very different. A layer in the neural network may see these batches with very different distributions. This problem is also known as internal covariate shift. The batches have different mean and different variance. So we use batch normalization to solve this problem. Whenever it gets a batch of input, it will normalize that batch first into a normal distribution with 0 mean and variance 1 and then scale it to a factor of gamma and shift by beta. So the distribution now has a mean and variance. Gamma and beta are learned by backpropagation. In doing so, a little noise is also added in the inputs, and batch normalization can also act as a regulariser to prevent overfitting but the noise added is so small that we cannot use it as a complete regulariser. The above normalization results in the same distribution for all batches after a particular layer and helps to have faster convergence. Since the inputs to a particular layer are coming from the same distribution, it increases the learning rate.
    </p>

    <h4 id="dropout" style="margin-top: 20px;"><b>DropOut</b></h4>
    <p style="text-align: justify;">
        Ensemble methods nearly always improve the accuracy in machine learning models. If we want to use ensembles in neural networks, we will have to train different neural network architecture and then take the average of all these trained architectures. But training different neural network architectures will be very computationally expensive.
    </p>
    <p style="text-align: justify;">
        Dropout is a technique that addresses this issue. It prevents overfitting and provides a way of combining different neural networks efficiently. It randomly drops nodes temporarily along with all its incoming and outgoing connections in the adjacent layers. We assign a probability(p) of retaining modes where p is basically found using a validation set or simply set to 0.5. So, Every epoch of the neural network has a different architecture based on the nodes which will be retained.  During testing, all the nodes are used and their weights are multiplied with the probability p.
    </p>
    <img class="img-responsive" style="margin:0 auto;" src="/resources/images/blogs/various-regularization-techniques-in-nn/regularisation-techniques-in-nn-4.png" alt="Reduced overfitting and better accuracy compared to architectures without dropout">
    <p style="text-align: justify;">
        The above image explains the difference between training and testing. It largely reduces overfitting and gives better accuracy as compared to architectures without dropout.
    </p>
    <h4 id="early-stopping" style="margin-top: 20px;"><b>Early Stopping</b></h4>
    <p style="text-align: justify;">
        Training and Validation Loss in Neural Networks starts decreasing after each epoch but after a certain epoch, we will notice that the validation loss is no longer reducing. It may remain constant or may start increasing. So, by early Stopping, we observe the epoch where our validation loss reaches minima and then starts to increase or remains constant. We will train our network up to the observed epoch and this results in better results and avoids overfitting.
    </p>
    <img class="img-responsive" style="margin:0 auto;" src="/resources/images/blogs/various-regularization-techniques-in-nn/regularisation-techniques-in-nn-5.png" alt="training stopped when the validation loss is minimum">
    <p style="text-align: justify;">
        The above picture shows the training loss on the left and the validation loss on the right. So as we can see, validation loss is minimum on the dashed line, we will stop training our network at this point.
    </p>
    <h4 id="data-augmentation" style="margin-top: 20px;"><b>Data Augmentation</b></h4>
    <p style="text-align: justify;">
        Data Augmentation can also be used as a regularization technique where we have a small amount of data. Data Augmentation includes various techniques such as Cropping, Flipping, Shearing, Zoom in/Zoom Out, Rotation, etc.
    </p>

<h3 id="conclusion"><b>Conclusion</b></h3>  

<p style="text-align: justify;">
    That's all from my side on different Regularization techniques which are used in complex models such as neural networks. You will be using almost all these techniques in your project based on neural networks.
</p>
<h4><b>References</b></h4>    

<ol style="padding-left: 40px; text-align: justify;">
    <li style="word-break: break-all">Chapter 5, Section 5.5 of Bishop - Pattern Recognition and Machine Learning</a></li>
</ol>
<br>

</div><!-- end course-table -->