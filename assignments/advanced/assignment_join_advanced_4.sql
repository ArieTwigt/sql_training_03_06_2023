/*
Find the most common color per car 
type and the number of cars with that color:
*/

WITH color_count AS (
    SELECT rc.car_type, rc.color, COUNT(*) as count
    FROM registered_cars rc
    GROUP BY rc.car_type, rc.color
)
, max_color_count AS (
    SELECT car_type, MAX(count) as max_count
    FROM color_count
    GROUP BY car_type
)
SELECT cc.car_type, cc.color, cc.count
FROM color_count cc
JOIN max_color_count mcc ON cc.car_type = mcc.car_type AND cc.count = mcc.max_count;
