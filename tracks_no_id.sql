-- Provide a query that shows all the Tracks, but displays no IDs. The result should include the Album name, Media type and Genre.

select t.Name, Composer, Milliseconds, Bytes, UnitPrice, al.Title [album], mt.Name [media type]
from Track t
join MediaType mt
		on mt.MediaTypeId = t.MediaTypeId
join Album al 
		on al.AlbumId = t.AlbumId
group by al.Title, mt.Name, t.Name, Composer, Milliseconds, Bytes, UnitPrice
