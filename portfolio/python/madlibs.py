"""
This program generates a story based off the word provided.  Similar to the popular MadLibs
Author: Analicia 
"""
# The template for the story

story = "This morning %s woke up feeling %s. 'It is going to be a %s day!' Outside, a bunch of %s's were protesting to keep %s in stores. They began to %s to the rhythm of the %s, which made all the %s's very %s. Concerned, %s texted %s, who flew %s to %s and dropped %s in a puddle of frozen %s. %s woke up in the year %s, in a world where %s's ruled the world."

print ("~ MadLib Stories ~\n")

print ("First lets get your name.")
name = input("Enter your name: ")

print ("\nWelcome to MadLibs " + (name) + ". Please provided the requested number of adjectives, verbs and nouns to present your completed story.")

adj1 = input("Adjective 1: ")
adj2 = input("Adjective 2: ")
adj3 = input("Adjective 3: ")

verb1 = input("\nVerb 1: ")

noun1 = input("\nNoun 1: ")
noun2 = input("Noun 2: ")

print ("\nLet's change things up a little bit.")

animal = input("What is your favorite animal: ")
food = input("What is your favorite food: ")
fruit = input("What is your favorite fruit: ")
superhero = input("Who is your favorite superhero: ")
country = input("What is a country that you have always wanted to visit: ")
dessert = input("What is your favorite dessert: ")
year = int(input("What year are you born in: "))
print ("")
print (story % (name, adj1, adj2, animal, food, verb1, noun1, fruit, adj3, name, superhero, name, country, name, dessert, name, year, noun2))
