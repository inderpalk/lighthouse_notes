Create table allsessions(
	fullVisitorId integer primary key,
	channelGrouping varchar(255),
	time time,
	country text,
	city text,
	totalTransactionRevenue integer,
	transactions integer,
	timeOnSite integer,
	pageviews integer,
	sessionQualityDim integer,
	date date,
	visitId integer,
	type text,
	productRefundAmount integer,
	productQuantity integer,
	productPrice integer,
	productRevenue integer,
	productSKU integer,
	v2ProductName text,
	v2ProductCategory text,
	productVariant integer,
	currencyCode text,
	itemQuantity integer,
	itemRevenue integer,
	transactionRevenue integer,
	transactionId integer,
	pageTitle text,
	searchKeyword text,
	pagePathLevel1 text,
	eCommerceAction_type integer,
	eCommerceAction_step integer,
	eCommerceAction_option text
);

select *
from allsessions



