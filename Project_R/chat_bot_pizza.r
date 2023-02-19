# data frame - munu
no_manu <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
menu <- c("Hawaiian","Double Cheese", "Seafood Cocktail",
          "Double Pepperoni","Meat Deluxe","Cheese Sticks","Calamari",
          "Garlic Bread","Baked Spinach","Cocktail Sauce" )
price_menu <- c(339, 299, 399, 279, 339, 89, 99, 79, 179, 10)
data_manu <- data.frame(no_manu, menu, price_menu)

# data frame - service
no_service <- c(1, 2)
service <- c("Pick-up", "Delivery")
price_service <- c(0, 50)
data_service <- data.frame(no_service, service, price_service)

print("Hi, Welcome to our app.")
# get input from user
print("What's your name?")
name <- readLines("stdin", n=1)
print(paste("Nice to meet you", name))


count_order <- 0
price <- 0
orders <- c()
print(data_manu)
while (TRUE) {
  print("What's would you like to order ? (Press 1 for Yes, 2 for No.)")
  customer <- as.numeric(readLines("stdin", n=1))
  if (customer == 1){
    print("Please press 1-10")
    number_menu <- as.numeric(readLines("stdin", n=1))
    if(number_menu %in% no_manu) {
      order <- menu[number_menu]
      orders <- append(orders,order)
      print(paste("You order:",order))
      price <- price + price_menu[number_menu]

    } else {
      print("Please try again")
      next
    }
  } else if (customer == 2) {
    print("Thank you")
    break
  } else {
    print("-------------------------------------------")
  }
}    

# ask user about the service
print(data_service)
print("Will you pick-up or delivery to ? (Please press 1 or 2)")
count_service <- as.numeric(readLines("stdin", n=1))
if(count_service %in% no_service){
  order_service <- service[count_service]
  price_services <- price_service[count_service]
  price <- price + price_service[count_service]
  print(paste("You select: ", order_service,""))
} else {
  print("Please try again!")
}


while (TRUE) {
  print("Will you pay by cash or card ? (Press 1 for cash, 2 for card.)")
  pay_no <- readLines("stdin", n=1)
  if (pay_no == 1) {
    print("Payment : By cash")
    break
  }
  else if (pay_no == 2) {
    print("Payment : By card")
    break
  }
  else {
    print("Please try again!")
  }
}


print("-----------------------------------------------------------")
print(paste(name, "'s order"))
print(orders)
print(paste("Total: ",price,"Baht"))
print(paste("you select: ",order_service))
print("Enjoy your meal !!!")
print("Thank you, Please come back again :)")

