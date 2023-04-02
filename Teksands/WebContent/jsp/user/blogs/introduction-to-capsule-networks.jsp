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
				<td><h5 class="margin-0"><b><a href="#limitations-of-cnn" style="color: #222222;">Limitations of CNNs</a></b></h5>
				</td>
			</tr>
            <tr>
				<td>2.1</td>
				<td><span style="margin-left:10px;"><a href="#translational-equivariance" style="color: #222222;">Translational Equivariance</a></span></td>
			</tr>
            <tr>
				<td>2.2</td>
				<td><span style="margin-left:10px;"><a href="#human-visual-system-and-maxpooling" style="color: #222222;">Human visual system and Maxpooling</a></span></td>
			</tr>
            <tr>
				<td>2.3</td>
				<td><span style="margin-left:10px;"><a href="#large-datasets" style="color: #222222;">Large Datasets</a></span></td>
			</tr>
			<tr>
				<td>3</td>
				<td>
                    <h5 class="margin-0"><b><a href="#capsule-networks" style="color: #222222;" >Capsule Networks</a></b></h5>
				</td>
			</tr>
            <tr>
				<td>3.1</td>
				<td><span style="margin-left:10px;"><a href="#what-are-capsules" style="color: #222222;">What are Capsules?</a></span></td>
			</tr>
            <tr>
				<td>3.2</td>
				<td><span style="margin-left:10px;"><a href="#advantages-over-cnn" style="color: #222222;">Advantages over CNN</a></span></td>
			</tr>
            <tr>
				<td>3.3</td>
				<td><span style="margin-left:10px;"><a href="#how-capsule-networks-work" style="color: #222222;">How Capsule Networks Work?</a></span></td>
			</tr>
            <tr>
				<td>3.4</td>
				<td><span style="margin-left:10px;"><a href="#routing-algorithm" style="color: #222222;">Routing Algorithm</a></span></td>
			</tr>
            <tr>
				<td>4</td>
				<td><h5 class="margin-0"><b><a href="#conclusion" style="color: #222222;">Conclusion</a></b></h5>
				</td>
			</tr>
			<tr>
				<td>5</td>
				<td><h5 class="margin-0"><b><a href="#references" style="color: #222222;">References</a></b></h5>
				</td>
			</tr>
		</tbody>
	</table>
	

	<br>
	<h3 id="introduction"><b>Introduction</b></h3>
    <p style="text-align: justify">
        The current workhorse which is almost used by everyone in the deep learning community are Convolutional Neural Networks. CNNs are being used in the field of image classification, object detection,semantic segmentation and many more applications. CNNs gained popularity back in the year 2012 when AlexNet won the ImageNet challenge. Since then CNNs have become the first choice in the deep learning community. But are they the best solutions for image problems? 
    </p>

    <br>
    <h3 id="limitations-of-cnn"><b>Limitations of CNNs</b></h3>
    <p style="text-align: justify;">
        The answer to the question that I asked at the end of the previous section is NO. Let us understand the problems caused by CNNs.
    </p>
    <h4 id="translational-equivariance" style="margin-top: 20px;"><b>Translational Equivariance</b></h4>
    <img class="img-responsive" style="margin:0 auto;" src="/resources/images/blogs/introduction-to-capsule-networks/capsule-networks-1.png" alt="Cat at different positions">
    <p style="text-align: justify;">
        The above images contain a cat but at different positions. The cat in the left image is located in the right part of the image and the cat in the right image is located in the left part of the image. If we pass these images to a CNN cat classification model, it will predict a cat in both images but it will not provide us any extra information like cat shifted to left or right etc. Here is an illustration of a CNN cat classification model.
    </p>
    <img class="img-responsive" style="margin:0 auto;" src="/resources/images/blogs/introduction-to-capsule-networks/capsule-networks-2.png" alt="CNN cat classification model">
    <p style="text-align: justify;">
        Here is another illustration.
    </p>
    <img class="img-responsive" style="margin:0 auto;" src="/resources/images/blogs/introduction-to-capsule-networks/capsule-networks-3.jpg" alt="Left side has different parts of face. Right side has a complete Human Face">
    <p style="text-align: justify;">
        The image on the left has parts of a human face - ears,eyes,nose and lips and the image on the right has a complete drawing of the human face.
    </p>
    <p style="text-align: justify;">
        If we pass these two images to a CNN face detection model, it will detect faces in both images. But the image on the left is not a face. This is the drawback of CNN's that they are translational invariant but not translational equivariant. 
    </p>

    <h4 id="human-visual-system-and-maxpooling" style="margin-top: 20px;"><b>Human Visual System and Maxpooling</b></h4>
    <p style="text-align: justify;">
        Most of you would have studied that CNN's represents our visual cortex system. Yes they do. But CNN's are a bad representation of the visual cortex system. When we see anything, our visual stimulus is triggered and sends the low level data to the part of the brain which can handle low level features. But CNN's do not have any such property. Infact, they generate high level semantic information from low level features through various convolution and maxpooling layers.
    </p>
    <p style="text-align: justify;">
        According to Geoffrey Hinton , "The pooling operation used in convolutional neural networks is a big mistake and the fact that it works so well is a disaster". 
    </p>
    <p style="text-align: justify;">
        The fact that Hinton is pointing towards is the loss of useful information due to maxpooling.
    </p>
    <h4 id="large-datasets" style="margin-top: 20px;"><b>Large Datasets</b></h4>
    <p style="text-align: justify;">
        CNN's require a large amount of data to generalize. This requirement of a large amount of data points towards the shortcomings of backpropagation. In the case of small datasets, CNNs will fail to give a good accuracy compared to the machine learning models.
    </p>
    <br>
    <h3 id="capsule-networks"><b>Capsule Networks</b></h3>
    <p style="text-align: justify;">
        The limitations of CNNs that I have discussed in the previous section can be solved using capsule networks. Capsule Networks were proposed by Geoffrey Hinton in his paper 
        <strong>"Dynamic Routing Between Capsules"</strong> in 2017. Since then , capsule networks have become an active field of research. They use capsules rather than neurons.
    </p>
    <h4 id="what-are-capsules" style="margin-top: 20px;"><b>What are Capsules?</b></h4>
    <p style="text-align: justify;">
        Capsules are the substitutes of artificial neurons in CNN's which do the computations of their inputs and then encapsulate the information in the form of a vector. The neurons in CNN's contain information in the form of scalar quantity while the capsules contain information in the form of vectors. Their scaler term gives us the probability of an object and the direction tells us about its pose(size, position, orientation etc.). Group of these capsules form a layer and these layers result in a capsule network.
    </p>
    <h4 id="advantages-over-cnn" style="margin-top: 20px;"><b>Advantages over CNN</b></h4>
    <p style="text-align: justify;">
        Let us understand how capsule networks can overcome the limitations of CNNs that we discussed above.
    </p>
    <ol style="text-align: justify; padding-left: 40px;">
        <li><b>Translational Equivariant</b></li>
        <p style="text-align: justify; padding-left: 20px;">
            Consider two images with the same object  but different pose. If we pass these images to a capsule network, the capsule vectors will have the same probability for that object but different orientation. It can help us to understand the shift of objects inside the image and this makes capsule networks translational equivarant as well as invariant. 
        </p>
        <li><b>Maxpooling</b></li>
        <p style="text-align: justify; padding-left: 20px;">
            Capsule Networks does not use any maxpooling layers and therefore saves useful information from being lost.
        </p>
        <li><b>Amount of Data</b></li>
        <p style="text-align: justify; padding-left: 20px;">
            Unlike CNN, Capsule Networks use less data for training as it saves spatial relationships with features.
        </p>
    </ol>
    <h4 id='how-capsule-networks-work' style="margin-top: 20px;"><b>How Capsule Networks Work?</b></h4>
    <p style="text-align: justify;">
        I hope you are familiar with CNN architectures in which one layer passes information to the subsequent layers. Capsule Networks or CapsNet also follow the same flow of information. Here is the illustration.
    </p>
    <img class="img-responsive" style="margin:0 auto;" src="/resources/images/blogs/introduction-to-capsule-networks/capsule-networks-4.jpg" alt="Capsule Networks' information flow illustration">
    <p style="text-align: justify;">
        The above network shows the capsule network on a MNIST dataset. Initial layers use convolution to get low level features and then pass these low level information to the primary capsule layer. The primary capsule layer reshape the convolutional layer output into capsules containing vectors of equal dimensions. The length of these vectors indicates the probability of an object and therefore we need to change the length in the range 0 to 1. This operation is known as "Squashing" in which we pass the output of capsule layers from a nonlinear function. Here is the formula for nonlinear function.
    </p>
    <img class="img-responsive" style="margin:0 auto;" src="/resources/images/blogs/introduction-to-capsule-networks/capsule-networks-5.jpg" alt="nonlinear function formula">
    <p style="text-align: justify;">
        Here, Sj is the input vector, ||Sj|| is the norm of the vector and Vj is the output vector. This output vector is then passed to the next layer. Capsules in the next layers are generated using a dynamic routing algorithm. Let us understand about routing algorithms.
    </p>
    <h4 id='routing-algorithm' style="margin-top: 20px;"><b>Routing Algorithm</b></h4>
    <p style="text-align: justify;">
        The routing algorithm in capsule networks connects capsules in consecutive layers and enables the upper level capsules to learn higher level concepts by combining the concepts of the lower level capsules. The routing algorithm defines the agreement between these capsules. The lower level capsules will send information to the higher level capsules if they agree to each other.
    </p>
    <p style="text-align: justify;">
        Let's look at a facial image as an example. If a lower layer contains four capsules, each symbolising the mouth, nose, left eye, and right eye, respectively. And if all four agree on the same face position, the output layer capsule will deliver its values indicating the presence of a face.
    </p>
    <p style="text-align: justify;">
        To generate output for the routing capsules (capsules in the higher layer), the output from the lower layer (u) is first multiplied by the weight matrix W, and then a routing coefficient C is applied. This C will identify which lower-layer capsules will transfer their output to which higher-layer capsule. Here is the mathematical expression.
    </p>
    <img class="img-responsive" style="margin:0 auto;" src="/resources/images/blogs/introduction-to-capsule-networks/capsule-networks-6.jpg" alt="">
    <p style="text-align: justify;">
        The lower level capsules or child capsules send their input to higher level capsules or parent capsules to make agreement. The Capsule that makes the agreement is assigned a larger weight. Initially, the routing coefficients are all set equal depending on the
        number of parent capsules. Then for each parent capsule, the child capsules are multiplied with
        the routing coefficient and then summed up. Squashing is performed after summation to take
        down the values between 0 and 1. After squashing, the dot product between the child capsules
        and parent capsules give us the similarity. The input child capsule having highest similarity is
        assigned greater routing coefficient. Routing coefficients are updated as old routing coefficient
plus the highest dot product. The iteration is run for user defined steps, typically 3. Here is the illustration.
    </p>
    <img class="img-responsive" style="margin:0 auto;" src="/resources/images/blogs/introduction-to-capsule-networks/capsule-networks-7.png" alt="Capsule Network">
<!-- -------------------------------------------------------------- -->

<br>
<h3 id="conclusion"><b>Conclusion</b></h3>  

<p style="text-align: justify;">
    In this article, we have discussed the capsule networks and its architecture. If you want to deep dive into the capsule network, I would recommend you to go through the original paper given in the references. 
</p>
<br>
<h4 id='references'><b>References</b></h4>    

<ol style="padding-left: 40px; text-align: justify;">
    <li style="word-break: break-all"><a href="https://arxiv.org/pdf/1710.09829.pdf">https://arxiv.org/pdf/1710.09829.pdf</a></li>
</ol>
<br>

</div><!-- end course-table -->