#import random
import random as rd

#Greeting
print("Welcome to Pao-Ying-Chub Game!!!")
print("What is your name?")
player_name = input("Enter your name: ")
print(f"Hello! {player_name} nice to meet you")
print("How to play?")
print("R:Rock")
print("S:Scissors")
print("P:Paper")

#set variables
bot_set = ["R","S","P"]
count = 0
win = 0
lose = 0
draw = 0

while True:
    user_act = input("Enter R or S or P :")
    user_act = user_act.upper()
    bot_act = rd.choice(bot_set)
    print(f"You select {user_act},Bot select {bot_act}")

#loop
    if user_act == bot_act:
        print("It's a draw!!!")
        draw +=1
    elif user_act == "R" and bot_act =="P":
        print("You lose!!!")
        lose +=1
    elif user_act == "R" and bot_act == "S":
        print("You win!!!")
        win +=1
    elif user_act == "S" and bot_act =="R":
        print("You lose!!!")
        lose +=1
    elif user_act == "S" and bot_act == "P":
        print("You win!!!")
        win +=1
    elif user_act == "P" and bot_act =="S":
        print("You lose!!!")
        lose +=1
    elif user_act == "P" and bot_act == "R":
        print("You win!!!")
        win +=1
    else:
        print('Error, Plase try again!')
    print("********************")

    print("Play again? (Y/N)")
    next_action = input().upper()
    if next_action == "N":
        #Summary
        print(f"You win:",win, "times")
        print(f"You lose:",lose, "times")
        print(f"You draw:", draw, "times")
        print("See you again next time.")
        break
