SELECT * 
FROM (
SELECT cars.brand,
       SUM(cars.price) AS total_sum,
       ROUND(AVG(cars.price), 0) AS average_price,
       MIN(cars.price) AS min_price,
       MAX(cars.price) AS max_price,
       COUNT(cars.price) AS total_amount
FROM registered_cars AS cars
WHERE cars.price <= 100000
GROUP BY 1
HAVING average_price BETWEEN 10000 AND 30000
   AND total_amount > 10
ORDER BY total_amount DESC
LIMIT 10
)
ORDER BY brand