db_config = {
    "connection": {
        "host": "production-db.internal",
        "port": 5432,
        "user": "postgres"
    }
}

host = db_config['connection'].get('host', 'localhost')
port = db_config['connection'].get('port', 5432)

ssl_mode = db_config.get('ssl_settings', {}).get('ssl_mode', 'verify-full')

db_config['connection']['user'] = 'admin'
db_config['connection']['max_connections'] = 100

print('SSL Mode:', ssl_mode)
print('Параметры соединения:')
for key, value in db_config['connection'].items():
    print(f'* {key}: {value}')