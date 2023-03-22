/*
Find the top 3 brands with the 
highest average net power (electric and fuel) 
for electric cars (cars with net_power_electric > 0), 
and order the results by the average net power 
in descending order:
*/


WITH electric_brands AS (
    SELECT rc.brand, AVG(cm.net_power_fuel + cm.net_power_electric) as average_net_power
    FROM registered_cars rc
    JOIN cars_motor cm ON rc.plate = cm.plate
    WHERE cm.net_power_electric > 0
    GROUP BY rc.brand
)
SELECT brand, average_net_power
FROM electric_brands
ORDER BY average_net_power DESC
LIMIT 3;
