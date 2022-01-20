use sales
select product_code, prod_desc, category.category_code from product 
right join category on category.category_code = product.category_code

select prod_desc from product(select order_code, product_code from order_detail) 

select count(order_code), product_code from order_detail 

update employees set salary = 0 where salary is null

                             
select prod_desc,product.product_code,order_detail.order_code from product 
join order_detail on product.product_code = order_detail.product_code 
join (select order_code, product_code from 
order_detail) h on h.product_code = order_detail.product_code

aggregate functions will return one value only



26/10/2021
Group functions
Having clause
Single row functions (string, number, date)

27/10/2021
USE TIMESHEET
SHOW TABLES
DROP TABLE SKILL
select * from allocation; 

SELECT  project_id, sum(datediff(to_date,from_date)*amount_per_day )
FROM allocation 
GROUP  BY project_id
HAVING sum(datediff(to_date,from_date)*amount_per_day )>=ALL(SELECT  sum(datediff(to_date,from_date)*amount_per_day )
FROM allocation 
GROUP  BY project_id)

SELECT dept_id from department
WHERE dept_id  IN('D01','D02')

SELECT salary,emp_id
FROM employee
WHERE salary >=any(SELECT salary
FROM employee)

SELECT DEPT_ID FROM DEPARTMENT
WHERE DEPT_ID  IN(SELECT DEPT_ID FROM EMPLOYEE);

select * from employee;
select * from department;
select * from allocation;
select * from employeeskill;
select * from mobilerecharge;
select * from role;
select * from skill;
select * from t_project;


SELECT * from allocation
SELECT DATEdiff('2022-01-20','2021-01-02')
SELECT DAYOFYEAR('2022-12-31')
SELEct lower('maheshraja')
SELECT SQRT(9)
update employee set mgr_id =null where emp_id='E01'

use angular
select * from books
insert into books values('4', 'angular','Naren')
insert into books values('7', 'SQL','Harikrishna')



use timesheet
select * from employee
SELECT emp_id,mgr_id,case when  mgr_id is null then 'no manager' else 'has manager' end  as comments
FROM employee

SELECT emp_id,SALARY
FROM EMPLOYEE
where salary =( select MAX(SALARY)
					from employee)













use timesheet                    
1. Which EMPLOYEE has not yet been allocated to any PROJECT?
select emp_id,emp_name from employee where emp_id not in (select emp_id from allocation) order by emp_id 

2. Which role played by the employee 'E03' frequently?
select * from role where role_id = (select role_id from allocation where emp_id = 'E03')
     
3. How many employees were there in costliest Project?
select emp_id from allocation where project_id = 
(select distinct project_id from allocation where amount_per_day =
(select max(amount_per_day)  from allocation))     

[11:41, 29/10/2021] Rathinaraj Madurai Htc: 1.which category has maxium products
SELECT category_code,COUNT(product_code)
FROM product
GROUP BY category_code
HAVING COUNT(product_code)>=ALL(SELECT COUNT(product_code)
FROM product
GROUP BY category_code)

2.which category has minimum products
SELECT category_code,COUNT(product_code)
FROM product 
GROUP BY category_code
HAVING COUNT(product_code)<=all(SELECT COUNT(product_code)
FROM product
GROUP BY category_code)

show tables
select* from product
3.which category has no products

SELECT category_code,product_code
from product
where category_code not in (select category_code
from product)
4.which is the costliest product

SELECT price,prod_desc
FROM  product
WHERE price=(select max(price) from product)

5.Which category has costliest product?

SELECT cat…
[11:51, 29/10/2021] Rathinaraj Madurai Htc: 3.Which role played by the employee 'E03' frequently?

SELECT role_id,emp_id
FROM allocation
WHERE emp_id='E03'

4.Which is the costliest Project?

SELECT project_id
FROM allocation
GROUP BY project_id
HAVING SUM(amount_per_day)>=ALL(SELECT SUM(amount_per_day)
               	               FROM allocation
                               GROUP BY project_id)

SELECT project_id,SUM(datediff(to_date,from_date) * amount_per_day, SUM(amount_per_day))
FROM allocation
GROUP BY project_id 
SELECT project_id,SUM(datediff(to_date,from_date) * amount_per_day), SUM(amount_per_day)
FROM allocation
GROUP BY project_id

	SELECT project_id,SUM(datediff(to_date,from_date) * amount_per_day), SUM(amount_per_day)
FROM allocation
GROUP BY project_id
HAVING  SUM(datediff(to_date,from_date) * amount_per_day)>=ALL(SELECT SUM(datediff(to_date,from_date) * amount_per_day)
FROM allocation
GROUP BY project_id)               

5.How many employees were there in costliest Project?

SELECT SUM(amount_per_day),project_id,COUNT(emp_id) as employees
FROM allocation
GROUP BY project_id
HAVING SUM(amount_per_day)>=ALL(SELECT SUM(amount_per_day)
                                FROM allocation
                                GROUP BY project_id)





7.What is the salary of employee, who played maximum roles in Project 'P07'?

SELECT emp_id,emp_name,salary
FROM employee
where emp_id in (select emp_id from allocation
                 where role_id=
                      (select role_id 
                        from allocation 
                        where project_id='P02'
                        group by role_id
                        order by count(role_id) desc
                        limit 1))
                        limit 1


8.How many projects are handled by senior most employee?

SELECT COUNT(project_id)
FROM allocation
WHERE emp_id in (SELECT emp_id
		FROM employee
	        WHERE hire_date = (SELECT MIN(hire_date)
			           FROM employee))
				
9.What is the total amount spent for unassigned employees?

SELECT SUM(salary) 
FROM employee
WHERE emp_id NOT IN (SELECT emp_id FROM allocation)

10.How many projects are completed till date (Assume to_date is completion date in Allocation table)

SELECT COUNT(to_date)
FROM allocation
WHERE to_date < '2021-08-05'

11.How many employees have worked for less than 10 Projects?

SELECT EMP_id,COUNT(PROJECT_id)
FROM allocation
GROUP BY EMP_id
HAVING COUNT(emp_id) < 10
order by project_id

SELECT COUNT(project_id)
FROM allocation
GROUP BY emp_id

SELECT COUNT(emp_id)
FROM allocation
GROUP BY emp_id
HAVING COUNT(project_id)<10


SELECT COUNT(emp_id)
FROM (SELECT emp_id
FROM allocation
GROUP BY emp_id 
HAVING COUNT(project_id)<10) emp_temp

SELECT emp_id
FROM allocation
GROUP BY emp_id 
HAVING COUNT(project_id)<10
          

     A001	P001
A001	P001
A002	P001
A001	P001
A005	P001
A002	P001               





use library
SELECT * FROM author ---- Author_id author_name
SELECT * FROM member ---- member_id member_name member_dept member_doj status
SELECT * FROM publisher ---- publisher_id publisher_name
SELECT * FROM book ---- book_id title category copyno author_id publisher_id edition year_of_publishing price rackno
SELECT * FROM BOOK_TRANSACTION book_id member_id issue_date due_date return_date

Sales

SELECT category_code,COUNT(product_code)
FROM product
GROUP BY category_code
HAVING COUNT(product_code)>=ALL(SELECT COUNT(product_code)
FROM product
GROUP BY category_code)

2.which category has minimum products
SELECT category_code,COUNT(product_code)
FROM product
GROUP BY category_code
HAVING COUNT(product_code)<=all(SELECT COUNT(product_code)
FROM product
GROUP BY category_code)

show tables
select* from product
3.which category has no products

SELECT category_code,product_code
from product
where category_code not in (select category_code
from product)
4.which is the costliest product

SELECT price,prod_desc
FROM  product
WHERE price=(select max(price) from product)

5.Which category has costliest product?

SELECT category_code,category_desc FROM category 
WHERE category_code=(SELECT category_code
FROM product
WHERE price =(SELECT MAX(price) 
FROM product))

6.which category has lot of products

SELECT category_code,SUM(qty_on_hand)
FROM product
GROUP BY category_code
HAVING SUM(qty_on_hand)>=all(SELECT SUM(qty_on_hand)
FROM product
GROUP BY category_code)
7.Category wise display the costliest products

SELECT category_code,prod_desc,price
FROM (SELECT category_code,prod_desc,price,dense_rank() OVER (partition by category_code order by price desc)
AS rk 
FROM product) tmp
WHERE rk=1
8.Category wise display the product whose quantity on hand is minimum?

SELECT pro.category_code,pro.product_code,pro.prod_DESC,pro.qty_on_hand
FROM product pro
WHERE pro.qty_on_hand = (SELECT MIN(ctmin.qty_on_hand)
FROM product ctmin
WHERE ctmin.category_code=pro.category_code
GROUP BY ctmin.category_code)
9.Which order has maximum products?

SELECT order_code,COUNT(product_code)
FROM order_detail
GROUP BY order_code
HAVING COUNT(product_code)>=ALL
(SELECT COUNT(product_code)
FROM order_detail
GROUP BY (order_code))
10.Which is the frequently ordered product?

SELECT product_code,COUNT(order_code)
FROM order_detail
GROUP BY product_code
HAVING COUNT(order_code)>=ALL(SELECT COUNT(order_code)
FROM order_detail
GROUP BY (product_code))

11.which product is least ordered product

SELECT product_code,COUNT(order_code)
from order_detail
GROUP BY  product_code
HAVING COUNT(order_code)<=all
(select count(order_code)from order_detail
group by (product_code))

12.which customer made the costliest order
SELECT product_code,count(order_code)
FROM ORDER_DETAIL
group by product_code
having count(order_code)<=all
(SELECT count (order_code) from order_detail
group by (product_code))

13.What product is not at all ordered?

SELECT product_code,COUNT(order_code)
FROM order_detail
GROUP BY order_code,product_code
HAVING COUNT(product_code) NOT IN(SELECT COUNT(order_code)
FROM order_detail
GROUP BY (product_code))

19.Which country has maximum branches?
SELECT country_code,COUNT(branch_code)
FROM branch
GROUP BY country_code
HAVING COUNT(branch_code)>= ALL(SELECT COUNT(branch_code)
FROM branch
GROUP BY country_code)
							
20.Which country has minimum branches?
SELECT country_code,COUNT(branch_code)
FROM branch
GROUP BY country_code
HAVING COUNT(branch_code)<=ALL  (SELECT COUNT(branch_code)
FROM branch
GROUP BY country_code)
                         
21.Which country has no branches?
SELECT country_code,COUNT(branch_code)
FROM branch
GROUP BY country_code
HAVING COUNT(branch_code) NOT IN  (SELECT COUNT(branch_code)
FROM branch
GROUP BY country_code)
							
22.Which branch has more sales representatives?
SELECT branch_code,COUNT(salesrep_id)
FROM salesrep
GROUP BY branch_code
HAVING COUNT(salesrep_id) >= ALL (SELECT COUNT(salesrep_id)
FROM salesrep
GROUP BY branch_code)                                          
								 
23.Which branch has less sales representatives
SELECT branch_code,COUNT(salesrep_id)
FROM salesrep
GROUP BY branch_code
HAVING COUNT(salesrep_id) <= ALL (SELECT COUNT(salesrep_id)
FROM salesrep
GROUP BY branch_code)

24.Which branch has no sales representatives?

SELECT branch_code,COUNT(salesrep_id)
FROM salesrep
GROUP BY branch_code
HAVING COUNT(salesrep_id) NOT IN (SELECT COUNT(salesrep_id)
FROM salesrep
GROUP BY branch_code)
use sales

SELECT branch_code
FROM branch 
WHERE branch_code NOT IN 
(SELECT branch_code
FROM salesrep)

SELECT branch_code
FROM branch  brn
WHERE  NOT EXISTS 
(SELECT branch_code
FROM salesrep
WHERE branch_code=brn.branch_code)

SELECT brn.branch_code
FROM branch  brn
LEFT JOIN salesrep
ON brn.branch_code =salesrep.branch_code
WHERE salesrep.branch_code IS NULL


SELECT branch_code
FROM branch 
EXCEPT
(SELECT branch_code
FROM salesrep)










25.Who is the active sales rep?

SELECT salesrep_id AS active_salesrep,COUNT(order_code)
FROM order_master
GROUP BY salesrep_id
HAVING COUNT(order_code)>= ALL (SELECT COUNT(order_code)
FROM order_master
GROUP BY salesrep_id)

26.Display all the manager’s names?
SELECT salesrep_name AS manager_name
FROM salesrep
WHERE salesrep_id = ANY(SELECT mgr
FROM salesrep)

27.Display the sales rep that who has joined before their manager?
SELECT salesrep_id
FROM salesrep sr
WHERE salesrep_doj<(SELECT salesrep_doj
FROM salesrep mgr
WHERE sr.mgr= mgr.salesrep_id )



28.Display the sales rep that who earns more than their manager?
SELECT sr.salesrep_id
FROM salesrep sr JOIN salesrep mgr
ON mgr.salesrep_id= sr.mgr
WHERE sr.salary>mgr.salary


29. Display the manager who earns more than average salary of the sales rep working under them.
SELECT mgr
FROM salesrep
GROUP BY mgr
HAVING sum(salary)> (SELECT AVG(salary)
FROM salesrep)

SELECT salesrep_id
FROM salesrep mgr
WHERE salary<(SELECT AVG(salary)
FROM salesrep sr
WHERE sr.mgr= mgr.salesrep_id )

30.Display the sales rep details that who started their work immediately?
SELECT salesrep_name
FROM salesrep 
WHERE salesrep_id  IN (SELECT salesrep_id
FROM order_master)

31.Display the sales rep that who is in bench for a long time?
SELECT salesrep_name
FROM salesrep 
WHERE salesrep_id  IN (SELECT salesrep_id
FROM order_master)

32.Display the details of in-active sales representatives.
SELECT salesrep_name
FROM salesrep 
WHERE salesrep_id NOT IN (SELECT salesrep_id
FROM order_master)


Timesheet

1.Which PROJECT has maximum number of EMPLOYEES?

SELECT project_id,COUNT(emp_id)
FROM allocation
GROUP BY project_id
HAVING COUNT(emp_id)>= ALL(SELECT COUNT(emp_id)
FROM allocation
GROUP BY project_id)



3.Which role played by the employee 'E03' frequently?

SELECT role_id,emp_id
FROM allocation
WHERE emp_id='E03'

4.Which is the costliest Project?

SELECT project_id
FROM allocation
GROUP BY project_id
HAVING SUM(amount_per_day)>=ALL(SELECT SUM(amount_per_day)
FROM allocation
GROUP BY project_id)
5.How many employees were there in costliest Project?
SELECT SUM(amount_per_day),project_id,COUNT(emp_id) as employees
FROM allocation
GROUP BY project_id
HAVING SUM(amount_per_day)>=ALL(SELECT SUM(amount_per_day)
FROM allocation
GROUP BY project_id)

7.What is the salary of employee, who played maximum roles in Project 'P07'?
SELECT emp_id,emp_name,salary
FROM employee
WHERE emp_id in (SELECT emp_id FROM allocation
WHERE role_id=
(SELECT role_id 
FROM allocation 
WHERE project_id='P02'
GROUP BY role_id
ORDER BYcount(role_id) desc
limit 1))
limit 1
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

13.Which client has given maximum number of Projects?
SELECT client_name FROM t_project 
GROUP BY client_name 
ORDER BY COUNT(client_name) DESC 
LIMIT 1

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
 
 26.Prepare a report in this format 
    Role Name Number of Project


 CREATE VIEW Project1 AS(SELECT ro.role_title AS Role_Name , COUNT(al.project_id) AS Number_Of_Projects
 FROM role ro JOIN allocation al
 ON ro.role_id = al.role_id
 GROUP BY ro.role_title)
 
