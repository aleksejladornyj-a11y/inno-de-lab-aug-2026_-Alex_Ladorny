-- Создание таблиц измерений и факта для DWH ветеринарной клиники

-- Измерение: Дата
CREATE TABLE DimDate (
    date_id INT PRIMARY KEY,
    date DATE,
    year INT,
    month INT,
    day INT,
    weekday VARCHAR(10),
    is_weekend BOOLEAN
);

-- Измерение: Питомец
CREATE TABLE DimPet (
    pet_id INT PRIMARY KEY,
    name VARCHAR(50),
    species VARCHAR(50),
    breed VARCHAR(50),
    birth_date DATE,
    owner_id INT
);

-- Измерение: Владелец
CREATE TABLE DimOwner (
    owner_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    phone VARCHAR(20),
    email VARCHAR(100)
);

-- Измерение: Ветеринар
CREATE TABLE DimVet (
    vet_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    specialization VARCHAR(100)
);

-- Измерение: Процедура
CREATE TABLE DimTreatment (
    treatment_id INT PRIMARY KEY,
    name VARCHAR(100),
    cost DECIMAL(10,2)
);

-- Таблица фактов: Приёмы
CREATE TABLE FactAppointments (
    appointment_id SERIAL PRIMARY KEY,
    date_id INT,
    pet_id INT,
    vet_id INT,
    treatment_id INT,
    total_cost DECIMAL(10,2),
    duration_minutes INT,
    number_of_procedures INT,
    FOREIGN KEY (date_id) REFERENCES DimDate(date_id),
    FOREIGN KEY (pet_id) REFERENCES DimPet(pet_id),
    FOREIGN KEY (vet_id) REFERENCES DimVet(vet_id),
    FOREIGN KEY (treatment_id) REFERENCES DimTreatment(treatment_id)
);

-- Тестовые данные
INSERT INTO DimDate VALUES
(1, '2026-01-15', 2026, 1, 15, 'Monday', FALSE),
(2, '2026-02-20', 2026, 2, 20, 'Friday', FALSE),
(3, '2026-03-10', 2026, 3, 10, 'Tuesday', FALSE),
(4, '2026-04-05', 2026, 4, 5, 'Sunday', TRUE);

INSERT INTO DimPet VALUES
(1, 'Rex', 'Dog', 'Labrador', '2020-05-10', 1),
(2, 'Mia', 'Cat', 'Siamese', '2021-08-15', 2),
(3, 'Bella', 'Dog', 'Poodle', '2019-11-20', 1),
(4, 'Luna', 'Cat', 'Persian', '2022-02-01', 3);

INSERT INTO DimOwner VALUES
(1, 'Alice', 'Smith', '+123456789', 'alice@mail.com'),
(2, 'Bob', 'Johnson', '+987654321', 'bob@mail.com'),
(3, 'Charlie', 'Brown', '+112233445', 'charlie@mail.com');

INSERT INTO DimVet VALUES
(1, 'John', 'Doe', 'Surgeon'),
(2, 'Jane', 'Smith', 'Therapist'),
(3, 'Mike', 'Brown', 'Dentist');

INSERT INTO DimTreatment VALUES
(1, 'Vaccination', 50.00),
(2, 'Surgery', 300.00),
(3, 'X-ray', 150.00),
(4, 'Dental cleaning', 120.00);

INSERT INTO FactAppointments (date_id, pet_id, vet_id, treatment_id, total_cost, duration_minutes, number_of_procedures) VALUES
(1, 1, 1, 2, 350.00, 45, 2),
(2, 2, 2, 1, 50.00, 15, 1),
(3, 3, 1, 3, 150.00, 30, 1),
(4, 4, 3, 4, 120.00, 25, 1),
(1, 2, 2, 1, 50.00, 10, 1),
(2, 1, 1, 2, 350.00, 40, 2);