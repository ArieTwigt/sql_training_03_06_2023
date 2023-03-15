SELECT
    car_type,
    COUNT(*) as count,
    (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM registered_cars)) as percentage
FROM registered_cars
GROUP BY car_type
ORDER BY count DESC
LIMIT 3;

