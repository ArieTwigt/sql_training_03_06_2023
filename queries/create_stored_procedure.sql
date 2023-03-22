USE Cars;
GO

CREATE PROCEDURE get_top_models
    @TopAmount INTEGER,
    @MinPrice INTEGER,
    @MaxPrice INTEGER
AS 

SELECT TOP (@TopAmount)
       cars.brand, 
       cars.model,
       AVG(cars.price) AS avg_price
FROM registered_cars AS cars
GROUP BY cars.brand, cars.model
HAVING AVG(cars.price) BETWEEN @MinPrice AND @MaxPrice
ORDER BY avg_price DESC;