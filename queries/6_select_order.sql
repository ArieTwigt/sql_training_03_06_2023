SELECT cars.brand, 
       cars.model, 
       cars.price
FROM registered_cars AS cars
ORDER BY cars.price DESC, 
         cars.brand, 
         cars.model DESC