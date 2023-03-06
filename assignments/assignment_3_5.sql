SELECT DISTINCT cars.brand, cars.model
FROM registered_cars AS cars
WHERE cars.brand = 'TOYOTA'
  AND cars.model LIKE "%COROLLA%"