SELECT cars.brand, 
       cars.model,
       cars.price,
       cars.tax
FROM registered_cars AS cars
WHERE cars.tax <= 1000 
  AND cars.brand = "BMW"
ORDER BY cars.model 