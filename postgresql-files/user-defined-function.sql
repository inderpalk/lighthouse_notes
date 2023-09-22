CREATE OR REPLACE FUNCTION LateShipment(date_ordered date, date_shipped date, lead_time_limit int)
RETURNS varchar
AS
$$
DECLARE
    is_late varchar;
    lead_time int;
BEGIN
    lead_time = date_shipped - date_ordered;
    CASE
        WHEN lead_time > lead_time_limit THEN is_late = 'late';
        ELSE is_late = 'on time';
    END CASE;
    RETURN is_late;
END
$$
LANGUAGE PLPGSQL

--Create a function that can be used to compute the total order revenue of a particular product 
--from the products table (i.e., unit price times number of units on order). 
-- Run a query using the function to compute the total order revenue for each product in the table.

create or replace function totalOrderrevenue(ordered int, unit_price float)
returns float
as
$$
Begin
	return ordered * unit_price;
end 
$$
LANGUAGE PLPGSQL;
select *, totalOrderrevenue(unitsonorder, unitprice) from products;

--Create a function that will compute the total cost of each individual product line item in the order_details 
--table (i.e., unit price times quantity minus the percentage discount). 
--Run a query using the function to compute the product line item costs for each product in the table.

create or replace function totalecost(price float, qty int, dis float)
returns float
as
$$
declare
	cost float;
begin
	cost = (price * qty) - dis;
	return cost;
end 
$$
Language PLPGSQL;
select *, totalecost(unitprice, quantity, discount) from order_details;

--Write a function that will compute the total cost of all of the orders in the order_details table 
--using the function that you wrote for question 2 and then run it in a query.

create or replace function TotalOrdersCost()
returns float
as
$$
declare
	orders_cost float;
begin
	SELECT SUM(totalecost(unitprice, quantity, discount)) INTO orders_cost FROM public.order_details;
    RETURN orders_cost;
end
$$
Language PLPGSQL;
SELECT TotalOrdersCost();
