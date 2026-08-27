-- Заказы с суммой > 1000
SELECT order_id, item, amount, customer_id 
FROM Orders 
WHERE amount > 1000;