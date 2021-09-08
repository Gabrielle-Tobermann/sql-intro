-- How many Invoices were there in 2009 and 2011?
select
count(case when InvoiceDate like '%2009%' then 1 else null end) [2009],
count(case when InvoiceDate like '%2011%' then 1 else null end) [2011]
from Invoice