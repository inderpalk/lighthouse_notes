--Datatype change od SALESBYSKU
select * from salesbysku;

ALTER TABLE salesbysku
ALTER COLUMN total_ordered TYPE integer USING (total_ordered::integer);

ALTER TABLE salesbysku
ALTER COLUMN productsku TYPE varchar(255) USING (productsku::varchar(255));

--Datatype change od PRODUCTS
select * from products;
ALTER TABLE products ADD PRIMARY KEY (sku);

ALTER TABLE products
ALTER COLUMN sku TYPE varchar(255) USING (sku::varchar(255));

ALTER TABLE products
ALTER COLUMN name TYPE varchar(255) USING (name::varchar(255));

ALTER TABLE products
ALTER COLUMN sku TYPE varchar(255) USING (sku::varchar(255));

ALTER TABLE products
ALTER COLUMN orderedquantity TYPE integer USING (orderedquantity::integer);

ALTER TABLE products
ALTER COLUMN stocklevel TYPE integer USING (stocklevel::integer);

ALTER TABLE products
ALTER COLUMN restockingleadtime TYPE integer USING (restockingleadtime::integer);

ALTER TABLE products
ALTER COLUMN sentimentscore TYPE numeric(10,3) USING (sentimentscore::numeric(10,3));

ALTER TABLE products
ALTER COLUMN sentimentmagnitude TYPE numeric(10,3) USING (sentimentmagnitude::numeric(10,3));

--Datatype change od SALESREPORT
select * from salesreport;
ALTER TABLE salesreport ADD PRIMARY KEY (productsku);

ALTER TABLE salesreport
ALTER COLUMN productsku TYPE varchar(255) USING (productsku::varchar(255));

ALTER TABLE salesreport
ALTER COLUMN name TYPE varchar(255) USING (name::varchar(255));

ALTER TABLE salesreport
ALTER COLUMN total_ordered TYPE integer USING (total_ordered::integer);

ALTER TABLE salesreport
ALTER COLUMN orderedquantity TYPE integer USING (orderedquantity::integer);

ALTER TABLE salesreport
ALTER COLUMN stocklevel TYPE integer USING (stocklevel::integer);

ALTER TABLE salesreport
ALTER COLUMN restockingleadtime TYPE integer USING (restockingleadtime::integer);

ALTER TABLE salesreport
ALTER COLUMN sentimentscore TYPE numeric(10,3) USING (sentimentscore::numeric(10,3));

ALTER TABLE salesreport
ALTER COLUMN sentimentmagnitude TYPE numeric(10,3) USING (sentimentmagnitude::numeric(10,3));

ALTER TABLE salesreport
ALTER COLUMN ratio TYPE numeric(10,3) USING (ratio::numeric(5,4));

--Datatype change od ALLSESSIONS
select * from allsessions;
ALTER TABLE allsessions ADD PRIMARY KEY (visitid);

ALTER TABLE allsessions
ALTER COLUMN fullvisitorid TYPE varchar(255) USING (fullvisitorid::varchar(255));

ALTER TABLE allsessions
ALTER COLUMN channelgrouping TYPE varchar(255) USING (channelgrouping::varchar(255));

ALTER TABLE allsessions
ALTER COLUMN time TYPE time USING (time::time);

ALTER TABLE allsessions
ALTER COLUMN country TYPE varchar(255) USING (country::varchar(255));

ALTER TABLE allsessions
ALTER COLUMN city TYPE varchar(255) USING (city::varchar(255));

ALTER TABLE allsessions
ALTER COLUMN totaltransactionrevenue TYPE integer USING (totaltransactionrevenue::integer);

ALTER TABLE allsessions
ALTER COLUMN transactions TYPE integer USING (transactions::integer);

ALTER TABLE allsessions
ALTER COLUMN timeonsite TYPE integer USING (timeonsite::integer);

ALTER TABLE allsessions
ALTER COLUMN pageviews TYPE integer USING (pageviews::integer);

ALTER TABLE allsessions
ALTER COLUMN sessionqualitydim TYPE integer USING (sessionqualitydim::integer);

ALTER TABLE allsessions
ALTER COLUMN date TYPE date USING (date::date);

ALTER TABLE allsessions
ALTER COLUMN visitid TYPE integer USING (visitid::integer);

ALTER TABLE allsessions
ALTER COLUMN type TYPE varchar(255) USING (channelgrouping::varchar(255));

ALTER TABLE allsessions
ALTER COLUMN productrefundamount TYPE integer USING (productrefundamount::integer);

ALTER TABLE allsessions
ALTER COLUMN productquantity TYPE integer USING (productquantity::integer);

ALTER TABLE allsessions
ALTER COLUMN productprice TYPE integer USING (productprice::integer);

ALTER TABLE allsessions
ALTER COLUMN productrevenue TYPE integer USING (productrevenue::integer);

ALTER TABLE allsessions
ALTER COLUMN productsku TYPE varchar(255) USING (productsku::varchar(255));

ALTER TABLE allsessions
ALTER COLUMN v2productname TYPE varchar(255) USING (v2productname::varchar(255));

ALTER TABLE allsessions
ALTER COLUMN v2productcategory TYPE varchar(255) USING (v2productcategory::varchar(255));

ALTER TABLE allsessions
ALTER COLUMN productvariant TYPE varchar(255) USING (productvariant::varchar(255));

ALTER TABLE allsessions
ALTER COLUMN currencycode TYPE varchar(255) USING (currencycode::varchar(255));

ALTER TABLE allsessions
ALTER COLUMN itemquantity TYPE integer USING (itemquantity::integer);

ALTER TABLE allsessions
ALTER COLUMN itemrevenue TYPE integer USING (itemrevenue::integer);

ALTER TABLE allsessions
ALTER COLUMN transactionrevenue TYPE integer USING (transactionrevenue::integer);

ALTER TABLE allsessions
ALTER COLUMN transactionid TYPE varchar(255) USING (transactionid::varchar(255));

ALTER TABLE allsessions
ALTER COLUMN pagetitle TYPE varchar(255) USING (pagetitle::varchar(255));

ALTER TABLE allsessions
ALTER COLUMN searchkeyword TYPE varchar(255) USING (searchkeyword::varchar(255));

ALTER TABLE allsessions
ALTER COLUMN pagepathlevel1 TYPE varchar(255) USING (pagepathlevel1::varchar(255));

ALTER TABLE allsessions
ALTER COLUMN ecommerceaction_type TYPE integer USING (ecommerceaction_type::integer);

ALTER TABLE allsessions
ALTER COLUMN ecommerceaction_step TYPE integer USING (ecommerceaction_step::integer);

ALTER TABLE allsessions
ALTER COLUMN ecommerceaction_option TYPE varchar(255) USING (ecommerceaction_option::varchar(255));

--analytics:
select * from analytics;
ALTER TABLE analytics
ALTER COLUMN visitnumber TYPE integer USING (visitnumber::integer);

ALTER TABLE analytics
ALTER COLUMN visitid TYPE integer USING (visitid::integer);

ALTER TABLE analytics
ALTER COLUMN visitstarttime TYPE integer USING (visitstarttime::integer);

ALTER TABLE analytics
ALTER COLUMN date TYPE date USING (date::date);

ALTER TABLE analytics
ALTER COLUMN fullvisitorid TYPE integer USING (fullvisitorid::integer);

ALTER TABLE analytics
ALTER COLUMN userid TYPE integer USING (userid::integer);

ALTER TABLE analytics
ALTER COLUMN channelgrouping TYPE varchar(255) USING (channelgrouping::varchar(255));

ALTER TABLE analytics
ALTER COLUMN socialengagementtype TYPE varchar(255) USING (socialengagementtype::varchar(255));

ALTER TABLE analytics
ALTER COLUMN units_sold TYPE integer USING (units_sold::integer);

ALTER TABLE analytics
ALTER COLUMN pageviews TYPE integer USING (pageviews::integer);

ALTER TABLE analytics
ALTER COLUMN timeonsite TYPE integer USING (timeonsite::integer);

ALTER TABLE analytics
ALTER COLUMN bounces TYPE integer USING (bounces::integer);

ALTER TABLE analytics
ALTER COLUMN revenue TYPE integer USING (revenue::integer);

ALTER TABLE analytics
ALTER COLUMN unit_price TYPE integer USING (unit_price::integer);
