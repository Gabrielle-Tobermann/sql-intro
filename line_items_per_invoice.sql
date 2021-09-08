-- Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for each Invoice.

select count(InvoiceId) [lines per invoice]
from InvoiceLine
group by InvoiceId