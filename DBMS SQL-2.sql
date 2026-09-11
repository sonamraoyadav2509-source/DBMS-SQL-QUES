USE DBMS;
SELECT s.student_name, d.department_name
FROM Student s
INNER JOIN Department d
ON s.department_id = d.department_id;

SELECT s.student_name, d.location
FROM Student s
LEFT JOIN Department d
ON s.department_id = d.department_id;

SELECT c.course_name, d.department_name
FROM Course c
INNER JOIN Department d
ON c.department_id = d.department_id;

SELECT 
    s.student_name,
    c.course_name,
    e.marks
FROM Student s
INNER JOIN Enrollment e
    ON s.student_id = e.student_id
INNER JOIN Course c
    ON e.course_id = c.course_id;
    
    SELECT DISTINCT s.student_name
FROM Student s
INNER JOIN Enrollment e
ON s.student_id = e.student_id;

SELECT s.student_name, d.department_name
FROM Student s
INNER JOIN Department d
ON s.department_id = d.department_id;

SELECT s.student_id, s.student_name, s.age
FROM Student s
INNER JOIN Department d
ON s.department_id = d.department_id
WHERE d.department_name = 'Computer Science';

SELECT 
    s.student_name,
    c.course_name,
    e.marks
FROM Student s
INNER JOIN Enrollment e
ON s.student_id = e.student_id
INNER JOIN Course c
ON e.course_id = c.course_id;

SELECT 
    d.department_name,
    s.student_id,
    s.student_name,
    s.age
FROM Department d
INNER JOIN Student s
ON d.department_id = s.department_id;

SELECT 
    s.student_name,
    d.department_name
FROM Student s
LEFT JOIN Department d
ON s.department_id = d.department_id;

-- Q11
SELECT s.student_name
FROM Student s
LEFT JOIN Enrollment e
ON s.student_id = e.student_id
WHERE e.student_id IS NULL;


-- Q12
SELECT d.department_name, s.student_name
FROM Department d
LEFT JOIN Student s
ON d.department_id = s.department_id;


-- Q13
SELECT c.course_name, s.student_name
FROM Course c
LEFT JOIN Enrollment e
ON c.course_id = e.course_id
LEFT JOIN Student s
ON e.student_id = s.student_id;


-- Q14
SELECT d.department_name, s.student_name
FROM Student s
RIGHT JOIN Department d
ON s.department_id = d.department_id;


-- Q15
SELECT c.course_name, s.student_name
FROM Enrollment e
RIGHT JOIN Course c
ON e.course_id = c.course_id
LEFT JOIN Student s
ON e.student_id = s.student_id;


-- Q16
SELECT 
    s.student_name,
    d.department_name,
    c.course_name,
    e.marks
FROM Student s
INNER JOIN Department d
ON s.department_id = d.department_id
INNER JOIN Enrollment e
ON s.student_id = e.student_id
INNER JOIN Course c
ON e.course_id = c.course_id;


-- Q17
SELECT 
    s.student_name,
    d.location,
    c.course_name
FROM Student s
INNER JOIN Department d
ON s.department_id = d.department_id
INNER JOIN Enrollment e
ON s.student_id = e.student_id
INNER JOIN Course c
ON e.course_id = c.course_id;


-- Q18
SELECT 
    c.course_name,
    AVG(e.marks) AS average_marks
FROM Course c
INNER JOIN Enrollment e
ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name;


-- Q19
SELECT 
    d.department_name,
    COUNT(s.student_id) AS number_of_students
FROM Department d
LEFT JOIN Student s
ON d.department_id = s.department_id
GROUP BY d.department_id, d.department_name;


-- Q20
SELECT 
    d.department_name,
    c.course_name,
    COUNT(e.student_id) AS students_enrolled
FROM Department d
INNER JOIN Course c
ON d.department_id = c.department_id
LEFT JOIN Enrollment e
ON c.course_id = e.course_id
GROUP BY d.department_id, d.department_name,
         c.course_id, c.course_name;


-- Q21
SELECT 
    c.course_name,
    s.student_name,
    e.marks
FROM Enrollment e
INNER JOIN Student s
ON e.student_id = s.student_id
INNER JOIN Course c
ON e.course_id = c.course_id
WHERE e.marks = (
    SELECT MAX(e2.marks)
    FROM Enrollment e2
    WHERE e2.course_id = e.course_id
);


-- Q22
SELECT d.department_name
FROM Department d
LEFT JOIN Student s
ON d.department_id = s.department_id
WHERE s.student_id IS NULL;


-- Q23
SELECT c.course_name
FROM Course c
LEFT JOIN Enrollment e
ON c.course_id = e.course_id
WHERE e.enrollment_id IS NULL;


-- Q24
SELECT 
    d.department_name,
    COUNT(s.student_id) AS total_students
FROM Department d
LEFT JOIN Student s
ON d.department_id = s.department_id
GROUP BY d.department_id, d.department_name;


-- Q25
SELECT 
    s.student_id,
    s.student_name,
    d.department_name AS department,
    c.course_name AS course,
    e.marks,
    CASE
        WHEN e.marks >= 40 THEN 'Pass'
        WHEN e.marks < 40 THEN 'Fail'
    END AS result_status
FROM Student s
INNER JOIN Department d
ON s.department_id = d.department_id
INNER JOIN Enrollment e
ON s.student_id = e.student_id
INNER JOIN Course c
ON e.course_id = c.course_id;


-- Q26
SELECT 
    e.emp_name AS employee,
    m.emp_name AS manager
FROM Employee e
LEFT JOIN Employee m
ON e.manager_id = m.emp_id;


-- Q27
SELECT 
    d.department_name,
    COUNT(s.student_id) AS total_students
FROM Department d
INNER JOIN Student s
ON d.department_id = s.department_id
GROUP BY d.department_id, d.department_name
HAVING COUNT(s.student_id) > 5;


-- Q28
SELECT MAX(e.marks) AS second_highest_marks
FROM Enrollment e
INNER JOIN Student s
ON e.student_id = s.student_id
WHERE e.marks < (
    SELECT MAX(e2.marks)
    FROM Enrollment e2
);


-- Q29
SELECT 
    s.student_name,
    COUNT(e.course_id) AS total_courses
FROM Student s
INNER JOIN Enrollment e
ON s.student_id = e.student_id
GROUP BY s.student_id, s.student_name
HAVING COUNT(e.course_id) > 1;


-- Q30
SELECT 
    d.department_name AS department,
    s.student_name AS student,
    c.course_name AS course,
    e.marks
FROM Department d
INNER JOIN Student s
ON d.department_id = s.department_id
INNER JOIN Enrollment e
ON s.student_id = e.student_id
INNER JOIN Course c
ON e.course_id = c.course_id;