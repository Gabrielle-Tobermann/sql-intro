-- show invoices associated with each sales agent - include agent's fill name
select e.FirstName [EmpFirstName], e.LastName [EmpLastName], i.*
from Invoice i, Customer c, Employee e
where e.EmployeeId = c.SupportRepId AND c.CustomerId = i.CustomerId

