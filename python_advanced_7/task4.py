# Аудит прав доступа и дедупликация

# Исходный список ролей, переданный в запросе
requested_roles = ["guest", "developer", "guest", "admin", "developer", "guest"]
# Множество обязательных административных ролей
required_admin_roles = {"admin", "security_officer", "audit_manager"}

# Множество удаляет повторяющиеся элементы
unique_roles = set(requested_roles)
# Находим пересечение множеств
common_admin = unique_roles & required_admin_roles
# Находим разность множеств
missing_admin = required_admin_roles - unique_roles
# Проверяем наличие 'security_officer' в запросе
has_security = 'security_officer' in unique_roles

print("Уникальные запрошенные роли:", unique_roles)
print("Общие административные роли:", common_admin)
print("Недостающее административные роли:", missing_admin)
print("Наличие роли security_officer в запросе:", has_security)