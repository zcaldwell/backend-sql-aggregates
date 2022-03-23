-- the top 10 cities with the most total rental payment amount
-- include the city name and sum
-- use SUM to sum up the amounts

SELECT
  city,
  SUM(amount) 
FROM 
  payment
INNER JOIN 
  customer
ON
  payment.customer_id = customer.customer_id
INNER JOIN
  address
ON
  address.address_id = customer.address_id
INNER JOIN 
  city
ON
  city.city_id = address.city_id
GROUP BY
  city 
ORDER BY
  sum DESC
LIMIT 
  10
  