

SELECT AVG(cars_tax.tax_pct)
FROM (
    SELECT cars.brand,
       cars.model,
       (cars.tax / cars.price) * 100 AS tax_pct
    FROM registered_cars AS cars
) AS cars_tax

