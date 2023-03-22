-- For which car is the reletive difference between fuel power and electrical power the largest?

WITH brands_motor AS (
    /*
    Subset 1: - Join the cars table with the motors table
              - Aggregate/sum the power_fuel, power_electric columns, to get the power on the same row
              - Group by the brand and model columns
    */      
    SELECT cars.brand,
       cars.model,
       SUM(motor.net_power_fuel) AS power_fuel,
       SUM(motor.net_power_electric) AS power_electric
    FROM cars_motor AS motor
    JOIN registered_cars AS cars
      ON motor.plate = cars.plate
    GROUP BY 1,2
    HAVING power_fuel > 0 
       AND power_electric > 0
), brands_motor_power AS (
    -- Subset 2: - Create the relative/pct columns for power_fuel and power_electric to get the relative powers
    SELECT brands_motor.brand,
       brands_motor.model,
       brands_motor.power_fuel / 
                (brands_motor.power_fuel + 
                 brands_motor.power_electric ) * 100
            AS pct_power_fuel,
        brands_motor.power_electric / 
                (brands_motor.power_fuel + 
                 brands_motor.power_electric ) * 100
            AS pct_power_electric
FROM brands_motor
)

-- Final set: Calculate the absolute differences between power_fuel and power_electric
SELECT 
       brands_motor_power.brand,
       brands_motor_power.model,
       brands_motor_power.pct_power_fuel,
       brands_motor_power.pct_power_electric,
       ROUND(ABS(pct_power_fuel - pct_power_electric), 1)
          AS power_difference
FROM brands_motor_power
ORDER BY power_difference ASC

