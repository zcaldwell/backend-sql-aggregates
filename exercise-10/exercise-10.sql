-- CUBE of amount made per year, month, day, and film rating
-- similar to exercise 9 but include the rating with joins
-- replace ROLLUP with CUBE
SELECT 
  SUM(amount),
  EXTRACT (YEAR from payment_date) AS y,
  EXTRACT (MONTH from payment_date) AS m,
  EXTRACT (DAY from payment_date) AS d,
  rating
FROM
  payment
INNER JOIN
  rental
ON  
  payment.rental_id = rental.rental_id
INNER JOIN
  inventory
ON
  rental.inventory_id = inventory.inventory_id
INNER JOIN
  film
ON
  inventory.film_id = film.film_id
GROUP BY
  CUBE (y, m, d, film.rating)
ORDER BY
  rating, y, m, d