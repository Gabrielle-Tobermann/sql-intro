 -- Provide a query that shows the # of invoices per country.

 select count(InvoiceId) [# invoices per country], BillingCountry
 from Invoice
 group by BillingCountry