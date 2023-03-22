/*
Find the most popular color 
for each car type and the respective 
number of cars with that color:
*/

WITH color_count AS (
    SELECT car_type, color, COUNT(*) as count
    FROM registered_cars
    GROUP BY car_type, color
)
, max_color_count AS (
    SELECT car_type, MAX(count) as max_count
    FROM color_count
    GROUP BY car_type
)
SELECT cc.car_type, cc.color, cc.count
FROM color_count cc
JOIN max_color_count mcc ON cc.car_type = mcc.car_type AND cc.count = mcc.max_count;

