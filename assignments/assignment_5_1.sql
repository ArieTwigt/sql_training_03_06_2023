
WITH cars_color AS (
    -- Subset 1: Overview of amount of cars grouped by country and color
        SELECT 
               brands.country,
               cars.color,
               COUNT(cars.color) AS amount
        FROM registered_cars AS cars
        JOIN car_brands AS brands
          ON cars.brand = brands.brand
        GROUP BY 1,2
)

-- Final set: Aggregate to see the most popular color for each country
SELECT cars_color.country,
       cars_color.color,
       MAX(cars_color.amount) AS max_amount
FROM cars_color
GROUP BY 1
ORDER BY 3 DESC