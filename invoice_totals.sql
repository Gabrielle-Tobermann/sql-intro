-- Provide a query that shows the Invoice Total, Customer name, Country and Sale Agent name for all invoices and customers.

select sum(i.Total) [Invoice Total], c.FirstName [cusFirst], c.LastName [cusLast], c.Country, e.FirstName [empFirst], e.LastName [empLast]
from Invoice i, Customer c , Employee e
where i.CustomerId = c.CustomerId AND e.EmployeeId = c.SupportRepId
group by c.FirstName, c.LastName, c.Country, e.FirstName, e.LastName