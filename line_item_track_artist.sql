-- Provide a query that includes the purchased track name AND artist name with each invoice line item.

select InvoiceLineId, InvoiceId, il.TrackId, il.UnitPrice, Quantity, t.Name, t.Composer
from InvoiceLine il
join Track t
		on il.TrackId = t.TrackId