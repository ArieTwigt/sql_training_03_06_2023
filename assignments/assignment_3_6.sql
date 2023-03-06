SELECT cars.brand,
       SUBSTR(cars.model, 1, 1) || "-class" AS car,
       COUNT(*) AS aantal
FROM registered_cars AS cars 
WHERE cars.brand = "MERCEDES-BENZ"
GROUP BY 1,2
ORDER BY 3 DESC
