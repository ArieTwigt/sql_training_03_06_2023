/*
 Find the total tax and the total CO2 emissions 
 per brand for cars registered within the last 3 years, 
 and order the results by total tax in descending order:
*/
SELECT cars.plate, 
       cars.tax,
       julianday('now') - date('2023-03-10') ,
       motor.co2_emission_combined
FROM cars_motor AS motor
JOIN registered_cars AS cars
  ON motor.plate = cars.plate
LIMIT 10




