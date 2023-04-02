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
				<td><h5 class="margin-0"><b><a href="#why-python-is-preferred-in-data-science-industry" style="color: #222222;">Why Python is preferred in Data Science Industry</a></b></h5>
				</td>
			</tr>
            <tr>
				<td>3</td>
				<td><h5 class="margin-0"><b><a href="#advantages-of-using-python" style="color: #222222;">Advantages of Using Python</a></b></h5>
				</td>
			</tr>
            <tr>
				<td>4</td>
				<td><h5 class="margin-0"><b><a href="#how-to-install-python" style="color: #222222;">How to Install Python</a></b></h5>
				</td>
			</tr>
            <tr>
				<td>4.1</td>
				<td><span style="margin-left:10px;"><a href="#installing-python-on-windows" style="color: #222222;">Installating Python on Windows</a></span></td>
			</tr>
            <tr>
				<td>4.2</td>
				<td><span style="margin-left:10px;"><a href="#installing-python-on-linux" style="color: #222222;">Installing Python on Linux</a></span></td>
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
        Programming languages have been there for ages now and every decade we see a new language that becomes widely popular. As a data scientist, the first thing you need to do is master a programming language. We can certainly say that right now python is topping the charts when it comes to its use in data science-related applications. In this article, we'll try to understand the reason behind the popularity of python among data scientists. Let's get started.
    </p>

    <h3 id="why-python-is-preferred-in-data-science-industry"><b>Why Python is preferred in Data Science Industry</b></h3>
    <p style="text-align: justify;">
        Python has seen a tremendous rise in its use in the data science industry in the last few years. There are many reasons for it. It has a wide range of libraries that can be used for tasks such as incorporating statistical code into production databases or integrating data with web-based applications. 
    </p>
    <p style="text-align: justify;">
        The biggest advantage of using python is the wide range of libraries available for data science tasks. Scikit-learn, NumPy, Scipy, Keras, TensorFlow, etc. are some popular libraries. Those who use scikit-learn will know about its various machine learning algorithms and how important they are. Plotting is another area where python excels with libraries like matplotlib, seaborn, plotly etc. These libraries are user-friendly and most of the functionalities are already taken care of by them.
    </p>
    
    <h3 id='advantages-of-using-python'><b>Advantages of Using Python</b></h3>
    <p style="text-align: justify;">
        There are many other languages like R, Scala, Julia, etc. which can be used for data science-related tasks. But python has a clear edge over all those languages. In this section we'll discuss the reasons behind python becoming so popular among data scientists:
    </p>
    <ol style="padding-left: 40px;">
        <li>Simplicity - The biggest advantage of python is it's ease of use. It's simplicity has never affected it's functionality. There are multiple reasons that have made python flexible and easy to use:</li>
        <ul style="padding-left: 40px;">
            <li>Free and open-source</li>
            <li>High-level programming language</li>
            <li>Interpreted language</li>
            <li>A large of community of developers</li>
        </ul>
        <p style="text-align: justify;">
            Python is also fast to write as the syntax is relatively simpler and usually, the number of lines required to write a piece of code is less when compared to other languages at the same time.
        </p>
        <li>Scalability - Among all the available languages python is the one that is best for fast scalability. It's good at scalability because every problem has multiple approaches. This is one of the reasons why YouTube migrated to python.</li>
        <li>Libraries and Frameworks - Due to the large community of developers python has a wide range of libraries and frameworks for data science. These can be used to directly solve many problems which could have required a lot of code. Some of the popular data science libraries include Scikit-learn, NumPy, Scipy, Pandas, etc.</li>
        <li>Community - As the use of python becomes more popular among data scientists most of the development related to data science will shift to python making it possible for everyone to have accessibility to a wide array of tools. This makes it easier to find a solution to any data science-related problem in python by simply searching it on the internet or StackOverflow.</li>
    </ol>


    <h3 id='how-to-install-python'><b>How to install Python</b></h3>
    <h4 id="installing-python-on-windows" style="margin-top: 20px;"><b>Installing Python on Windows</b></h4>
    <p style="text-align: justify;">
        Before knowing how to use python; first, we need to install it. Due to a big update a few years back, python has now two different versions that is python 2 and python 3. In this section, we'll show ways on how to install python 3.x because most of the developers have shifted to it. But if you see some old projects you'll realize they were coded in python 2 and still need python 2 to run. This issue can be resolved by downloading python 2 and installing it side by side. Download the python installer using this <a href="https://www.python.org/downloads/windows/">link</a>. Run the installer when it's downloaded.
    </p>
    <p style="text-align: justify;">
        Enable "Add Python 3.6 to PATH" and then click "Install Now". 
    </p><br>
    <img class="img-responsive" style="margin:0 auto;" src="/resources/images/blogs/why-python/why-python-1.png" alt="Python Installer window"><br>
    <p style="text-align: justify;">
        Next, you have a decision to make. Clicking the "Disable path length limit" option removes the limitation on the MAX_PATH variable. This change won't break anything but will allow Python to use long path names. Since many Python programmers are working in Linux and other *nix systems where pathname length isn't an issue, turning this on in advance can help smooth over any path-related issues you might have while working in Windows.
    </p><br>
    <img class="img-responsive" style="margin:0 auto;" src="/resources/images/blogs/why-python/why-python-2.png" alt="Python setup successful window"><br>

    <h4 id="installing-python-on-linux"><b>Installing Python on Linux</b></h4>
    <p style="text-align: justify;">
        Python in Linux can be installed directly from the command line. Let's see how to do it.
    </p>
    <p style="text-align: justify;">
        Type in the following command in your terminal.
    </p>
    <pre><code>sudo apt-get install python3.8</code></pre>
    <p style="text-align: justify;">
        Once you are done with it you have to go through a "Y/n" question which asks you to assign some disk space for python. After you type in "Y" the remaining steps of installation will happen on their own.
    </p>
    <img class="img-responsive" style="margin:0 auto;" src="/resources/images/blogs/why-python/why-python-3.png" alt="Python installing via apt in Ubuntu">
    <p style="text-align: justify;">
        To verify the installation, type in the following command.
    </p>
    <img class="img-responsive" style="margin:0 auto;" src="/resources/images/blogs/why-python/why-python-4.png" alt="Python in terminal">
    <h3 id="different-editors-for-python"><b>Different Editors for Python</b></h3>
    <p style="text-align: justify;">
        Python editors are tools for developers to write codes, debug any error, execute programs and perform unit tests in the code to catch bugs. It can be thought of as the workspace of a developer for working with their code and playing around with the code. There are many popular editors for python such as IDLE, Sublime Text, Atom, Pycharm, Spyder, etc.
    </p>
    <p style="text-align: justify;">
        Following are some basic requirements you should keep in mind before starting using a code editor:
    </p>
    <ol style="padding-left: 40px;">
        <li>The code editor must save the work and refer to it later.</li>
        <li>Should support code debugging.</li>
        <li>Able to spot variables, keywords, and symbols using some color pattern or other method. This makes it easier to read the code.</li>
        <li>Allow auto-formatting of code.</li>
    </ol>
    <p style="text-align: justify;">
        Following are some editors who support all the features mentioned above:
    </p>
    <ol style="padding-left: 40px;">
        <li>
            <a href="https://www.sublimetext.com/">Sublime Text</a>
        </li>
        <li>
            <a href="https://atom.io/">Atom</a>
        </li>
        <li>
            <a href="https://www.jetbrains.com/pycharm/">Pycharm</a>
        </li>
    </ol>
<!-- -------------------------------------------------------------- -->
<h3 id="conclusion"><b>Conclusion</b></h3>  

<p style="text-align: justify;">
    After reading this article it is why python is becoming so popular and used more frequently in most of the areas of research and engineering. This article has provided an overview about different functionalities of python and why this programming language has an edge over others. You can read more and discover other advantages of python. Happy Learning!
</p>

<h4><b>References</b></h4>    

<ol style="padding-left: 40px; text-align: justify;">
    <li style="word-break: break-all"><a href="https://www.upgrad.com/blog/reasons-why-python-popular-with-developers/">https://www.upgrad.com/blog/reasons-why-python-popular-with-developers/</a></li>
    <li style="word-break: break-all"><a href="https://www.howtopython.org/why-python-programming-language-popular-2020/">https://www.howtopython.org/why-python-programming-language-popular-2020/</a></li>
</ol>
<br>

</div><!-- end course-table -->