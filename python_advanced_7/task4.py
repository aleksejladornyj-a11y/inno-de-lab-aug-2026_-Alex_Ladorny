requested_roles = ["guest", "developer", "guest", "admin", "developer", "guest"]
required_admin_roles = {"admin", "security_officer", "audit_manager"}

unique_roles = set(requested_roles)
common_admin = unique_roles & required_admin_roles
missing_admin = required_admin_roles - unique_roles
has_security = 'security_officer' in requested_roles

print("Уникальные запрошенные роли:", unique_roles)
print("Общие административные роли:", common_admin)
print("Недостающее административные роли:", missing_admin)
print("Наличие роли security_officer в запросе:", has_security)