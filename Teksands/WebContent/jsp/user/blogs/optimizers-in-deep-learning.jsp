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
				<td><span style="margin-left:10px;"><a href="#gradient-descent" style="color: #222222;">Gradient Descent</a></span></td>
			</tr>
            <tr>
				<td>1.2</td>
				<td><span style="margin-left:10px;"><a href="#adagrad" style="color: #222222;">Adagrad</a></span></td>
			</tr>
            <tr>
				<td>1.3</td>
				<td><span style="margin-left:10px;"><a href="#adam" style="color: #222222;">Adam</a></span></td>
			</tr>
            <tr>
				<td>1.4</td>
				<td><span style="margin-left:10px;"><a href="#rmsprop" style="color: #222222;">RMSProp</a></span></td>
			</tr>
			<tr>
				<td>2</td>
				<td><h5 class="margin-0"><b><a href="#performance-analysis" style="color: #222222;">Performance Analysis</a></b></h5>
				 </td>
			</tr>
            <tr>
				<td>2.1</td>
				<td><span style="margin-left:10px;"><a href="#importing-and-preprocessing-dataset" style="color: #222222;">Importing and Preprocessing Dataset</a></span></td>
			</tr>
            <tr>
				<td>2.2</td>
				<td><span style="margin-left:10px;"><a href="#model-creation" style="color: #222222;">Model Creation</a></span></td>
			</tr>
            <tr>
				<td>2.3</td>
				<td><span style="margin-left:10px;"><a href="#model-training" style="color: #222222;">Model Training</a></span></td>
			</tr>
			<tr>
				<td>3</td>
				<td><h5 class="margin-0"><b><a href="#conclusion" style="color: #222222;">Conclusion</a></b></h5>
				 </td>
			</tr>
			
		</tbody>
	</table>
	
	<h3 id="introduction"><b>Introduction</b></h3>
    <p style="text-align: justify">
        Optimization is the task of finding the optimal loss surface by changing the attributes such as the weights and bias to achieve the defined objective (curve fitting). Optimizers are responsible for reducing loss and providing the best result possible. There are numerous optimizers proposed in the literature; different optimizers are suitable for different types of tasks. In this article, we will understand some of the most commonly used optimizers.
    </p>
    <br>

    <h4 id="gradient-descent" style="margin-top: 20px;"><b>Gradient Descent</b></h4>
    <p style="text-align: justify;">
        Gradient Descent is the most widely used optimization algorithm in tasks such as linear regression and logistic regression. The backpropagation in neural networks also uses a gradient descent optimizer or its derivatives. It uses the first-order derivative of the loss function and determines the direction in which the gradient should be directed to reach the local minima in the loss surface.
    </p>
    <p style="text-align: justify;">
        Basically, in this algorithm we need to find a valley of a mountain. The valley being the minimum loss and the mountain being the loss function. In order to find the minimum loss we need to proceed with a negative gradient of the function at the current point.
    </p>
    <p style="text-align: justify;">
        Gradient descent is of three types.. There are:
    </p>
    <ol style="padding-left: 40px;">
        <li><strong>Batch Gradient Descent:</strong> In batch gradient descent, we update the weights after calculating the gradient on the whole dataset. It is easy to implement, but if our dataset is too large then this may take a long time to converge to a minima.</li>
        <li><strong>Stochastic Gradient Descent:</strong> In Stochastic Gradient Descent, the weights are updated after computation of loss on each training example. This means that if our dataset has 100 rows, then SGD will update the weights 100 times in one cycle. This kind of model converges in less time and also causes high variance.</li>
        <li><strong>Mini- Batch Gradient Descent:</strong> It is the best variation of gradient descent. In Mini- Batch Gradient Descent, the weights are updated after every batch. So, if our dataset has 100 rows and we have a batch size of 10 then our weights will be updated 100/10= 10 times. This algorithm has less variance.</li>
    </ol>
    <h4 id="adagrad" style="margin-top: 20px;"><b>Adagrad</b></h4>
    <p style="text-align: justify;">
        AdaGrad stands for the adaptive gradient. A common disadvantage associated with most of the optimizers is that the learning rate remains constant throughout the training process. Adagrad adapts the learning rate for each parameter at every time step to.  It sets the learning rate to a lower value for parameters with frequently occurring features and higher learning rates for parameters with infrequent features. It eliminates the need to manually tune the learning rate. Adagrad is an optimization algorithm of second-order and it works on the derivative of an error function. It is computationally expensive because we need to calculate second-order derivatives.
    </p>
    <h4 id="adam" style="margin-top: 20px;"><b>Adam</b></h4>
    <p style="text-align: justify;">
        Adam or Adaptive moment estimation is the most popular and widely used optimization algorithm adopted by the <a href="https://teksands.ai/courses/deep-learning-and-cnn-for-image-processing" target="_blank"><b>deep learning</b></a>, computer vision, and natural language processing community.  Adam provides the following advantages over other optimization algorithms.
    </p>
    <ol style="padding-left: 40px;">
        <li>Limited memory requirements</li>
        <li>Easy to implement</li>
        <li>Computationally efficient</li>
        <li>Invariant to diagonal rescale of the gradients</li>
        <li>Well suited for problems that are large in terms of data and/or parameters</li>
    </ol>
    <p style="text-align: justify;">
        This is also an adaptively learning algorithm. This optimizer works with the momentum of first-order and second-order derivatives. Adam also makes use of an exponentially decaying average of the past gradients. This optimizer rectifies the vanishing learning rate problem.
    </p>

    <h4 id="rmsprop" style="margin-top: 20px;"><b>RMSProp</b></h4>
    <p style="text-align: justify;">
        RMSProp stands for Root Mean Square Propagation. This solves some of the disadvantages of Adagrad. In RMSProp, the learning rate gets adjusted automatically and a different learning rate is chosen for each parameter. This optimizer divides the learning rate by an exponentially decaying average of squared gradients. A good default value for the learning rate is 0.001.
    </p>

    <h3 id="performance-analysis"><b>Performance Analysis</b></h3>
    <p style="text-align: justify;">
        Now let us see the performance of these optimizers on Mnist data.
    </p>
    <p style="text-align: justify;">
        We will use SGD, RMSProp, Adam and Adagrad optimizer for our comparison. We will construct a CNN architecture and train it for 5 epochs with each optimizer then we will compare the validation accuracy attained by each optimizer.
    </p>
    <h4 id="importing-and-preprocessing-dataset" style="margin-top: 20px;">Importing and Preprocessing <b></b></h4>
    <pre><code>#Here we are importing all the libraries necessary for our analysis

from keras.datasets import mnist
from keras.utils import to_categorical
from keras.layers import *
from keras.models import Sequential

#Here we are importing the MNIST dataset from keras 
#and making loading train and test data from it

(XTrain,YTrain),(XTest,YTest) = mnist.load_data()
</code></pre>
    <p style="text-align: justify;">
        As we can see we have loaded the mnist dataset and stored it in separate train and test variables. Now we will reshape our train and test data. 
    </p>
    <pre><code># define a function which will help us preprocess our train and test data.
def preprocess_data(X,Y):
    X = X.reshape((-1,28,28,1))
    X = X/255.0
    Y = to_categorical(Y)
    return X,Y

XTrain,YTrain = preprocess_data(XTrain,YTrain)
print(XTrain.shape,YTrain.shape)

XTest,YTest = preprocess_data(XTest,YTest)
print(XTest.shape,YTest.shape)
</code></pre>
    <p style="text-align: justify;">
        Output:
    </p>
    <pre>(60000, 28, 28, 1) (60000, 10)
(10000, 28, 28, 1) (10000, 10)
</pre>
    <p style="text-align: justify;">
        As we can see our train and test data both now have a shape of (28,28,1) where 1 is the number of channels.
    </p>

    <h4 id="model-creation" style="margin-top: 20px;"><b>Model Creation</b></h4>
    <p style="text-align: justify;">
        Now it is time to create our CNN architecture.
    </p>
    <pre>model = Sequential()
model.add(Conv2D(32,(3,3),activation='relu',input_shape=(28,28,1)))
model.add(MaxPool2D((2,2)))
model.add(Conv2D(64,(3,3),activation='relu',input_shape=(28,28,1)))
model.add(MaxPool2D((2,2)))
model.add(Conv2D(64,(3,3),activation='relu',input_shape=(28,28,1)))
model.add(Flatten())
model.add(Dense(64,activation='relu'))
model.add(Dense(10,activation='softmax'))
model.summary()
</pre>
    <img src="/resources/images/blogs/Optimizers-Deep-Learning/optimizers-in-deep-learning-1.png" alt="cnn architecture with 3 convolutional layers and 2 dense layers" class="img-responsive" style="margin: 0 auto;">
    <p style="text-align: justify;">
        As we can see our CNN architecture has 3 convolutional layers and 2 dense layers.
    </p>
    <p style="text-align: justify;">
        Now let us train our data for 5 epochs with different optimizers.
    </p>
    <h4 id="model-training" style="margin-top: 20px;"><b>Model Training</b></h4>
    <pre>#Here we are compiling our model with optimizer as adam. We have a validation_split of 0.1
model.compile(optimizer='adam',loss='categorical_crossentropy',metrics=['accuracy'])
hist = model.fit(XTrain,YTrain,epochs=5,validation_split=0.1,batch_size=128)
</pre>
    <p style="text-align: justify;">
        We will train our model with different optimizers and compare the validation accuracy achieved.
    </p>
    <div style="overflow-x:auto;">
        <table class="table table-bordered table-striped table-responsive ">
      <thead>
          <tr>
              <th style="text-align: center;background-color: #fff;border-right: 1px solid #ddd;"></th>
              <th style="text-align: center;background-color: #fff;border-right: 1px solid #ddd;">Optimizer</th>
              <th style="text-align: center;background-color: #fff;border-right: 1px solid #ddd;">Validation Accuracy</th>
          </tr>
      </thead>
      <tbody style="text-align: center;">
          <tr>
              <td>0</td>
              <td>SGD</td>
              <td>96.50</td>
          </tr>
          <tr>
              <td>1</td>
              <td>Adagrad</td>
              <td>89.28</td>
          </tr>
          <tr>
              <td>2</td>
              <td>Adam</td>
              <td>98.97</td>
          </tr>
          <tr>
              <td>3</td>
              <td>rmsprop</td>
              <td>98.95</td>
          </tr>
      </tbody>
      </table>
        
        </div>
    <p style="text-align: justify;">
        As we can see from the table, maximum validation accuracy is achieved when we have an optimizer as adam.
    </p>

<!-- -------------------------------------------------------------- -->

<h3 id="conclusion"><b>Conclusion</b></h3>  

<p style="text-align: justify;">
    In this article, we have discussed the various optimizers available for training deep neural networks. Further, we have experimented by training a neural network with SGD, Adam, RMSProp, and Adagrad optimizers respectively, and compared the validation accuracy. We have also seen how Adam optimizer outperformed the Adagrad and RMSprop to achieve superior performance. We also discussed in detail the variants of the gradient descent algorithm.
</p>
<h4><b>References</b></h4>    

<ol style="padding-left: 40px; text-align: justify;">
    <li style="word-break: break-all"><a href="https://arxiv.org/abs/1412.6980" title="">https://arxiv.org/abs/1412.6980</a></li>
    <li style="word-break: break-all"><a href="http://www.cs.toronto.edu/~tijmen/csc321/slides/lecture_slides_lec6.pdf" title="">http://www.cs.toronto.edu/~tijmen/csc321/slides/lecture_slides_lec6.pdf</a></li>
    <li style="word-break: break-all"><a href="https://ruder.io/optimizing-gradient-descent/index.html#adagrad" title="">https://ruder.io/optimizing-gradient-descent/index.html#adagrad</a></li>
    <li style="word-break: break-all"><a href="https://arxiv.org/abs/1412.6651" title="">https://arxiv.org/abs/1412.6651</a></li>
</ol>

<br>

</div><!-- end course-table -->