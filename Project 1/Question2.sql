SELECT t.Name,t.Milliseconds,ar.Name as Artist_Name
FROM Track t
JOIN Album ab
ON ab.AlbumId=t.AlbumId
JOIN Artist ar
ON ar.ArtistId=ab.ArtistId
WHERE Milliseconds>(SELECT avg(Milliseconds)
					FROM Track)
ORDER BY 2 DESC					