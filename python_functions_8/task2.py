import time
from typing import Callable, Any

PERFORMANCE_LOG_PREFIX = "[PERF_LOG]"
TIME_DECIMALS = 8

def perfomance_logger(func: Callable) -> Callable:
    """
    Декоратор для логирования времени выполнения функции.

    Args
        func (Callable): Декорируемая функция.

    Returns:
         Callable: Обернутая функция.
    """
    def wrapper(*args: Any, **kwargs: Any) -> Any:
        start_time = time.perf_counter()
        result = func(*args, **kwargs)
        elapsed = time.perf_counter() - start_time
        print(f'{PERFORMANCE_LOG_PREFIX} Функция "{func.__name__}" выполнена за {elapsed:.{TIME_DECIMALS}f} секунд')
        return result
    return wrapper

@perfomance_logger
def get_sorted_report(data: list[dict[str, str | float]]) -> list[dict[str, str | float]]:
    """
    Соритрует список словарей по ключу 'total_sales' по убыванию.

    Args:
        data (list[dict[str, str | float]]): Данные по выручке жанров.

    Returns:
        list[dict[str, str | float]]): Отсортированный список.
    """
    return sorted(data, key=lambda d: d['total_sales'], reverse=True)

if __name__ == '__main__':
    test_sets = [
        [
            {"category": "Action", "total_sales": 4311.85},
            {"category": "Animation", "total_sales": 4656.30},
            {"category": "Children", "total_sales": 3655.55}
        ],
        [
            {"category": "Classics", "total_sales": 1200.10},
            {"category": "Comedy", "total_sales": 4000.00},
            {"category": "Documentary", "total_sales": 4000.00}
        ],
        [
            {"category": "Drama", "total_sales": 500.00}
        ]
    ]

    print('=== ТЕСТИРОВАНИЕ ПРОИЗВОДИТЕЛЬНОСТИ ===')
    for i, data in enumerate(test_sets, start=1):
        print(f'\n--- ТЕСТ {i} ---')
        sorted_data = get_sorted_report(data)
        print('Топ категорий по выручке:')
        for idx, item in enumerate(sorted_data, start=1):
            print(f'{idx}. {item["category"]}: {item["total_sales"]}')