-- ctrl + r to collapse or show results console
-- ctrl + e to execute
-- alt + f1 will show info about table


-- what artists' music do we sell that starts with the letter c?

select *,
	ArtistId + 10000
from Artist
where Name like 'c%' -- stuff based on matching a partial string -> use Like operator


-- How many customers are in each state?
-- select State as [Customer State],
select isnull([State], Country) as [Customer Location], -- will name column whatever is inside as []
		count(*) [Number of Customers],
		[Customer Names] = string_agg(firstname, ',')
from Customer c
-- grouping based on state
-- group by [State], Country -- [] tells sql it's not a keyword
group by isnull([State], Country) -- same as line above
--------------------------------------------------------------------------------------------

select *
from Customer
where [state] is not null --> is this something which we don't know the value of
-- you can use is null or is not null


--------------------------------------------------------------------------------------------
-- How many music tracks were purchased by each customer country? ---------------------------------
--------------------------------------------------------------------------------------------

-- number of invoice lines by country
select BillingCountry, count(*)
from Invoice i
	 join InvoiceLine il -- inner joins are implied. Don't need 'inner'. If not inner than need to specify
	 on i.InvoiceId = il.InvoiceId
	 group by BillingCountry
order by 1


select * 
from Invoice -- costumerid, billingcountry

select count(distinct TrackId), count(*)
from InvoiceLine -- tracks on the invoice


-- when you want only the first x number of rows, use TOP ----- limit and top do the same thing
Select top 1 *
from Invoice
order by Total desc -- desc = descending, asc = ascending


----------------------------------------------------------------------------------------
---------------------    Subqueries    -------------------------------------------------
----------------------------------------------------------------------------------------

-- nesting one or more queries inside another one
-- subquery, and subcorrelated subquery are the two main categories


-- arties and their longest track 

select *
From Artist a 
 join (select ArtistId, max(Milliseconds) LongestSongLength
		From track t 
			join Album a
			on a.AlbumId = t.AlbumId
		group by ArtistId
 ) maxSong
 on a.ArtistId = maxSong.ArtistId


 -- correlated subquery in the select statement 
 select a.ArtistId, 
		a.name,
		(select max(Milliseconds) LongestSongLength
		from track t
			join Album al 
				on al.AlbumId = t.AlbumId
		where al.ArtistId = a.ArtistId
		group by ArtistId
		)
From Artist a


-- which artists have no trakcs 
-- correlated subquery in the where clause
select *
from Artist a
where not exists (
select * 
from track t
	join Album al
			on  al.AlbumId = t.AlbumId
where al.ArtistId = a.ArtistId
)

--regular subquery
select *
from Artist a
where ArtistId not in (
	select ArtistId
	from track t
		join Album al
		on al.AlbumId = t.AlbumId
)

----------------------------------------------------------------------------------------
---------------------   union, except, union all   -------------------------------------
----------------------------------------------------------------------------------------

-- combining/comparing two or more resultsets that may or may not have anything in common

--1,2,3,4,5,6,7,8,9,10
--union
--8,9,10,11,12,13,14,15

-- unions returns only the numbers that are unique in the two datasets. --> 
-- unions need the datasets to have the same number of columns

--1,2,3,4,5,6,7,8,9,10
--except
--8,9,10,11,12,13,14,15

-- except returns only the numbers that are unique to the first set

select left(Name, 1)
from Artist

select left(FirstName, 1)
from Customer

select Email, 'Employee' as [type]
from Employee
union
select Email, 'Customer'
from Customer


-- intersect gives the middle portion of the venn diagram
select ArtistId 
from Artist a
intersect
select ArtistId
from Album

select left(FirstName, 1)
from Customer 
except 
select left(FirstName, 1)
from Employee
