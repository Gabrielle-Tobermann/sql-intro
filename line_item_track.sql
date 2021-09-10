-- Provide a query that includes the purchased track name with each invoice line item.

select InvoiceLineId, InvoiceId, il.TrackId, il.UnitPrice, Quantity, t.Name
from InvoiceLine il
join Track t
	on t.TrackId = il.TrackId