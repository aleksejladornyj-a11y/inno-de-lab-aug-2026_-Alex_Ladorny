num1 = float(input("Введите первое число: "))
num2 = float(input("Введите второе число: "))
op = input("Выберите оператор (+, -, *, /): ")

if op == '+':
    result = num1 + num2
elif op == '-':
    result = num1 - num2
elif op == '*':
    result = num1 * num2
elif op == '/':
    if num2 != 0:
        result = num1 / num2
    else:
        result = "Ошибка: деление на ноль!"
else:
    result = "Неверный оператор!"

print(f"Результат: {num1} {op} {num2} = {result}")