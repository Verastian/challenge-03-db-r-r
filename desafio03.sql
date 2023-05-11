-- 1. Crear una base de datos llamada películas.
CREATE DATABASE movies_csv;

-- 2. Cargar ambos archivos a su tabla correspondiente y aplicar el truncado de estas.
-- tabla Peliculas
CREATE TABLE peliculas (
    id INTEGER,
    Pelicula TEXT,
    "Año estreno" INTEGER,
    Director TEXT
);
TRUNCATE TABLE peliculas;
SELECT * FROM peliculas;
-- tabla Reparto
CREATE TABLE reparto (
    id_pelicula INTEGER,
    actor TEXT
);

ALTER TABLE reparto ADD COLUMN id SERIAL PRIMARY KEY;

TRUNCATE TABLE reparto;
SELECT * FROM reparto;
-- Cargar archivo CSV desde psql tool

-- COPY peliculas(id,Pelicula,"Año estreno",Director) FROM 'B:\RUBY ON RAILS\Modulo_02\Desafio_evaluado\T
-- op _100\peliculas.csv' DELIMITER ',' CSV HEADER;

 -- COPY reparto FROM 'B:\RUBY ON RAILS\Modulo_02\Desafio_evaluado\Top _100\reparto.csv' DELIMITER ',' CSV;

-- 3. Obtener el ID de la película “Titanic”
SELECT id FROM peliculas WHERE pelicula = 'Titanic';
-- 4. Listar a todos los actores que aparecen en la película "Titanic".
SELECT r.actor FROM reparto r JOIN peliculas p ON p.id = r.id_pelicula WHERE p.pelicula = 'Titanic';
-- 5. Consultar en cuántas películas del top 100 participa Harrison Ford.
SELECT COUNT(*) FROM reparto r WHERE r.actor = 'Harrison Ford';
-- 6. Indicar las películas estrenadas entre los años 1990 y 1999 ordenadas 
-- por título de manera ascendente.
SELECT Pelicula P FROM peliculas   WHERE "Año estreno" BETWEEN 1990 AND 1999  ORDER BY P ASC;
-- 7. Hacer una consulta SQL que muestre los títulos con su longitud, 
-- la longitud debe ser nombrado para la consulta como “longitud_titulo”.
SELECT Pelicula, LENGTH(Pelicula) AS longitud_titulo FROM peliculas;
-- 8. Consultar cual es la longitud más grande entre todos los títulos de las películas.
SELECT MAX(LENGTH(Pelicula)) AS longitud_maxima FROM peliculas;
