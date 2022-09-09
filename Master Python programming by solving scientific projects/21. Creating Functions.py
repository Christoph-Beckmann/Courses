# Exercise
## 1. Create a function that computes a factorial of an integer
## 2. compare Your factorial function with math module

from math import factorial as mathfact

def factorial(x: int):
    fact = 1
    for i in range(1,x+1):
        fact = fact * i
    return fact

def compare(x: int):
    own_fact = factorial(x)
    math_fact = mathfact(x)
    return own_fact, math_fact

number = 30
own_fact, math_fact = compare(number)

print("Your factorial of " + str(number) + " is: " + str(own_fact))
print("The mathlib factorial of " + str(number) + " is: " + str(math_fact))