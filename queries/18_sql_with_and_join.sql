WITH cars_tax AS (
    SELECT brands.country,
           cars.tax / cars.price * 100 AS tax_percentage
    FROM registered_cars AS cars
    JOIN car_brands AS brands
      ON cars.brand = brands.brand
)

SELECT country,
       ROUND(AVG(tax_percentage), 1) AS average_tax_percentage
FROM cars_tax
GROUP BY 1
ORDER BY 2 DESC