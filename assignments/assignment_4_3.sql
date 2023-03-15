-- What car has the highes price per seat?
SELECT cars.brand,
       cars.model,
       cars.price / cars.seats AS price_per_seat
FROM registered_cars AS cars
ORDER BY price_per_seat DESC


-- [GROUPED] What car has the highes price per seat?
SELECT cars.brand,
       cars.model,
       AVG(cars.price / cars.seats) AS average_price_per_seat
FROM registered_cars AS cars
GROUP BY 1,2
ORDER BY average_price_per_seat DESC