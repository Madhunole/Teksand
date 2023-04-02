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
				<td><h5 class="margin-0"><b><a href="#what-are-callbacks-in-keros" style="color: #222222;">What are callbacks in Keras?</a></b></h5>
				 </td>
			</tr>
			<tr>
				<td>3</td>
				<td>
                    <h5 class="margin-0"><b><a href="#types-of-callbacks" style="color: #222222;" >Types of callbacks</a></b></h5>
				</td>
			</tr>
			<tr>
				<td>3.1</td>
				<td><span style="margin-left:10px;"><a href="#early-stopping" style="color: #222222;">EarlyStopping</a></span></td>
			</tr>
			<tr>
				<td>3.2</td>
				<td><span style="margin-left:10px;"><a href="#model-check-point" style="color: #222222;">ModelCheckpoint</a></span></td>
			</tr>
			<tr>
				<td>3.3</td>
				<td><span style="margin-left:10px;"><a href="#learning-rate-scheduler" style="color: #222222;">LearningRateScheduler</a></span></td>
			</tr>
			<tr>
				<td>3.4</td>
				<td><span style="margin-left:10px;"><a href="#tensor-board" style="color: #222222;">TensorBoard</a></span></td>
			</tr>
            <tr>
				<td>3.5</td>
				<td>
                    <span style="margin-left:10px;"><a href="#custom-callbacks" style="color: #222222;">Custom Callbacks</a></span>
                </td>
			</tr>
            <tr>
				<td>3.6</td>
				<td><span style="margin-left:10px;"><a href="#lambda-callback" style="color: #222222;">LambdaCallback</a></span></td>
			</tr>
			<tr>
				<td>4</td>
				<td><h5 class="margin-0"><b><a href="#conclusion" style="color: #222222;">Conclusion</a></b></h5>
				 </td>
			</tr>
			
		</tbody>
	</table>
	

	<br>
	<h3 id="introduction"><b>1. Introduction</b></h3>
	
    <p style="text-align: justify">
        Let's start by assuming that you are training a deep learning model built
        using Keras library. Now there are few circumstances like the model can train
        for a really long time without any significant improvement in its performance,
        it can start overfitting after a few iterations/epochs or the model might
        never learn anything and train for a really long time without us knowing.
        These situations can be a nightmare in real life and we would obviously want
        to avoid them by monitoring our models from time to time. It is similar to
        driving a car without any control over the speed or steering of the car which
        can lead to an accident. In order to address the issues discussed above, we
        have callbacks in Keras about which we'll discuss in this article. Let's get
        started.
    </p>
	
    <br>
	<h3 id="what-are-callbacks-in-keros"><b>2. What are callbacks in Keras?</b></h3>
	
	<p style="text-align: justify;">In simple terms, callbacks are the functions that help in having some control over the model training stage. Things like stopping the model training when certain accuracy/loss is achieved, adjusting learning rate after epochs, saving the model after each epoch, and many more things. </p>
	
    <p style="text-align: justify;">Following is a formal definition from Keras Documentation:</p>
	<div class="section-title-2 text-center" style="padding: 0 0 0;">
		<p class="lead"><b>"A callback is a set of functions to be applied at given stages of the training procedure. You can use callbacks to get a view of the internal states and statistics of the model during training."</b></p>
		<hr><br>
	</div>

    <p style="text-align: justify;">This is a simple introduction and rough overview of what callbacks are. In the upcoming sections, we'll see how to use callbacks with the help of Keras library.</p>

    <br>
	<h3 id="types-of-callbacks"><b>3. Types of Callbacks</b></h3>
	
	<p style="text-align: justify;">There are multiple options of callback functions in keras and in this section, we'll explore a few commonly used callback functions. Let's get started.</p>
	
	<h4 style="margin-top: 20px;" id="early-stopping"><b>3.1 EarlyStopping</b></h4>
	
	<p style="text-align: justify;">This is the most commonly used callback function owing to the fact that overfitting can be a nightmare. Imagine training a model for a day and realizing it overfits. This overfitting can be stopped in the initial stages itself. </p>
    
    <p style="text-align: justify;">Let's have a look at few hyperparameters of this function:</p>
	
    <ol type="a" style="padding-left: 40px; text-align: justify;">
        <li>monitor - value to consider for stopping training.</li>
        <p style="padding-left: 40px;text-align: justify;">E.g. - val_loss.</p>
        <li>min_delta - minimum change in the monitored value at which training will stop. For example, min_delta is 0.1 then the training will stop when an absolute change in monitored value is less than 0.1</li>
        <li>patience - Number of epochs with no improvement after which training has to stop.</li>
        <li>restore_best_weights - Setting this to false will ensure that the weights for the best training epoch will be used.</li>
    </ol>
    
    <pre><code>
from keras.callbacks import EarlyStopping

earlystop = EarlyStopping(monitor='val_loss',
                        min_delta=0,
                        patience=3,
                        verbose=1,
                        restore_best_weights=True)

#add the callback to your model using the following snippet

model.fit(x_train, y_train, epochs=20, callbacks=[earlystop])

    </code></pre>
	
	<p style="text-align: justify;">One thing to notice is that we pass the callback function in a list which implies that we can simply pass multiple callbacks of different kids to monitor the progress of our model.</p>
	
	<h4 style="margin-top: 20px;" id="model-check-point"><b>3.2 ModelCheckpoint</b></h4>
	
	<p style="text-align: justify;">This callback method saves the model after each epoch. It can be used when we want to save the best model for which say val_accuracy reaches a maximum value during the training stage. We can also use it for other measures like train_accuracy etc.</p>
	
	<p style="text-align: justify;">Following are some hyperparameters to know about before using this callback method:</p>
	
    <ol type="a" style="padding-left: 40px; text-align: justify;">
        <li><strong>filepath:</strong> the path of the file where a model is saved</li>
        <li><strong>monitor:</strong> value that is monitored</li>
        <li><strong>save_best_only:</strong> set to true if do not want to overwrite the last best model</li>
        <li><strong>mode:</strong> auto, min, or max. Say your mode is mode='min' for val_loss then you are trying to minimize the monitored value.</li>
    </ol>

	<pre>
	<code>
from keras.callbacks import ModelCheckpoint

#autosave best model

best_model_file = "best.pdf"
best_model = ModelCheckpoint(best_model_file,
                monitor='val_acc',
                mode='max',
                verbose=1,
                save_best_only=True)
</code>
</pre> 
		
	<h4 style="margin-top: 20px;" id="learning-rate-scheduler"><b>3.3 LearningRateScheduler</b></h4>
	
	<p style="text-align: justify;">This method is used to change the learning rate over time based on a scheduling function that we define (scheduler function in code box). At the beginning of every epoch, this callback gets the updated learning rate from the scheduler function. We can decide if we want to update the learning rate after each epoch or after a few epochs.</p>
	 
	<p style="text-align: justify;">Following functions and hyperparameters need to be defined for this callback:</p>
	
    <ol type="a" style="padding-left: 40px; text-align: justify;">
        <li><strong>scheduler:</strong>It is a function that needs to be defined before calling the callback function. It takes the current epoch number and the current learning rate and returns a new learning rate based on the conditions defined in the function.</li>
        <li><strong>verbose:</strong>Used to get updates after each epoch.</li>
    </ol>

	<pre>
	<code style="overflow-x: scroll;">
#This function keeps the initial learning rate for the first ten epochs
#and decreases it exponentially after that

def scheduler(epoch, lr):
        if epoch < 10:
            return lr
        else:
            return lr * tf.math.exp(-0,1)

from keras.callbacks import LearningRateScheduler
lrs = LearningRateScheduler(scheduler, verbose=0) #scheduler is a function

#adding the callback while fitting model to data
model.fit(np.arrange(data, epochs=15, callbacks=[callback],verbose=0))

</code>
</pre>
	
	<h4 style="margin-top: 20px;" id="tensor-board"><b>3.4 TensorBoard</b></h4>
	
	<p style="text-align: justify;">This is an excellent callback that takes care of a lot of things at once. Logs are written to a directory which is examined using TensorFlow's TensorBoard visualization tool.</p>
	
	<pre>
	<code>
tbCallBack = keras.callbacks.TensorBoard(
                log_dir=path_to_your_logs,
                histogram_freq=0,
                write_graph=True,
                write_images=False)
...
model.fit(............, callbacks=[tbCallBack])
                
</code>
</pre> 
	
    <p style="text-align: justify;">Following are some important hyperparameters of the callback function given above:</p>

    <ol type="a" style="padding-left: 40px; text-align: justify;">
        <li><strong>histogram_freq:</strong> frequency (in epochs) at which to compute activation and weight histograms for the layers of the model. If set to 0, histograms won't be computed. Validation data (or split) must be specified for histogram visualizations.</li>
        <li><strong>write_graph:</strong> whether to visualize the graph in TensorBoard. The log file can become quite large when write_graph is set to True.</li>
        <li><strong>write_images:</strong> whether to write model weights to visualize as an image in TensorBoard.</li>
    </ol>
	
	
  <p style="text-align: justify;">If you want to visualize the files created during training, run the following snippet in your terminal.</p>
	
  <pre><code>tensorboard --logdir=path_to_your_logs
</code></pre>

<h4 style="margin-top: 20px;" id="custom-callbacks"><b>3.5 Custom Callbacks</b></h4>
	
	<p style="text-align: justify;">This is an excellent callback that takes care of a lot of things at once. Logs are written to a directory which is examined using TensorFlow's TensorBoard visualization tool.</p>
	
	<pre><code>
class myCallback(tf.keras.callbacks.Callback): 
    def on_epoch_end(self, epoch, logs={}): 
        if(logs.get('acc') > ACCURACY_THRESHOLD):   
            print("\nWe have reached %2.2f%% accuracy, so we will stopping training."
                     %(acc_thresh*100))   
            self.model.stop_training = True
callbacks = myCallback()
    
model.fit(x_train, y_train, epochs=20, callbacks=[callbacks])
</code></pre> 
	
    <p style="text-align: justify;">Let's try to understand what's happening here. We are building a child class myCallback by extending/inheriting Callbacks class from keras and using its functions. We have implemented the on_epoch_end function which is called at the end of each epoch. After that, we are getting the accuracy after the epoch and if the accuracy value is greater than our threshold then we stop training the model. Next, we create an instance of the object of myCallback class and pass it to model.fit() function where the model is a model we want to train using keras layers.</p>

    <h4 style="margin-top: 20px;" id="lambda-callback"><b>3.6 LambdaCallback</b></h4>
	
	<p style="text-align: justify;">Keras provides numerous callback classes to serve almost all our requirements but sometimes we still want to build a custom callback function for specific tasks like stopping the model after certain accuracy is reached or saving the model at each epoch. In place of writing a callback class using keras.callbacks.Callback() as a parent class we can use LamdaCallback. It takes some arguments such as "on_epoch_end" which takes a function that can be called at the end of each epoch. </p>
	
    <p style="text-align: justify;"> Following arguments with fixed positional  arguments are there:</p>

    <ul>
        <li><code>on_epoch_begin</code> and <code>on_epoch_end</code> expect two positional arguments: <code>epoch</code>,<code>logs</code></li>
        <li><code>on_batch_begin</code> and <code>on_batch_end</code> expect two positional arguments: <code>batch</code>,<code>logs</code></li>
        <li><code>on_train_begin</code> and <code>on_train_end</code> expect one positional argument: <code>logs</code></li>
    </ul>

    <p style="text-align: justify;">Let's start using this callback with the help of the following example. In this example the  model weights are saved when accuracy goes beyond a set threshold:</p>
	<pre>
	<code>
from keras.callbacks import LambdaCallback
call = LambdaCallback(on_epoch_end= lambda epochs, 
        logs: model.save_weights('kang.hdf5') if logs.get('acc')>0.99 else None)
        
</code>
</pre> 
	
    <p style="text-align: justify;"> Take another example where we stop the training when the accuracy reaches beyond a certain point:</p>

<pre>
<code>
from keras.callbacks import LambdaCallback
call = LambdaCallback(on_epoch_end= lambda epochs, 
        logs: (model.stop_training:=True) if logs.get('acc')>0.99 else None)    
</code>
</pre>

<!-- -------------------------------------------------------------- -->

<br>
<h3 id="conclusion"><b>Conclusion</b></h3>  

<p style="text-align: justify;">With this, we come to the end of this article. There are many other callback methods in keras such as LambdaCallback, CSVLogger, BaseLogger which can be tried while implementing callbacks. One common tip is that one should use multiple callbacks while training a model to have a better understanding and control over all the aspects of the model during the training phase. <strong>Happy Learning!</strong></p>

<h4><b>References</b></h4>    

<ol style="padding-left: 40px; text-align: justify;">
<li><a href="https://keras.io/api/callbacks/" title="">https://keras.io/api/callbacks/</a></li>
<li><a href="https://keras.io/" title="">https://keras.io/</a></li>
</ol>
<br>

</div><!-- end course-table -->



