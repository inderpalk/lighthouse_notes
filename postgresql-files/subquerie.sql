Select productname, unitsinstock,
(select sum(quantity) from order_details od where p.productID = od.productID) as unitsold
from products p;

select o.shipaddress, o.shipcity, o.shipcountry, od.quantity
from orders o
join order_details od
on o.orderid = od.orderid
where o.shipcountry like '%y%' and 
od.quantity > (select avg(quantity) from order_details);

select * 
from orders o
where employeeid In (select distinct employeeid from 
employeeterritories where territoryid = '40222')

SELECT 
(SELECT companyname FROM customers c WHERE o.customerid = c.customerid) AS customername,
e.lastname AS employeelastname
FROM orders o
JOIN employees e
ON o.employeeid = e.employeeid

select p.productname, (select s.companyname 
					   from suppliers s
					   where p.supplierid = s.supplierid)
from products p;

SELECT 
(SELECT companyname FROM customers c WHERE o.customerid = c.customerid) AS customername,
e.lastname AS employeelastname, o.orderdate, o.orderid
FROM orders o
JOIN employees e
ON o.employeeid = e.employeeid

SELECT c.companyname, e.lastname AS employeelastname, o.orderdate, o.orderid
FROM customers c
JOIN (
    SELECT customerid, employeeid, orderdate, orderid
    FROM orders
) AS o 
ON c.customerid = o.customerid
JOIN employees e 
ON o.employeeid = e.employeeid

SELECT shipperid AS id, companyname AS name, 'shipper 222' AS type FROM shippers
UNION
SELECT supplierid AS id, companyname AS name, 'supplier' FROM suppliers

select city, contacttitle as title, 'Customer' as type from customers
where country = 'USA'
Union
select city, contacttitle as title, 'supplier' as type from suppliers
where country = 'USA'
union
select city, title, 'employeee' as type from employees
where country = 'USA'

select companyname as name, 'shippers' as partnertype from shippers 
union
select companyname as name, 'suppliers' as partnertype from suppliers
union
select companyname as name, 'customer' as partnertype from customers