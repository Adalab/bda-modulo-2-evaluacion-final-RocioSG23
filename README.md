EVALUACIÓN FINAL MÓDULO 2
Ejercicio técnico sobre código SQL

Consultas SQL - Base de datos Sakila
Este repositorio contiene varias consultas SQL realizadas sobre la base de datos Sakila, la cual se usa en entornos educativos como ejemplo simulando el alquiler de películas e incluye varias tablas como las de actores, clientes y alquileres.


Tecnologías
Se ha utilizado MySQL Workbench


Descripción
El objetivo de este proyecto es practicar realizando distintas de consultas SQL sobre una base de datos relacional. Se incluyen consultas de selección, filtrado, agregación y joins entre tablas.
Las tablas utilizadas son:
•	film 
•	actor 
•	customer 
•	rental 
•	category 
•	film_category 
•	inventory 


Consultas realizadas
1.	Obtener títulos de películas sin duplicados
* Uso de Distinct para obtener valores únicos.
-	SELECT DISTINCT title FROM film;
2.	Películas con clasificación "PG-13": 
*Uso de Where para filtrar con condición.
-	SELECT title FROM film WHERE rating = "PG-13";
3.	Películas cuya descripción contiene "amazing"
*Uso de wher (condición) apoyado por el filtro “like”
-	SELECT title, description FROM film WHERE description LIKE '%amazing%';
4.	Películas con duración mayor a 120 minutos
-	SELECT title FROM film WHERE length >= 120;
5.	Obtener nombres de todos los actores
-	SELECT first_name FROM actor;
6.	Actores con apellido que contiene "Gibson"
-	SELECT first_name, last_name FROM actor WHERE last_name LIKE '%Gibson%';
7.	Actores con actor_id entre 10 y 20
*Empleo de between para seleccionar un rango
-	SELECT first_name FROM actor WHERE actor_id BETWEEN 10 AND 20;
8.	Películas que no sean R ni PG-13
-	SELECT title FROM film WHERE rating NOT IN ('R', 'PG-13');
9.	Cantidad total de películas por clasificación
-	SELECT rating, COUNT(*) FROM film GROUP BY rating;
10.	Cantidad de películas alquiladas por cada cliente
-	SELECT customer.customer_id, customer.first_name, customer.last_name, COUNT(rental.rental_id) AS peliculas_alquiladas
FROM customer
LEFT JOIN rental ON customer.customer_id = rental.customer_id
GROUP BY customer.customer_id, customer.first_name, customer.last_name
ORDER BY peliculas_alquiladas;
11.	Cantidad total de películas alquiladas por categoría
-	SELECT category.name, COUNT(rental.rental_id) AS recuento_alquileres
FROM category
INNER JOIN film_category fc ON fc.category_id = category.category_id
INNER JOIN film ON film.film_id = fc.film_id
INNER JOIN inventory ON inventory.film_id = film.film_id
INNER JOIN rental ON inventory.inventory_id = rental.inventory_id
GROUP BY category.name
ORDER BY recuento_alquileres;
12.	Promedio de duración de películas por clasificación
SELECT rating, AVG(length) AS promedio_duracion FROM film GROUP BY rating;
13.	Actores que aparecen en la película "Indian Love"
SELECT first_name, last_name
FROM actor a
INNER JOIN film_actor fa ON fa.actor_id =  a.actor_id
INNER JOIN film f ON f.film_id = fa.film_id
WHERE title = "Indian Love";
14.	Películas cuya descripción contiene "dog" o "cat"
SELECT title FROM film WHERE description LIKE '%dog%' OR description LIKE'%cat%';
15.	Películas lanzadas entre 2005 y 2010
SELECT title FROM film WHERE release_year BETWEEN 2005 AND 2010;

