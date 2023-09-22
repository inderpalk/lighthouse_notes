select productprice, productprice / 1000000 from allsessions;
select * from allsessions;

--update allsessions
--set productprice = productprice / 1000000;

-- setting default value for city
update allsessions
set city = (CASE 
WHEN city = 'not available in demo dataset' or city = '(not set)' THEN 'N/A' 
when city is not null then city end);


-- setting the default value of totaltransactionrevenue as 0
update allsessions
set totaltransactionrevenue = (
	CASE 
		when totaltransactionrevenue is not null then totaltransactionrevenue
		when totaltransactionrevenue is null then 0 end
);

update allsessions
set transactionrevenue = (
	CASE 
		when transactionrevenue is not null then transactionrevenue
		when transactionrevenue is null then 0 end
);



--setting currency code as per country
select distinct country, currencycode from allsessions where currencycode is null;
select  country, currencycode from allsessions where currencycode is null;

update allsessions
set currencycode = (case 
when country = 'Canada'  and (currencycode is null or currencycode = 'USD') then 'CAD'
when country = 'Turkey'  and (currencycode is null or currencycode = 'USD') then 'TRY'
when country = 'Czechia'  and (currencycode is null or currencycode = 'USD') then 'CZK'
when country = 'Hong Kong'  and (currencycode is null or currencycode = 'USD') then 'HKD'
when (country = 'Spain' or country = 'Germany' or country = 'Belgium' 
	  or country = 'Finland' or country = 'France' or country = 'Ireland'
	 or country = 'Italy' or country = 'Netherlands') and (currencycode is null or currencycode = 'USD') then 'EUR'
when country = 'Argentina'  and (currencycode is null or currencycode = 'USD') then 'ARS'
when country = 'Australia'  and (currencycode is null or currencycode = 'USD') then 'AUD'
when country = 'Belgium'  and (currencycode is null or currencycode = 'USD') then 'ARS'
when country = 'Brazil'  and (currencycode is null or currencycode = 'USD') then 'BRL'
when country = 'Chile'  and (currencycode is null or currencycode = 'USD') then 'CLF'
when country = 'Croatia'  and (currencycode is null or currencycode = 'USD') then 'HRK'
when country = 'Denmark'  and (currencycode is null or currencycode = 'USD') then 'DKK'
when country = 'El Salvador'  and (currencycode is null or currencycode = 'USD') then 'SVC'
when country = 'Hungary'  and (currencycode is null or currencycode = 'USD') then 'HUF'
when country = 'India'  and (currencycode is null or currencycode = 'USD') then 'INR'
when country = 'Indonesia'  and (currencycode is null or currencycode = 'USD') then 'IDR'
when country = 'Japan'  and (currencycode is null or currencycode = 'USD') then 'JPY'
when country = 'Mexico'  and (currencycode is null or currencycode = 'USD') then 'MXN'
when country = 'Myanmar'  and (currencycode is null or currencycode = 'USD') then 'MMK'
when country = 'Norway'  and (currencycode is null or currencycode = 'USD') then 'NOK'
when country = 'Pakistan'  and (currencycode is null or currencycode = 'USD') then 'PKR'
when country = 'Peru'  and (currencycode is null or currencycode = 'USD') then 'PEN'
when country = 'Phillippines'  and (currencycode is null or currencycode = 'USD') then 'PHP'
when country = 'Romania'  and (currencycode is null or currencycode = 'USD') then 'RON'
when country = 'Philippines'  and (currencycode is null or currencycode = 'USD') then 'PHP'
when country = 'Russia'  and (currencycode is null or currencycode = 'USD') then 'RUB'
when country = 'Singapore'  and (currencycode is null or currencycode = 'USD') then 'SGD'
when country = 'Singapore'  and (currencycode is null or currencycode = 'USD') then 'SGD'
when country = 'Sweden'  and (currencycode is null or currencycode = 'USD') then 'SEK'
when country = 'Switzerland'  and (currencycode is null or currencycode = 'USD') then 'CHE'
when country = 'Taiwan'  and (currencycode is null or currencycode = 'USD') then 'TWD'
when country = 'Thailand'  and (currencycode is null or currencycode = 'USD') then 'THB'
when country = 'Ukraine'  and (currencycode is null or currencycode = 'USD') then 'UAH'
when country = 'United Kingdom'  and (currencycode is null or currencycode = 'USD') then 'GBP'
when country = 'Vietnam'  and (currencycode is null or currencycode = 'USD') then 'VND'
when country = 'New Zealand'  and (currencycode is null or currencycode = 'USD') then 'NZD'
when country = 'United States' then 'USD' end);


-- analytics 
select fullvisitorid, count(*) from analytics group by fullvisitorid
select * from analytics where fullvisitorid = '0114604846439850855'
--where visitid = 1497271522;
SELECT  visitnumber, visitid, visitstarttime, date, fullvisitorid, userid, channelgrouping, 
socialengagementtype, units_sold, pageviews, timeonsite, bounces, revenue, unit_price, SUM(Unit_price) AS total_quantity
FROM analytics
GROUP BY visitnumber, visitid, visitstarttime, date, fullvisitorid, userid, channelgrouping, 
socialengagementtype, units_sold, pageviews, timeonsite, bounces, revenue, unit_price
order by fullvisitorid

UPDATE analytics AS t
SET unit_price = merged_value
FROM (
    SELECT
        visitnumber, visitid, visitstarttime, date, fullvisitorid, userid, channelgrouping, 
socialengagementtype, units_sold, pageviews, timeonsite, bounces, revenue, unit_price,
        sum(Unit_price) AS merged_value
    FROM analytics
    GROUP BY visitnumber, visitid, visitstarttime, date, fullvisitorid, userid, channelgrouping, 
socialengagementtype, units_sold, pageviews, timeonsite, bounces, revenue, unit_price
) AS duplicates
WHERE t.visitnumber = duplicates.visitnumber
  AND t.visitid = duplicates.visitid
  AND t.visitstarttime = duplicates.visitstarttime
  and t.date = duplicates.date
  and t.fullvisitorid = duplicates.fullvisitorid
  and t.userid = duplicates.userid
  and t.channelgrouping = duplicates.channelgrouping
  and t.socialengagementtype = duplicates.socialengagementtype
  and t.units_sold = duplicates.units_sold
  and t.pageviews = duplicates.pageviews
  and t.timeonsite = duplicates.timeonsite
  and t.bounces = duplicates.bounces
  and t.revenue = duplicates.revenue

CREATE TABLE analytics_2 AS
SELECT DISTINCT *
FROM analytics;
select * from analytics_2

--7819357531996452181;
--select * from allsessions where country = 'United States'



