-- Задание 1: DML

-- 1. Вставить двух новых сотрудников
INSERT INTO Employees (FirstName, LastName, Department, Salary)
VALUES 
('Ivan', 'Petrov', 'HR', 55000.00),
('Maria', 'Sidorova', 'Finance', 62000.00);

-- 2. Выбрать всех сотрудников
SELECT * FROM Employees;

-- 3. Выбрать FirstName и LastName из отдела IT
SELECT FirstName, LastName FROM Employees WHERE Department = 'IT';

-- 4. Обновить зарплату Alice Smith до 65000.00
UPDATE Employees SET Salary = 65000.00 WHERE FirstName = 'Alice' AND LastName = 'Smith';

-- 5. Удалить сотрудника Eve Davis
DELETE FROM Employees WHERE FirstName = 'Eve' AND LastName = 'Davis';

-- 6. Проверить изменения
SELECT * FROM Employees;