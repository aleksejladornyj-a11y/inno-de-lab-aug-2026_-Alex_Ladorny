# Сборщик метрик инфраструктуры

system_telemetry = [
    ("srv_01", 12.5, 64, "online"),
    ("srv_02", 85.0, 92, "online"),
    ("srv_03", 0.0, 0, "offline"),
    ("srv_04", 45.2, 78, "online"),
    ("srv_05", 95.1, 99, "online")
]

# Инициализация списков для сбора данных активных узлов
active_nodes = []    # имена активных серверов
cpu_loads = []       # значения загрузки CPU
ram_usages = []      # значения использования RAM

# Проход по каждому кортежу с распаковкой переменных
for node, cpu, ram, status in system_telemetry:
    # Фильтруем только серверы со статусом 'online'
    if status == "online":
        active_nodes.append(node)
        cpu_loads.append(cpu)
        ram_usages.append(ram)

# Вычисление итоговых метрик через встроенные агрегирующие функции
active_count = len(active_nodes)                                                # количество активных узлов
avg_cpu = round(sum(cpu_loads) / active_count, 2) if active_count > 0 else 0    # средний CPU
max_ram = max(ram_usages) if ram_usages else 0                                  # максимальный RAM

print('Активные узлы в сети:', active_nodes)
print('Итоговый отчет телеметрии:')
print('{')
print(f"    'active_nodes_count': {active_count},")
print("    'metrics': {")
print(f"        'average_cpu': {avg_cpu},")
print(f"        'max_ram': {max_ram}")
print("    }")
print("}")
