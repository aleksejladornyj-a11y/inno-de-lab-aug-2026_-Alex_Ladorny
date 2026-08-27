system_telemetry = [
    ("srv_01", 12.5, 64, "online"),
    ("srv_02", 85.0, 92, "online"),
    ("srv_03", 0.0, 0, "offline"),
    ("srv_04", 45.2, 78, "online"),
    ("srv_05", 95.1, 99, "online")
]

active_nodes = []
cpu_loads = []
ram_usages = []

for node, cpu, ram, status in system_telemetry:
    if status == "online":
        active_nodes.append(node)
        cpu_loads.append(cpu)
        ram_usages.append(ram)

active_count = len(active_nodes)
avg_cpu = round(sum(cpu_loads) / active_count, 2) if active_count > 0 else 0
max_ram = max(ram_usages) if ram_usages else 0

report = {
    'active_nodes_count': active_count,
    'metrics': {
        'average_cpu': avg_cpu,
        'max_ram': max_ram,
    }
}

print('Активные узлы в сети:', active_nodes)
print('Итоговый отчет телеметрии:')
print(report)