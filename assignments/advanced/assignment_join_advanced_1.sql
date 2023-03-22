/*
Find the total tax and the total CO2 emissions per brand 
for cars registered within the last 3 years, and 
order the results by total tax in descending order:
*/


SELECT rc.brand, SUM(rc.tax) as total_tax, SUM(cm.co2_emission_combined) as total_co2_emission
FROM registered_cars rc
JOIN cars_motor cm ON rc.plate = cm.plate
WHERE (strftime('%Y', 'now') - strftime('%Y', rc.registration_date)) <= 3
GROUP BY rc.brand
ORDER BY total_tax DESC;