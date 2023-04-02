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
				<td><h5 class="margin-0"><b><a href="#why-libraries-are-heavily-used-in-python" style="color: #222222;">Why libraries are heavily used in Python</a></b></h5>
				</td>
			</tr>
			<tr>
				<td>3</td>
				<td>
                    <h5 class="margin-0"><b><a href="#some-popular-libraries" style="color: #222222;" >Some Popular Libraries</a></b></h5>
				</td>
			</tr>
            <tr>
				<td>3.1</td>
				<td><span style="margin-left:10px;"><a href="#numpy" style="color: #222222;">Numpy</a></span></td>
			</tr>
            <tr>
				<td>3.2</td>
				<td><span style="margin-left:10px;"><a href="#scikit-learn" style="color: #222222;">Scikit-learn</a></span></td>
			</tr>
            <tr>
				<td>3.3</td>
				<td><span style="margin-left:10px;"><a href="#pandas" style="color: #222222;">Pandas</a></span></td>
			</tr>
            <tr>
				<td>3.4</td>
				<td><span style="margin-left:10px;"><a href="#keras" style="color: #222222;">Keras</a></span></td>
			</tr>
            <tr>
				<td>3.5</td>
				<td><span style="margin-left:10px;"><a href="#matplotlib" style="color: #222222;">Matplotlib</a></span></td>
			</tr>
            <tr>
				<td>3.6</td>
				<td><span style="margin-left:10px;"><a href="#tensorflow" style="color: #222222;">Tensorflow</a></span></td>
			</tr>
            <tr>
				<td>3.7</td>
				<td><span style="margin-left:10px;"><a href="#pytorch" style="color: #222222;">PyTorch</a></span></td>
			</tr>
            <tr>
				<td>4</td>
				<td><h5 class="margin-0"><b><a href="#ways-of-installing-libraries" style="color: #222222;">Ways of Installing Libraries</a></b></h5>
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
        Libraries in python are an integral part of the language. We use many different libraries for different tasks ranging from plotting curves to solving complex mathematical equations. The idea of libraries in python has given us the freedom to perform lots of different tasks without writing our own code from scratch. For example, if you are working with numerical data and you have to do complex calculations then there are libraries such as NumPy, pandas, scipy, etc. that can do these calculations for you. In this article, we'll talk about the significance of libraries in python and why they became so popular. 
    </p>

    <h3 id="why-libraries-are-heavily-used-in-python"><b>Why libraries are heavily used in Python</b></h3>
    <p style="text-align: justify;">
        The common definition of a python library is that it consists of reusable chunks of codes that can be included and used as part of other programs/projects. A library is a collection of many modules where each module contains few lines of code for specific tasks. There are many reasons that these collections of codes or packages are used heavily while writing codes. Let's discuss a few reasons for the same.
    </p>
    <p style="text-align: justify;">
        The biggest advantage of <a href="https://teksands.ai/blog/journey-through-libraries-of-python" target="_blank"><b>python libraries</b></a> is the fact that they are open-sourced and constantly developed by a large community of python developers. This ensures that all the issues related to the use of libraries or any bugs in them are resolved efficiently. Another advantage is the availability of multiple libraries for similar tasks which leaves us with multiple options to explore as per the task at hand.
    </p>
    <p style="text-align: justify;">
        The idea of writing a piece of code and then making it reusable for tasks up ahead can be difficult as there are constant changes needed. What if someone has already taken care of all these changes and the code at the same time? This is one more advantage of using libraries as they save our time from writing chunks of code and optimizing them to achieve the best results. This speeds up the progress of any project.
    </p>

    <h3 id="some-popular-libraries"><b>Some Popular Libraries</b></h3>
    <p style="text-align: justify;">
        There are many popular libraries in python that are used for different tasks such as plotting, data handling, generating numerical and analytical solutions, machine learning etc. Those who frequently do plotting and exploratory data analysis related tasks will have plotting libraries like matplotlib, seaborn, plotly at the top of their list of most used libraries. Those who work as data scientists will have sklearn, tensorflow, keras, etc at the top of their list of used libraries. Similarly are many other libraries which are frequently used and are quite popular because of their ease of use and large number of functions available for different tasks. In this section, we'll discuss these top-priority libraries and will also try to gather insight about how they are used for different computations.
    </p>
    <h4 id="numpy" style="margin-top: 20px;"><b>Numpy</b></h4>
    <img class="img-responsive" style="margin:15px auto;max-width:380px;" src="/resources/images/blogs/python-libraries/python-lib-1.png" alt="Numpy">
    <p style="text-align: justify;">
        This library is used by many other machine learning libraries to perform various numeric operations for different algorithms beneath the hood. This makes it one of the most used libraries in python. The most important feature of this library is the wide range of mathematical operations available for arrays and matrices.
    </p>

    <h4 id="scikit-learn" style="margin-top: 20px;"><b>Scikit-learn</b></h4>
    <img class="img-responsive" style="margin:15px auto;max-width:380px;" src="/resources/images/blogs/python-libraries/python-lib-2.png" alt="scikit-learn">
    <p style="text-align: justify;">
        It is one of the most popular libraries used for machine learning. It has different algorithms which can be directly used for addressing data science-related tasks. All the algorithms and modules are easy to use which is really helpful in structuring a project without coding anything from scratch. The simple interface and user guide available with explanations of many algorithms is what makes it a must-know for anyone interested in data science.
    </p>

    <h4 id="pandas" style="margin-top: 20px;"><b>Pandas</b></h4>
    <img class="img-responsive" style="margin:15px auto;max-width:380px;" src="/resources/images/blogs/python-libraries/python-lib-3.png" alt="pandas">
    <p style="text-align: justify;">
        This name pops up whenever it comes to data manipulation using python. It provides data structures of high level and a wide variety of tools for data analysis. It has a lot of features for grouping, combining data and filtering, as well as time series-related functionality. The user guide is good and the community support for pandas is really large making it easier to quickly resolve issues while working with it.
    </p>

    <h4 id="keras" style="margin-top: 20px;"><b>Keras</b></h4>
    <img class="img-responsive" style="margin:15px auto;max-width:380px;" src="/resources/images/blogs/python-libraries/python-lib-4.png" alt="keras">
    <p style="text-align: justify;">
        This is a relatively new library for neural networks. It is easier to use compared to many other neural network libraries as it provides inbuilt functions and pre-trained models with a simple interface. It is built on top of tensorflow and gets rid of direct handling of computational graph-related functionality that is there in tensorflow. The fact that it creates the computational graph using the back-end infrastructure slows it down when compared to other deep learning libraries. The modular structure of numerous implementations of layers, objectives, activations functions makes it much easier to use.
    </p>

    <h4 id="matplotlib" style="margin-top: 20px;"><b>Matplotlib</b></h4>
    <img class="img-responsive" style="margin:15px auto;max-width:380px;" src="/resources/images/blogs/python-libraries/python-lib-5.jpg" alt="Matplotlib">
    <p style="text-align: justify;">
        Matplotlib was developed by John D. hunter. The library was built on top of NumPy arrays and works with a broader scipy stack. It is a low-level graph plotting library in python that is open source and constantly under development. It is easy to use and the fact that it has been around for two decades has helped it in establishing a large community of users and developers. It covers almost all the plots that one can think of with detailed examples in the user guides.
    </p>

    <h4 id="tensorflow" style="margin-top: 20px;"><b>Tensorflow</b></h4>
    <img class="img-responsive" style="margin:15px auto;max-width:380px;" src="/resources/images/blogs/python-libraries/python-lib-6.png" alt="tensorflow">
    <p style="text-align: justify;">
        Tensorflow is an open source machine learning framework developed by google. It is flexible and provides support for model deployment on different platforms. Tensorflow is highly modular compared to keras which makes it popular among those who want custom machine learning/deep learning models to be built from scratch. Another important aspect of tensorflow is the user guide and a large number of tutorials present on the official website for different applications. All these make it easier for a beginner to learn tensorflow from scratch.
    </p>

    <h4 id="pytorch" style="margin-top: 20px;"><b>PyTorch</b></h4>
    <img class="img-responsive" style="margin:15px auto;max-width:380px;" src="/resources/images/blogs/python-libraries/python-lib-7.png" alt="pytorch">
    <p style="text-align: justify;">
        PyTorch is another popular deep learning library commonly used for computer vision and natural language processing tasks. It was developed by facebook and offers high modularity just like tensorflow.
    </p>

    <h3 id="ways-of-installing-libraries"><b>Ways of installing Libraries</b></h3>
    <p style="text-align: justify;">
        The easiest way of using these libraries if you are an aspiring data scientist is by downloading them with the anaconda distribution that is freely available. You can use pip from the anaconda command prompt or the terminal of your PC to directly download the required libraries. Pip is a package management system written in python which is used to install and manage packages. Use the following lines of code to install packages using pip/conda in windows.
    </p>
    <pre><code>#can be used with anaconda or with windows terminal
pip install library_name

#use this command if you don't have pip with anaconda
conda install pip

#you can also use conda without pip in anaconda prompt
conda install pandas</code></pre>
    <p style="text-align: justify;"> 
        For Linux (Ubuntu) users the process is very similar and instead of pip, you'll use the Sudo command. Following is the code for downloading packages on Linux. This command can change from package to package.
    </p>
    <pre><code>sudo apt-get install python3-package_name</code></pre>

<!-- -------------------------------------------------------------- -->

<h3 id="conclusion"><b>Conclusion</b></h3>  

<p style="text-align: justify;">
    There are a large number of packages in python and there are many more under development. These packages have made python an easy-to-use language with more functionalities in fewer lines of code. You can also develop your own package and release it if you want to contribute to the ever-growing community. Happy learning! 
</p>
<h4><b>References</b></h4>    

<ol style="padding-left: 40px; text-align: justify;">
    <li style="word-break: break-all"><a href="https://numpy.org/" title="">https://numpy.org/</a></li>
    <li style="word-break: break-all"><a href="https://www.scipy.org/" title="">https://www.scipy.org/</a></li>
    <li style="word-break: break-all"><a href="https://pandas.pydata.org" title="">https://pandas.pydata.org</a></li>
    <li style="word-break: break-all"><a href="https://scikit-learn.org/stable/" title="">https://scikit-learn.org/stable/</a></li>
    <li style="word-break: break-all"><a href="https://keras.io/" title="">https://keras.io/</a></li>
    <li style="word-break: break-all"><a href="https://matplotlib.org/" title="">https://matplotlib.org/</a></li>
    <li style="word-break: break-all"><a href="https://www.tensorflow.org/guide" title="">https://www.tensorflow.org/guide</a></li>
    <li style="word-break: break-all"><a href="https://pytorch.org/" title="">https://pytorch.org/</a></li>
</ol>
<br>

</div><!-- end course-table -->