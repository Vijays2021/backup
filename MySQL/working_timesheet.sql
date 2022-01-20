1.Which PROJECT has maximum number of EMPLOYEES?
select emp_id,emp_name
 from employee
 where emp_id 
 not in (select emp_id 
		from allocation)
        order by emp_id 

2.Which EMPLOYEE has not yet been allocated to any PROJECT?
SELECT emp_id
FROM employee
WHERE emp_id NOT IN(SELECT emp_id
FROM allocation)

3.Which role played by the employee 'E03' frequently?
select * from role where role_id = (select role_id from allocation where emp_id = 'E03')


 4.Which is the costliest Project?
SELECT project_id
FROM allocation
GROUP BY project_id
HAVING SUM(amount_per_day)>=ALL(SELECT SUM(amount_per_day)
FROM allocation
GROUP BY project_id)

5.How many employees were there in costliest Project?
select emp_id
 from allocation
 where project_id = (select distinct project_id 
					from allocation 
					where amount_per_day =(select max(amount_per_day)  
											from allocation))     

8.How many projects are handled by senior most employee?

SELECT COUNT(project_id)
FROM allocation
WHERE emp_id = (SELECT emp_id
FROM employee
WHERE hire_date = (SELECT MIN(hire_date)
FROM employee))

9.What is the total amount spent for unassigned employees
SELECT SUM(salary) 
FROM employee
WHERE emp_id NOT IN (SELECT emp_id FROM allocation)

10.How many projects are completed till date (Assume to_date is completion date in Allocation table)
SELECT COUNT(to_date)
FROM allocation
WHERE to_date < current_date

11.How many employees have worked for less than 10 Projects?
SELECT emp_id,COUNT(project_id)
FROM allocation
GROUP BY emp_id
HAVING COUNT(project_id)<10

12.How many employees are working with role 'R02' in project 'P04'
SELECT COUNT(emp_id)
FROM allocation
WHERE emp_id IN(SELECT emp_id
FROM allocation
WHERE role_id='R02' AND project_id='P04')

14.Which employee has not been allocated to any project in the year 2010
SELECT emp_id
FROM employee
WHERE emp_id NOT IN(SELECT emp_id
FROM allocation
WHERE EXTRACT(YEAR FROM from_date)=2010)

15.Find the total number of days worked by the employee 'E04' in project 'P02'
SELECT emp_id,project_id,to_date-from_date AS  noOfDays
FROM allocation
WHERE emp_id='E04' AND project_id='P02'

18.Which Project has been completed so earlier?
SELECT project_id,sum(to_date-from_date) 
FROM allocation 
GROUP BY project_id
HAVING sum(to_date-from_date)<=ALL(SELECT sum(to_date-from_date) 
FROM allocation GROUP BY project_id)
 
 19.Which Project has taken maximum duration?
SELECT project_id,sum(to_date-from_date) 
FROM allocation 
GROUP BY project_id
HAVING sum(to_date-from_date)>=ALL(SELECT sum(to_date-from_date) 
FROM allocation GROUP BY project_id)

20.Prepare a report in following format 
	Emp Id    Total Number of Days in bench
        
SELECT 	emp.emp_id , CURRENT_DATE-hire_date - SUM(to_date-from_date) as bench_days
FROM employee emp
JOIN allocation  alloc
ON emp.emp_id=alloc.emp_id
GROUP BY emp.emp_id 

22.Prepare a report in following format 
   Role Name Number of Employee

 SELECT ro.role_title AS Role_Name  , COUNT(al.emp_id) AS Number_Of_Employees
 FROM role ro JOIN allocation al
 ON ro.role_id = al.role_id
 JOIN employee em
 ON al.emp_id = em.emp_id
 GROUP BY ro.role_title)
 
 23.Prepare a report in following format 
    Emp Name Number of Projects

 SELECT em.emp_name, COUNT(al.project_id) AS Number_Of_Projects
 FROM employee em  JOIN allocation al
 ON al.emp_id = em.emp_id
 GROUP BY em.emp_name
 
 24.Prepare a report in following format 
    Emp Name Number of Roles

 SELECT em.emp_name, COUNT(al.role_id) AS Number_Of_Roles
 FROM employee em  JOIN allocation al
 ON al.emp_id = em.emp_id
 GROUP BY em.emp_name
 
 25.Prepare a report in this format 
Role Name Number of Employees

 SELECT ro.role_title AS Role_Name  , COUNT(al.emp_id) AS Number_Of_Employees
 FROM role ro JOIN allocation al
 ON ro.role_id = al.role_id
 JOIN employee em
 ON al.emp_id = em.emp_id
 GROUP BY ro.role_title

 27.Prepare a report in this format 
    Emp Name Role Name Number of Projects

SELECT em.emp_name,ro.role_title AS Role_Name,COUNT(al.project_id) AS Project_count
FROM role ro JOIN allocation al
ON ro.role_id = al.role_id
JOIN employee em
ON al.emp_id = em.emp_id
GROUP BY ro.role_title,em.emp_name
