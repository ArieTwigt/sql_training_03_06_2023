-- Find the 2-seater car (brand and model) that has te most total sales
SELECT cars.brand,
       cars.model,
       SUM(cars.price) AS total_sales
FROM registered_cars AS cars
WHERE cars.seats = 2
GROUP BY 1,2
ORDER BY total_sales DESC