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
				<td><h5 class="margin-0"><b><a href="#problems-solved-by-inception-network" style="color: #222222;">Problems solved by inception network</a></b></h5>
				 </td>
			</tr>
			<tr>
				<td>3</td>
				<td>
                    <h5 class="margin-0"><b><a href="#inception-module" style="color: #222222;" >Inception Module</a></b></h5>
				</td>
			</tr>
            <tr>
                <td>4</td>
                <td>
                    <h5 class="margin-0"><b><a href="#inception-network-architecture" style="color: #222222;">Inception Network Architecture</a></b></h5>
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
        Deep learning is a growing field with new innovations and research papers emerging frequently. Convolutional neural networks have improved a lot with new ideas to tackle frequently faced problems. One such innovative idea is the idea of inception networks. The idea of inception came out from a paper named "Going Deeper with Convolutions". The architecture proposed in this network is called GoogLeNet or Inception V1. This network put forward a phenomenal performance in the ImageNet Visual Recognition Challenge in 2014 hosted on a reputed platform for benchmarking image recognition and detection algorithms.
    </p>
    <p style="text-align: justify;">
        In this article, we'll go through the network architecture and how it helps in improving performance by tackling some commonly faced problems while training very deep networks.
    </p>
	
    <br>
	<h3 id="problems-solved-by-inception-network"><b>Problems solved by inception network</b></h3>
	
	<p style="text-align: justify;">Theoretically, the best way to improve the performance of a deep learning network is by creating bigger networks with a large number of layers of neurons in each layer. This idea of improving performance looks good but often leads to complications like overfitting due to an increase in complexity of the network and more computational power required due to an increase in the number of parameters. Another major challenge is faced when we add a new layer where we have to select a new filter size, select between convolutional or pooling layers. This can be problematic when we have a huge network and testing the addition of a new layer and tuning its hyperparameters can be time-consuming. These are some major issues that are more or less solved by the inception of the network.</p>
    <p style="text-align: justify;">The paper on the inception network mentioned before suggests the use of sparsely connected network architecture which is used in place of traditional fully connected architectures. The approach suggested allows increasing the depth of the network while not increasing the computational cost by a large amount.</p>
    <p style="text-align: justify;">The following diagram throws some light on the basic concept of sparsely connected networks:</p>
    
    <div style="display: flex; flex-wrap: wrap;justify-content: center; align-items: center; text-align: center; text-decoration: underline;">
        <figure>
            <img src="/resources/images/blogs/google-inception-network/Inception-1-207x300.jpg" alt="Densely connected architecture">
            <figcaption>Densely Connected Architecture</figcaption>
        </figure>
        <figure>
            <img src="/resources/images/blogs/google-inception-network/Inception-2-300x165.jpg" alt="Sparsely Connected Architecture">
            <figcaption>Sparsely Connected Architecture</figcaption>
        </figure>
    </div>
	<br>
    <p style="text-align: justify;">In the upcoming sections, we'll have a look at how this idea was implemented and what changes were made to the fully connected CNN to get an Inception Network.</p>
    
    <br>


	<h3 id="inception-module"><b>Inception Module</b></h3>
	
	<p style="text-align: justify;">Before jumping on to visualize the entire network we'll have a look at a smaller block of the network called the inception module. Multiple inception modules are stacked with different configurations to form an inception network. </p>
    <p style="text-align: justify;">Following is an image of an inception module:</p>
    <p style="text-align:center;"><img src="/resources/images/blogs/google-inception-network/Inception1-300x133.png" alt="Inception module" class="img-responsive"></p>
    <p style="text-align: justify;">In the given figure above we have an inception block where the input is 28x28x192. Now we'll apply 1x1x64 convolution using the following rule to calculate the dimensions (this rule will be used for all the dimension related calculations):</p>
    <br>
    <p style="text-align: justify; font-size: 1.2em;">Dimension(n2)  = <b>(n1+2p-f/s)+1</b> </p>
    <br>
    <p style="text-align: justify;">Where, n1=28 (previous layer dimension), f=1 (filter size), p = 0 (padding) , s = 1 (filter steps). Now we want a 3x3x128 convolution where we need to set the padding as 1 which basically refers to the same convolution which sets the dimension as 28x28x128 so that we can stack the outputs to get the final output. This way we can apply different filters like the max-pooling filter applied above. The only thing to keep in mind is that the width and breadth of all the outputs should be the same so that we can concatenate them at the end. In order to do this, we use padding=same for all filters except the 1×1 filter. This idea of concatenating outputs from different filters and getting a single output is at the heart of an inception network. It allows the network to learn whatever it wants.</p>
    <p style="text-align: justify;">One issue with the method we discussed above is a large number of parameters we'll get when we convolve 32 5×5 filters with 28x28x192 input volume. The final output here is 28x28x32 where we have 32 filters with 5x5x192 dimensions. Now the total number of parameters is 28x28x32x5x5x192 which is 120 million parameters which are really expensive considering this is a very small part of the entire network. In order to solve this, we can use a 1×1 convolution to reduce input dimensions. After that we can apply 5×5 convolution to get the final output:</p>
    <img src="/resources/images/blogs/google-inception-network/Inception1-1-300x102.png" alt="final output after applying 5x5 convolution" class="img-responsive">
    <br>
    <p style="text-align:justify">The total number of parameters in this case is 28x28x16x1x1x192 + 28x28x32x5x5x16 = 12.4 million parameters. Now, this is a significant reduction in the number of parameters compared to the 120 million parameters we got before.</p>
    <p style="text-align: justify;">This idea of using 1×1 convolutions is successful as lower-dimensional embeddings can also contain information about large patches of images. So the basic idea boils down to using a 1×1 convolution before 5×5 or 3×3 convolutions. There are other uses and interpretations of a 1×1 filter but for an inception network, we'll keep the use limited to dimensionality reduction.  In the next section, we'll have a look at how this small block is embedded into a large network.</p>

    <br>

    <h3 id="inception-network-architecture">Inception Network Architecture</h3>
    <p style="text-align: justify;">Remember the basic architecture of a traditional convolutional network where we take the output from the previous layer and feed it to the next layer and this process is repeated until the end of the network. But in an inception network, the output from the previous layer is taken and then passed on to four different layers/operations in parallel and then concatenate the output and keep repeating the process till the end. Have a look at the following figure which represents an inception network (GoogLeNet):</p>
    <img src="/resources/images/blogs/google-inception-network/Inception1-2-300x67.png" alt="GoogLeNet (inception network)" class="img-responsive">
    <br>
    <p style="text-align: justify;">Google's inception network has 9 inception modules stacked linearly. There are 22 layers, 27 if pooling layers are counted. A global average pooling layer is added at the end of the last inception block.</p>
    <p style="text-align: justify;">One issue that inception networks face like any other deep network is vanishing gradients. In order to solve this issue, intermediate classifiers were introduced. They are represented by the yellow blocks in the above diagram. Following is a zoomed-out image of the inception network for a better understanding of these intermediate classifiers:</p>
    <img src="/resources/images/blogs/google-inception-network/Inception-300x217.png" alt="zoomed-out image of the inception network" class="img-responsive">
    <br>
    <p style="text-align: justify;">Now the final loss is a combination of intermediate loss from these classifiers and the final loss at the end. The total loss is a combination of three losses from three yellow blocks. A weight of 0.3 is given to intermediate losses. These intermediate networks stay active during the training stage and are discarded during the inference/test stage. Following is an equation for total loss:</p>
    <br>
    <p style="text-align: center;font-size: 1.2em;">total<sub>loss</sub> = real<sub>loss</sub> + 0.3 * aux<sub>loss<sub>1</sub></sub>+ 0.3 * aux<sub>loss<sub>2</sub></sub></p>
    <br>
    <p style="text-align: justify;">Have a look at the following diagram from the paper to see how the intermediate classifiers are added:</p>
    <img src="/resources/images/blogs/google-inception-network/Inception-3-300x155.jpg" alt="how intermediate classes are added" class="img-responsive">    


<br>
<h3 id="conclusion"><b>Conclusion</b></h3>  

<p style="text-align: justify;">With this, we come to the end. Though old, the inception network produced state-of-the-art results when it was introduced in 2014 and led to more interesting research in order to get efficient architectures for deep CNN models. This research was carried on newer architectures that came into the picture which revolutionized the way deep CNN models were trained. <strong>Happy Learning!</strong></p>

<h4><b>References</b></h4>    

<ol style="padding-left: 40px; text-align: justify;">
<li style="word-break: break-all"><a href="https://www.cs.colostate.edu/~dwhite54/InceptionNetworkOverview.pdf" title="">https://www.cs.colostate.edu/~dwhite54/InceptionNetworkOverview.pdf</a></li>
<li><a href="https://www.coursera.org/lecture/convolutional-neural-networks/inception-network-piR0x" title="">https://www.coursera.org/lecture/convolutional-neural-networks/inception-network-piR0x</a></li>
</ol>
<br>

</div><!-- end course-table -->