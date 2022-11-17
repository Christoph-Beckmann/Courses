# alist = [10, 11, 12, 13, 14, 15]
# print(alist[3])
# print(alist[-1])
# print(alist[-2])
# idx = 5
# print(alist[idx])

# alist = [4,3.2,[9,4,5],4]  # list in list
# print( alist[2][2] )

# s = 'hello'

# Exercise
## Get the attribute of Penguin in the following list

listlist = [ 4,'hi', [5,4,3],'yo',{'Squirrel':'cute', 'Penguin':'Yummy'}]
dict=listlist[4]
print(dict['Penguin'])

## Easier:
print(listlist[4]['Penguin'])