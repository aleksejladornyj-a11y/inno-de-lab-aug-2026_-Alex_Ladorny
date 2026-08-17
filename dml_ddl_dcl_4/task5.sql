-- Задание 5: Функции и представления

-- 1. Функция CalculateAnnualBonus (10% от зарплаты)
CREATE OR REPLACE FUNCTION CalculateAnnualBonus(emp_id INT)
RETURNS NUMERIC
LANGUAGE plpgsql
AS $$
DECLARE
    emp_salary NUMERIC;
BEGIN
    SELECT Salary INTO emp_salary 
    FROM Employees 
    WHERE EmployeeID = emp_id;
    
    RETURN emp_salary * 0.10;
END;
$$;

-- 2. Посчитать бонус для каждого сотрудника
SELECT EmployeeID, FirstName, LastName, Salary, 
       CalculateAnnualBonus(EmployeeID) AS AnnualBonus
FROM Employees;

-- 3. Создать представление IT_Department_View
CREATE OR REPLACE VIEW IT_Department_View AS
SELECT EmployeeID, FirstName, LastName, Salary
FROM Employees
WHERE Department = 'IT' OR Department = 'Senior IT';

-- 4. Выбрать данные из представления
SELECT * FROM IT_Department_View;