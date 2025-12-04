USE pelis_ejercicio;

-- ¿Cuántas películas tienen una duración superior a 120 minutos?
SELECT COUNT(*) AS Peliculas_superior_120_min
FROM peliculas
WHERE duracion >= 120;

-- ¿Cuántas películas tienen contenido adulto?
SELECT COUNT(*) AS contenido_adulto
FROM peliculas
WHERE adultos = true;

-- ¿Cuál es la película más antigua registrada en la base de datos?
SELECT titulo
FROM Peliculas
WHERE año = (SELECT MIN(año) FROM Peliculas);

-- Muestra el promedio de duración de las películas agrupado por género.
SELECT genero, AVG(duracion) AS promedio_duracion
FROM Peliculas
GROUP BY genero;

-- ¿Cuántas películas por año se han registrado en la base de datos? Ordena de mayor a menor.
SELECT año, COUNT(*) AS cantidad_por_año
FROM peliculas
GROUP BY año 
ORDER BY cantidad_por_año DESC;

-- ¿Cuál es el año con más películas en la base de datos?
SELECT año, COUNT(*) AS cantidad_por_año
FROM Peliculas
GROUP BY año
ORDER BY cantidad_por_año DESC
LIMIT 1;

-- Obtén un listado de todos los géneros y cuántas películas corresponden a cada uno.
SELECT genero, COUNT(*) AS cantidad_peliculas 
FROM peliculas
GROUP BY genero;


-- Muestra todas las películas cuyo título contenga la palabra "Godfather" (puedes usar cualquier palabra).
SELECT *
FROM PELICULAS
WHERE titulo LIKE '%Godfather%';



