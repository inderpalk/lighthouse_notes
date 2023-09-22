Display a list of orders with their ID, order date, customer ID, and a new column called "Days Late" 
that shows the number of days the order was late, calculated as the difference between the 
required date and the shipped date. 
If the order has not been shipped yet, the "Days Late" column should be NULL.

select orderid, orderdate, customerid,
case 
	when shippeddate is null then null
	else cast(requireddate - shippeddate as int)
end as "Days Late"
from orders;

 Display a list of products with their name, unit price, and a new column called 
 "Discounted Price" that shows the unit price with a 10% discount if the unit price 
 is greater than $20, and otherwise shows the unit price without any discount.
 If the unit price is NULL, the "Discounted Price" column should also be NULL.

select productname, unitprice,
case 
	when unitprice is null then null
	when unitprice > 20 then cast(unitprice - 0.9 as numeric)
	else CAST(UnitPrice AS NUMERIC)
end as "Discounted Price"
from products;

Display a list of orders with their ID, order date, customer ID, 
and a new column called "Shipped Date" that shows the date the order was 
shipped in the format "MM/DD/YYYY". If the shipped date is NULL, 
the "Shipped Date" column should display "N/A".

select orderid, orderdate, customerid, 
COALESCE(TO_CHAR(ShippedDate, 'MM/DD/YYYY'), 'N/A') AS "Shipped Date"
from orders;

Display a list of employees with their ID, first name, last name, and a new column called "Birth Year" 
that shows the year they were born in. 
If the birth date is NULL, the "Birth Year" column should also be NULL.

select employeeid, firstname, lastname, 
COALESCE(Extract(year from birthdate), NULL) AS "Birth year"
from employees;

Display a list of orders with their ID, order date, customer ID, 
and a new column called "Total Sales" that shows the total sales for each order 
in the format "XX.XX". The total sales should be calculated as the sum of the 
product of the quantity and unit price for each product in the order. 
If the total sales is NULL, the "Total Sales" column should also be NULL.

select o.orderid, o.orderdate, o.customerid,
cast (sum(od.quantity * od.unitprice) as numeric(10,2)) as "total sales"
from orders o
join order_details od
on o.orderid = od.orderid
group by o.orderid, o.orderdate, o.customerid;


