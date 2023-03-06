SELECT cars.brand, 
       cars.model, 
       cars.price
FROM registered_cars AS cars
WHERE cars.price BETWEEN 100000 AND 200000