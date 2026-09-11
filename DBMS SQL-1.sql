
-- =========================
-- 1. DEPARTMENT TABLE
-- =========================

CREATE TABLE Department (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50),
    location VARCHAR(50)
);


-- =========================
-- 2. STUDENT TABLE
-- =========================

CREATE TABLE Student (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    department_id INT,
    age INT
);


-- =========================
-- 3. COURSE TABLE
-- =========================

CREATE TABLE Course (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50),
    department_id INT
);


-- =========================
-- 4. ENROLLMENT TABLE
-- =========================

CREATE TABLE Enrollment (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    marks INT
);


-- =========================
-- 5. EMPLOYEE TABLE
-- =========================

CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    manager_id INT
);


-- =========================
-- DEPARTMENT DATA
-- =========================

INSERT INTO Department (department_id, department_name, location)
VALUES
(1, 'Computer Science', 'Delhi'),
(2, 'Electronics', 'Gurgaon'),
(3, 'Mechanical', 'Rohtak'),
(4, 'Civil', 'Sonipat');


-- =========================
-- STUDENT DATA
-- =========================

INSERT INTO Student (student_id, student_name, department_id, age)
VALUES
(101, 'Rahul', 1, 20),
(102, 'Priya', 1, 19),
(103, 'Aman', 2, 21),
(104, 'Neha', 3, 20),
(105, 'Riya', NULL, 19),
(106, 'Karan', 1, 20),
(107, 'Simran', 1, 21),
(108, 'Arjun', 1, 19),
(109, 'Pooja', 1, 20);


-- =========================
-- COURSE DATA
-- =========================

INSERT INTO Course (course_id, course_name, department_id)
VALUES
(201, 'DBMS', 1),
(202, 'Machine Learning', 1),
(203, 'Digital Electronics', 2),
(204, 'Thermodynamics', 3),
(205, 'Engineering Drawing', 4);


-- =========================
-- ENROLLMENT DATA
-- =========================

INSERT INTO Enrollment (enrollment_id, student_id, course_id, marks)
VALUES
(1, 101, 201, 85),
(2, 101, 202, 72),
(3, 102, 201, 90),
(4, 103, 203, 65),
(5, 104, 204, 35);


-- =========================
-- EMPLOYEE DATA
-- =========================

INSERT INTO Employee (emp_id, emp_name, manager_id)
VALUES
(1, 'Amit', NULL),
(2, 'Rahul', 1),
(3, 'Priya', 1),
(4, 'Neha', 2),
(5, 'Karan', 2);


-- =========================
-- Q1. STUDENT NAME + DEPARTMENT NAME
-- =========================

SELECT s.student_name, d.department_name
FROM Student s
INNER JOIN Department d
ON s.department_id = d.department_id;