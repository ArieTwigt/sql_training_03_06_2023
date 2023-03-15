-- From these 2-seater cars, which color has the highest price on average?
SELECT cars.color,
       AVG(cars.price) AS average_price
FROM registered_cars AS cars
WHERE cars.seats = 2
GROUP BY 1
ORDER BY average_price DESC