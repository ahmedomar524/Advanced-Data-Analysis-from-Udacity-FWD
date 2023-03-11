SELECT ar.Name as Artist_Name,sum(il.Quantity) AS Total_sales
FROM Track t
JOIN InvoiceLine il
ON il.TrackId=t.TrackId
JOIN Album ab
ON ab.AlbumId=t.AlbumId
JOIN Artist ar
ON ar.ArtistId=ab.ArtistId
GROUP BY 1
ORDER BY 2 DESC

