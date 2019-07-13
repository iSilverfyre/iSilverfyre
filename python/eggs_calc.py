#!/usr/bin/python
print('Content-type: text/html\r\n\r')

print ("This is a simple script setup to request the needed info for the contract bot in Discord.")

print ("Open your stats menu and provide the following.")
egg_laying = raw_input("Egg Laying Rate: ")
egg_hatchery = raw_input("Internal Hatchery Rate: ")
population = raw_input("Farm Population: ")

print ("Open your contract and provide the following.")
production = raw_input("Current Eggs Produced (or 0): ")
time = raw_input("Time Left in Contract: ")

print ("Open your epic research and provide the following.")
epic = raw_input("Internal Hatchery Calm (Max 20): ")

print ("Open your habs menu and provide the following.")
habs = raw_input("Maximum Hab Capacity (Max 189810^7): ")

print ("Open your shipping menu and provide the following.")
shipping = raw_input("Maximum Shipping Rate (Max 311462*10^6=17): ")

print ("e!contract {} {} {} {} {} {} {} {} ").format(egg_laying, egg_hatchery, time, population, production, epic, habs, shipping)