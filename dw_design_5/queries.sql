-- 1. Количество приёмов по месяцам
SELECT 
    d.year,
    d.month,
    COUNT(f.appointment_id) AS total_appointments
FROM FactAppointments f
JOIN DimDate d ON f.date_id = d.date_id
GROUP BY d.year, d.month
ORDER BY d.year, d.month;

-- 2. Топ-5 самых популярных процедур
SELECT 
    t.name,
    COUNT(f.appointment_id) AS usage_count
FROM FactAppointments f
JOIN DimTreatment t ON f.treatment_id = t.treatment_id
GROUP BY t.name
ORDER BY usage_count DESC
LIMIT 5;

-- 3. Средняя стоимость приёма по врачам
SELECT 
    v.first_name || ' ' || v.last_name AS vet_name,
    AVG(f.total_cost) AS avg_revenue_per_visit
FROM FactAppointments f
JOIN DimVet v ON f.vet_id = v.vet_id
GROUP BY v.vet_id
ORDER BY avg_revenue_per_visit DESC;

-- 4. Загруженность врачей (количество приёмов)
SELECT 
    v.first_name || ' ' || v.last_name AS vet_name,
    COUNT(f.appointment_id) AS total_visits
FROM FactAppointments f
JOIN DimVet v ON f.vet_id = v.vet_id
GROUP BY v.vet_id
ORDER BY total_visits DESC;