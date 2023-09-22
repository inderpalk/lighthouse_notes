-- For each order, what is the number of days between order date and shipping date (lead time)?
select orderdate - shippeddate  as leadtime from orders;

-- How many orders are shipped within each unique lead time number 
-- of days (order the results by lead time descending)?
select count(*) leadcount, orderdate - shippeddate as leadtime 
from orders 
group by leadtime
order by leadcount desc;

-- What is the lead time with the highest number of orders?
select count(*) leadcount, orderdate - shippeddate as leadtime 
from orders 
group by leadtime
order by leadcount desc
limit 1;

-- How many orders have a required delivery date on a Saturday or Sunday?
select count(*), extract(dow from requireddate) dayrequire
from orders
group by dayrequire
order by dayrequire;

-- For each order, determine if the order is late or not (i.e., if the shipping date is after the required date)?
select case
	when shippeddate > requireddate then 'late'
	else 'on-time'
End
from orders;

-- How many orders are late vs. not late?
select count(*),
case
	when shippeddate > requireddate then 'late'
	else 'on-time'
End on_time
from orders
group by on_time;

-- How many orders are shipped the same week as they are placed?
select count(*),
case 
	when (shippeddate - orderdate between 0 and 7) and 
	extract(dow from orderdate) > extract(dow from shippeddate) then 'yes'
	else 'no'
end shipped_same_week
from orders
group by shipped_same_week;

-- ADVANCED SQL QUERIES;
--Write a subquery to retrieve all orders where the order date is before the order date of any orders 
--placed by the same customer in the USA, and the total price of the order is greater than $1,000.
select * 
from orders o
where exists (
	select *
	from orders o1
	join customers c
	on o.customerid = c.customerid
	where c.country = 'USA' and o.orderdate < o1.orderdate
) and (
	select sum(unitprice * quantity)
	from order_details
	where orderid = o.orderid
) > 1000;

-- Write a correlated subquery to retrieve the names of all employees who 
-- have a higher salary than their immediate supervisor, and their respective job titles.

select e.firstname || ' ' || e.lastname as employeename, e.title, count(*) as numberoforders
from employees e
join orders o
on e.employeeid = o.employeeid
group by e.employeeid, e.firstname, e.title
order by numberoforders desc;

-- Write a self-join to retrieve the names of all employees and their managers, including employees 
-- who do not have a manager. Also include the job titles for each employee and manager.
SELECT e.FirstName || ' ' ||  e.LastName AS EmployeeName, 
e.Title AS EmployeeTitle, 
m.FirstName || ' ' ||  m.LastName AS ManagerName, 
m.Title AS ManagerTitle
FROM Employees e
LEFT JOIN Employees m ON e.ReportsTo = m.EmployeeID;

-- Write a window function to retrieve the top 5 customers who have spent the most money on 
-- orders in the year 1997, and their respective sales amounts.

WITH OrderTotals AS (
  SELECT o.CustomerID, SUM(od.UnitPrice * od.Quantity) AS TotalSalesAmount,
         RANK() OVER (ORDER BY SUM(od.UnitPrice * od.Quantity) DESC) AS SalesRank
  FROM Orders o
  JOIN Order_Details od ON o.OrderID = od.OrderID
  WHERE EXTRACT(YEAR FROM o.OrderDate) = 1997
  GROUP BY o.CustomerID
)
SELECT c.CustomerID, c.CompanyName, ot.TotalSalesAmount
FROM Customers c
JOIN OrderTotals ot ON c.CustomerID = ot.CustomerID
WHERE ot.SalesRank <= 5;

--Write a CTE to retrieve the total sales revenue for each product, as well as the percentage of total revenue
-- that each product represents, for the year 1997 only.

WITH ProductSales AS (
  SELECT ProductID, SUM(UnitPrice * Quantity) AS TotalSales
  FROM Order_Details
  JOIN Orders ON Order_Details.OrderID = Orders.OrderID
  WHERE EXTRACT(YEAR FROM Orders.OrderDate) = 1997
  GROUP BY ProductID
)
SELECT ProductName, TotalSales, 
       100.0 * TotalSales / SUM(TotalSales) OVER () AS PercentageOfTotalSales
FROM Products
JOIN ProductSales ON Products.ProductID = ProductSales.ProductID;
