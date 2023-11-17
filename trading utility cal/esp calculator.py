account_capital = 30000

trading_days = 18

averague_trades_per_day = 4

#esto es para calcular la cantidad de operaciones por mes
cantidad_de_operaciones_por_mes = (trading_days * averague_trades_per_day)

#Cantidad en dólares por operación si es positiva o negativa
print(" ") 
resultado_de_operación_positiva = (account_capital * (.02)) 
print("Ganancias por operación =", resultado_de_operación_positiva) 
print(" ")

resultado_de_operación_negativa = (account_capital * (.01)) 
print("Riesgo por operación =", resultado_de_operación_negativa) 
print(" ")

#La utilidad es simplemente la cantidad de dinero ganada en total por mes
operaciones_positivas = (resultado_de_operación_positiva * cantidad_de_operaciones_por_mes)

operaciones_negativas = (resultado_de_operación_negativa * cantidad_de_operaciones_por_mes)

#utilidad total vs utilidad real
utilidad = (operaciones_positivas - operaciones_negativas) 
print("Utilidad total =", utilidad) 
print(" ")

salario_del_trader = (utilidad * .20) 
print("Salario =", salario_del_trader) 
print(" ")

#Crecimiento de la cuenta
crecimiento_de_la_cuenta = ((utilidad * .80) + account_capital) 
print("Crecimiento de la cuenta ", crecimiento_de_la_cuenta) 
print(" ")