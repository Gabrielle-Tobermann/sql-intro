-- show invoices for customers from Brazil - name, invoice, date of invoice, billing country

select FirstName, LastName, BillingCountry, InvoiceDate, InvoiceId
from Customer c
	join Invoice i 
		on i.CustomerId = c.CustomerId
where BillingCountry = 'Brazil'
