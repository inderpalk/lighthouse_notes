select p.productname, c.categoryname, p.unitprice, 
avg(p.unitprice) over(partition by c.categoryid) as "AVG unitprice by category",
avg(p.unitprice) over() as "AVG unitprice by overall"
from products p
join categories c 
on p.categoryid = c.categoryid
order by categoryname, productname;

select o.orderid, o.orderdate, p.productid, od.quantity, p.unitprice,
SUM(od.Quantity * od.UnitPrice) OVER (PARTITION BY o.OrderID, c.CategoryName ORDER BY p.ProductID) AS "Running Total"
from orders o 
join order_details od
on od.orderid = o.orderid
join products p
on p.productid = od.productid
join categories c
on c.categoryid = p.categoryid
order by o.orderid, c,categoryname, p.productid;

-- Write a query to calculate the rank of each product within its category based on the total quantity sold. 
-- If two or more products have the same total quantity sold, they should have the same rank.

select p.productname, c.categoryname, od.quantity,
rank() over(partition by c.categoryid order by sum(od.quantity)desc ) as "Ranking"
from categories c
join products p
on c.categoryid = p.categoryid
join order_details od
on p.productid = od.productid
group by p.productname, c.categoryname, od.quantity, c.categoryid
order by c.categoryname, "Ranking", p.productname;

select p.productname, c.categoryname, od.quantity, p.unitprice, 
(((
	SUM(od.Quantity * od.UnitPrice) OVER (PARTITION BY c.CategoryID) / 
   	COUNT(p.ProductID) OVER (PARTITION BY c.CategoryID)
  ) - (od.Quantity * od.UnitPrice)
 ) / 
   (
	   SUM(od.Quantity * od.UnitPrice) OVER (PARTITION BY c.CategoryID) / 
	COUNT(p.ProductID) OVER (PARTITION BY c.CategoryID)
   ) * 100
) 
	AS "Percentage Difference"
from categories c
join products p
on c.categoryid = p.categoryid
join order_details od
on p.productid = od.productid;

--Write a query to calculate the moving average of sales for each product over a period of three months, 
--based on the order date. The moving average should be calculated for each day, 
---and the result set should include the product name, order date, 
--and moving average sales.

select p.productname, o.orderdate, od.quantity, od.unitprice, od.quantity * od.unitprice,
avg(od.quantity * od.unitprice) 
over (partition by p.productid order by o.orderdate rows between 2 preceding and current row) 
as "Moving Sales"
from orders o
join order_details od
on o.orderid = od.orderid
join products p
on od.productid = p.productid
order by p.productname, o.orderdate;