MAX_RENTAL_BATCH_LIMIT = 150.0

def calculate_rental_batch(quantity : int, rental_rate: float, discount: float = 0.0) -> tuple[float, bool]:
    """
    Расчитывает стоимость партии аренды и проверят превышение лимита.

    Args:
        quantity (int): Количество дисков.
        rental_rate (float): Стоимость аренды одного диска.
        discount (float): Скидка в долях(по умолчанию 0.0).

    Returns:
        tuple[float, bool]: (final_sum, is_limit_exceeded)
    """
    final_sum = round(rental_rate * quantity * (1-discount), 2)
    is_limit_exceeded = final_sum > MAX_RENTAL_BATCH_LIMIT
    return final_sum, is_limit_exceeded

if __name__ == '__main__':
    batches = [
        ("Academy Dinosaur", 30, 2.99, 0.0),
        ("Affair Prejudice", 40, 4.99, 0.1),
        ("«Agent Truman", 10, 1.99, 0.0),
        ("«African Egg", 50, 3.50, 0.2),
    ]

    print('=== ОТЧЕТ ПО ПАРТИЯМ АРЕНДЫ ===')
    for idx, (name, qty, rate, disc) in enumerate(batches, start=16):
        total, exceeded = calculate_rental_batch(qty, rate, disc)
        status = 'TRUE' if exceeded else 'FALSE'
        print(f'Партия {idx} ({name}): Сумма {total}$. Превышение лимита: {status}')