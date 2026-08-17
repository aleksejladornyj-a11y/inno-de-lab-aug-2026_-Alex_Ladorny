-- Задание 4: Сложные DML

-- 1. Увеличить зарплату всех сотрудников в отделе 'HR' на 10%
UPDATE Employees 
SET Salary = Salary * 1.10 
WHERE Department = 'HR';

-- 2. Перевести сотрудников с зарплатой > 70000 в 'Senior IT'
UPDATE Employees 
SET Department = 'Senior IT' 
WHERE Salary > 70000;

-- 3. Удалить сотрудников без проектов (не числятся в EmployeeProjects)
DELETE FROM Employees 
WHERE EmployeeID NOT IN (
    SELECT DISTINCT EmployeeID 
    FROM EmployeeProjects
);

-- 4. Транзакция: новый проект + назначение двух сотрудников
BEGIN;

INSERT INTO Projects (ProjectName, Budget, StartDate, EndDate) 
VALUES ('AI Research', 250000.00, '2024-01-01', '2024-12-31');

INSERT INTO EmployeeProjects (EmployeeID, ProjectID, HoursWorked) 
VALUES 
    (2, (SELECT ProjectID FROM Projects WHERE ProjectName='AI Research'), 150),
    (4, (SELECT ProjectID FROM Projects WHERE ProjectName='AI Research'), 120);

COMMIT;

-- Проверка
SELECT * FROM Employees;
SELECT * FROM Projects;
SELECT * FROM EmployeeProjects;