Create table allsessions(
	fullVisitorId text,
	channelGrouping text,
	time text,
	country text,
	city text,
	totalTransactionRevenue text,
	transactions text,
	timeOnSite text,
	pageviews text,
	sessionQualityDim text,
	date text,
	visitId text,
	type text,
	productRefundAmount text,
	productQuantity text,
	productPrice text,
	productRevenue text,
	productSKU text,
	v2ProductName text,
	v2ProductCategory text,
	productVariant text,
	currencyCode text,
	itemQuantity text,
	itemRevenue text,
	transactionRevenue text,
	transactionId text,
	pageTitle text,
	searchKeyword text,
	pagePathLevel1 text,
	eCommerceAction_type text,
	eCommerceAction_step text,
	eCommerceAction_option text
);

create table salesbysku(
	productsku text,
	total_ordered text
);

create table products(
	sku text,
	name text,
	orderedQuantity text,
	stockLevel text,
	restockingLeadTime text,
	sentimentScore text,
	sentimentMagnitude text
);

create table salesreport(
	productSKU text,
	total_ordered text,
	name text,
	stockLevel text,
	restockingLeadTime text,
	sentimentScore text,
	sentimentMagnitude text,
	ratio text
);

create table products(
	sku text,
	name text,
	orderedQuantity text,
	stockLevel text,
	restockingLeadTime text,
	sentimentScore text,
	sentimentMagnitude text
);

create table analytics(
	visitNumber text,
	visitId text,
	visitStartTime text,
	date text,
	fullvisitorId text,
	userid text,
	channelGrouping text,
	socialEngagementType text,
	units_sold text,
	pageviews text,
	timeonsite text,
	bounces text,
	revenue text,
	unit_price text
);

select *
from analytics;




