select *
from orders 
where orderid is null;

select Distinct(orderid), discount
from order_details
where discount >= 0.05;

select distinct(c.customerid), c.companyname, c.contacttitle
from customers c
join orders o
on c.customerid = o.customerid;

SELECT customerid, companyname, contacttitle
FROM customers
WHERE EXISTS 
    (SELECT customerid
     FROM orders
     WHERE customers.customerid = orders.customerid)

select distinct(companyname) AS companyname
from suppliers 
where country = 'Germany'
AND city IN ('Berlin', 'Frankfurt');

SELECT *
FROM orders
WHERE DATE_PART('YEAR', orderdate) = 1997 AND DATE_PART('YEAR',requireddate) = 1998
		 
select *
from products
WHERE UPPER(quantityperunit) LIKE '%PIECES%';


SELECT *
FROM order_details
WHERE productid IN (50, 55, 57)
    --(productid = 50 OR productid = 55 OR productid = 57) 
    AND NOT DISCOUNT = 0 
    --AND DISCOUNT > 0 
    --AND DISCOUNT <> 0
    --AND DISCOUNT != 0
    AND (quantity = 120 OR quantity = 60)
    --AND quantity IN (60, 120)
	
