# Exercise of "Printing and inputting"

# Pythagorean theorem: a**2 + b**2 = c**2
# get two numbers from the user: a,b
# compute and print the length of side c

side_a = float(input('Enter the side a: '))
side_b = float(input('Enter the side b: '))
side_c = (side_a**2 + side_b**2)**(1/2)

print( 'Your entered side a with ' + str(side_a) + 'and side b with ' + str(side_b) +
       '. According to the pythagorean theorem: Side c has the length: ' + str(side_c) )