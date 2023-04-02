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
				<td><h5 class="margin-0"><b><a href="#what-are-autoencoders" style="color: #222222;">What are Autoencoders?</a></b></h5>
				 </td>
			</tr>
			<tr>
				<td>3</td>
				<td>
                    <h5 class="margin-0"><b><a href="#autoencoders-vs-pcs" style="color: #222222;" >Autoencoders vs PCA</a></b></h5>
				</td>
			</tr>
            <tr>
                <td>4</td>
                <td>
                    <h5 class="margin-0"><b><a href="#types-of-autoencoders" style="color: #222222;">Types of Autoencoders</a></b></h5>
                </td>
            </tr>
			<tr>
				<td>5</td>
				<td><h5 class="margin-0"><b><a href="#conclusion" style="color: #222222;">Conclusion</a></b></h5>
				 </td>
			</tr>
			
		</tbody>
	</table>
	

	<br>
	<h3 id="introduction"><b>Introduction</b></h3>
	
    <p style="text-align: justify">
        The field of deep learning has gained a lot of attraction in the last few years. The most popular problems that are solved by deep learning models tend to use supervised deep learning models. For example, problems related to image recognition, speech recognition, sentiment classification are traditionally a part of supervised deep learning. The unsupervised models for deep learning are not commonly used or discussed like their counterparts (supervised models). There are many popular unsupervised models such as self-organizing maps (SOM), autoencoders, Deep Boltzmann machines (DBM) etc. In this article we'll keep our focus on autoencoders which have gained popularity in the last few years.
    </p>
    <p style="text-align: justify;">
        Autoencoders have played a crucial role in solving many problems in the last few years such as data anomaly detection, data denoising, information retrieval, etc. They have also helped in overcoming the shortcomings of many traditional dimensionality reduction techniques such as PCA, SVD. Let's get started. In this article, we'll try to shed some light on the unsupervised side of deep learning models, specifically autoencoders. We'll aim at an exhaustive yet simple explanation of autoencoders.
    </p>
	
    <br>
	<h3 id="what-are-autoencoders"><b>What are Autoencoders?</b></h3>
	<p style="text-align: justify;">
        As discussed before autoencoders are unsupervised deep learning models that are used primarily for dimensionality reduction. The basic idea is to map input data to output data and learn the encodings in the process. We also introduce a bottleneck in our model architecture which forces the model to learn a compressed knowledge representation of the original input. Following is a quote from Francois Chollet (Machine Learning Researcher at Google) from Keras Blog:
    </p>
    <div class="section-title-2 text-center" style="padding: 0 0 30px;">
        <p class="lead" style="padding-top: 15px;">
            <b>
                "Autoencoding" is a data compression algorithm where the compression and decompression functions are 1) data-specific, 2) lossy, and 3) learned automatically from examples rather than engineered by a human.
            </b>
        </p>
        <hr>
    </div>
    <p style="text-align: justify;">
        Have a look at the following image to get a preliminary idea of the basic working of an autoencoder:
    </p>
    <img style="margin: 0 auto;" src="/resources/images/blogs/AutoEncoders/autoencoder-1.png" alt="Basic working of an encoder" class='img-responsive'>
    <p style="text-align: justify;">
        Now from the image, you can see that an autoencoder comprises two important components, encoder, and decoder. Let's see how these individual components work.
    </p>
    <p style="text-align: justify;">
        The job of the encoder is to take the input and encode it. The input is in the form of a vector. Now if the input vector is x then let the encoded function be f(x). Now the most important part comes. Autoencoders have hidden layer (or hidden layers) that learn the encodings from the data and decode it. These hidden layers are responsible for data compression, encoding/decoding i.e. in simpler terms these layers form the heart of an autoencoder. The encoding function is learned by encoder hidden layers. The hidden layer in the middle of the encoder and decoder hidden layers learns the input encodings that are encoded by the encoder i.e. h=f(x). Have a look at the following image (first two layers form encoder, the middle layer is bottleneck hidden layer or the layer that contains encoded data, final two layers form the decoder):
    </p>
    <img style="margin: 0 auto;" src="/resources/images/blogs/AutoEncoders/autoencoder-2.png" alt="bottleneck hidden layers" class='img-responsive'>
    <p style="text-align: justify;">
        Sometimes the hidden layer in the middle is also considered a part of both encoder and decoder. It's called the bottleneck hidden layer. After the encodings are learnt by encoder hidden layers, the decoder hidden layers or the decoder function tries to reconstruct input data. If we define the decoder function as g then the reconstruction is r = g(f(x)). This is how autoencoders work in very simple terms.
    </p>
    <p style="text-align: justify;">
        The next step is to evaluate and train the network by minimizing the reconstruction error L(x,r). The reconstruction error measures the difference between the reconstructed output r and original input x. One more thing to observe is the bottleneck type structure when you move from the encoder to decoder layers. This stops the model from simply memorizing the input values by passing these values through the network. Have a look at the figure given below:
    </p>
    <img style="margin: 0 auto;" src="/resources/images/blogs/AutoEncoders/autoencoder-3.png" alt="hidden layer without any bottleneck" class="img-responsive">
    <p style="text-align: justify;">
        In the figure above without any bottleneck, the network will memorize the inputs and pass them through the network. Now there is a tradeoff considering what we have said. On one hand, we want our model to learn efficient encodings which can be later decoded to get a representation of data close to the input, and on the other hand, we don't want the model to blindly memorize everything i.e. we need to make sure the model is neither too good nor too bad. If you are building an ideal autoencoder it should balance the following two things:
    </p>
    <ol style="margin-left:40px;">
        <li>
            It should be sensitive enough to accurately encode the data and build reconstruction with the least error.
        </li>
        <li>
            It should be insensitive enough to make sure the network doesn't overfit the training data or simply memorize it in the worst case.
        </li>
    </ol>
    <p style="text-align: justify;">
        In simpler words we want the model to retain only those variations in data that are required to reconstruct the input and drop other redundancies within the input. This can be done by introducing a loss function where one term pushes our model to be more sensitive to input i.e. learn more and the other terms discourage overfitting/memorization (i.e. add regularizer to a standard loss function).
    </p>
    <p style="text-align: justify;">
        The next question that comes in our mind is the usage of autoencoders for dimensionality reduction when we already have other algorithms like PCA. We'll discuss this in the upcoming section.
    </p>
    <br>
	<h3 id="autoencoders-vs-pcs"><b>Autoencoders vs PCA</b></h3>
	<p style="text-align: justify;">
        PCA is the first thing that pops up in our minds when we talk about dimensionality reduction. This happens because of its widespread popularity. Both PCA and Autoencoders transform data to lower-dimensional representation by learning important features from the input data which also reduces the reconstruction cost from lower to higher dimensions. Now when we see how PCA transforms data to a lower dimension we realize that PCA does linear projections of data to lower dimensions which are orthogonal. The idea is to preserve the variance that was there in higher dimensions. Where is the problem in such a transformation?
    </p>
    <p style="text-align: justify;">
        The main problem arises due to the fact that PCA does a linear transformation. This means that any relation or important input information that is non-linear is lost. This problem is resolved in autoencoders when we use non-linear activation functions in our hidden layers. These activation functions are capable of learning input properties that are non-linear. One interesting fact is that if we use linear activation function for autoencoders we would observe a dimensionality reduction similar to the one observed for PCA. 
    </p>
    <br>
    <h3 id="types-of-autoencoders"><b>Types of Autoencoders</b></h3>
    <p style="text-align: justify;">
        There are different types of architectures for an autoencoder and in these sections, we'll discuss a few of them. Let's get started.
    </p>
    <p style="text-align: justify;">
        <strong>1. Undercomplete Autoencoder -</strong> This is the simplest architecture where the basic idea is to reduce the number of nodes in the hidden layer to constrain the amount of information that flows through the network. If we use this idea combined with penalties for wrong reconstructions then our model tries to learn the best possible features from the input which are most helpful while decoding back from the "encoded" state.  The following figure represents the model architecture we are talking about:
    </p>
    <img style="margin: 0 auto;" src="/resources/images/blogs/AutoEncoders/autoencoder-4.png" alt="Undercomplete autoencoder" class="img-responsive">
    <p style="text-align: justify;">
        This network can be thought of as a more powerful nonlinear generalization of PCA as neural networks are capable of learning nonlinear relationships. These autoencoders are capable of learning non-linear surfaces in higher dimensions whereas PCA attempts to find a lower-dimensional hyperplane to describe original data.
    </p>
    <p style="text-align: justify;">
        There is no regularization term in loss functions of under complete autoencoders which leaves us with carefully setting the number of nodes in hidden layers to minimize the reconstruction error. For deep autoencoders with multiple hidden layers, we have to be careful with the capacity of the encoder and decoder layers. Even if the bottleneck layer is one hidden node our model can still memorize the training data by learning some arbitrary function to map data to some index.
    </p>
    <p style="text-align: justify;">
        In order to take care of the memorizing power of autoencoders, we apply some techniques for the regularization of networks in order to encourage generalization for unseen data. Some of the techniques are mentioned below in the form of different architectures.
    </p>
    <p style="text-align: justify;">
        <strong>2. Sparse Autoencoders - </strong> This is an alternative method where we are not required to reduce the number of nodes in the hidden layer to introduce an information bottleneck. Instead, we use a loss function that penalizes activations within a layer. In simpler words, we'll try to make sure that our model learns encodings and decodings which rely on a small number of active neurons. This is similar to the dropout regularization we see in many other neural network architectures.
    </p>
    <p style="text-align: justify;">
        Following is a figure showing a sparse encoder where opaque nodes correspond to the activated nodes. The activation of a node depends on the input i.e. for different inputs different nodes can get activated based on the information that input carries.
    </p>
    <img src="/resources/images/blogs/AutoEncoders/autoencoder-5.png" alt="sparse encoder" class='img-responsive' style="margin:0 auto;">
    <p style="text-align: justify;">
        By using this method different nodes learn different information and get activated only when the input carries that specific information. This helps in reducing the network's capacity to memorize the data but also makes sure the network can learn to extract important features from the data.
    </p>
    <p style="text-align: justify;">
        There are two different methods using which we can impose the sparsity constraint. They involve adding some term to loss function to penalize excessive activations by measuring them. Following are the two activation methods:
    </p>
    <ol style="margin-left:40px;">
        <li>
            <strong>L1 Regularization - </strong>Here we add a term to our loss function which is basically the activation vector for a hidden layer. Vector a for activation in layer h for observation i, with scaling parameter &#955; is added.</li>
        <p style="text-align: center; font-size: 1.2em;">
            <b><em>L(x,x&#770; )+ &lambda; &sum;|a<sub>i</sub><sup>h</sup>|</em></b>
        </p>
        <li>
            <strong>KL-Divergence - </strong>The main idea behind KL divergence is to measure the difference between two distributions. In order to use KL-Divergence, we define a sparsity parameter that denotes the average activation of neurons over a large number of observations. This parameter is calculated as 
            <span>
                &rho;&#770;<sub>j</sub> = 
                <div class="fraction">
                    <span class="fup">1</span>
                    <span class="bar">/</span>
                    <span class="fdn">m</span>
                </div>
                &Sigma;a<sub>i</sub><sup>h</sup>(x)
            </span> 
            where j refers to a specific neuron in layer h, an average of activation of m training examples are taken where each individual training example is denoted as x. When we try to put a constraint over the average value of neuron activations over a large number of samples we force them to fire a few times so that the average value stays low to reduce the loss. The distribution of parameter
            <span>&rho;<sub>j</sub></span>
            an be assumed to have a Bernoulli distribution so that we can use KL divergence to compare the ideal distribution
            <span>&rho;<sub>j</sub></span>
            and the observed distribution <span>&rho;&#770;<sub>j</sub></span>
        </li>
        <br>
        <p style="text-align: center; font-size: 1.2em;">
            <em><b>
                L(x,x&#770; )+  <span>&sum;</span><sub><sub>i</sub></sub>
                KL
                (&rho;<sub>j</sub>
                &#124;&#124;
                &rho;&#770; <sub>j</sub>)
            </b></em>
        </p>
        <p style="text-align: justify;">
            We'll not go deeper into the math of KL-Divergence but the final equation is a simple one that can be easily used for calculations of divergence between two Bernoulli distributions.
        </p>
        <li>
            <strong>Denoising Autoencoders - </strong>This approach uses the idea of changing the input and output we feed to our autoencoder. In simpler terms, we add some noise to our inputs but we keep the noiseless data as our outputs. This approach makes sure our model is not able to develop a mapping to simply memorize the training data because input and output are not the same. Instead, our model learns to map the input data to lower dimensions such that the data in lower dimensions accurately describes the input data without noise or the output data. If this happens then our model has learned to cancel out the noise without memorizing the input data. Following is a figure of how the architecture looks:
        </li>
        <img style="margin: 0 auto;" src="/resources/images/blogs/AutoEncoders/autoencoder-6.png" alt="model learns o=to cancel out noise - donoising autoencoders" class="img-responsive">
    </ol>
<!-- -------------------------------------------------------------- -->

<br>
<h3 id="conclusion"><b>Conclusion</b></h3>  

<p style="text-align: justify;">
    We have learned that autoencoders are models that are capable of finding structure within data with which they can develop a compressed representation of data. Many variants of the simple autoencoder are there which work on the basic idea of not letting the architecture memorize it all but at the same time allowing it to learn important features of the input data. You can even think of your own way to implement this idea!
    <strong>Happy Learning!</strong></p>
<h4><b>References</b></h4>    

<ol style="padding-left: 40px; text-align: justify;">
<li style="word-break: break-all"><a href="https://www.jeremyjordan.me/autoencoders/" title="">https://www.jeremyjordan.me/autoencoders/</a></li>
<li><a href="https://debuggercafe.com/autoencoders-in-deep-learning/" title="">https://debuggercafe.com/autoencoders-in-deep-learning/</a></li>
</ol>
<br>

</div><!-- end course-table -->


