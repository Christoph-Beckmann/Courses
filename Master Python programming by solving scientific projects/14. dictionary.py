# Input two numbers from the user.
# Create a dictionary with keys 'firstNum', 'secondNum', 'product'

firstNum = float( input('Enter your first number: '))
secondNum = float( input('Enter your second number: '))

dict = dict()
dict['firstNum'] = firstNum
dict['secondNum'] = secondNum
dict['product'] = firstNum * secondNum

print(dict.keys())
print(dict.items())
print(dict.values())
