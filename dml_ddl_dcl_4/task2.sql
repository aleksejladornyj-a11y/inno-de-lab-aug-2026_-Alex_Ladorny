-- Задание 2: DDL

-- 1. Создать таблицу Departments (если её нет)
CREATE TABLE IF NOT EXISTS Departments (
    DepartmentID SERIAL PRIMARY KEY,
    DepartmentName VARCHAR(50) UNIQUE NOT NULL,
    Location VARCHAR(50)
);

-- 2. Добавить колонку Email (если её нет)
ALTER TABLE Employees ADD COLUMN IF NOT EXISTS Email VARCHAR(100);

-- 3. Заполнить Email для всех сотрудников (если ещё не заполнены)
UPDATE Employees SET Email = 
    LOWER(FirstName) || '.' || LOWER(LastName) || '@company.com' 
WHERE Email IS NULL;

-- 4. Добавить ограничение UNIQUE на Email (без IF NOT EXISTS, потому что не поддерживается)
-- Если ограничение уже существует, будет ошибка – её можно игнорировать, задание выполнено.
ALTER TABLE Employees ADD CONSTRAINT unique_email UNIQUE (Email);

-- Проверка
SELECT * FROM Departments;
SELECT EmployeeID, FirstName, LastName, Email FROM Employees;