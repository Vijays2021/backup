DELIMITER //
CREATE FUNCTION generate_bill2(ordercode char(4)) 
RETURNS integer deterministic
BEGIN
DECLARE bill INTEGER default 0;
SELECT SUM(price*qty_ordered) INTO bill
FROM product 
JOIN order_detail
ON product.product_code =order_detail.product_code
WHERE order_code =ORDER_CODE;
RETURN bill;
END
//
DELIMITER ;
select * from order_detail



select generate_bill(OR01)
Display the details of the customer who made the costliest order.







How many orders are processed by the seniormost salesrep in April-2018.

select salesrep_id from salesrep
where salesrep_doj <= (select min(salesrep_doj) from salesrep)

select count(order_code),sr.salesrep_id 
from Order_master 
where month(order_date)=2 and year(order_date)=2018
join salesrep sr on sr.salesrep_id = order_master.salesrep_id where salesrep_doj <= 
																		(select min(salesrep_doj) 
																		 from salesrep)
                                                                         
3.Get the details of the customer who have not placed any order.(All possibilities)

select customer_name, customer_code from customer
where customer_code not in (select customer_code from order_master) 

select customer_code from customer WHERE customer_code not in (select customer_code from order_master) 
UNION
select customer_code from order_master                                                                       

select  from customer left join order_master on customer.customer_code = order_master.customer_code
where order_master.customer_code is null
SELECT customer_name 
FROM customer
LEFT JOIN order_master
ON customer.customer_code = order_master.customer_code
WHERE order_master.customer_code IS NULL

Using Joins:

SELECT customer_name 
FROM customer
LEFT JOIN order_master
ON customer.customer_code = order_master.customer_code
WHERE order_master.customer_code IS NULL

Using Subquery:

SELECT customer_name, customer_code
FROM customer
WHERE customer_code NOT IN (SELECT customer_code 
                                                          FROM order_master) 

Using Set Operator:

SELECT customer_code 
FROM customer 
WHERE customer_code NOT IN (SELECT customer_code FROM order_master) 

UNION

SELECT customer_code FROM order_master
select * from order_detail
4.Orderwise,productwise,sum of the order quantity,prepare a report using Rollup.

SELECT order_code, product_code, SUM(qty_ordered) FROM order_detail 
GROUP BY order_code,product_code with rollup;

6.Display the name of the customers who have placed orders whose billvalue is greater than Rs.200000 

select count(order_code), product_code, case when count(order_code)>4 then 'frequently ordered product' end) as "Review",
case when  count(order_code)>2 and count(order_code)<4 then 'less ordered product' else "Rarely ordered product"end) "Review"
from order_detail group by product_code

select customer.customer_name 
from order_master
join customer
on order_master.customer_code = customer.customer_code
where qty_ordered*price >=( select qty_ordered * price as rate from order_detail join product on order_detail.product_code = product.product_code)


select count(order_code), product_code, 
case
         when count(order_code)>4 then 'frequently ordered product',
         when  count(order_code)>2  then 'less ordered product' ,
         when count(order_code)<4 then "Rarely ordered product"  
         Else " condition"
end;
from order_detail group by product_code

select count(order_detail.order_code), product_code, 
case
         when count(order_detail.order_code)>4 then 'frequently ordered product'
         when  count(order_detail.order_code)>2  then 'less ordered product' 
         when count(order_detail.order_code)<4 then "Rarely ordered product"  
         Else " use some random string"
end;
from order_detail group by product_code