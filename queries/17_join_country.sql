SELECT 
       brands.country,
       COUNT(brands.country) AS amount
FROM registered_cars AS cars
JOIN car_brands AS brands
  ON cars.brand = brands.brand
GROUP BY 1
ORDER BY 2 DESC