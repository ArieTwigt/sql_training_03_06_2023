/*
Find the top 3 most popular car 
types and their respective percentage 
of the total cars:
*/

WITH car_type_count AS (
    SELECT car_type, COUNT(*) as count
    FROM registered_cars
    GROUP BY car_type
)
, total_cars AS (
    SELECT COUNT(*) as total_count
    FROM registered_cars
)
SELECT car_type, count, (count * 100.0 / total_count) as percentage
FROM car_type_count, total_cars
ORDER BY count DESC
LIMIT 3;

