__author__ = 'Rodney'

'''
You get 5 chances to guess a number that the computer is thinking of
'''

import random

min_guess = 1
max_guess = 100
number_of_tries = 5

print("Hello, what is your name?")
username = input("Enter your name: ")
print("Okay {0}. I am thinking of a number from {1} to {2}.".format(username, min_guess, max_guess))
print("I'll give you {0} tries to guess and tell you if you are too low or too high.".format(number_of_tries))
print("Go ahead.")

number_to_guess = random.randint(min_guess, max_guess)

attempt = 1

while attempt <= 5:
    guess = int(input("Guess # {0}: ".format(attempt)))
    if guess < number_to_guess:
        print("You're too low.")
    elif guess > number_to_guess:
        print("You're too high.")
    else:
        print("Good guess. You guessed the correct number!")
        break
    attempt += 1
else:
    print("Sorry. You never guessed correctly.")
    print("The answer was {0}.".format(number_to_guess))