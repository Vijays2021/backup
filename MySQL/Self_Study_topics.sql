CREATE DATABASE unidb;
USE unidb;

CREATE TABLE students (
id INT PRIMARY KEY,
name varchar(50) NOT NULL,
department VARCHAR(15) NOT NULL);

CREATE TABLE courses (
course_id VARCHAR(20) PRIMARY KEY,
name varchar(50) NOT NULL,
credit SMALLINT NOT NULL);

CREATE TABLE result(
std_id INT NOT NULL,
course_id VARCHAR(20) NOT NULL,
mark_type VARCHAR(20) NOT NULL,
marks SMALLINT NOT NULL,
FOREIGN KEY (std_id) REFERENCES students(id),
FOREIGN KEY (course_id) REFERENCES courses(course_id),
PRIMARY KEY (std_id, course_id, mark_type));

INSERT INTO students VALUES
( '1937463', 'Harper Lee', 'CSE'),
( '1937464', 'Garcia Marquez', 'CSE'),
( '1937465', 'Forster, E.M.', 'CSE'),
( '1937466', 'Ralph Ellison', 'CSE');

INSERT INTO courses VALUES
( 'CSE-401', 'Object Oriented programming', 3),
( 'CSE-403', 'Data Structure', 2),
( 'CSE-407', 'Unix programming', 2);

INSERT INTO result VALUES
( '1937463', 'CSE-401','Internal Exam' ,15),
( '1937463', 'CSE-401','Mid Term Exam' ,20),
( '1937463', 'CSE-401','Final Exam', 35),
( '1937464', 'CSE-403','Internal Exam' ,17),
( '1937464', 'CSE-403','Mid Term Exam' ,15),
( '1937464', 'CSE-403','Final Exam', 30),
( '1937465', 'CSE-401','Internal Exam' ,18),
( '1937465', 'CSE-401','Mid Term Exam' ,23),
( '1937465', 'CSE-401','Final Exam', 38),
( '1937466', 'CSE-407','Internal Exam' ,20),
( '1937466', 'CSE-407','Mid Term Exam' ,22),
( '1937466', 'CSE-407','Final Exam', 40);

select * from students;
select * from courses;
select * from result;

SELECT result.std_id, result.course_id,
MAX(CASE WHEN result.mark_type = "Internal Exam" THEN result.marks END) "Internal Exam",
MAX(CASE WHEN result.mark_type = "Mid Term Exam" THEN result.marks END) "Mid Term Exam",
MAX(CASE WHEN result.mark_type = "Final Exam" THEN result.marks END) "Final Exam",
SUM( result.marks) as Total
FROM result
GROUP BY result.std_id, result.course_id
ORDER BY result.std_id, result.course_id ;

select salesrep_id, 
count(case when month(order_date) = 1 then (order_code) end)"Jan",
count(case when month(order_date) = 2 then (order_code) end)"Feb",
count(case when month(order_date) = 3 then (order_code) end)"Mar",
count(case when month(order_date) = 4 then (order_code) end)"Apr",
count(case when month(order_date) = 5 then (order_code) end)"May",
count(case when month(order_date) = 6 then (order_code) end)"Jun",
count(case when month(order_date) = 7 then (order_code) end)"Jul",
count(case when month(order_date) = 8 then (order_code) end)"Aug",
count(case when month(order_date) = 9 then (order_code) end)"Sep",
count(case when month(order_date) = 10 then (order_code) end)"Oct",
count(case when month(order_date) = 11 then (order_code) end)"Nov",
count(case when month(order_date) = 12 then (order_code) end)"Dec"
from order_master
group by salesrep_id
 EXTRACT(MONTH FROM ORDER_DATE) = EXTRACT(MONTH FROM DATE)
SELECT students.name as `Student Name` , courses.name as `Course Name`,
MAX(CASE WHEN result.mark_type = "Internal Exam" THEN result.marks END) "CT",
MAX(CASE WHEN result.mark_type = "Mid Term Exam" THEN result.marks END) "Mid",
MAX(CASE WHEN result.mark_type = "Final Exam" THEN result.marks END) "Final",
SUM( result.marks) as Total
FROM students, courses, result
WHERE result.std_id = students.id and result.course_id= courses.course_id
GROUP BY result.std_id, result.course_id
ORDER BY result.std_id, result.course_id;

