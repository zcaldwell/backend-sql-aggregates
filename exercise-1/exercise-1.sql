
SELECT
  title,
  COUNT (rental_date)
FROM
  film
INNER JOIN
  inventory
ON 
  film.film_id = inventory.film_id
INNER JOIN
  rental
ON
  inventory.inventory_id = rental.inventory_id
GROUP BY
  film.film_id
ORDER BY 
  count DESC
LIMIT  
  10






