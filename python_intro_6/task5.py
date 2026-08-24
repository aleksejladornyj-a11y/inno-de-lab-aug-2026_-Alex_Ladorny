import random

num = random.randint(1, 20)
attempts = 5
print("Я загадал число от 1 до 20. У тебя 5 попыток!")

while attempts > 0:
    guess = int(input(f"Попытка {6 - attempts}. Введите число: "))
    if guess == num:
        print("Ты угадал! Отличная работа.")
        break
    elif guess < num:
        print("Слишком мало!")
    else:
        print("Слишком много!")
    attempts -= 1
    print(f"Осталось попыток: {attempts}")
else:
    print(f"Игра окончена. Было загадано число {num}.")