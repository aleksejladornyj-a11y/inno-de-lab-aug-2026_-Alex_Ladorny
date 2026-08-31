from typing import Any

DEFAULT_RETURN_INDEX_BASE = 10.0

def calculate_overdue_fine(film_name: str, days_overdue: Any, fine_rate: float) -> tuple[float, float] | None:
    """
    Безопасно вычисляет штраф и индекс оборачиваемости.

    Args:
        film_name (str): Название фильма.
        days_overdue (Any): Количество дней просрочки.
        fine_rate (float): Штраф за день

    Returns:
        tuple[float, float] | None: (total_fine, return_index) или None при ошибке.

    Обрабатываемые ошибки:
       TypeError: если days_overdue не является числом или строкой.
       ValueError: если days_overdue не может быть преобразовано в float.
       ZeroDivisionError: если days_overdue == 0.
    """
    try:
        numeric_days = float(days_overdue)
        total_fine = numeric_days * fine_rate
        return_index = DEFAULT_RETURN_INDEX_BASE / numeric_days
        print(f'Фильм: "{film_name}" | Итоговый штраф: {total_fine}$ | Индекс: {return_index}')
        return total_fine, return_index
    except ValueError as e:
        print(f'[Ошибка значения] Невозможно преобразовать дни в число для "{film_name}": {e}')
        return None
    except TypeError as e:
        print(f'[Ошибка типа] Некорректный тип данных для "{film_name}": {e}')
        return None
    except ZeroDivisionError as e:
        print(f'[Ошибка деления на ноль] Возврат без просрочки для "{film_name}": float division by zero')
        return None
    finally:
        print('--- Проверка транзакции возврата завершена ---')

if __name__ == '__main__':
    test_cases = [
        ('Matrix', 5, 1.5),
        ('Inception', 'пять', 2.0),
        ('Avatar', 0 , 2.5),
        ('Interstellar', [3], 3.0),
    ]

    print("=== ПРОВЕРКА ВОЗВРАТОВ ===")
    for film, days, rate in test_cases:
        calculate_overdue_fine(film, days, rate)
        print()