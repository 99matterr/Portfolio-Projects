account_capital = 30000

trading_days = 18

averague_trades_per_day = 4

# this is to calculate the amount of trades per month
amount_of_trades_per_month = (trading_days * averague_trades_per_day)


# Amount in dollars per trades if positive of negative
print(" ")
positive_trade_result = (account_capital * (.02))
print("Gains per trade =", positive_trade_result)
print(" ")

negative_trade_result = (account_capital * (.01))
print("Risk per trade =", negative_trade_result)
print(" ")

# Utility is simply the amount of money made in total per month

positive_trades = (positive_trade_result * amount_of_trades_per_month)

negative_trades = (negative_trade_result * amount_of_trades_per_month)

# total utility vs real utility 

utility = (positive_trades - negative_trades)
print("Total Utility =", utility)
print(" ")

trader_salary = (utility * .20)
print("Salary =", trader_salary)
print(" ")

# Grow of the account
account_growth = ((utility * .80) + account_capital)
print("Growth of the account ", account_growth)
print(" ")

