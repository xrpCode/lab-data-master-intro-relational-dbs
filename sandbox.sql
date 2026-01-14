-- =====================================================
-- DESAFÍO 3: IMPLEMENTACIÓN FÍSICA - SNOWFLAKE
-- Usuario: xrpCode - Lab Módulo 1
-- =====================================================

-- 1. Crear DATABASE y SCHEMA (nomenclatura SEAT)
CREATE DATABASE IF NOT EXISTS seat_lab_xrpcodes;
USE DATABASE seat_lab_xrpcodes;
CREATE SCHEMA IF NOT EXISTS modulo_01_intro_bd;

-- 2. Tabla DEPARTMENT (maestro)
CREATE OR REPLACE TABLE modulo_01_intro_bd.department (
    id_department NUMBER(5) PRIMARY KEY,
    nam_department VARCHAR(50) NOT NULL UNIQUE
);

-- 3. Tabla PROJECT (maestro)
CREATE OR REPLACE TABLE modulo_01_intro_bd.project (
    id_project NUMBER(5) PRIMARY KEY,
    nam_project VARCHAR(100) NOT NULL UNIQUE
);

-- 4. Tabla EMPLOYEE
CREATE OR REPLACE TABLE modulo_01_intro_bd.employee (
    id_employee NUMBER(5) PRIMARY KEY,
    nam_employee VARCHAR(100) NOT NULL,
    id_department NUMBER(5) NOT NULL REFERENCES modulo_01_intro_bd.department(id_department)
);

-- 5. Tabla EMPLOYEE_PROJECT (N:M)
CREATE OR REPLACE TABLE modulo_01_intro_bd.employee_project (
    id_employee NUMBER(5),
    id_project NUMBER(5),
    PRIMARY KEY (id_employee, id_project),
    FOREIGN KEY (id_employee) REFERENCES modulo_01_intro_bd.employee(id_employee),
    FOREIGN KEY (id_project) REFERENCES modulo_01_intro_bd.project(id_project)
);

-- 6. Datos de prueba (de tu hoja de cálculo)
INSERT INTO modulo_01_intro_bd.department VALUES (1, 'Finanzas'), (2, 'IT');
INSERT INTO modulo_01_intro_bd.project VALUES (101, 'Migración SAP'), (102, 'Portal Cliente');
INSERT INTO modulo_01_intro_bd.employee VALUES (1001, 'Alicia Gómez', 1), (1002, 'Juan Martínez', 2);
INSERT INTO modulo_01_intro_bd.employee_project VALUES 
(1001, 101), (1002, 102), (1001, 102);

-- 7. Verificación
SELECT * FROM modulo_01_intro_bd.employee;
SELECT * FROM modulo_01_intro_bd.employee_project;
