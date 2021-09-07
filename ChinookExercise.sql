-- non US customers

select *
from Customer
where not Country = 'USA'


-- Customers from Brazil 

select *
from Customer 
where Country = 'Brazil'



-- show invoices for customers from Brazil - name, invoice, date of invoice, billing country

select FirstName, LastName, BillingCountry, InvoiceDate, InvoiceId
from Customer c
	join Invoice i 
		on i.CustomerId = c.CustomerId
where BillingCountry = 'Brazil'



-- show employees who are Sales Agents 
select *
from Employee
where title = 'Sales Support Agent'



-- show distinct billing countries from Invoice 
select distinct BillingCountry
from Invoice



-- show invoices assiciated with each sales agent - include agent's fill name
