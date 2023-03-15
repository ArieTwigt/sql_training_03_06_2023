-- How many cars of the type hatchback have a higher price than 40.000?
SELECT cars.brand,
       cars.model
FROM registered_cars AS cars
WHERE cars.car_type = "hatchback"
  AND cars.price > 40000
GROUP BY 1,2