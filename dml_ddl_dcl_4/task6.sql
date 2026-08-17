-- Задание 6 (опционально): сложные DML

-- 1. Проекты, где Bob Johnson работал > 150 часов
SELECT ProjectName
FROM Projects p
JOIN EmployeeProjects ep ON p.ProjectID = ep.ProjectID
JOIN Employees e ON ep.EmployeeID = e.EmployeeID
WHERE e.FirstName = 'Bob' AND e.LastName = 'Johnson' AND ep.HoursWorked > 150;

-- 2. Увеличить бюджет проектов на 10%, если есть сотрудник из IT
UPDATE Projects
SET Budget = Budget * 1.10
WHERE ProjectID IN (
    SELECT DISTINCT ep.ProjectID
    FROM EmployeeProjects ep
    JOIN Employees e ON ep.EmployeeID = e.EmployeeID
    WHERE e.Department = 'IT'
);

-- 3. Установить EndDate на год позже для проектов без EndDate
UPDATE Projects
SET EndDate = StartDate + INTERVAL '1 year'
WHERE EndDate IS NULL;

-- 4. Транзакция: новый сотрудник + проект + назначение с RETURNING
DO $$
DECLARE
    new_emp_id INT;
    new_proj_id INT;
BEGIN
    -- Начать транзакцию
    INSERT INTO Employees (FirstName, LastName, Department, Salary)
    VALUES ('New', 'Employee', 'IT', 70000.00)
    RETURNING EmployeeID INTO new_emp_id;

    INSERT INTO Projects (ProjectName, Budget, StartDate, EndDate)
    VALUES ('Website Redesign', 150000.00, '2024-01-01', '2024-06-30')
    RETURNING ProjectID INTO new_proj_id;

    INSERT INTO EmployeeProjects (EmployeeID, ProjectID, HoursWorked)
    VALUES (new_emp_id, new_proj_id, 80);
    
    RAISE NOTICE 'Created employee %, project %', new_emp_id, new_proj_id;
END;
$$;

-- Проверка
SELECT * FROM Employees WHERE FirstName = 'New';
SELECT * FROM Projects WHERE ProjectName = 'Website Redesign';
SELECT * FROM EmployeeProjects WHERE EmployeeID = (SELECT EmployeeID FROM Employees WHERE FirstName = 'New');