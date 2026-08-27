raw_user_record = " 10827 ; aLexAnDer_vLaDimiRov ; mInSk ; ACTIVE "

parts = raw_user_record.split(";")
cleaned = [part.strip() for part in parts]

user_id = f'UID-{cleaned[0]}'
name = cleaned[1].replace("_", " ").title()
city = cleaned[2].upper()
status = cleaned[3].lower()

normalized_parts = [user_id, name, city, status]
normalized = " | ".join(normalized_parts)

print('Нормализованная запись:', normalized)