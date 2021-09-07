-- non US customers

select *
from Customer
where not Country = 'USA'
