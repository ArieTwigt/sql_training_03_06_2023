/*
Find the average fuel consumption and 
CO2 emissions per fuel type, only 
considering car types with more than 5 registered cars:
*/

WITH car_type_count AS (
    SELECT rc.car_type, COUNT(*) as count
    FROM registered_cars rc
    GROUP BY rc.car_type
    HAVING count > 5
)
SELECT cm.fuel_type_description, AVG(cm.fuel_consumption_combined) as avg_fuel_consumption, AVG(cm.co2_emission_combined) as avg_co2_emission
FROM registered_cars rc
JOIN cars_motor cm ON rc.plate = cm.plate
JOIN car_type_count ctc ON rc.car_type = ctc.car_type
GROUP BY cm.fuel_type_description;
