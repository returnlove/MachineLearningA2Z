
# importing libs

print("importing libs")
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
print("import done")


dataset = pd.read_csv("Data.csv")
X = dataset.iloc[:, :-1].values
y = dataset.iloc[:, 3].values

from sklearn.preprocessing import Imputer
imputer = Imputer(missing_values = "NaN", strategy = "mean", axis = 0)
imputer =  imputer.fit(X[:, 1:3])
X[:,1:3] = imputer.transform(X[:,1:3])

# ENcoding categorical values

from sklearn.preprocessing import LabelEncoder, OneHotEncoder
labelencoder_X = LabelEncoder()
X[:,0] = labelencoder_X.fit_transform(X[:, 0])
onehotencoder = OneHotEncoder(categorical_features = [0])
X = onehotencoder.fit_transform(X).toarray()

#only label encoder is enough for the dependent variables, only for categorical features we have to do
# one hot encoding

labelencoder_y = LabelEncoder()
y = labelencoder_y.fit_transform(y)


#splitting training and test sets

from sklearn.cross_validation import train_test_split

X_train, X_test, y_train, y_test = train_test_split(X, y, test_size = 0.20, random_state = 0)







