# Toxic text big data visualisations

Big data visualizations - multiclassification of 6 types of toxicity: ['toxic', 'severe_toxic', 'obscene', 'threat', 'insult', 'identity_hate'].

Based on [Toxic Comment Classifier](https://developer.ibm.com/exchanges/models/all/max-toxic-comment-classifier/) which includes pretrained BERT model for [Kaggle Toxic Comment Classification Challenge](https://www.kaggle.com/c/jigsaw-toxic-comment-classification-challenge/data). 

The pretrained BERT PyTorch model was used on 2 datasets: 

* [jigsaw-toxic](https://www.kaggle.com/c/jigsaw-toxic-comment-classification-challenge/data) (training dataset)
* [polytical-tweets](https://www.kaggle.com/kaushiksuresh147/political-tweets)

where outputs of last hidden layer were extracted and fed as learning datasets into two dimension reduction models: PCA and UMAP. As a next step, we visualized all the reduced data to check how well the model grouped similar toxic sentences together.

The obtained results were used to built an API and frontend which can be found here: https://github.com/LeszekBlazewski/WWZD.
