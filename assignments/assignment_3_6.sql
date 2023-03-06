SELECT cars.brand,
       SUBSTR(cars.model, 1, 1) || "-class" AS car
FROM registered_cars AS cars 
WHERE cars.brand = "MERCEDES-BENZ"