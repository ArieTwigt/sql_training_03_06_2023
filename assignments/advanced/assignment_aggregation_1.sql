/*
Calculate the price difference between 
the most expensive and least expensive car for each brand:
*/

WITH min_max_prices AS (
    SELECT brand, MIN(price) as min_price, MAX(price) as max_price
    FROM registered_cars
    GROUP BY brand
)
SELECT brand, (max_price - min_price) as price_difference
FROM min_max_prices;
