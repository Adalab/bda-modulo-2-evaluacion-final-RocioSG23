-- Ejercicio 2. Base de Datos Sakila
-- María del Rocío Sánchez Gálvez Promo 59

use sakila;
-- 1. Selecciona todos los nombres de las películas sin que aparezcan duplicados.
SELECT DISTINCT title
FROM film;

-- 2. Muestra los nombres de todas las películas que tengan una clasificación de "PG-13".
SELECT title
FROM film
WHERE rating = "PG-13";

-- 3. Encuentra el título y la descripción de todas las películas que contengan la palabra "amazing" en su descripción.
SELECT title, description
FROM film
WHERE description LIKE '%amazing%';

-- 4. Encuentra el título de todas las películas que tengan una duración mayor a 120 minutos.
SELECT title
FROM film
WHERE length >= 120;

-- 5. Recupera los nombres de todos los actores.
SELECT first_name
FROM actor;

-- 6. Encuentra el nombre y apellido de los actores que tengan "Gibson" en su apellido.
SELECT first_name, last_name
FROM actor
WHERE last_name LIKE '%Gibson%';

-- 7. Encuentra los nombres de los actores que tengan un actor_id entre 10 y 20.
SELECT first_name
FROM actor
WHERE actor_id BETWEEN 10 AND 20;

-- 8. Encuentra el título de las películas en la tabla film que no sean ni "R" ni "PG-13" en cuanto a su clasificación.
SELECT title
FROM film
WHERE rating NOT LIKE '%R%' AND rating NOT LIKE '%PG-13%';

-- ALTERNATIVA
SELECT title
FROM film
WHERE rating NOT IN ('R', 'PG-13');


-- 9. Encuentra la cantidad total de películas en cada clasificación de la tabla film y muestra la clasificación junto con el recuento.
SELECT rating, COUNT(*)
FROM film
GROUP BY rating;

-- 10. Encuentra la cantidad total de películas alquiladas por cada cliente y muestra el ID del cliente, su nombre y apellido junto con la cantidad de películas alquiladas.
    -- Uso de left join para que se incluyan todos los clientes, tanto si tienen peliculas alquiladas como si no.
SELECT customer.customer_id, customer.first_name, customer.last_name, COUNT(rental.rental_id) AS peliculas_alquiladas
FROM customer
LEFT JOIN rental ON customer.customer_id = rental.customer_id
GROUP BY customer.customer_id, customer.first_name, customer.last_name
ORDER BY peliculas_alquiladas;


-- 11. Encuentra la cantidad total de películas alquiladas por categoría y muestra el nombre de la categoría junto con el recuento de alquileres.
SELECT category.name, COUNT(rental.rental_id) AS recuento_alquileres
FROM category
INNER JOIN film_category fc ON fc.category_id = category.category_id
INNER JOIN film ON film.film_id = fc.film_id
INNER JOIN inventory ON inventory.film_id = film.film_id
INNER JOIN rental ON inventory.inventory_id = rental.inventory_id
GROUP BY category.name
ORDER BY recuento_alquileres;


-- 12. Encuentra el promedio de duración de las películas para cada clasificación de la tabla film y muestra la clasificación junto con el promedio de duración.


-- 13. Encuentra el nombre y apellido de los actores que aparecen en la película con title "Indian Love".


-- 14. Muestra el título de todas las películas que contengan la palabra "dog" o "cat" en su descripción.


-- 15. Encuentra el título de todas las películas que fueron lanzadas entre el año 2005 y 2010.

