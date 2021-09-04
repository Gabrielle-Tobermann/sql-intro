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

