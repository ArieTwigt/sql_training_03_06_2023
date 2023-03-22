SELECT cars_hybrid.pct_electric_cat,
       COUNT(cars_hybrid.pct_electric_cat) as amount
FROM cars_overview_hybrid as cars_hybrid
GROUP BY 1