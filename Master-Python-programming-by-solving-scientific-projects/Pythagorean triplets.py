print('Check for a pythagorean triplets:')
print('')

# Input
a = input('What is your guess for a? ')
b = input('What is your guess for b? ')
c = input('What is your guess for c? ')

# Calculation

pyth_triples = ((int(a)**2) + (int(b)**2)) == (int(c)**2)

# Output

print('')
if (pyth_triples == True):
    print('Your entered set of integers is a correct pythagorean triples!')
else:
    print('Your entered set of integers is not a correct pythagorean triples!')
