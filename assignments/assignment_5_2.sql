
WITH cars_hybrid AS (
    SELECT 
       cars.plate,
       cars.brand, 
       cars.price,
       SUM(motor.net_power_fuel) AS power_fuel,
       SUM(motor.net_power_electric) AS power_electric
    FROM registered_cars AS cars
    JOIN cars_motor AS motor
      ON cars.plate = motor.plate
    WHERE cars.brand IN ("VOLVO", "LEXUS")
    GROUP BY 1,2
    HAVING power_electric > 0
       AND power_fuel > 0
)


SELECT cars_hybrid.brand,
       ROUND(AVG(cars_hybrid.price), 2) AS avg_price
FROM cars_hybrid
GROUP BY 1
ORDER BY avg_price DESC