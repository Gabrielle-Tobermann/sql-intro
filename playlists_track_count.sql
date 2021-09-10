 -- Provide a query that shows the total number of tracks in each playlist. The Playlist name should be include on the resultant table.

 select count(TrackId) [num of tracks], p.Name [Playlist Name]
 from PlaylistTrack pt
 join Playlist p
		on p.PlaylistId = pt.PlaylistId
group by p.Name