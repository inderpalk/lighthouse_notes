select DISTINCT(c.customerid) AS customerid, c.companyname
from customers c
join orders o
on c.customerid = o.customerid
join order_details od
on o.orderid = od.orderid
join products p
on od.productid = p.productid
where od.quantity > p.unitsinstock;

select e.lastname, e.firstname, e.employeeid
from employees e
join orders o
on e.employeeid = o.employeeid
where o.employeeid is null;

select DISTINCT(c.customerid) AS customerid, c.companyname, o.orderdate
from customers c
join orders o
on c.customerid = o.customerid
WHERE EXISTS (
  SELECT *
  FROM orders o2
  WHERE o.customerid = o2.customerid
  AND o.orderid <> o2.orderid
  AND o.orderdate = o2.orderdate
)

SELECT DISTINCT(p.productname) AS productname
FROM products p
JOIN order_details od 
ON p.productid = od.productid
JOIN orders o 
ON od.orderid = o.orderid
WHERE o.shippeddate IS NULL;

select DISTINCT(e.employeeid), e.lastname, e.firstname
from employees e
join orders o
on e.employeeid = o.employeeid
join customers c
on o.customerid = c.customerid
where e.city = c.city;

select e.employeeid as id, 'Employee' as type, e.city
from employees e
Union
select s.supplierid as id, 'Suppliers' as type, s.city
from suppliers s
join employees e
on s.city = e.city

select s.companyname, s.country
from suppliers s 
join products p
on s.supplierid = p.supplierid
where s.country In ('UK', 'USA');

select DISTINCT(c.customerid) AS customerid, c.companyname
from customers c
join orders o 
on c.customerid = o.customerid
join order_details od
on o.orderid = od.orderid
join products p
on od.productid = p.productid
where p.productname in ('Chang', 'Guaraná Fantástica');

select p.productname
from products p
WHERE supplierid IN (
  SELECT supplierid
  FROM suppliers s
  WHERE country IN (
    SELECT shipcountry
    FROM orders o
    JOIN customers c 
      ON o.customerid = c.customerid
    WHERE p.supplierid = s.supplierid
  )
)




