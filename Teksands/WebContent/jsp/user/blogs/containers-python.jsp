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
				<td><h5 class="margin-0"><b><a href="#types-of-containers" style="color: #222222;">Types of Containers</a></b></h5>
				</td>
			</tr>
            <tr>
				<td>2.1</td>
				<td><span style="margin-left:10px;"><a href="#lists" style="color: #222222;">Lists</a></span></td>
			</tr>
            <tr>
				<td>2.3</td>
				<td><span style="margin-left:10px;"><a href="#tuples" style="color: #222222;">Tuples</a></span></td>
			</tr>
            <tr>
				<td>2.3</td>
				<td><span style="margin-left:10px;"><a href="#dictionary" style="color: #222222;">Dictionary</a></span></td>
			</tr>
            <tr>
				<td>2.4</td>
				<td><span style="margin-left:10px;"><a href="#sets" style="color: #222222;">Sets</a></span></td>
			</tr>
            
            <tr>
				<td>3</td>
				<td><h5 class="margin-0"><b><a href="#when-to-use-what" style="color: #222222;">When to Use What</a></b></h5>
				</td>
			</tr>
			<tr>
				<td>4</td>
				<td><h5 class="margin-0"><b><a href="#conclusion" style="color: #222222;">Conclusion</a></b></h5>
				</td>
			</tr>
			
		</tbody>
	</table>
	

	<h3 id="introduction"><b>Introduction</b></h3>
    <p style="text-align: justify">
        Programming languages have been there for ages now and every decade we see a new language that becomes widely popular. As a data scientist, the first thing you need to do is master a programming language. We can certainly say that right now python is topping the charts when it comes to its use in data science-related applications. In this article, we'll try to understand the reason behind the popularity of python among data scientists. Let's get started.
    </p>

    <h3 id="types-of-containers"><b>Type of Containers</b></h3>
    <p style="text-align: justify;">
        There are pre-defined container classes in python that are frequently used. In the following sections, you'll see different types of containers and how easy it is to manipulate them.
    </p>
    <h4 id="lists" style="margin-top: 20px;"><b>Lists</b></h4>
    <p style="text-align: justify;">
        A list represents an ordered, mutable collection of objects. You can mix and match any type of object in a list, we can add and remove objects from a list. For creating empty lists we can either call the list() function or use square brackets as follows:
    </p>
    <pre><code>l=[]
l=list()</code></pre>
    <p style="text-align: justify;">
        We can initialize a list with the content of any type using the same square bracket notation which we used above. The list() function also takes an iterable as a single argument and returns a shallow copy of that iterable as a new list. A list is one such iterable as we'll see now.
    </p>
    <pre><code>l=['a','b','c']
l2 = list(l)
print(l2)</code></pre>
    <p style="text-align: justify;">
        Output:
    </p>
    <pre><code>['a','b','c']</code></pre>
    <p style="text-align: justify;">
        A Python string is a sequence of characters and can be treated as an iterable over those characters. If we combine it with the <strong>list()</strong> function, a new list of the characters can be generated.
    </p>
    <pre><code>list('name')</code></pre>
    <p style="text-align: justify;">
        Output:
    </p>
    <pre><code>['n','a','m','e']</code></pre>
    <p style="text-align: justify;">

    </p>
    <pre><code>l = []
l.append('b')
l.append('c')
l.append(0,'a')</code></pre>
    <p style="text-align: justify;">
        Output:
    </p>
    <pre><code>['a','b','c']</code></pre>
    <p style="text-align: justify;">
        It is easy to iterate over lists using the 'for' statement. Each element in the iterable structure is assigned once to the "loop variable" for a single pass of the loop during which the block enclosed is executed.
    </p>
    <pre><code>for i in l:
    print(l)</code></pre>
    <p style="text-align: justify;">
        Iterating while using a while loop is also possible. Generally, a while loop is used to perform iterations of unknown lengths while checking conditions in each iteration or using a break statement when a condition is met. We are using list.pop() to ensure no list items are repeated when we loop through them.
    </p>
    <pre><code>l=['a','b','c']
while(len(l)):
    print(l.pop())
    </code></pre>
    <p style="text-align: justify;">
        Output:
    </p>
    <pre><code>['a','b','c']</code></pre>
    <p style="text-align: justify;">
        The next important functionality is accessing different list elements and slicing. It is simple to access the elements of a list and is similar to accessing array elements in other languages. Another useful addition is the use of negative indexing where l[-1] gives us the last element of list l.
    </p>
    <p style="text-align: justify;">
        Slices is another important extension of subscripting syntax. They are marked about single or doubles colons (:) inside the square bracket subscript. In the single colon format, the first number from the left represents the starting index (inclusive), and the number after the colon represents the ending index (exclusive). In l[:2] the first index is omitted which means the slice starts from the very first element and in l[2:] slice starts from the 2nd element, ending at the last element.
    </p>
    <p style="text-align: justify;">
        In double colon format, the first two numbers from left represent the indices while the number after the second colon represents stride. For example l[::2] would take every second item from the list.
    </p>
    <pre><code>l = list('abcde')
print(l)
print(l[3])
print(l[-3])
print(l[1:3])
print(l[1:-1])</code></pre>
    <p style="text-align: justify;">
        Output:
    </p>
    <pre><code>['a','b','c','d','e']
'd'
'c'
['b','c']
['b','c','d']</code></pre>
    <p style="text-align: justify;">
        In order to find an object inside a list, we can use the 'in' keyword. The index() method returns the actual location of an object in the list.
    </p>
    <pre><code>l = list('abc')
print('a' in l)
print(l.index('c'))
</code></pre>
    <p style="text-align: justify;">
        Output:
    </p>
    <pre><code>True
2</code></pre>

    <h4 id="tuples" style="margin-top: 20px;"><b>Tuples</b></h4>
    <p style="text-align:justify">
        Tuples are similar to lists with the only difference being that they are immutable. They are slightly faster and smaller than a list. They can be created in a similar way to how we create a list. They can also be initialized with values. Another way of creating tuples is bypassing an iterable object to tuple function.
    </p>
    <pre><code>t=()
t=tuple()</code></pre>
    <p style="text-align: justify;">
        A very common way of accessing the elements of a tuple in python is called unpacking. It can be used on lists as well but more commonly used with tuples as it requires us to know the size of the container. Unpacking is done by assigning a list of variables whose size is equal to the number of elements in the tuple. All the variables are individually assigned values from the tuple.
    </p>
    <pre><code>t = ('a', 'b')
a, b = t
print(a)
print(b)</code></pre>
    <p style="text-align: justify;">
        Tuples can be sliced and accessed in the same way as lists. The slices you'll get will be tuples themselves. Similarly, you can iterate over the tuples in the same way you iterate over a list.
    </p>

    <p style="text-align: justify;">
        The major difference between a tuple and a list is the fact that tuples are immutable. This means that the objects in them cannot be replaced or updated with something else. If you try to do this you'll get an error. This makes them safe to store data as it cannot be modified easily.
    </p>

    <h4 id="dictionary"><b>Dictionary</b></h4>
    <p style="text-align: justify;">
        Dictionaries in Python are similar to an implementation of key-value mapping that can also go by the name of "hashtable" or  "associative array" in another language. They are one of the most important inbuilt container classes in python. Dictionaries are created in the same way as tuple or list using braces '{}'. You can also use dict() built-in function that accepts a set of keyword arguments.
    </p>
    <pre><code>char = {1:'a',  2:'b',  3:'c'}
char = {}
char[1] = 'a'
char[2]= 'b'
char[3]= 'c'</code></pre>
    <p style="text-align: justify;">
        Dictionary values can be iterated over by using keys as follows. You can also use the keys() method to get the keys of the dictionary.
    </p>
    <pre><code>for key in char:
    char[key]

for key in char.keys():    
    char[key]
</code></pre>
    <p style="text-align: justify;">
        New values can be entered as key-value pairs and old values can be modified using the keys.
    </p>
    <pre>char[4] = 'd' #adding new value
char[2] = 'B' #changing old value</pre>
    <p style="text-align: justify;">
        If we try to find the values using a key that is not there in the dictionary then KeyError is raised. Another important thing about dictionaries are keys should be immutable i.e. you cannot use a list data type as a key but you can use a tuple as a key. Dictionaries cannot be used as keys as they are mutable.
    </p>
    <p style="text-align: justify;">
        Another important method used with dictionaries is items(). It returns a list containing tuples of (key, value) pairs. 
    </p>

    <h4 id="sets" style="margin-top: 20px;"><b>Sets</b></h4>
    <p style="text-align: justify;">
        A set is an unordered, unique, mutable collection of objects. It is designed in a way to reflect the actual properties of a set. A set is created by using the set() function on an iterable object.
    </p>
    <pre><code>l = ['a', 'b', 'a', 'c']
s = set(l)
print(s)</code></pre>
    <p style="text-align: justify;">
        Output:
    </p>
    <pre><code>set(['a', 'b', 'c'])</code></pre>
    <p style="text-align: justify;">
        Notice how only one 'a' is retained after we convert the list into a set. We can use the pop()  function similar to lists.
    </p>
    <p style="text-align: justify;">
        Another important property of sets is set functions. These methods can be directly called by their names as is shown in the following snippet.
    </p>

    <pre><code>S1 = set(['a', 'b', 'c', 'b'])
S2 = set(['d', 'e', 'f', 'e', 'a'])
print(S1)
print(S2)

print(S1.union(S2))
print(S1.intersection(S2))</code></pre>
    <p style="text-align: justify;">
        Output:
    </p>
    <pre><code>set(['a', 'b', 'c'])
set(['d', 'e', 'f', 'a'])
set(['a', 'b', 'c', 'd', 'e', 'f'])
set(['a'])</code></pre>


    <h3 id="when-to-use-what"><b>When to Use What</b></h3>
    <p style="text-align:justify;">
        The biggest dilemma while using one of the container classes is how to pick the correct container class for the data at hand. Following are a few points that can be helpful while selecting one of the classes:
    </p>
    <ol style="padding-left: 40px;">
        <li>When you don't want the data to be altered by anyone, use tuples as they are immutable.</li>
        <li>If the data is in the form of key-value pairs then the obvious approach is to store it using a dictionary. The mistake many people make is that they sometimes end up making different lists or tuples for each key and its corresponding values.</li>
        <li>If you want to perform set functions on your data in the future then use sets as your container.</li>
        <li>If you want to perform all sorts of slicing, replacements, and related operations on your data then go with lists.</li>
    </ol>
    
<!-- -------------------------------------------------------------- -->
<h3 id="conclusion"><b>Conclusion</b></h3>  

<p style="text-align: justify;">
    The idea of in-built container classes with different functionalities in python makes it easy while working with certain data types. There are many more containers not commonly used but can be explored after going through the basic ones discussed in this article. Happy learning!
</p>
<h4><b>References</b></h4>    

<ol style="padding-left: 40px; text-align: justify;">
    <li style="word-break: break-all"><a href="https://www.analyticsvidhya.com/blog/2021/06/datatypes-and-containers-in-python-a-complete-guide/">https://www.analyticsvidhya.com/blog/2021/06/datatypes-and-containers-in-python-a-complete-guide/</a></li>
</ol>
<br>
</div><!-- end course-table -->