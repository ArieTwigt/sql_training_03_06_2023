WITH cars_dates AS (
SELECT cars.brand,
       cars.model,
       strftime("%Y-%m-%d", -- Indicate the format of the date
                            -- Manually compose the date
                date(
                     SUBSTR(cars.registration_date, 1, 4) || "-" ||
                     SUBSTR(cars.registration_date, 5, 2) || "-" ||
                     SUBSTR(cars.registration_date, 7, 2)
                )
       ) as registration_date,
       date('now') AS current_date
    
FROM registered_cars AS cars
WHERE cars.brand = "FORD"
)

SELECT ROUND(julianday('now') - julianday(registration_date), 0) AS days_registered
FROM cars_dates