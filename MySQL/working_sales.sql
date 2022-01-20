select * from product
select qty_on_hand from product
select * from order_detail group by order_code
select category_code from category where category_code not in (select category_code from product)

-- 1,2,3,4,5,6,7,9,10,11
                                                               
1. Which category has maximum products 
select category_code, count(product_code) from product group by category_code
having count(product_code) >= all(
select count(product_code) from product group by category_code)

2. Which category has no products?
select category_code from category where category_code not in (select category_code from product)

3. Which is the costliest product?
select * from product where price =(select max(price) from product)

4. Which category has lot of products (with respect to quantity on hand)?
select category_code,SUM(qty_on_hand) from product
group by category_code 
having SUM(qty_on_hand) >= all(select SUM(qty_on_hand) from product
group by category_code)

7. Which order has maximum products?
select order_code, count(product_code) from order_detail 
group by order_code order by count(product_code) desc limit 1

8. Which is the frequently ordered product?
select product_code,COUNT(order_code)
from order_detail
group by product_code
having count(order_code)>=all
(select count(order_code) from order_detail
group by product_code)

9. Which product is least ordered product?
select product_code,COUNT(order_code)
from order_detail
group by product_code
having count(order_code)<=all
(select count(order_code) from order_detail
group by(product_code))

4. Which is the costliest product?
select product_code, prod_desc, price from product 
where price = ( select max(price) from product )  

5. Which category has costliest product?
select category_code,category_desc 
from category 
where category_code= (select category_code from product 
where price = ( select max(price) from product ) ) 
  

2. Which category has minimum products?
select category_code, count(product_code) from product group by category_code
having count(product_code) <= all(
select count(product_code) from product group by category_code)

7. Category wise display the costliest products? 'wrong output'

select category_code,max(price) from product
group by category_code
 having max(price) in (select max(price) from product group by category_code ) 

12. What product is not at all ordered?
select product_code from product where product_code not in
(select product_code from order_detail)

13. Which is the costliest order? ( Calculate the bill ) 
 
 16.	Which country has maximum branches?
SELECT country_code,COUNT(branch_code)branch_count
FROM branch
GROUP BY country_code
HAVING COUNT(branch_code)>= ALL(SELECT COUNT(branch_code)
FROM branch
GROUP BY country_code)

17.	Which country has minimum branches?
 SELECT country_code,COUNT(branch_code) branch_count
FROM branch
GROUP BY country_code
HAVING COUNT(branch_code)<=ALL (SELECT COUNT(branch_code)
FROM branch
GROUP BY country_code)


18.	Which country has no branches?
SELECT country_code,COUNT(branch_code) branch_count
FROM branch
GROUP BY country_code
HAVING COUNT(branch_code) NOT IN (SELECT COUNT(branch_code)
FROM branch
GROUP BY country_code)

19.	Which branch has more sales representatives?
 SELECT branch_code,COUNT(salesrep_id) salesrep_count
FROM salesrep
GROUP BY branch_code
HAVING COUNT(salesrep_id) >= ALL (SELECT COUNT(salesrep_id)
FROM salesrep
GROUP BY branch_code)


20.Which branch has less sales representatives?

SELECT branch_code,COUNT(salesrep_id) salesrep_count
FROM salesrep
GROUP BY branch_code
HAVING COUNT(salesrep_id) <= ALL (SELECT COUNT(salesrep_id)
FROM salesrep
GROUP BY
branch_code)

21.	Which branch has no sales representatives?

SELECT branch_code,COUNT(salesrep_id) salesrep_count
FROM salesrep
GROUP BY branch_code
HAVING COUNT(salesrep_id) NOT IN (SELECT COUNT(salesrep_id)
FROM salesrep
GROUP BY
branch_code)

22.	Who is the active sales rep? 

SELECT salesrep_id AS active_salesrep,COUNT(order_code) order_count
FROM order_master
GROUP BY salesrep_id
HAVING COUNT(order_code)>= ALL (SELECT COUNT(order_code)
FROM order_master
GROUP BY salesrep_id)

 23.	Display all the manager’s names?
 
SELECT salesrep_name AS manager_name
FROM salesrep
WHERE salesrep_id = ANY (SELECT mgr
FROM salesrep)

24.	Display the sales rep that who has joined before their manager? 

SELECT salesrep_id
FROM salesrep sr
WHERE salesrep_id IN (SELECT mgr
FROM salesrep sr1
WHERE sr.salesrep_doj <sr1.salesrep_doj)

 25.	Who is the active sales rep?
SELECT salesrep_id AS active_salesrep,COUNT(order_code)
FROM order_master
GROUP BY salesrep_id
HAVING COUNT(order_code)>= ALL (SELECT COUNT(order_code)
FROM order_master
GROUP BY salesrep_id)

26.	Display all the manager’s names?
 SELECT salesrep_name AS manager_name
FROM salesrep
WHERE salesrep_id = ANY(SELECT mgr
FROM salesrep)

27.	Display the sales rep that who has joined before their manager?
 SELECT salesrep_id
FROM salesrep sr
WHERE salesrep_id IN (SELECT mgr
FROM salesrep sr1
WHERE sr.salesrep_doj <sr1.salesrep_doj)

28.	Display the sales rep that who earns more than their manager?
 Select sr.saleserp_id
FROM salesrep sr JOIN Sales mgr
ON mgr.salesrep_id =sr.mgr
WHERE sr.salary>mgr.salary

29.	Display the manager who earns more than average salary of the sales rep working under them.
SELECT mgr
FROM salesrep
GROUP BY mgr
HAVING sum(salary)> (SELECT AVG(salary)
FROM salesrep);

30.	Display the sales rep details that who started their work immediately?
 SELECT salesrep_name
FROM salesrep
WHERE salesrep_id IN (SELECT salesrep_id
FROM order_master)

31.	Display the sales rep that who is in bench for a long time?
 SELECT salesrep_name
FROM salesrep
WHERE salesrep_id NOT IN (SELECT salesrep_id
FROM order_master)
 

32.	Display the details of in-active sales representatives.
SELECT salesrep_name
FROM salesrep
WHERE salesrep_id NOT IN (SELECT salesrep_id
FROM order_master)

34.Generate the report like 

SELECT sr.salesrep_name,od.order_code,SUM(od.qty_ordered*pr.price) AS Bill
FROM salesrep sr JOIN order_master om
ON sr.salesrep_id = om.salesrep_id
JOIN order_detail od
ON om.order_code = od.order_code
JOIN product pr
ON od.product_code = pr.product_code
GROUP BY sr.salesrep_name,od.order_code

35. Generate the report like
Sales_rep_name	Order_code	No_of_products(in order)

SELECT sr.salesrep_name,od.order_code, COUNT(od.product_code) AS product_count
FROM salesrep sr JOIN order_master om
ON sr.salesrep_id = om.salesrep_id
JOIN order_detail od
ON om.order_code = od.order_code
JOIN product pr
ON od.product_code = pr.product_code
GROUP BY sr.salesrep_name,od.order_code

36. Generate the report like  
Sales_rep_name	Order_code	Bill_value	No_of_products(in order)And
A. For the orders placed on the year 2010
B. For the sales rep who has placed not more than 10 orders
C. For the sales rep whose salary >45000

SELECT sr.salesrep_name,od.order_code,SUM(od.qty_ordered*pr.price) AS Bill,COUNT(od.product_code) AS product_count
FROM salesrep sr JOIN order_master om
ON sr.salesrep_id = om.salesrep_id
JOIN order_detail od
ON om.order_code = od.order_code
JOIN product pr
ON od.product_code = pr.product_code
GROUP BY sr.salesrep_name,od.order_code	


37. Who is the senior most sales rep?

SELECT salesrep_name
FROM salesrep
WHERE salesrep_doj<= ALL(SELECT salesrep_doj
						FROM salesrep)

39. Find the no of orders processed by each month in the year 2010?

       SELECT EXTRACT(month FROM order_date) AS MONTH,COUNT(order_code) AS NO_OF_ORDERS    
       FROM order_master
       WHERE EXTRACT(YEAR FROM order_date)=2010
       GROUP BY ROLLUP(EXTRACT(month FROM order_date))
       ORDER BY EXTRACT(month FROM order_date)

40. Which region is having in-active sales rep (using joins?)

         SELECT c.region,s.salesrep_id
         FROM country c JOIN branch b
        ON c.country_code=b.country_code
        JOIN salesrep s
        ON b.branch_code=s.branch_code
        LEFT JOIN order_master om
        ON s.salesrep_id=om.salesrep_id
        WHERE om.salesrep_id IS NULL

41. Which region is having junior most sales rep?
        SELECT c.region,MAX(salesrep_id) AS SALESREP
        FROM country c
        JOIN branch b
        ON c.country_code=b.country_code
        JOIN salesrep s
        ON b.branch_code=s.branch_code
        WHERE salesrep_id = (SELECT MAX(salesrep_id) FROM salesrep)
        GROUP BY region
        ORDER BY region

42. Find the no of orders whose bill is less than 500?

      SELECT od.order_code,COUNT(od.qty_ordered),SUM(od.qty_ordered*p.price)as bill	
      FROM order_detail od JOIN product p 	
      ON p.product_code=od.product_code
      GROUP BY od.order_code
      HAVING SUM(od.qty_ordered*price)<500

43. What is the frequently ordered product by the most active customer?

      SELECT * FROM (SELECT product_code,count(product_code),
      DENSE_RANK() OVER (ORDER BY COUNT (product_code) DESC)rank
      FROM order_detail od
      JOIN order_master om
      ON om.order_code=od.order_code
      WHERE customer_code=(SELECT customer_code
		           FROM order_master
		           GROUP BY customer_code
	                   HAVING COUNT(order_code)>=ALL(SELECT 
			   COUNT(order_code)
		           FROM order_master
	                   GROUP BY customer_code))
     GROUP BY product_code
     ORDER BY COUNT(product_coDe) DESC)temp
     WHERE rank<=1

44. What are all the products are not ordered by active customer? 
    
       SELECT p.product_code
       FROM product p LEFT JOIN order_detail od
       ON p.product_code=od.product_code
       WHERE od.product_code IS NULL    

45. Display the orders which can’t be processed immediately?

       SELECT order_code
       FROM order_detail od  JOIN product p
      ON p.product_code=od.product_code
      WHERE p.qty_on_hand<od.qty_ordered


46. Complete order report
Cust_name	Cust_cose	Order_code	Product_id	Product_name	Order_date

SELECT c.customer_code,c.customer_name,om.order_code,p.product_code,p.prod_desc,om.order_date
FROM customer c
JOIN order_master om
ON c.customer_code=om.customer_code
JOIN order_detail od
ON om.order_code=od.order_code
JOIN product p
ON od.product_code=p.product_code

47. What is the order of execution of clauses?
    
    FROM
    WHERE
    GROUP BY
    HAVING
    SELECT
    ORDER BY
 

49. Find the Top-10 active customers based on no. of orders?

      SELECT c.customer_code,c.customer_name,COUNT(order_code) AS NO_OF_ORDERS
      FROM customer c
      JOIN order_master om
      ON c.customer_code=om.customer_code
      GROUP BY c.customer_code
      ORDER BY c.customer_code
      LIMIT 10 
			
51. Display the sales rep that who processed the orders ORD11 and ORD12
      
SELECT salesrep_name 
FROM salesrep
WHERE salesrep_id in (SELECT salesrep_id 
FROM order_master WHERE order_code in ('OR11','OR12'));