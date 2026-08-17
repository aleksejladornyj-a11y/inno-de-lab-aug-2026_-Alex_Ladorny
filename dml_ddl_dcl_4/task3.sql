-- Задание 3: DCL

-- 1. Создать роль (пользователя) hr_user с паролем (если не существует)
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'hr_user') THEN
        CREATE ROLE hr_user WITH LOGIN PASSWORD 'hr_password';
    END IF;
END
$$;

-- 2. Дать права SELECT на таблицу Employees
GRANT SELECT ON Employees TO hr_user;

-- 3. Проверить права (выполнить как текущий пользователь)
-- Это просто информационный запрос, чтобы увидеть, что права назначены
SELECT grantee, privilege_type 
FROM information_schema.role_table_grants 
WHERE table_name='employees' AND grantee='hr_user';