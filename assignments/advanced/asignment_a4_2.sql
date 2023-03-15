-- Find the most popular 
-- color for each car type 
-- and the respective number of cars with that color
SELECT 
    car_type,
    color,
    COUNT(*) as count
FROM registered_cars
GROUP BY car_type, color
HAVING COUNT(*) = (
    SELECT MAX(count)
    FROM (
        SELECT car_type, COUNT(*) as count
        FROM registered_cars rc2
        WHERE rc2.car_type = registered_cars.car_type
        GROUP BY car_type, color
    )
)
ORDER BY count DESC;

