-- Количество клиентов по странам
SELECT country, COUNT(*) AS count 
FROM Customers 
GROUP BY country;