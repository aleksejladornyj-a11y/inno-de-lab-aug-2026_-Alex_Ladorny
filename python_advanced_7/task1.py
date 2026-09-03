# Нормализация записи пользователя

raw_user_record = " 10827 ; aLexAnDer_vLaDimiRov ; mInSk ; ACTIVE "

# Разбить по разделителю
parts = raw_user_record.split(";")
# Очистить от пробелов
cleaned = [part.strip() for part in parts]

# Добавить префикс UID-
user_id = f'UID-{cleaned[0]}'
# Заменить _ на пробел и привести к title
name = cleaned[1].replace("_", " ").title()
# Город в верхний регистр
city = cleaned[2].upper()
# Статус в нижний регистр
status = cleaned[3].lower()

# Подготовить элементы для итоговой строки
normalized_parts = [user_id, name, city, status]
# Собрать итоговую строку с разделителем
normalized = " | ".join(normalized_parts)
print('Нормализованная запись:', normalized)