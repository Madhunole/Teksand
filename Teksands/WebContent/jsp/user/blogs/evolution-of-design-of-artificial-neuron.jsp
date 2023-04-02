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
				<td><h5 class="margin-0"><b><a href="#biological-neuron" style="color: #222222;">Biological Neuron</a></b></h5>
				 </td>
			</tr>
            <tr>
				<td>3</td>
				<td><h5 class="margin-0"><b><a href="#mcculloch-pits(mcp)-neuron" style="color: #222222;">McCulloh Pitts (MCP) Neuron</a></b></h5>
				 </td>
			</tr>
            <tr>
				<td>4</td>
				<td><h5 class="margin-0"><b><a href="#perceptron" style="color: #222222;">Perceptron</a></b></h5>
				 </td>
			</tr>
            <tr>
				<td>5</td>
				<td><h5 class="margin-0"><b><a href="#adaline" style="color: #222222;">Adaline</a></b></h5>
				 </td>
			</tr>
            <tr>
				<td>6</td>
				<td><h5 class="margin-0"><b><a href="#madaline" style="color: #222222;">Madaline</a></b></h5>
				 </td>
			</tr>
			<tr>
				<td>7</td>
				<td><h5 class="margin-0"><b><a href="#conclusion" style="color: #222222;">Conclusion</a></b></h5>
				 </td>
			</tr>
			
		</tbody>
	</table>
	
	<h3 id="introduction"><b>Introduction</b></h3>
    <p style="text-align: justify">
        How did it all begin? This thought would have crossed everyone's mind while studying various concepts related to Artificial Intelligence. Another interesting thought is about the usage of the word "Neural" for deep learning models such as Artificial Neural Networks, Recurrent <a href="https://teksands.ai/blog/recurrent-neural-networks" target="_blank"><b>neural network</b></a>, etc. This can lead to a vague idea that the concepts of these models are borrowed from the functioning of the human brain. To summarize all these thoughts we'll take a deeper dive into the past to see how neural networks were born and how they progressed over time. Also, the parallelism that is drawn with biological neurons will be discussed briefly.
    </p>

    <h3 id="biological-neuron"><b>Biological Neuron</b></h3>
    <p style="text-align: justify;">
        Before we talk about any preliminary models that mimic the biological neuron let's have a look at how biological neurons work. Following is a simplified representation of a neuron:
    </p>
    <img class="img-responsive" style="margin: 0 auto;max-height: 360px;" src="/resources/images/blogs/Evolution-Of-Design-Of-Artificial-Neuron/evolution-of-design-of-an-1.png" alt="neuron with dendrites, soma, axon and synapse">
    <p style="text-align: justify;">
        It has 4 different components:
    </p>
    <ol style="padding-left: 40px;">
        <li>Dendrite - Takes the signal(input) from other neurons</li>
        <li>Soma - Processes the information in the signal</li>
        <li>Axon - Transmits the output from the neuron</li>
        <li>Synapse - Connects the neuron to other neurons to tranfer the processed signal</li>
    </ol>
    <p style="text-align: justify;">
        Let's have a look at how neurons work on a higher level. Dendrites take the input, the processing is done by Soma(CPU), the output is passed on to other neurons using a wire-like structure. To summarize it, neurons do the following things - take input, process the input, and then generate the output. Now in reality we have more than one neuron in our body and they make decisions based on the inputs they receive. For example, we are playing a sport like a football and there is a ball coming towards us then the signal from our eyes regarding that ball is passed down to our hands/feet through a network of neurons. But how many neurons do we have?
    </p>
    <p style="text-align: justify;">
        An estimate says that the human body has around 100 billion neurons, and they are inter-connected through complex networks with the smallest unit functioning close to what we showed above. Now in the flying ball example, not all the neurons are fired or activated at the same time. Only those neurons which can send signals to move our hand/feet to protect us from the ball are activated. This is an interesting property of biological neurons as they have a mechanism by which only relevant neurons are fired at a time. Another interesting property is that neurons are believed to have a hierarchical order and each layer of a neuron does a specific task.
    </p>
    <p style="text-align: justify;">
        With all this said about the biological neuron let's move on and talk about how artificial neurons were developed over the past few decades.
    </p>

    <h3 id='mcculloch-pits(mcp)-neuron'><b>McCulloch Pitts(MCP) Neuron</b></h3>
    <p style="text-align: justify;">
        The most fundamental unit of a deep neural network is an artificial neuron. The very first attempt at building an artificial neuron to mimic the functionality of a biological neuron was made by McCulloh (neuroscientist) and Pitts(logician) in 1943 in their research paper entitled <strong>"A Logical Calculus Of The Ideas Immanent In Nervous Activity"</strong>. Following is a schematic representation of their proposed artificial neuron.
    </p>
    <img class="img-responsive" style="margin: 0 auto;max-height: 360px;" src="/resources/images/blogs/Evolution-Of-Design-Of-Artificial-Neuron/evolution-of-design-of-an-2.png" alt="proposed representation of artificial neuron">
    <p style="text-align: justify;">
        Now the functioning of this unit can be divided into two parts. Let's try to understand the functioning of these two units with an example where we say yes to eating an ice cream based on different inputs we get. Assume that the inputs are flavor(x<sub>1</sub>), color (x<sub>2</sub>), sugar content(x<sub>3</sub>). Assume all the inputs have only two possibilities represented by binary digits (0,1) and the output is also binary (0 for no, 1 for yes). The first part is the input part where function g takes the inputs and performs an aggregation function by adding these inputs. Next, a function f  takes the aggregated values and makes a decision based on a threshold theta.
    </p>
    <!-- <p style="text-align: center;font-size: 1.2em;">
        Formula
    </p> -->
    <img class="img-responsive" style="margin: 0 auto;max-height: 360px;" src="/resources/images/blogs/Evolution-Of-Design-Of-Artificial-Neuron/evolution-of-design-of-an-3.png" alt="proposed representation of artificial neuron">
    <p style="text-align: justify;">
        Now, you'll want to eat the ice cream when it has your favorite flavor or it has less sugar or the color is attractive. These factors are taken into account by aggregating all the inputs. If the final value after aggregation is sufficiently larger than a threshold then you would surely like to eat the ice cream. Sounds efficient enough right? But there's a major issue, there's no learning associated with this model. Threshold values are manually assigned and can be different for different people. This means that we cannot have a model which is generalizable. So what next!!?
    </p>
    <p style="text-align: justify;">
        After realizing that there was no learning involved, in such a model many researchers tried to add a learning component to the model based on the errors it made and this led to the birth of the perceptron model. Let's have a look at it.
    </p>


    <h3 id="perceptron"><b>Perceptron</b></h3>
    <p style="text-align: justify;">
        Perceptron was arguably the first model that had a self-training mechanism using which it could learn from the errors it made during prediction. It was introduced by Frank Rosenblatt in 1957 (<strong>"The perceptron: A probabilistic model for information storage and organization in the brain"</strong>). Following is a schematic representation of a single layer perceptron:
    </p>
    <img class="img-responsive" style="margin: 0 auto;max-height: 360px;" src="/resources/images/blogs/Evolution-Of-Design-Of-Artificial-Neuron/evolution-of-design-of-an-4.jpeg" alt="Single layer perceptron">
    <p style="text-align: justify;">
        Let's understand how a perceptron works. The working is pretty similar to that of MCP neurons with minor modifications.
    </p>
    <ol style="padding-left: 40px;">
        <li>
            Input - It takes input X where X can have any number of dimensions d i.e. x<sub>1</sub>, x<sub>2</sub>, x<sub>3</sub>......x<sub>d</sub>.
        </li>
        <li>
            Weight matrix - There's a weight w(i) assigned corresponding to each dimension d.
        </li>
        <li>
            Weighted sum - The dot product or the weighted sum 
            <span>
                (
                    z= <span style="font-size: 1.2em;">&Sigma;</span>
                    <span class="supsub">
                        <span class="super">d</span>
                        <span class="sub">i=1</span>
                    </span>
                    x<sub>i</sub>w<sub>i</sub> = W<sup>T</sup>X
                )
            </span>
            is calculated in the next step. We have assumed that W and X are both column/row vectors.
        </li>
        <li>
            Activation - This is weighted sum is then passed on to the activation function which is a threshold function defined as ( &theta;  is the threshold value). This function is similar to a sigmoid function if we set &theta; to zero.
        </li>
        <p style="text-align: center; font-size: 1.2em;">
            g(z) = { 1 if z> &theta;-1 otherwise
        </p>
        <li>
            Weight Update - This step is something that separates Adaline from perceptron neurons. In this step we pass the difference between continuous aggregated value and class label to the model to learn. This is a self-learning step defined by the following equations:
        </li>
        <p style="text-align: center; font-size: 1.2em;">
            w<sub>i</sub> := w<sub>i</sub> + &Delta;w<sub>i</sub>
        </p>
        <p style="text-align: center">
            where &Delta;w<sub>i</sub> = &eta;*(target<sup>i</sup> - output<sup>i</sup>)*
            x
            <!-- <sub>i</sub> -->
            <sup>i</sup>
            <span class="sub1">i</span>
        </p>
    </ol>

    <p style="text-align: justify;">
        Here 'i' corresponds to dimension and 'j' corresponds to an index of the training example. If you are familiar with gradient descent techniques then the result given above is the gradient of the sum-of-squared cost function and using this gradient we are trying to minimize the error. The only issue with such a network is that it cannot learn on its own from the error it makes and the weights are changed by hand-tuning them. This was a big drawback which was later on taken care of by another algorithm called Adaline.
    </p>

    <br>
    <h3><b>Adaline</b></h3>
    <p style="text-align: justify;">
        Adaline (Adaptive Linear Neuron) was developed by Professor Bernard Widrow and his student Ted Hoff in 1960  (Adaptive Switching Circuits) at Stanford. It is very similar to a perceptron model. There are some minor differences which include a change in activation function (linear activation), this is followed by a threshold function and thus, the learning is not based on errors from final outputs but is based on the output from activation functions. Following is a diagram of an Adaline neuron:
    </p>
    <img class="img-responsive" style="margin: 0 auto;max-height: 360px;" src="/resources/images/blogs/Evolution-Of-Design-Of-Artificial-Neuron/evolution-of-design-of-an-5.png" alt="adaline network">
    <p style="text-align: justify;">
        Let's have a look at different steps in the working of an Adaline network:
    </p>
    <ol style="padding-left: 40px;">
        <li>
            Input - It takes input X where X can have any number of dimensions d i.e. x<sub>1</sub>, x<sub>2</sub>, x<sub>3</sub>,...., x<sub>d</sub>
        </li>
        <li>
            Weight matrix - There's a weight w(i) assigned corresponding to each dimension d.
        </li>
        <li>
            Weighted sum - The dot product or the weighted sum 
            <span>
                (
                    z= <span style="font-size: 1.2em;">&Sigma;</span>
                    <span class="supsub">
                        <span class="super">d</span>
                        <span class="sub">i=1</span>
                    </span>
                    x<sub>i</sub>W<sub>i</sub> = W<sup>T</sup>X
                )
            </span> 
            is calculated in the next step. We have assumed that W and X are both column/row vectors.
        </li>
        <li>
            Activation - This weighted sum is then passed on to the activation function which is just a linear activation that is equivalent to multiplying the aggregated values with 1.
        </li>
        <li>
            Weight Update - This step is something that separates Adaline from perceptron neurons. In this step we pass the difference between continuous aggregated value and class label to the model to learn. This is a self-learning step defined by the following equations:
        </li>
        <p style="text-align: center; font-size: 1.2em;">
            w<sub>i</sub> := w<sub>i</sub> + &Delta;w<sub>i</sub>
        </p>
        <p style="text-align: center">
            where &Delta;w<sub>i</sub> = &eta;*(target<sup>i</sup> - output<sup>i</sup>)*
            x
            <!-- <sub>i</sub> -->
            <sup>i</sup>
            <span class="sub1">i</span>
        </p>
        <p style="text-align: justify;">
            One thing to keep in mind here is that the output here is a continuous value. This means that even if our prediction is correct our model will still try to learn. For example, say our output is 0.8 (for class 1 input) with a threshold of 0.6 but the difference between label value 1 and output 0.8 is 0.2 which indicates that our model will try to bridge the gap between 0.8 and 1.
        </p>
        <li>
            Thresholding function - This function takes the value from the linear activation function and uses a threshold to predict the final output.
        </li>
        <p style="text-align: center;font-size: 1.2em;">
            g(z)= { 1 if z > &#920; - 1    otherwise 
        </p>
    </ol>
    <p style="text-align: justify;">
        This sums up the working of an Adaline neuron. In a nutshell, the major difference between Adaline and perceptron is that perceptron uses class labels to learn model coefficients whereas Adaline uses continuous predicted values to learn model coefficients. The method used by Adaline is more powerful as it tells your model how much wrong or right its predictions are.
    </p>
    <p style="text-align: justify;">
        One of the major issues concerned with both Adaline and perceptron models is that they cannot solve a nonlinear problem (failure on solving an XOR gate problem). Later, the researchers found that such problems can be solved by stacking multiple neurons, which led to the birth of Madaline.
    </p>
    

    <h3 id="madaline"><b>Madaline</b></h3>
    <p style="text-align: justify;">
        Madaline (Many Adaline) is a three-layer (input, hidden, output), fully connected, a feed-forward artificial neural network that uses Adaline neurons in its hidden and output layers. It has multiple Adaline units in parallel in the hidden layer and one Madaline neuron in the output layer. Have a look at the architecture of the Madaline network:
    </p>
    <img class="img-responsive" style="margin: 0 auto;max-height: 360px;" src="/resources/images/blogs/Evolution-Of-Design-Of-Artificial-Neuron/evolution-of-design-of-an-6.png" alt="madaline network">
    <p style="text-align: justify;">
        Let's talk about architecture. It consists of 'n' neurons in the input layer, 'm' neurons in the Adaline layer, and 1 neuron in the Madaline layer. Following is a stepwise propagation through this network:
    </p>
    <ol style="padding-left: 40px;">
        <li>
            Input - Input consists of an 'n' dimension vector having input values.
        </li>
        <li>
            Net input at a neuron of Adaline layer  (fo j Adaline neurons) - 
        </li>
        <p style="text-align: center; font-size: 1.2em;">
            Q<span>inj</span> = b<spjan></span> + &Sigma;</span>
                <span class="supsub">
                    <span class="super">n</span>
                    <span class="sub">i</span>
                </span>
                x<sub>i</sub>w<sub>ij</sub>
        </p>
        <p style="text-align: justify;">
            b<sub>j</sub> is the bias term, w<sub>ij</sub> is the weight for input neuron i to Adaline hidden neuron j.
        </p>
        <li>
            Output (Q<sub>j</sub>) from each neuron of the Adaline layer is governed by the function given below -
        </li>
        <p style="text-align: center;font-size: 1.2em;">
            f(x) = {1   if x&geq;0 - 1     if x&lt;0 
        </p>
        <p style="text-align: center;font-size: 1.2em;">
            Q<sub>j</sub> = f(Q<sub>inj</sub>)
        </p>
        <li>
            The final output is governed by the following equation of weighted sum of input from previous layer and weights from the previous layer to the output neuron:
        </li>
        <p style="text-align: center;font-size: 1.2em;">
            y<sub>inj</sub> = b<sub>0</sub>+ 
            &Sigma;
            <span class="supsub">
                <span class="super">m</span>
                <span class="sub">j=1</span>
            </span>
            Q<sub>j</sub>v<sub>j</sub>
        </p>
        <p style="text-align: center;font-size: 1.2em;">
            y = f(y<sub>inj</sub>)
        </p>
        <li>
            Weight update - This stage has three different cases mentioned below:
        </li>
        <ol style="padding-left: 20px;list-style: lower-alpha;">
            <li>
                Case - 1 (y is not equal to target value, target value = 1)
            </li>
            <p style="text-align: center;font-size: 1.2em;">
                w<sub>ij</sub>(new) = w <sub>ij</sub>(old) + &alpha; * (1 - Q<sub>inj</sub>)x<sub>i</sub>
            </p>
            <p style="text-align:center;">
                b<sub>j</sub>(new) = b<sub>j</sub>(old) + &alpha; * ( 1 - Q<sub>inj</sub>)
            </p>
            <li>
                Case - 2 (y is not equal to target value, target value = -1)
            </li>
            <p style="text-align: center;font-size: 1.2em;">
                w<sub>ik</sub>(new) = w <sub>ik</sub>(old) + &alpha; * (1 - Q<sub>ink</sub>)x<sub>i</sub>
            </p>
            <p style="text-align:center;">
                b<sub>k</sub>(new) = b<sub>k</sub>(old) + &alpha; * ( 1 - Q<sub>ink</sub>)
            </p>
            <li>
                Case - 3 (when actual output is equal to target output)
            </li>
            <p style="text-align: justify;">
                In this case, there is no change in weights. 
            </p>
        </ol>
    </ol>
<!-- -------------------------------------------------------------- -->

<h3 id="conclusion"><b>Conclusion</b></h3>  

<p style="text-align: justify;">
    This brings us to an end of how the development of artificial neurons took place over the past few decades. This progressive development eventually led to the idea of the modern Neural Network architecture that we see and use nowadays. We went through perceptron, Adaline, and Madaline models where we also discussed the difference between these models. More about the further development of neural nets in the upcoming articles. Happy learning!
</p>
<h4><b>References</b></h4>    

<ol style="padding-left: 40px; text-align: justify;">
    <li style="word-break: break-all"><a href="https://isl.stanford.edu/~widrow/papers/c1988madalinerule.pdf" title="">https://isl.stanford.edu/~widrow/papers/c1988madalinerule.pdf</a></li>
    <li style="word-break: break-all"><a href="https://sebastianraschka.com/faq/docs/diff-perceptron-adaline-neuralnet.html" title="">https://sebastianraschka.com/faq/docs/diff-perceptron-adaline-neuralnet.html</a></li>
    <li style="word-break: break-all"><a href="https://cs.stanford.edu/people/eroberts/courses/soco/projects/neural-networks/Neuron/index.html" title="">https://cs.stanford.edu/people/eroberts/courses/soco/projects/neural-networks/Neuron/index.html</a></li>
</ol>

<br>

</div><!-- end course-table -->