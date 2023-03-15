
WITH cars_tax_percentage AS (
    SELECT cars.car_type,
           cars.tax / cars.price * 100 AS tax_percentage
    FROM registered_cars AS cars
)

SELECT cars_tax_percentage.car_type,
       AVG(cars_tax_percentage.tax_percentage) AS average_tax_percentage
FROM cars_tax_percentage
GROUP BY 1
ORDER BY 2 DESC