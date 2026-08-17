-- Задание 3: DCL

-- 1. Создать роль hr_user
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'hr_user') THEN
        CREATE ROLE hr_user WITH LOGIN PASSWORD 'hr_password';
    END IF;
END
$$;

-- 2. Дать права SELECT
GRANT SELECT ON Employees TO hr_user;

-- 3. Дать права INSERT и UPDATE
GRANT INSERT, UPDATE ON Employees TO hr_user;

-- 4. Дать права на все последовательности
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO hr_user;

-- 5. Проверить права
SELECT grantee, privilege_type 
FROM information_schema.role_table_grants 
WHERE table_name='employees' AND grantee='hr_user';