WITH t1 AS (SELECT c.CustomerId, Country,sum(Total) AS TotalSpent, c.FirstName,c.LastName 
			FROM Invoice i
			JOIN Customer c
			on i.CustomerId=c.CustomerId
			GROUP BY 1),
   t2 AS   (SELECT Country,Max(TotalSpent) as max_spent,CustomerId
			FROM t1
			GROUP BY 1)
SELECT t1.Country,max_spent, FirstName,LastName ,t1.CustomerId
FROM t1 
JOIN t2
on t1.Country=t2.Country  AND t1.TotalSpent=t2.max_spent
ORDER BY 1
