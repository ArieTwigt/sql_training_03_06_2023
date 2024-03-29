WITH brands_motors AS (
    -- Subset 1: Create a join between the 'cars_motor' table and the 'registered_cars' table
    SELECT cars.brand,
       cars.model,
       motor.fuel_type_number,
       motor.net_power_fuel,
       motor.net_power_electric
    FROM cars_motor as motor
    JOIN registered_cars as cars
      ON motor.plate = cars.plate
), brands_motors_grouped AS (
   -- Subset 2: Group and aggregate the table so we have the power_fuel and power_electric on the same row
    SELECT brands_motors.brand,
           brands_motors.model,
           AVG(brands_motors.net_power_fuel) AS power_fuel,
           AVG(brands_motors.net_power_electric) AS power_electric
    FROM brands_motors
    GROUP BY 1, 2
    HAVING power_fuel > 0 
       AND power_electric > 0
)

-- Final set: Create the final table in which we have the percentage of electric power
SELECT  brands_motors_grouped.brand,
        brands_motors_grouped.model,
        ROUND(
        (brands_motors_grouped.power_electric / 
            (brands_motors_grouped.power_fuel + 
            brands_motors_grouped.power_electric)) * 100, 1) AS pct_power_electric
FROM brands_motors_grouped
ORDER BY pct_power_electric DESC