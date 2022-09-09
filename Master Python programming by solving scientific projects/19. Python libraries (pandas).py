import pandas as pd
import numpy as np

# create some random data

var1 = np.random.randn(100)*5+20
var2 = np.random.randn(100)>0

labels = ['Temp. (C)', 'Ice cream eaten']

# create a dictionary

D = {labels[0]:var1, labels[1]:var2}

df = pd.DataFrame(data=D)

print(df.head(10))
print(df.count())
print(df.mean())

# Exercise 
## Create a pandas dataframe with three variables
### 1) integers from 0 to 10
### 2) their square
### 3) their log

integers = np.array(range(11))
squares = integers**2
logs = np.log(integers)
data = {"Integers": integers, "Squares": squares, "logs": logs}
df = pd.DataFrame(data=data)
print(df)
