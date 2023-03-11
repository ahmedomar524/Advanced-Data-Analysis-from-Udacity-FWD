WITH t1 AS (SELECT sum(il.Quantity) purchases,i.BillingCountry, g.Name,g.GenreId
			FROM Invoice i
			JOIN InvoiceLine il
			ON i.InvoiceId=il.InvoiceId  
			JOIN Track t
			ON il.TrackId=t.TrackId
			JOIN Genre g
			ON t.GenreId=g.GenreId
			GROUP BY 2,3
			ORDER BY 2,3),
	 t2 AS (SELECT t1.BillingCountry,max(t1.purchases) AS max_purchases 
			FROM t1
			GROUP BY 1 )
SELECT max_purchases ,t1.BillingCountry,t1.Name ,t1.GenreId
from t1
JOIN t2
on t1.BillingCountry=t2.BillingCountry  AND t1.purchases=t2.max_purchases