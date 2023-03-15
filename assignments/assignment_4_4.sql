-- How many cars have higher price than 1.000.000?
SELECT   COUNT(*) AS amount
FROM registered_cars AS cars
WHERE cars.price > 1000000
