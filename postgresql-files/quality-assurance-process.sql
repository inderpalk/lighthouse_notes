select a.albumid, a.title, t.name
from album a
join track t
on a.albumid = t.albumid;

select count(distinct albumid) from (
	select a.albumid, a.title, t.name
	from album a
	join track t
	on a.albumid = t.albumid
) tmp

select count(distinct albumid) from album

-- since above both queries are give the same output i.e 347 that means join is 
--working properly as per the number of albums

select count(distinct name) from (
	select a.albumid, a.title, t.name
	from album a
	join track t
	on a.albumid = t.albumid
) tmp

select count(name) from track

-- since above both queries are give the different output i.e 3256 and 3506 that means join is not
--working properly as per the number of albums

select title, name, count(*) from (
	select a.albumid, a.title, t.name
	from album a
	join track t
	on a.albumid = t.albumid
) tmp
group by name, title
having count(*) > 1
order by name

select * from track
where albumid = 229

-- few albums have same name that is the reason it shwos diff numbers


