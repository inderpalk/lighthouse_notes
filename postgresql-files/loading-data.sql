create table public.temp
(
	categoryid smallint not null,
	categoryname character varying not null,
	description character varying not null,
	picture bytea,
	Primary Key (categoryid)
);

alter table if exists public.temp
owner to postgres;

insert into temp
select * from categories;

select * from temp;