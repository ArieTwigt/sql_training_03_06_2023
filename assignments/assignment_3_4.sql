WITH brands_motor AS (SELECT cars.plate,
                             cars.brand,
                             cars.model,
                             motor.fuel_type_number,
                             motor.net_power_fuel AS power_fuel,
                             motor.net_power_electric AS power_electric
                      FROM registered_cars AS cars
                      LEFT JOIN cars_motor AS motor
                      ON cars.plate = motor.plate
), brands_motor_grouped AS (
    SELECT brands_motor.brand,
       brands_motor.model,
       brands_motor.plate,
       SUM(brands_motor.power_fuel) AS power_fuel,
       SUM(brands_motor.power_electric) AS power_electric
    FROM brands_motor
    GROUP BY 1,2,3
    HAVING power_electric IS NOT NULL
    --HAVING plate = 'P634RF'
), brands_motor_grouped_power AS (
    SELECT 
       --brands_motor_grouped.plate,
       brands_motor_grouped.brand,
       brands_motor_grouped.model,
       ROUND(
         AVG(
             (brands_motor_grouped.power_electric / 
             (brands_motor_grouped.power_fuel + 
              brands_motor_grouped.power_electric)) * 100
          ), 1) AS relative_power_electric,

       ROUND(
         AVG(
             (brands_motor_grouped.power_fuel / 
             (brands_motor_grouped.power_fuel + 
              brands_motor_grouped.power_electric)) * 100
          ), 1) AS relative_power_fuel
FROM brands_motor_grouped
GROUP BY 1,2
)

SELECT *,
       ABS(brands_motor_grouped_power.relative_power_electric -
       brands_motor_grouped_power.relative_power_fuel) AS power_difference
FROM brands_motor_grouped_power
ORDER BY power_difference DESC