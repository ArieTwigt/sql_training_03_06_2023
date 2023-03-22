SELECT cars.brand,
       cars.model,
       cars.price,
       cars.registration_date,
       strftime('%Y-%m-%d %H:%M:%S', cars.registration_date) AS registration_date_time
FROM registered_cars AS cars
WHERE cars.brand = 'PORSCHE';
