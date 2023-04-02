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
				<td><span style="margin-left:10px;"><a href="#artificial-neural-networks" style="color: #222222;">Artificial Neural Networks</a></span></td>
			</tr>
			<tr>
				<td>2</td>
				<td><h5 class="margin-0"><b><a href="#human-brain" style="color: #222222;">Human Brain</a></b></h5>
				 </td>
			</tr>
            <tr>
				<td>2.1</td>
				<td><span style="margin-left:10px;"><a href="#neuron" style="color: #222222;">Neuron</a></span></td>
			</tr>
            <tr>
				<td>2.2</td>
				<td><span style="margin-left:10px;"><a href="#soma" style="color: #222222;">Soma</a></span></td>
			</tr>
            <tr>
				<td>2.3</td>
				<td><span style="margin-left:10px;"><a href="#dendrites" style="color: #222222;">Dendrites</a></span></td>
			</tr>
            <tr>
				<td>2.4</td>
				<td><span style="margin-left:10px;"><a href="#axon" style="color: #222222;">Axon</a></span></td>
			</tr>
            <tr>
				<td>2.5</td>
				<td><span style="margin-left:10px;"><a href="#synapse" style="color: #222222;">Synapse</a></span></td>
			</tr>
			<tr>
				<td>3</td>
				<td>
                    <h5 class="margin-0"><b><a href="#architecture-of-ann" style="color: #222222;" >Architecture of ANN</a></b></h5>
				</td>
			</tr>
            <tr>
				<td>3.1</td>
				<td><span style="margin-left:10px;"><a href="#perceptron" style="color: #222222;">Perceptron</a></span></td>
			</tr>
            <tr>
				<td>3.2</td>
				<td><span style="margin-left:10px;"><a href="#activation-function" style="color: #222222;">Activation Function</a></span></td>
			</tr>
            <tr>
                <td>4</td>
                <td>
                    <h5 class="margin-0"><b><a href="#types-of-activation-functions" style="color: #222222;">Types of Activation Functions</a></b></h5>
                </td>
            </tr>
            <tr>
				<td>4.1</td>
				<td><span style="margin-left:10px;"><a href="#threshold-activation-function" style="color: #222222;">Threshold Activation Function</a></span></td>
			</tr>
            <tr>
				<td>4.2</td>
				<td><span style="margin-left:10px;"><a href="#sigmoid-activation-function" style="color: #222222;">Sigmoid Activation Function - (Binary Step Function)</a></span></td>
			</tr>
            <tr>
				<td>4.3</td>
				<td><span style="margin-left:10px;"><a href="#hyperbolic-tangent-function" style="color: #222222;">Hyperbolic Tangent Function - (Logistic Function)</a></span></td>
			</tr>
            <tr>
				<td>4.4</td>
				<td><span style="margin-left:10px;"><a href="#rectified-linear-units" style="color: #222222;">Rectified Linear Units - (ReLu)</a></span></td>
			</tr>
            <tr>
				<td>4.5</td>
				<td><span style="margin-left:10px;"><a href="#leaky-relu" style="color: #222222;">Leaky ReLu</a></span></td>
			</tr>
            <tr>
                <td>5</td>
                <td>
                    <h5 class="margin-0"><b><a href="#working-of-neural-networks" style="color: #222222;">Working of Neural Networks</a></b></h5>
                </td>
            </tr>
            <tr>
				<td>5.1</td>
				<td><span style="margin-left:10px;"><a href="#learning-of-a-neural-network" style="color: #222222;">Learning of a Neural Network</a></span></td>
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
        Deep Learning is one of the most powerful branches of Machine learning. Deep learning is a crucial part of the technology involved in creating self-driving cars, which enables them to recognize obstacles or traffic lights, etc. In deep learning, we train a computer model to perform tasks by training on text, image, or audio data. In many cases, deep learning models are able to perform tasks with more accuracy than humans. In deep learning, the models are created using neural networks which often contain many layers.
    </p>
    <h4 id="articial-neural-networks" style="margin-top: 20px;"><b>Artificial Neural Networks</b></h4>
    <p style="text-align: justify;">
        An Artificial Neural Network which is abbreviated as ANN is a structure that is inspired by the way our nervous system processes information. An ANN contains a lot of interconnected elements( neurons) which work together to solve a particular problem, just like our brain.
    </p>
    <br>


	<h3 id="human-brain"><b>Human Brain</b></h3>
	
    <h4 id="neuron" style="margin-top: 20px;"><b>Neuron</b></h4>
	<p style="text-align: justify;">
        In order to understand ANN let us first understand how neurons work in our brain. The biological neurons are the basic unit of our brain and the nervous system. They are the cells, which are responsible for receiving sensory input from the world using the dendrites. The neurons then process these inputs and then provide an output through the axons.
    </p>
    <img style="margin:0 auto;" src="/resources/images/blogs/introduction-to-neural-networks/intro_to_nn-1.png" alt="neuron" class="img-responsive">
    <h4 id="soma" style="margin-top: 20px;"><b>Soma</b></h4>
    <p style="text-align: justify;">
        It is the cell body of the neuron.
    </p>
    <h4 id="dendrites" style="margin-top: 20px;"><b>Dendrites</b></h4>
    <p style="text-align: justify;">
        Every neuron has very thin, tubular structures around it, which branch out around the cell body. The dendrites are responsible for accepting the incoming signals.
    </p>
    <h4 id="axon" style="margin-top: 20px;"><b>Axon</b></h4>
    <p style="text-align: justify;">
        It is a long, thin, tubular structure that works like a transmission line.
    </p>
    <h4 id="synapse" style="margin-top: 20px;"><b>Synapse</b></h4>
    <p style="text-align: justify;">
        The neurons are connected to each other in a complicated arrangement. At the end of the axon are structures known as synapses, which are responsible for connecting two neurons. The dendrites receive input signals via the synapses of other neurons.
    </p>
    <p style="text-align: justify;">
        Dendrites receive input through the synapses of other neurons. The soma processes these incoming signals over time and converts that processed value into an output, which is sent out to other neurons through the axon and the synapses.
    </p>
	<br>


	<h3 id="architecture-of-ann"><b>Architecture of ANN</b></h3>
	<h4 id="perceptron" style="margin-top: 20px;"><b>Perceptron</b></h4>
    <p style="text-align: justify;">
        In the below diagram we can see the general model of an ANN. A neural network with a single layer is called a Perceptron. If it has multiple layers then it is called a Multi-Layer Perceptron.
    </p>
    <img style="margin:0 auto;" src="/resources/images/blogs/introduction-to-neural-networks/intro_to_nn-2.png" alt="various inputs and a bias are summed and fed to an activation function that generates result" class="img-responsive">
    <p style="text-align: justify;">
        In the above figure, we can see that, for a single observation, x0, x1, x2, x3...x(n) represents various inputs to the network. Every single input is multiplied by its corresponding weight which is represented by w0, w1, w2 . . . w(n). Weights show us the strength of a particular node. Now, b is the bias value. A bias value is a value that allows us to shift our activation function up or down.
    </p>
    <p style="text-align: justify;">
        In the most trivial scenario, all these products are summed together and then fed to an activation function, which generates a result.
    </p>
    <p style="text-align: justify;">
        Mathematically, x<sub>1</sub>.w<sub>1</sub>+x<sub>2</sub>.w<sub>2</sub>+.x<sub>3</sub>.w<sub>3</sub>..... x<sub>n</sub>.w<sub>n</sub> = &#8721; x<sub>i</sub>.w<sub>i</sub>
    </p>
    <p style="text-align: justify;">
        Now activation function is applied (&#8721; xi.wi)
    </p>

    <h4 id="activation-function" style="margin-top: 20px"><b>Activation Function</b></h4>
    <p style="text-align: justify;">
        The activation function is an integral part of an ANN. The main goal of the activation function is to convert the input signal of a node to an output signal, which is then used as input for the next layer. An activation function helps us to decide whether a neuron should be activated or not by calculating the weighted sum and adding it to the bias. The purpose of this is to inculcate non-linearity in the output of a neuron.
    </p>
    <p style="text-align: justify;">
        If we don't use an activation function, then the output signal would just be a linear function. The problem with that is, a linear function is limited by its complexity and it has less power. So, without an activation function, our model cannot learn complicated data such as images, audio, etc. Non-Linear functions are the functions that have a degree greater than one and also have a curvature. Now, a neural network can learn almost anything and any complicated function which connects an input to output.
    </p>
    <p style="text-align: justify;">
        Now let us see some of the activation functions that we have available.
    </p>
    <br>

    <h3 id="types-of-activation-functions"><b>Types of Activation Functions</b></h3>
    <h4 id="threshold-activation-function" style="margin-top: 20px;"><b>1. Threshold Activation Function</b></h4>
    <p style="text-align: justify">
        In a threshold activation function, if the input value is above or below a particular threshold, then the neuron is activated and it sends the same signal to the next layer.
    </p>
    <img style="margin:0 auto;" src="/resources/images/blogs/introduction-to-neural-networks/intro_to_nn-3.png" alt="Binary step function" class="img-responsive"> 
    <h4 id="sigmoid-activation-function" style="margin-top: 20px;"><b>2. Sigmoid Activation Function - (Logistic function)</b></h4>
    <p style="text-align: justify;">
        A sigmoid function gives values between 0 and 1. Hence, it is used in models wherein we need to predict the probability as an output.
    </p>
    <img style="margin:0 auto;" src="/resources/images/blogs/introduction-to-neural-networks/intro_to_nn-4.png" alt="sigmoid activation function (Logistic function)" class="img-responsive">

    <h4 id="hyperbolic-tangent-function" style="margin-top: 20px;"><b>3. Hyperbolic Tangential Function - (tanh)</b></h4>
    <p style="text-align: justify;">
        The tanh function is similar to the sigmoid function but it is better in performance. The range of this function is between (-1, 1).
    </p>
    <img style="margin:0 auto;" src="/resources/images/blogs/introduction-to-neural-networks/intro_to_nn-5.png" alt="" class="img-responsive">

    <h4 id="rectified-linear-units" style="margin-top: 20px;"><b>4. Rectified Linear Units - (ReLu)</b>></h4>
    <p style="text-align: justify;">
        ReLu is one of the most widely used activation functions while training a CNN or ANN. The value ReLu ranges from zero to infinity.
    </p>
    <img style="margin: 0 auto;" src="/resources/images/blogs/introduction-to-neural-networks/intro_to_nn-6.png" alt="relu" class="img-responsive">
    <h4 id="leaky-relu" style="margin-top: 20px;"><b>5. Leaky ReLu</b></h4>
    <p style="text-align: justify;">
        Leaky ReLu ranges from -&#8734; to +&#8734;. 
    </p>
    <img style="margin: 0 auto;" src="/resources/images/blogs/introduction-to-neural-networks/intro_to_nn-7.jpeg" alt="Leaky Rellu" class="img-responsive">
    <p style="text-align: justify;">
        Based on our needs, we can decide what activation function we want to use. Now that we know about activation functions, let us now understand how a neural network actually works.
    </p>

    <br>
    <h3><b>Working of Neural Networks</b></h3>
    <p style="text-align: justify;">
        Let us understand the working of a neural network by taking the example of the price of a property.
    </p>
    <img style="margin: 0 auto;" src="/resources/images/blogs/introduction-to-neural-networks/intro_to_nn-8.png" alt="neural network - price of a property" class="img-responsive">
    <p style="text-align: justify;margin-top: 20px;">
        Here all the input values X1, X2, X3, and X4 go through the weighted neurons of the input layer. After this, all 4 values go to the output layer. They are analyzed and an activation function is applied to them, after which the result is produced.
    </p>
    <p style="text-align: justify;">
        We can further increase the power of the neural network by adding hidden layers which are located between the input and output layers.
    </p>
    <img style="margin:0 auto;" src="/resources/images/blogs/introduction-to-neural-networks/intro_to_nn-9.png" alt="adding hidden layers to a neural network" class="img-responsive">
    <p style="text-align: justify;margin-top: 20px;">
        A neural network with a hidden layer(only showing non-0 values)
    </p>
    <p style="text-align: justify;">
        Now here we can see that all 4 variables are connected to the neurons through a synapse. But, not all synapses will have a weight.
    </p>
    <p style="text-align: justify;">
        If weight is 0 then it will be discarded, and a non 0 value of weight will indicate the importance. Let us understand this by taking the variables Bedrooms and Age to be non-zero for the first neuron. This means that they are weighted and they matter to the first neuron. The remaining variables which are Area and Distance to the city are not weighted and hence they are not taken into consideration by the first neuron.
    </p>
    <p style="text-align: justify;">
        This is one of the main reasons that neural networks are so powerful. There are many such neurons in a network and each of them is doing calculations like this. Once the calculation is done, the neuron applies the activation function and does its final calculations. This way the neurons work and look for specific things while training.
    </p>
    <h4 id="learning-of-a-neural-network"><b>Learning of a Neural Network</b></h4>
    <p style="text-align: justify;">
        To understand how a neural network learns, let us take a closer look at how human beings learn. We perform a task, and it is either appreciated or corrected by a trainer/teacher so that we can understand how to get better at that task. In a similar way, neural networks need a trainer which can describe what should be produced as a response to the input. On the basis of the actual value and predicted value, an error is calculated and it is sent back through the system. This error value is also called the cost function.
    </p>
    <p style="text-align: justify;">
        For every layer in the network, the cost function is calculated, and based on that value, the weights are adjusted for the next input. Our goal in this is to minimize the cost function because the lower the cost function would be, the greater will be the similarity between the actual and the predicted values. So as the network learns, the error keeps on reducing.
    </p>
    <img style="margin:0 auto;" src="/resources/images/blogs/introduction-to-neural-networks/intro_to_nn-10.gif" alt="network learns" class="img-responsive">
    <p style="text-align: justify;">
        We feed the resulting data back through the entire neural network. The weighted synapses connecting input variables to the neuron are the only thing we have control over.
    </p>
    <p style="text-align: justify;">
        As long as we have a difference between the actual and the predicted values, we need to keep adjusting the weight. After we update the weights, we run the neural network again on our data. This will give us a new cost function. We will send this cost function back again. This process of sending the cost function back is called back-propagation. We need to back-propagate the loss until our loss is as small as possible.
    </p>
    <img style="margin:0 auto;" src="/resources/images/blogs/introduction-to-neural-networks/intro_to_nn-11.png" alt="propagation" class="img-responsive">

<br>
<h3 id="conclusion"><b>Conclusion</b></h3>  

<p style="text-align: justify;">
    In this article, we have briefly explained the idea behind the working of neural networks. Further, we have also explored different activation functions that are used in building the models. We believe this article helps to get the coincide overview of the mechanism of neural networks.
</p>

<br>

</div><!-- end course-table -->