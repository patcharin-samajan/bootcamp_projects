#Greeting
print("Welcome to Pao-Ying-Chub Game!!!")
print("What's your name?")
name <- readLines("stdin", n=1)
print(paste("Hello!",name," nice to meet you"))
print("How to play?")
print("R:Rock")
print("S:Scissors")
print("P:Paper")

# set data
bot_act <- sample(1:3, 1)
win <- 0
lose <- 0
draw <- 0

#play game
while (TRUE) {
  choose <- ("Enter your choice :
              1 rock, 
              2 paper, 
              3 scissors 
              or 0 for exit: ")
  cat(choose)
  user_act <- as.numeric(readLines("stdin", n = 1))
  if (user_act == 1 || user_act == 2 || user_act == 3 ){
      if(user_act == bot_act){
        draw <- draw + 1
        print("It's a draw!!!")
        print("--------------")
      } else if (user_act == 1 && bot_act == 2){
        lose <- lose + 1
        print("It's a lose!!!")
        print("--------------")
      } else if (user_act == 1 && bot_act == 3){
        win <- win + 1
        print("It's a win!!!")
        print("--------------")
      } else if (user_act == 2 && bot_act == 3){
        lose <- lose + 1
        print("It's a lose!!!")
        print("--------------")
      } else if (user_act == 2 && bot_act == 1){
        win <- win + 1
        print("It's a win!!!")
        print("--------------")
      } else if (user_act == 3 && bot_act == 1){
        lose <- lose + 1
        print("It's a lose!!!")
        print("--------------")
      } else if (user_act == 3 && bot_act == 2){
        win <- win + 1
        print("It's a win!!!")
        print("--------------")
      } else {
        print('Error, Plase try again!')
        print("********************")
      }
  } else if (user_act == 0) {
    print("--------------exit--------------")
    break 
  } else {
    print("Invalid choice. Please try again.")
  } 
}

print(paste("You win:",win,"times"))
print(paste("You lose:",lose,"times"))
print(paste("You draw:",draw,"times"))
print(paste("See you again next time."))
