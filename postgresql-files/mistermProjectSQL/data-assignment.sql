--Which cities and countries have the highest level of transaction revenues on the site?
select country, city, Sum(transactionrevenue) as HighestRevenue 
from allsessions 
where transactionrevenue <> 0
group by city, country
order by HighestRevenue desc
limit 5;

SELECT SUM(totaltransactionrevenue) AS highest_level_of_transaction, currencycode, 
country, city, timeonsite FROM allsessions WHERE totaltransactionrevenue IS NOT NULL 
AND city !='not available in demo dataset' GROUP BY totaltransactionrevenue, 
currencycode, city, country, timeonsite ORDER BY totaltransactionrevenue DESC

--What is the average number of products ordered from visitors in each city and country?
select country, city, round(avg(orderedquantity),3) as AvgProductOrdered from products p
join allsessions a
on p.sku = a.productsku
group by city, country
order by AvgProductOrdered desc;

SELECT ROUND(AVG(productquantity)) AS Avg_Product_Quantity, city, country FROM allsessions 
WHERE city != 'not available in demo dataset' 
AND city IS NOT NULL GROUP BY productquantity, city, country ORDER BY productquantity

SELECT a.country, a.city, cast(AVG(an.units_sold) as decimal(10,2)) AS averageProductCount 
FROM allsessions AS a JOIN analytics AS an 
ON a.visitId = an.visitId where units_sold is not null GROUP BY a.country, a.city;

--Is there any pattern in the types (product categories) of 
 --products ordered from visitors in each city and country?**
select count(p.name)as Productpatttern, a.city, a.country
from products p
join allsessions a
on p.sku = a.productsku
group by a.city, a.country
order by Productpatttern desc;

SELECT a.country as country, a.city as city, a.v2ProductCategory as productcategory, SUM(an.units_sold) 
as totalUnitsSold FROM allsessions AS a JOIN analytics AS an ON a.visitId = an.visitId JOIN products AS p ON a.productSKU = p.SKU WHERE a.country != '(not set)' AND a.city != '(not set)' AND a.v2ProductCategory != '(not set)' GROUP BY a.country, a.city, a.v2ProductCategory 
HAVING SUM(an.units_sold) IS NOT NULL ORDER BY a.country, a.city, totalUnitsSold DESC

--What is the top-selling product from each city/country?
--Can we find any pattern worthy of noting in the products sold?
with topselling as (
	select p.sku, a.city, a.country,
	row_number() over(partition by country order by sum(a.productquantity * a.productprice) desc) as rank
	from products p
	join allsessions a
	on p.sku = a.productsku
	group by a.city, a.country, p.sku
)
select 
    ts.city,
    ts.country,
    p.name,
    sum(a.productquantity * a.productprice) AS total_quantity_sold
from topselling ts
join products p on ts.sku = p.sku
join allsessions a on p.sku = a.productsku
where ts.rank = 1
group by ts.city, ts.country, p.name
order by ts.city, ts.country, total_quantity_sold desc;
---

with topselling as (
	select country, city, v2productcategory,
	count(v2productcategory) as categoryCount,
	rank() over (partition by country order by count(v2productcategory) desc) as categoryRank
	from allsessions
	group by country, city, v2productcategory
	order by country desc, categoryRank
)
select * from topselling where categoryRank = 1

--Can we summarize the impact of revenue generated from each city/country?
select sum(productrevenue) as Revenue, city, country 
from allsessions
group by city, country
order by Revenue desc;


