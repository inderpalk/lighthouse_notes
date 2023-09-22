---Create a report that shows the products purchased along with their 
--quantity purchased and the total of revenue made by product. 
--Sort the result by product in alphabetical order.

select p.productname, sum(od.quantity) as  TotalQuantity, sum(od.unitprice * od.quantity) as Revenue
from products p
join order_details od
on p.productid = od.productid
group by p.productname
order by productname;

--Create a report that shows the most expensive product purchased.
select p.productname, sum(od.unitprice * od.quantity) as Expensive
from products p
join order_details od
on p.productid = od.productid
group by p.productname
order by sum(od.unitprice * od.quantity) desc
limit 1;

--Create a report that shows the most expensive product purchased.
select p.productname, sum(od.unitprice * od.quantity) as Revenue,
Rank() over(order by sum(od.unitprice * od.quantity) desc) as Ranking
from products p
join order_details od
on p.productid = od.productid
group by p.productname;

-- Create a report that shows all the information on customers who made an order in November 1996.

select o.orderdate, extract(year from o.orderdate) as Year, extract(month from o.orderdate) as Month, c.*
from customers c
join orders o
on c.customerid = o.customerid 
where o.orderdate between '1996-11-01' and '1996-12-01';

--Create a report that shows only the top 5 most popular products purchased along with 
--their names and total quantity purchased. Sort the result by total quantity in descending order.

select p.productname, sum(od.quantity) as TotalQuanity
from products p 
join order_details od 
on p.productid = od.productid
group by p.productname
order by TotalQuanity desc
limit 5;


