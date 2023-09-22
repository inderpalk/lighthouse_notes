--Display a list of all customers, their email address, and the date they made their first purchase at the store. 
--Order the results by the customer's last name. Additionally, include a column that shows the customer's 
--total spending at the store, as well as a column that shows the number of distinct artists the customer 
--has purchased music from. Only include customers who have made at least one purchase, and order the results 
--by the total spending, in descending order.

select c.customerid, c.firstname || ' ' || c.lastname as Name, min(i.invoicedate) as firstpurchase, 
sum(i.total) as TotalSpending, count(distinct a.artistid) as numDistinctArtist
from customer c
join invoice i
on c.customerid = i.customerid
join invoiceline il
on i.invoiceid = il.invoiceid
join track t
on il.trackid = t.trackid
join album a
on t.albumid = a.albumid
group by c.customerid
having sum(i.total) > 0
order by c.lastname, TotalSpending desc;

--Display a list of all employees and the number of customers they have served, 
--broken down by country. Only include employees who have served at least one customer, 
--and order the results by the total number of customers, in descending order.

select e.firstname || ' ' || e.lastname as Fullname, count(distinct c.customerid) as NumberofCustomer, c.country
from employee e
join customer c
on e.employeeid = c.supportrepid
group by e.employeeid, c.country
having count(e.employeeid) > 0
order by NumberofCustomer desc;

--Display a list of all genres and the top-selling artist for each genre. 
--If there is a tie for the top-selling artist, include all tied artists in the result set.

select g.name as GenreName, a.name as ArtistName, count(il.invoiceid) as numsales
from genre g
join track t
on g.genreid = t.genreid
join invoiceline il
on t.trackid = il.trackid
join album al
on t.albumid = al.albumid
join artist a
on al.artistid = a.artistid
where a.artistid IN (
	select artistid 
	from (
		SELECT al.ArtistId, COUNT(il.InvoiceLineId) AS NumSales
			FROM Album al
			JOIN Track t ON al.AlbumId = t.AlbumId
			JOIN InvoiceLine il ON t.TrackId = il.TrackId
			GROUP BY al.ArtistId
			ORDER BY NumSales DESC
		) AS TopArtistByAlbum
)
GROUP BY g.GenreId, a.ArtistId
HAVING COUNT(il.InvoiceLineId) >= (
  SELECT COUNT(il.InvoiceLineId)
  FROM Genre g2
  JOIN Track t2 ON g2.GenreId = t2.GenreId
  JOIN InvoiceLine il ON t2.TrackId = il.TrackId
  JOIN Album al2 ON t2.AlbumId = al2.AlbumId
  JOIN Artist a2 ON al2.ArtistId = a2.ArtistId
  WHERE g2.GenreId = g.GenreId
  GROUP BY a2.ArtistId
  ORDER BY COUNT(il.InvoiceLineId) DESC
  LIMIT 1
)
ORDER BY g.Name, NumSales DESC;

--Display a list of all customers who have made a purchase in the month of January 2013, 
--along with the total amount they spent in that month. Order the results by the total amount spent, 
--in descending order.

select c.firstname || ' ' || c.lastname as Customername, sum(i.total) as TotalAmount
from customer c
join invoice i
on c.customerid = i.customerid
join invoiceline il
on i.invoiceid = il.invoiceid
where i.invoicedate between '2013-01-01' and '2013-01-31'
group by c.customerid 
having sum(i.total) > 0
order by TotalAmount desc;

--Display a list of all tracks that have been purchased more than once, along with the number of times 
--they have been purchased. Order the results by the number of purchases, in descending order.

select t.name as Trackname, count(il.invoiceid) as NumPurchase
from track t
join invoiceline il
on t.trackid = il.trackid
group by t.trackid 
having count(il.invoiceid) > 1
order by count(il.invoiceid) Desc;

--Display a list of all customers who have purchased music from more than one genre, 
--along with the number of distinct genres they have purchased music from. 
--Order the results by the number of distinct genres, in descending order.

select c.firstname || ' ' || c.lastname as Customername, count(distinct g.genreid) as NumDistinctgenre
from customer c
join invoice i
on c.customerid = i.customerid
join invoiceline il
on i.invoiceid = il.invoiceid
join track t
on il.trackid = t.trackid
join genre g
on t.genreid = g.genreid
group by c.customerid
having count(g.genreid) > 1
order by count(distinct g.genreid) desc;

--Create a new table called "PopularAlbums" that contains the top 5 best-selling albums of all time, 
--along with the total number of tracks sold for each album.

create table PopularAlbumsRecords (
	albumid integer primary key,
	title text,
	artistid integer,
	totaltrackssold integer
);

insert into PopularAlbumsRecords(Albumid, title, artistid, totaltrackssold)
SELECT al.AlbumId, al.Title, al.ArtistId, SUM(il.Quantity) AS TotalTracksSold
FROM Album al
JOIN Track t ON al.AlbumId = t.AlbumId
JOIN InvoiceLine il ON t.TrackId = il.TrackId
JOIN Invoice i ON il.InvoiceId = i.InvoiceId
GROUP BY al.AlbumId
ORDER BY TotalTracksSold DESC
LIMIT 5;
