-- Which country produces the most hybrid cars?

WITH hybrid_cars AS (
    -- Subset 1: Join the cars table with the motors table to get an overview of the hybrid cars
    SELECT cars.plate,
       cars.brand,
       SUM(motor.net_power_electric) AS power_electric,
       SUM(motor.net_power_fuel) AS power_fuel
    FROM registered_cars AS cars
    JOIN cars_motor AS motor
      ON cars.plate = motor.plate
    GROUP BY 1,2
    HAVING power_electric > 0
       AND power_fuel > 0
)

SELECT brands.country,
       COUNT(brands.country) AS amount
FROM hybrid_cars 
JOIN car_brands AS brands
  ON hybrid_cars.brand = brands.brand
GROUP BY 1
ORDER BY amount DESC