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
				<td><h5 class="margin-0"><b><a href="#project" style="color: #222222;">Project</a></b></h5>
				 </td>
			</tr>
            <tr>
				<td>2.1</td>
				<td><span style="margin-left:10px;"><a href="#dataset" style="color: #222222;">Dataset</a></span></td>
			</tr>
            <tr>
				<td>2.2</td>
				<td><span style="margin-left:10px;"><a href="#preprocessing-text-data" style="color: #222222;">Preprocessing Text Data</a></span></td>
			</tr>
            <tr>
				<td>2.3</td>
				<td><span style="margin-left:10px;"><a href="#preprocessing-image-data" style="color: #222222;">Preprocessing Image Data</a></span></td>
			</tr>
            <tr>
				<td>2.4</td>
				<td><span style="margin-left:10px;"><a href="#encoding-text-data" style="color: #222222;">Encoding Text Data</a></span></td>
			</tr>
            <tr>
                <td>2.6</td>
                <td><span style="margin-left:10px;"><a href="#data-generator" style="color: #222222;">Data Generator</a></span></td>
            </tr>
            <tr>
				<td>2.5</td>
				<td><span style="margin-left:10px;"><a href="#model-creation" style="color: #222222;">Model Creation</a></span></td>
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
        In this article, we are going to make an image to speech converter. This is especially useful for blind people as it can be used to describe the images to them. We can also modify this project in such a way that we are able to describe the surroundings to the blind. This way they can be more independent in day-to-day life.
    </p>
    
    <h3 id="project"><b>Project</b></h3>
    <h4 id="dataset" style="margin-top: 20px;"><b>Dataset</b></h4>
    <p style="text-align: justify;">
        We are going to be using the Flickr8k dataset. This dataset contains 8000 images, with 5 captions each. These images are bifurcated as follows:
    </p>
    <ul style="text-align: justify;padding-left: 40px; list-style: none;">
        <li>Train Data: 6000 images</li>
        <li>Dev Data: 1000 images</li>
        <li>Test Data: 1000 images</li>
    </ul>
    <pre><code>#Here we are reading our descriptions file

with open("./Flickr_Data/Flickr_Data/Flickr_TextData/Flickr8k.token.txt") as filepath:
    captions = filepath.read()
    filepath.close()
captions = captions.split("\n")[:-1]
len(captions)
</code></pre>
    <pre>Output: 40460</pre>
    <h4 id="preprocessing-text-data"><b>Preprocessing Text Data</b></h4>
    <p style="text-align: justify;">
        As we can see, we have 40460 captions. Every image has 5 captions attached to it. Now we are going to create a dictionary that will map our image id with the captions.
    </p>
    <pre><code># Here we are creating a "descriptions" dictionary where key is 'img_name' and value is list of captions corresponding to that image_file.

descriptions = {}

for ele in captions:
    i_to_c = ele.split("\t")
    img_name = i_to_c[0].split(".")[0]
    cap = i_to_c[1]
    
    if descriptions.get(img_name) == None:
        descriptions[img_name] = []

    descriptions[img_name].append(cap)

descriptions['1000268201_693b08cb0e']
</code></pre>
<pre>
Output:

    ['child in pink dress is climbing up set of stairs in an entry way',
    'girl going into wooden building',
    'little girl climbing into wooden playhouse',
    'little girl climbing the stairs to her playhouse',
    'little girl in pink dress going into wooden cabin']
</pre>

    <p style="text-align: justify;">
        As we can see, our data is now cleaned.
    </p>
    <p style="text-align: justify;">
        We have cleaned our data in 3 steps. First, we converted each word into a lower case, then we removed all the punctuations. Lastly, we removed all the words with length less than 1.
    </p>
    <pre><code># Here we are finding the unique vocabulary and storing it in a set called vocabulary.

vocabulary = set()

for key in descriptions.keys():
    [vocabulary.update(i.split()) for i in descriptions[key]]

print('Vocabulary Size: %d' % len(vocabulary))
</code></pre>
    <pre>Output: Vocabulary Size: 8424</pre>
    <p style="text-align: justify;">
        As we can see, we have 8424 unique words.
    </p>
    <p style="text-align: justify;">
        Our next task is to store all the words that are present int the captions in a list.
    </p>
    <pre><code>#  Here we are storing all the words in description dictionary
all_vocab =  []

for key in descriptions.keys():
    [all_vocab.append(i) for des in descriptions[key] for i in des.split()]

print('Vocabulary Size: %d' % len(all_vocab))
print(all_vocab[:15])
</code></pre>
    <pre>
Output: Vocabulary Size: 373837
    ['child', 'in', 'pink', 'dress', 'is', 'climbing', 'up', 'set', 'of', 'stairs', 'in', 'an', 'entry', 'way', 'girl']
    </pre>

    <p style="text-align: justify;">
        As we can see we have a total of 37837 words in our descriptions dictionary. Now we will count the frequency of each word and discard the words with a frequency less than 10.
    </p>
    <pre><code>#  count the frequency of each word, sort them, and discard the words having frequency lesser than the threshold value

import collections

counter= collections.Counter(all_vocab)
dic_ = dict(counter)
threshelod_value = 10
sorted_dic = sorted(dic_.items(), reverse=True, key = lambda x: x[1])
sorted_dic = [x for x in sorted_dic if x[1]>threshelod_value]
all_vocab = [x[0] for x in sorted_dic]

len(all_vocab)
</code></pre>
    <pre>Output: 1845</pre>
    <p style="text-align: justify;">
        Now there are 1845 words in our vocabulary. Our next step is to load the training and test image ids.
    </p>
    <pre><code>#Here we are loading the image ids which will be used in training and testing.
f = open("flicker8k-dataset/Flickr8k_text/Flickr_8k.trainImages.txt")
train = f.read()
f.close()
train  = [e.split(".")[0] for e in train.split("\n")[:-1]]

f = open("flicker8k-dataset/Flickr8k_text/Flickr_8k.testImages.txt")
test = f.read()
f.close()
test  = [e.split(".")[0] for e in test.split("\n")[:-1]]
</code></pre>
    <p style="text-align: justify;">
        Now we have loaded all the image ids which will be used for training and testing. Our next step is to create a dictionary of training image ids and captions. We will also put a startseq and endseq with each caption.
    </p>
    <pre><code># Here we are creating train_descriptions dictionary, which will be similar to earlier one, but having only train samples
# add startseq + endseq 

train_descriptions = {}

for t in train:
    train_descriptions[t] = []
    for cap in descriptions[t]:
        cap_to_append = "startseq " + cap + " endseq"
        train_descriptions[t].append(cap_to_append)

train_descriptions['1000268201_693b08cb0e']
</code></pre>
    <pre>
Output: ['startseq child in pink dress is climbing up set of stairs in an entry way endseq',
    'startseq girl going into wooden building endseq',
    'startseq little girl climbing into wooden playhouse endseq',
    'startseq little girl climbing the stairs to her playhouse endseq',
    'startseq little girl in pink dress going into wooden cabin endseq']
</pre>
    <h4 id="preprocessing-image-data" style="margin-top: 20px;">Preprocessing Image Data</h4>
    <p style="text-align: justify;">
        Now that we have processed our text data, we will do some pre-processing on our image data. We will use the ResNet50 model and pass all our images through it up till the second last layer. This way our images will be converted in a vector of shape (2048,).
    </p>
    <pre><code>#Here we are creating model of ResNet50 and removing the last layer.

model = ResNet50(weights="imagenet", input_shape=(224,224,3))
model_new = Model(model.input, model.layers[-2].output)

images = "./flicker8k-dataset/Flickr8k_Dataset/"

#Now we are encoding all our train and test images with the help of ResNet50 model. The train images are being stored in encoding_train and test images are being stored in encoding_test.

def preprocess_image(img):
    img = image.load_img(img, target_size=(224,224))
    img = image.img_to_array(img)
    img = np.expand_dims(img, axis=0)
    img = preprocess_input(img)
    return img
def encode_image(img):
    img = preprocess_image(img)
    feature_vector = model_new.predict(img)
    feature_vector = feature_vector.reshape(feature_vector.shape[1],)
    return feature_vector

encoding_train = {}
for ix, img in enumerate(train):
    img = "./flicker8k-dataset/Flickr8k_Dataset/{}.jpg".format(train[ix])
    encoding_train[img[len(images):]] = encode_image(img)

encoding_test = {}
for ix, img in enumerate(test):
    img = "./flicker8k-dataset/Flickr8k_Dataset/{}.jpg".format(test[ix])
    encoding_test[img[len(images):]] = encode_image(img)
</code></pre>
    <p style="text-align: justify;">
        We encoded our images by passing them through the ResNet50 model. We used the second last layer to get our encodings. Now that we have encoded all our images, our next task is to create 2 dictionaries that have a mapping of word to index and index to the word of all the words in our vocabulary.
    </p>
    <pre><code>"""
word_to_idx is mapping between each unique word in all_vocab to int value 
and idx_to_word is vice-versa
"""

ix = 1
word_to_idx = {}
idx_to_word = {}

for e in all_vocab:
    word_to_idx[e] = ix
    idx_to_word[ix] = e
    ix +=1

#  need to add these 2 words as well

word_to_idx['startseq'] = 1846
word_to_idx['endseq'] = 1847

idx_to_word[1846] = 'startseq'
idx_to_word[1847] = 'endseq'

#  vocab_size is total vocabulary len +1 because we will append 0's as well. 

vocab_size = len(idx_to_word)+1
print(vocab_size)
</code></pre>
    <pre>Output: 1848</pre>
    <p style="text-align: justify;">
        The dictionary word_to_idx has each word in the vocabulary as its key and the value is the index and the opposite has happened with idx_to_word. After that we have added the words 'startseq' and 'endseq' in the dictionary too.
    </p>
    <p style="text-align: justify;">
        Now we have to find the maximum caption length.
    </p>
    <pre><code>all_captions_len = []

for key in train_descriptions.keys():
    for cap in train_descriptions[key]:
        all_captions_len.append(len(cap.split()))

max_len = max(all_captions_len)
print(max_len)
</code></pre>
    <pre>Output: 35</pre>
    <p style="text-align: justify;">
        As we can see, the maximum length of our captions is 35.
    </p>

    <h4 id="encoding-text-data" style="margin-top: 20px;"><b>Encoding Text Data</b></h4>
    <p style="text-align: justify;">
        Now our next task is to encode our text data. To do this we will be using glove embeddings.
    </p>
    <pre><code>#Here we are using glove embeddings to encode our vocabulary.

f = open("./GloVE/glove.6B.50d.txt", encoding='utf8')

embedding_index = {}

for line in f:
    values = line.split()
    word = values[0]
    coefs = np.asarray(values[1:], dtype="float")
    
    embedding_index[word] = coefs
    
f.close()

def get_embedding_output():
    
    emb_dim = 50
    embedding_output = np.zeros((vocab_size,emb_dim))
    
    for word, idx in word_to_idx.items():
        embedding_vector = embedding_index.get(word)
        
        if embedding_vector is not None:
            embedding_output[idx] = embedding_vector
            
    return embedding_output


embedding_output = get_embedding_output()

embedding_output.shape
</code></pre>
    <pre>Output: (1848, 50)</pre>
    <p style="text-align: justify;">
        Now our text data has been encoded and it has been stored in a variable called embedding_output. We used glove embeddings to encode each word in our vocabulary and we stored them in embedding_output whose shape is (1848,50).
    </p>

    <h4 id="data-generator"><b>Data Generator</b></h4>
    <p style="text-align: justify;">
        Now we will make the data generator function which will pass the data into the neural network.
    </p>
    <code>
        <pre>#Here we are making a generator function which will pass our data into the neural network.
            
def data_generator(train_descriptions, encoding_train, word_to_idx, max_len, num_photos_per_batch):

    X1, X2, y = [], [], []

    n=0

    while True:
        
        for key, desc_list in train_descriptions.items():
            n +=1

            photo = encoding_train[key+".jpg"]

            for desc in desc_list:
                
                seq = [ word_to_idx[word] for word in desc.split() if word in word_to_idx]  

                for i in range(1,len(seq)):

                    in_seq = seq[0:i]
                    out_seq = seq[i]

                    in_seq = pad_sequences([in_seq], maxlen=max_len, value=0, padding='post')[0]

                    out_seq = to_categorical([out_seq], num_classes=vocab_size)[0]

                    X1.append(photo)
                    X2.append(in_seq)
                    y.append(out_seq)

            if n==num_photos_per_batch:
                yield [[np.array(X1), np.array(X2)], np.array(y)]
                X1, X2, y = [], [], []
                n=0
</pre>
    </code>
    <p style="text-align: justify;">
        We have created our generator function. At each epoch, the generator function will take images in as many steps as defined by the num_photos_per_batch variable. The generator function will encode the photos and store them in a variable X1, the input sequence will be stored in the variable X2 and the output sequence will be stored in a variable y.
    </p>
    <h4 id="model-creation" style="margin-top: 20px;"><b>Model Creation</b></h4>
    <p style="text-align: justify;">
        Now we have to make our <a href="https://teksands.ai/blog/recurrent-neural-networks" target="_blank"><b>neural network</b></a>.
    </p>
    <pre><code># image feature extractor model

input_img_fea = Input(shape=(2048,))
inp_img1 = Dropout(0.3)(input_img_fea)
inp_img2 = Dense(256, activation='relu')(inp_img1)

# partial caption sequence model

input_cap = Input(shape=(max_len,))
inp_cap1 = Embedding(input_dim=vocab_size, output_dim=50, mask_zero=True)(input_cap)
inp_cap2 = Dropout(0.3)(inp_cap1)
inp_cap3 = LSTM(256)(inp_cap2)

decoder1 = add([inp_img2 , inp_cap3])
decoder2 = Dense(256, activation='relu')(decoder1)
outputs = Dense(vocab_size, activation='softmax')(decoder2)

# Merge 2 networks
model = Model(inputs=[input_img_fea, input_cap], outputs=outputs)

model.layers[2].set_weights([embedding_output])
model.layers[2].trainable = False

model.compile(loss="categorical_crossentropy", optimizer="adam")

model.summary()
</code></pre>
    <pre>
Output:
    
Layer (type)                    Output Shape         Param #     Connected to                     
=======================================================================================
input_3 (InputLayer)            (None, 35)           0                                     
________________________________________________________________________________________
input_2 (InputLayer)            (None, 2048)         0                                   
________________________________________________________________________________________
embedding_1 (Embedding)         (None, 35, 50)       92400       input_3[0][0]             
________________________________________________________________________________________
dropout_2 (Dropout)             (None, 2048)         0           input_2[0][0]                   
________________________________________________________________________________________
dropout_3 (Dropout)             (None, 35, 50)       0           embedding_1[0][0]     
________________________________________________________________________________________
dense_2 (Dense)                 (None, 256)          524544      dropout_2[0][0]      
________________________________________________________________________________________
lstm_1 (LSTM)                   (None, 256)          314368      dropout_3[0][0]        
________________________________________________________________________________________
add_1 (Add)                     (None, 256)          0           dense_2[0][0]          
                                                                 lstm_1[0][0]           
________________________________________________________________________________________
dense_3 (Dense)                 (None, 256)          65792       add_1[0][0]            
________________________________________________________________________________________
dense_4 (Dense)                 (None, 1848)         474936      dense_3[0][0]          
=========================================================================================
Total params: 1,472,040
Trainable params: 1,379,640
Non-trainable params: 92,400
_________________________________________________________________________________________
</pre>
    <p style="text-align: justify;">
        Our neural network is now created. Our output layer has neurons equal to the vocab_size. The embedding layer has been set as non-trainable as we are using glove embeddings. Now it's time to train our model.
    </p>
    <pre><code>epochs = 10
number_pics_per_bath = 3
steps = len(train_descriptions)//number_pics_per_bath

for i in range(epochs):
    generator = data_generator(train_descriptions, encoding_train, word_to_idx, max_len, number_pics_per_bath)
    model.fit_generator(generator, epochs=1, steps_per_epoch=steps, verbose=1)
</code></pre>
    <p style="text-align: justify;">
        Using the fit_generator method we have now trained our model for 10 epochs. Now we have to test our model.
    </p>
    <pre><code>#Here we have created a predict_caption function that will predict the caption using the trained model.

def predict_caption(photo):
    in_text = "startseq"
    
    for i in range(max_len):
        sequence = [word_to_idx[w] for w in in_text.split() if w in word_to_idx]
        sequence = pad_sequences([sequence], maxlen=max_len, padding='post')

        ypred =  model.predict([photo,sequence])
        ypred = ypred.argmax()
        word = idx_to_word[ypred]
        in_text+= ' ' +word
        
        if word =='endseq':
            break
        
        
    final_caption =  in_text.split()
    final_caption = final_caption[1:-1]
    final_caption = ' '.join(final_caption)
    
    return final_caption

#We are using gTTS in order to convert our caption to speech.

from gtts import gTTS
import os

for i in range(2):
    rn =  np.random.randint(0, 1000)
    img_name = list(encoding_test.keys())[rn]
    photo = encoding_test[img_name].reshape((1,2048))

    i = plt.imread(images+img_name)
    plt.imshow(i)
    plt.axis("off")
    plt.show()

    caption = predict_caption(photo)
    say=gTTS(text=caption,lang='en', slow=False)
    say.save("cap.mp3")
    os.system("cap.mp3")
    print(caption)
</code></pre>
    <p style="text-align: justify;">
        Output:
    </p>
    <img class="img-responsive" style="margin: 0 auto;" src="/resources/images/blogs/Eye-for-Blind/Eye-for-Blind-1.png" alt="Output">
    <br>
    <p style="text-align: justify;">
        As we can see that our model is showing captions for our images with decent accuracy. To convert our captions to speech we have used gTTS. Using the predict_caption function, we generate the caption for our image and display it below the image.
    </p>
<!-- -------------------------------------------------------------- -->


<h3 id="conclusion"><b>Conclusion</b></h3>  

<p style="text-align: justify;">
    In this project, we have explored an interesting topic called image to speech converter. We have seen how to pre-process the text data and image data. Further, how to make use of glove embeddings to build a text-speech converter. We hope, this article helps to gain an intuitive understanding of building image to speech converter.
</p>

<br>

</div><!-- end course-table -->