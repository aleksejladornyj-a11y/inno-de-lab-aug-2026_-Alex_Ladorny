# Безопасный парсинг конфигурации API

db_config = {
    "connection": {
        "host": "production-db.internal",
        "port": 5432,
        "user": "postgres"
    }
}
# Извлекаем значение host и port из вложенного словаря
# Если ключи отсутствуют выставляем default
host = db_config['connection'].get('host', 'localhost')
port = db_config['connection'].get('port', 5432)

# Извлекаем параметр ssl_mode, проверяя ключ ssl_settings
# Если ssl_settings отсутствует, подставляем пустой словарь {}.
# Если ssl_mode отсутствует внутри ssl_settings, используем значение по умолчанию 'verify-full'
ssl_mode = db_config.get('ssl_settings', {}).get('ssl_mode', 'verify-full')

# Изменяем пользователя на 'admin'
db_config['connection']['user'] = 'admin'
# Добавляем max_connections со значением 100
db_config['connection']['max_connections'] = 100

# Для вывода используем цикл по .items
print('SSL Mode:', ssl_mode)
print('Параметры соединения:')
for key, value in db_config['connection'].items():
    print(f'* {key}: {value}')