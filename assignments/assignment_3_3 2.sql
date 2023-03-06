WITH hybrid_cars AS (
    SELECT cars.brand,
       cars_motor.net_power_electric,
       cars_motor.net_power_fuel
     FROM registered_cars AS cars
     JOIN cars_motor
       ON cars.plate = cars_motor.plate
       WHERE cars_motor.net_power_electric > 0
)

SELECT car_brands.country,
       COUNT(car_brands.country) AS amount
FROM hybrid_cars
JOIN car_brands
  ON hybrid_cars.brand = car_brands.brand
GROUP BY 1
ORDER BY amount DESC