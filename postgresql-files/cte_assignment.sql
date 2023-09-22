With cte_USA as (
	Select o.customerid, c.companyname, o.orderdate
	from orders o
	join customers c
	on o.customerid = c.customerid
)
select * 
from cte_USA
WHERE customerid IN (
  SELECT customerid
  FROM customers
  WHERE country = 'USA'
)

with cte_emp as (
	select employeeid, firstname, lastname, hiredate
	from employees
)
select * 
from cte_emp
where hiredate >= '1990-01-01';

with cte_product_info as(
	select p.productname, p.unitprice, c.categoryname
	from products p 
	join categories c
	on p.categoryid = c.categoryid
)
select * 
from cte_product_info
where unitprice between 10 and 20;

with cte_order_info as (
	select p.productname, od.orderid, od.quantity 
	from order_details od 
	join products p
	on od.productid = p.productid
)
select * 
from cte_order_info 
where quantity >= 10;

with cte_customer_order as (
	select o.orderid, o.orderdate, c.customerid
	from orders o
	join customers c 
	on o.customerid = c.customerid
)
select *
from cte_customer_order
where orderdate between '1997-01-01' and '1997-12-31';
