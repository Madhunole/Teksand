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
				<td><h5 class="margin-0"><b><a href="#steps-in-eda" style="color: #222222;">Steps in EDA</a></b></h5>
				 </td>
			</tr>
            <tr>
				<td>2.1</td>
				<td><span style="margin-left:10px;"><a href="#variable-identification" style="color: #222222;">Variable Identification</a></span></td>
			</tr>
            <tr>
				<td>2.2</td>
				<td><span style="margin-left:10px;"><a href="#basic-data-exploration" style="color: #222222;">Basic Data Exploration</a></span></td>
			</tr>
            <tr>
				<td>2.3</td>
				<td><span style="margin-left:10px;"><a href="#null-values" style="color: #222222;">Null Values</a></span></td>
			</tr>
            <tr>
				<td>2.4</td>
				<td><span style="margin-left:10px;"><a href="#outliers" style="color: #222222;">Outliers</a></span></td>
			</tr>
            <tr>
				<td>2.5</td>
				<td><span style="margin-left:10px;"><a href="#transforming-categorical-variables" style="color: #222222;">Transforming Categorical Variables</a></span></td>
			</tr>
            <tr>
				<td>2.6</td>
				<td><span style="margin-left:10px;"><a href="#encoding" style="color: #222222;">Encoding</a></span></td>
			</tr>
            <tr>
				<td>2.7</td>
				<td><span style="margin-left:10px;"><a href="#correlation" style="color: #222222;">Correlation</a></span></td>
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
        Exploratory data analysis (EDA) is an approach to investigating the datasets to discover patterns, anomalies, imbalances using statistical graphics and other data visualization methods. EDA is all about making sense of the data, after which we can gather insights from it. Exploratory Data Analysis is an important step before making a machine learning model. EDA provides the context needed to develop an appropriate model - and interpret the results correctly.
    </p>
    <p style="text-align: justify;">
        Let us understand EDA in more detail by performing EDA on the wine quality dataset.
    </p>

    <h3 id="steps-in-eda"><b>Steps in EDA</b></h3>
    <p style="text-align: justify">
        There are many steps in EDA. Some of them are as follows:
    </p>
    <h4 id="variable-identification" style="margin-top: 20px;"><b>Variable Identification</b></h4>
    <p style="text-align: justify;">
        In this step, we identify the predictor (input) and the target (output) variables. After this, we have to identify the category and data types of the variables.
    </p>
    <p style="text-align: justify;">
        Let us visualize the first 5 rows of our dataset.
    </p>
    <pre><code>df=pd.read_csv('winequalityN.csv')
df.head()
</code></pre>
    <p style="text-align: justify;">
        Output:
    </p>
    <div style="overflow-x:auto;">
        <table class="table table-bordered table-striped table-responsive ">
      <thead>
          <tr>
              <th style="text-align: center;background-color: #fff;border-right: 1px solid #ddd;">type</th>
              <th style="text-align: center;background-color: #fff;border-right: 1px solid #ddd;">fixed acidity</th>
              <th style="text-align: center;background-color: #fff;border-right: 1px solid #ddd;">free sulphur dioxide</th>
              <th style="text-align: center;background-color: #fff;border-right: 1px solid #ddd;">total sulfur dioxide</th>
              <th style="text-align: center;background-color: #fff;border-right: 1px solid #ddd;">density</th>
              <th style="text-align: center;background-color: #fff;border-right: 1px solid #ddd;">pH</th>
              <th style="text-align: center;background-color: #fff;border-right: 1px solid #ddd;">sulphates</th>
              <th style="text-align: center;background-color: #fff;border-right: 1px solid #ddd;">alcohol</th>
              <th style="text-align: center;background-color: #fff;border-right: 1px solid #ddd;">quality</th>
          </tr>
      </thead>
      <tbody style="text-align: center;">
          <tr>
              <td>white</td>
              <td>7</td>
              <td>45</td>
              <td>170</td>
              <td>1.001</td>
              <td>3</td>
              <td>0.45</td>
              <td>8.8</td>
              <td>6</td>
          </tr>
          <tr>
            <td>white</td>
            <td>6.3</td>
            <td>14</td>
            <td>132</td>
            <td>0.994</td>
            <td>3.3</td>
            <td>0.49</td>
            <td>9.5</td>
            <td>6</td>
        </tr>
        <tr>
            <td>white</td>
            <td>8.1</td>
            <td>30</td>
            <td>97</td>
            <td>0.9951</td>
            <td>3.26</td>
            <td>0.44</td>
            <td>10.1</td>
            <td>6</td>
        </tr>
        <tr>
            <td>white</td>
            <td>7.2</td>
            <td>47</td>
            <td>186</td>
            <td>0.9956</td>
            <td>3.19</td>
            <td>0.4</td>
            <td>9.9</td>
            <td>6</td>
        </tr>
        <tr>
            <td>white</td>
            <td>7.2</td>
            <td>47</td>
            <td>186</td>
            <td>0.9956</td>
            <td>3.19</td>
            <td>0.4</td>
            <td>9.9</td>
            <td>6</td>
        </tr>
      </tbody>
      </table>
        
    </div>
    <p style="text-align: justify;">
        As we can see from this dataset 'quality' is our target variable and all the other variables are our predictor variables.
    </p>
    <h4 id="basic-data-exploration" style="margin-top: 20px;"><b>Basic Data Exploration</b></h4>
    <p style="text-align: justify;">
        In this step, we will explore the shape and the information of the dataset. The shape of the dataset will tell us the dimensions of the dataset, like how many rows and columns we have in our dataset. info() is used to check the Information about the data and the data types of each respective attribute.
    </p>
    <pre>print(df.shape)</pre>
    <p style="text-align: justify;">
        Output:
    </p>
    <pre>(6497,13)</pre>
    <p style="text-align: justify;">
        As we can see, our dataset has 6497 rows and 13 columns.
    </p>
    <p style="text-align: justify;">
        Now let us gather some for information about our dataset.
    </p>
    <pre>print(df.info())</pre>
    <p style="text-align: justify;">
        Output:
    </p>
    <pre>&lt;class 'pandas.core.frame.DataFrame'&gt;
RangeIndex: 6497 entries, 0 to 6496
Data columns (total 13 columns):
type                    6497 non-null object
fixed acidity           6487 non-null float64
volatile acidity        6489 non-null float64
citric acid             6494 non-null float64
residual sugar          6495 non-null float64
chlorides               6495 non-null float64
free sulfur dioxide     6497 non-null float64
total sulfur dioxide    6497 non-null float64
density                 6497 non-null float64
pH                      6488 non-null float64
sulphates               6493 non-null float64
alcohol                 6497 non-null float64
quality                 6497 non-null int64
dtypes: float64(11), int64(1), object(1)
memory usage: 660.0+ KB
None       
    </pre>
    <p style="text-align: justify;">
        We can see from the output that the 'type' attribute has characters instead of numbers as it is of the type object. The data types in our entire dataset are float64(11), int64(1), and object(1). Now we will gather some more insights into our dataset using the 'describe' method.  This will tell us the mean, median, mode, maximum value, minimum value, etc. of each column.
    </p>
    <div style="overflow-x:auto;">
        <table class="table table-bordered table-striped table-responsive ">
      <thead>
        <tr>
            <th style="text-align: center;background-color: #fff;border-right: 1px solid #ddd;"></th>
            <th style="text-align: center;background-color: #fff;border-right: 1px solid #ddd;">fixed acidity</th>
            <th style="text-align: center;background-color: #fff;border-right: 1px solid #ddd;">volatile acidity</th>
            <th style="text-align: center;background-color: #fff;border-right: 1px solid #ddd;">citric acid</th>
            <th style="text-align: center;background-color: #fff;border-right: 1px solid #ddd;">residual sugar</th>
            <th style="text-align: center;background-color: #fff;border-right: 1px solid #ddd;">chlorides</th>
        </tr>
      </thead>
      <tbody style="text-align: center;">
        <tr>
            <td>count</td>
            <td>6487</td>
            <td>6489</td>
            <td>6494</td>
            <td>6495</td>
            <td>6495</td>
        </tr>
        <tr>
            <td>mean</td>
            <td>7.216579</td>
            <td>0.339691</td>
            <td>0.318722</td>
            <td>5.444326</td>
            <td>0.056042</td>
        </tr>
        <tr>
            <td>std</td>
            <td>1.29675</td>
            <td>0.164649</td>
            <td>0.145265</td>
            <td>4.758125</td>
            <td>0.035036</td>
        </tr>
        <tr>
            <td>min</td>
            <td>3.8</td>
            <td>0.08</td>
            <td>0</td>
            <td>0.6</td>
            <td>0.009</td>
        </tr>
        <tr>
            <td>25%</td>
            <td>6.4</td>
            <td>0.23</td>
            <td>0.25</td>
            <td>1.8</td>
            <td>0.038</td>
        </tr>
        <tr>
            <td>50%</td>
            <td>7</td>
            <td>0.29</td>
            <td>0.31</td>
            <td>3</td>
            <td>0.047</td>
        </tr>
        <tr>
            <td>75%</td>
            <td>7.7</td>
            <td>0.4</td>
            <td>0.39</td>
            <td>8.1</td>
            <td>0.065</td>
        </tr>
        <tr>
            <td>max</td>
            <td>15.9</td>
            <td>1.58</td>
            <td>1.66</td>
            <td>65.8</td>
            <td>0.611</td>
        </tr>
      </tbody>
      </table>
        
    </div>
    <p style="text-align: justify;">
        Here we can see the count, mean, standard deviation, minimum value, maximum value of each of the columns in our dataset.
    </p>
    <h4 id="null-values" style="margin-top: 20px;"><b>Null Values</b></h4>
    <p style="text-align: justify;">
        The next step in EDA is to check and remove null values in our dataset. If there are null values then we won't be able to apply machine learning algorithms to our dataset, so it is imperative that we eliminate them.
    </p>
    <pre>df.isnull().sum()</pre>
    <p style="text-align: justify;">
        Output:
    </p>
    <pre>
type                     0
fixed acidity            10
volatile acidity         8
citric acid              3
residual sugar           2
chlorides                2
free sulfur dioxide      0
total sulfur dioxide     0
density                  0
pH                       9
sulphates                4
alcohol                  0
quality                  0
dtype: int64
</pre>
    <p style="text-align: justify;">
        Here we can see that the attributes, 'fixed acidity', 'volatile acidity', 'citric acidity', 'residual sugar', 'chlorides', 'pH' and 'sulphates' all have missing values. We need to remove them.
    </p>
    <p style="text-align: justify;">
        The ways to handle null values are as follows:
    </p>
    <ul style="padding-left: 40px;">
        <li>We can drop the missing values. This can be done when the number of missing values is less.</li>
        <li>For numerical columns, we can replace the missing values with the mean values of the column.</li>
        <li>For numerical columns, we can replace the missing values with the median of the column.</li>
        <li>For categorical columns, we can replace the missing values with the mode of the column.</li>
    </ul>
    <p style="text-align: justify;">
        Since all the columns which have null values are numeric, so we can replace the null values in them with their means.
    </p>
    <pre><code>#Here we are replacing all the null values in a column with the mean of that particular column.

df['fixed acidity'].replace(np.nan,df['fixed acidity'].mean(),inplace=True)
df['volatile acidity'].replace(np.nan,df['volatile acidity'].mean(),inplace=True)
df['citric acid'].replace(np.nan,df['citric acid'].mean(),inplace=True)
df['residual sugar'].replace(np.nan,df['residual sugar'].mean(),inplace=True)
df['chlorides'].replace(np.nan,df['chlorides'].mean(),inplace=True)
df['pH'].replace(np.nan,df['pH'].mean(),inplace=True)
df['sulphates'].replace(np.nan,df['sulphates'].mean(),inplace=True)
df.isnull().sum()
</code></pre>
    <p style="text-align: justify;">
        Output:
    </p>
    <pre>type                    0
fixed acidity           0
volatile acidity        0
citric acid             0
residual sugar          0
chlorides               0
free sulfur dioxide     0
total sulfur dioxide    0
density                 0
pH                      0
sulphates               0
alcohol                 0
quality                 0
dtype: int64
</pre>
    <p style="text-align: justify;">
        As we can see, now our dataset does not have any missing values.
    </p>

    <h4 id="outliers" style="margin-top: 20px;"><b>Outliers</b></h4>
    <p style="text-align: justify;">
        Our next step is to detecting and treating outliers. Outlier is an observation that appears far away and diverges from an overall pattern in a sample. Let us see the outliers in the column 'fixed acidity'.
    </p>
    <pre>#boxplot will help us see the outliers in a particular column
df.boxplot(column=["fixed acidity"])
</pre>
    <img class="img-responsive" style="margin:0 auto;" src="/resources/images/blogs/eda/eda-1.png" alt="fixed acidity with outliers">
    <p style="text-align: justify;">
        The black dots represent the outliers in our column.
    </p>
    <p style="text-align: justify;">
        We can remove outliers by either dropping the outliers or by replacing the outlier values using IQR.
    </p>
    <pre><code>def remove_outlier(col):
    sorted(col)
    Q1,Q3= col.quantile([0.25,0.75])
    IQR=Q3-Q1
    lower_range= Q1-(1.5* IQR)
    upper_range= Q3+(1.5*IQR)
    return lower_range,upper_range
low,high=remove_outlier(df["fixed acidity"])
df["fixed acidity"]=np.where(df["fixed acidity"]&gt;high,high,df["fixed acidity"])
df["fixed acidity"]=np.where(df["fixed acidity"]&lt;low,low,df["fixed acidity"])
</code></pre>
    <p style="text-align: justify;">
        Here, by using IQR we have removed outliers of the column 'fixed acidity'. Similarly, we can remove outliers of all the columns. Let us see the boxplot of the column 'fixed acidity' again in order to see whether or not the outliers have been removed.
    </p>
    <pre>df.boxplot(column=["fixed acidity"])</pre>
    <p style="text-align: justify;">
        Output:
    </p>
    <img class="img-responsive" style="margin:0 auto;" src="/resources/images/blogs/eda/eda-2.png" alt="fixed acidity box plot - outliers removed">
    <p style="text-align: justify;">
        As we can see, now we don't have any outliers.
    </p>
    <h4 id="transforming-categorical-variables" style="margin-top: 20px;"><b>Transforming categorical variables</b></h4>
    <p style="text-align: justify;">
        The column 'type' is a categorical variable as it has only two categories, white and red. Our machine learning algorithm will not be able to understand string inputs, so we will have to convert our text data to an integer. This will be achieved through the LabelEncoder library inside Sklearn.
    </p>
    <pre>from sklearn.preprocessing import LabelEncoder 
label=LabelEncoder()

#Here we are transforming our categorical data

df['type']=label.fit_transform(df['type'])
</pre>
    <p style="text-align: justify;">
        Now our column 'type' has integers instead of characters.
    </p>
    <h4 style="margin-top: 20px;" id="encoding"><b>Encoding</b></h4>
    <p style="text-align: justify;">
        One hot encoding is used to create dummy variables so that we can replace the categories in a categorical variable into features of each category and we can represent each feature using 1 or 0 based on whether or not the categorical value is present or absent in the record.
    </p>
    <h4 style="margin-top: 20px;" id="correlation"><b>Correlation</b></h4>
    <p style="text-align: justify;">
        Correlation helps us to understand how all the variables are related to one another. It helps us see how important a particular feature is and whether or not we have any multicollinearity.
    </p>
    <pre>import seaborn as sns

#Here we are computing the correlation of our variables.
corr = df.corr()
plt.subplots(figsize=(30,10))

#We are now plotting our correlation matrix using heatmap in seaborn 
sns.heatmap( corr, square=True, annot=True,fmt=".1f")
</pre>
    <p style="text-align: justify;">
        Output:
    </p>
    <img class="img-responsive" style="margin:0 auto;" src="/resources/images/blogs/eda/eda-3.png" alt="heatmap representation">
    <p style="text-align: justify;">
        The blocks that are shaded lighter mean that they have a higher degree of relation.
    </p>
    <p style="text-align: justify;">
        After this we can Standardize our data, we can visualize it using matplotlib, seaborn, or any other visualization libraries available in python so that we can get more information regarding our data and we can perform feature engineering.
    </p>

<!-- -------------------------------------------------------------- -->

<h3 id="conclusion"><b>Conclusion</b></h3>  

<p style="text-align: justify;">
    In this article, we have explored Exploratory Data Analysis in machine learning. Also, we have discussed various steps involved in EDA, such as removing null values, one-hot encoding, etc. Further, we have seen how to perform EDA in python. Hope this tutorial will help in exploiting EDA in real-time data. Happy learning. 
</p>
<h4><b>References</b></h4>    

<ol style="padding-left: 40px; text-align: justify;">
    <li style="word-break: break-all"><a href="https://medium.com/swlh/exploratory-data-analysis-what-is-it-and-why-is-it-so-important-part-1-2-240d58a89695" title="">https://medium.com/swlh/exploratory-data-analysis-what-is-it-and-why-is-it-so-important-part-1-2-240d58a89695</a></li>
    <li style="word-break: break-all"><a href="https://www.upgrad.com/blog/exploratory-data-analysis-and-its-importance-to-your-business/#:~:text=Exploratory%20Data%20Analysis%20is%20a,and%20interpret%20the%20results%20correctly" title="">https://www.upgrad.com/blog/exploratory-data-analysis-and-its-importance-to-your-business/#:~:text=Exploratory%20Data%20Analysis%20is%20a,and%20interpret%20the%20results%20correctly</a></li>
    <li style="word-break: break-all"><a href="https://towardsdatascience.com/ways-to-detect-and-remove-the-outliers-404d16608dba" title="">https://towardsdatascience.com/ways-to-detect-and-remove-the-outliers-404d16608dba</a></li>
</ol>

<br>

</div><!-- end course-table -->