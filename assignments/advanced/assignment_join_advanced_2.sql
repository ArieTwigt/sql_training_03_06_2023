/*
Find the brand and model of the car with the 
highest net power to weight ratio (sum of net_power_fuel 
and net_power_electric divided by the price):
*/

WITH power_to_weight AS (
    SELECT rc.brand, rc.model, (cm.net_power_fuel + cm.net_power_electric) / rc.price as ratio
    FROM registered_cars rc
    JOIN cars_motor cm ON rc.plate = cm.plate
)
SELECT brand, model, MAX(ratio) as highest_ratio
FROM power_to_weight;
