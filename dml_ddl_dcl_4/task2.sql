-- Задание 2: DDL

-- 1. Создать таблицу Departments
CREATE TABLE IF NOT EXISTS Departments (
    DepartmentID SERIAL PRIMARY KEY,
    DepartmentName VARCHAR(50) UNIQUE NOT NULL,
    Location VARCHAR(50)
);

-- 2. Переименовать колонку Location в OfficeLocation
ALTER TABLE Departments RENAME COLUMN Location TO OfficeLocation;

-- 3. Добавить колонку Email
ALTER TABLE Employees ADD COLUMN IF NOT EXISTS Email VARCHAR(100);

-- 4. Заполнить Email для всех сотрудников
UPDATE Employees SET Email = 
    LOWER(FirstName) || '.' || LOWER(LastName) || '@company.com' 
WHERE Email IS NULL;

-- 5. Добавить ограничение UNIQUE на Email
ALTER TABLE Employees ADD CONSTRAINT unique_email UNIQUE (Email);

-- Проверка
SELECT * FROM Departments;
SELECT EmployeeID, FirstName, LastName, Email FROM Employees;