WITH cars_power AS (
    SELECT cars.plate,
       cars.brand,
       cars.model,
       SUM(motor.net_power_fuel) AS power_fuel,
       SUM(motor.net_power_electric) AS power_electric
    FROM registered_cars AS cars
    JOIN cars_motor AS motor
      ON cars.plate = motor.plate
    WHERE cars.brand = 'VOLVO'
      AND cars.model = 'XC40'
      AND cars.plate = 'K807KS'
    GROUP BY 1,2,3
)

SELECT cars_power.plate,
       cars_power.brand, 
       cars_power.model,
       cars_power.power_fuel + cars_power.power_electric AS total_power
FROM cars_power