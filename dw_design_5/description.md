# Проектирование Data Warehouse для ветеринарной клиники

## 1. Бизнес-процесс
Анализ эффективности работы ветеринарной клиники – отслеживание количества приёмов, загруженности врачей, популярности процедур и динамики доходов.

## 2. Уровень детализации (grain)
Одна запись в таблице фактов = один приём (визит) питомца.

## 3. Измерения (dimensions)

| Измерение | Описание | Атрибуты |
|-----------|----------|----------|
| DimDate | Дата приёма | date_id (PK), date, year, month, day, weekday, is_weekend |
| DimPet | Питомец | pet_id (PK), name, species, breed, birth_date, owner_id (FK) |
| DimOwner | Владелец | owner_id (PK), first_name, last_name, phone, email |
| DimVet | Ветеринар | vet_id (PK), first_name, last_name, specialization |
| DimTreatment | Процедура | treatment_id (PK), name, cost |

## 4. Таблица фактов (FactAppointments)

| Поле | Тип | Описание |
|------|-----|----------|
| appointment_id | SERIAL (PK) | Уникальный ID приёма |
| date_id | INT (FK) | Дата приёма |
| pet_id | INT (FK) | Питомец |
| vet_id | INT (FK) | Ветеринар |
| treatment_id | INT (FK) | Основная процедура |
| total_cost | DECIMAL(10,2) | Общая стоимость приёма |
| duration_minutes | INT | Длительность приёма |
| number_of_procedures | INT | Количество процедур |

## 5. Схема (звезда)
В центре FactAppointments, вокруг – DimDate, DimPet, DimOwner, DimVet, DimTreatment.

## 6. Аналитические запросы (приведены в queries.sql)