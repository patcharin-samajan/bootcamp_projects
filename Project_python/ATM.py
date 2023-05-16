class ATM :
    def __init__(self,name,balance,promptpay,password):
        self.name = name
        self.balance = balance
        self.promtpay = promptpay
        self.password = password
    def check_balance(self):
        data = f"Account: {self.name}, balance: {self.balance}, \npromptpay: {self.promtpay}, password: {self.password}"
        print(data)
    def deposit(self,money):
        self.balance += money
        print(f"New balance: {self.balance}")
        print("Deposit successfully.")
    def withdraw(self,money):
        self.balance -= money
        print(f"New balance: {self.balance}")
        print("Withdraw successfully.")
    def transfer(self,money,account_transfer: str):
        self.balance -= money
        print(f"Transter to {account_transfer},total {money} ")
        print(f"New Balance: {self.balance} ")
    def change_promptpay(self,new_promtpay: str):
        self.promtpay = new_promtpay
        print(f"New promptpay: {self.promtpay}")
        print("Your prompypay has been changed")
    def change_password(self,new_password: str):
        self.password = new_password
        print(f"New password: {self.password}")
        print("Your password has been changed")

#input data
customers = []
print("Hello world")
customers.append(str(input("Your name is: ")))
customers.append(float(input("Balance: ")))
customers.append(str(input("Password 5 digit: ")))
customers.append(str(input("Promtpay 10 digit: ")))
scb = ATM(customers[0],customers[1],customers[2],customers[3])

#select_service
data = [1,2,3,4,5,6]
print("Total services for customer")
print("1.check_balance \n2.deposit \n3.withdraw \n4.transfer \n5.change_promptpay \n6.change_password")
select_service = int(input("Please select the service(1-10): "))

#1.check_balance
if select_service == (data[0]) :
    scb.check_balance()
#2.deposit
elif select_service == (data[1]) :
    deposit_value = float(input("Deposit Amount: "))
    scb.deposit(deposit_value)
    print('Thank you')
#3.withdraw
elif select_service == (data[2]) :
    withdraw_value = float(input("Withdraw Amount: "))
    if withdraw_value > (customers[1]) :
       print("Balance is not enough, please Try again!")
       print('Thank you') 
    else: scb.withdraw(withdraw_value)
#4.transfer
elif select_service == (data[3]) :
    account_transfer = str(input("Bank account number to transfer 10 digits[0-9]: "))
    if len(account_transfer) == 10 :
        transfer_value = float(input("Transfer Amount: "))
        if transfer_value > (customers[1]) :
            print("Balance is not enough, please Try again!")
            print("Error")
        else: scb.transfer(transfer_value,account_transfer)
    else:
        print("Invalid account number, please Try again!")
        print('Thank you')
#5.change_promptpay
elif select_service == (data[4]) :
    new_promptpay = str(input("New promptpay 10 digit[0-9]: "))
    if len(new_promptpay) == 10:
        scb.change_promptpay(new_promptpay)
    else: 
        print("Invalid promptpay number, please Try again!")
        print('Thank you')
#6.change_password
elif select_service == (data[5]) :
    new_password = str(input("New password 5 digit[0-9]: "))
    if len(new_password) == 5:
        scb.change_password(new_password)
    else: 
        print("Invalid password, please Try again!")
        print('Thank you')
else:
    print("please Try again!")
