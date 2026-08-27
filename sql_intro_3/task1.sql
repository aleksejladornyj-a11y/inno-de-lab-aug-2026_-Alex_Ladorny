-- Клиенты из USA с возрастом > 25
SELECT first_name, last_name, age, country 
FROM Customers 
WHERE country = 'USA' AND age > 25;