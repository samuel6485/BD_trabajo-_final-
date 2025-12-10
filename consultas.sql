
-- CONSULTAS SQL SOLICITADAS

-- Asegúrate de usar la base de datos: USE PLATAFORMA_VIDEOJUEGOS;


-- CONSULTA 1: Conteo de Usuarios
-- Descripción: Contar el número total de usuarios registrados en la plataforma.

SELECT COUNT(*) AS total_usuarios 
FROM USUARIO;


-- CONSULTA 2: Agrupación de Barrios por Comuna
-- Descripción: Mostrar el nombre de la comuna y la cantidad de barrios asociados a cada una.

SELECT COMUNA, COUNT(*) AS cantidad_barrios 
FROM COMUNA_BARRIO 
GROUP BY COMUNA 
ORDER BY COMUNA;


-- CONSULTA 3: Alias en Columnas (Juegos)
-- Descripción: Seleccionar nombre y estudio desarrollador de todos los juegos
-- con alias personalizados.

SELECT nombre AS 'Título del Juego', 
       estudio_dev AS 'Empresa Desarrolladora' 
FROM JUEGO;


-- CONSULTA 4: Unión Implícita (Usuarios y Barrios)
-- Descripción: Mostrar nombre completo del usuario (Primer Nombre y Primer Apellido)
-- junto con el nombre del barrio en el que reside.

SELECT u.primer_nombre, 
       u.primer_apellido, 
       cb.barrio 
FROM USUARIO u, COMUNA_BARRIO cb 
WHERE u.COMUNA_BARRIO_id = cb.id
ORDER BY u.primer_nombre;


-- CONSULTA 5: Conteo de Juegos por Plataforma
-- Descripción: Indicar cuántos juegos hay registrados para cada plataforma.

SELECT PLATAFORMA_id, 
       COUNT(*) AS cantidad_juegos 
FROM JUEGO 
GROUP BY PLATAFORMA_id 
ORDER BY PLATAFORMA_id;


-- CONSULTA 6: Alias en Columnas (Equipos)
-- Descripción: Listar nombre de equipos y sus horas de entrenamiento con alias.

SELECT nombre AS 'Squad', 
       horas AS 'Tiempo Jugado' 
FROM EQUIPO_JUEGO;


-- CONSULTA 7: Unión Implícita (Equipos y Juegos)
-- Descripción: Mostrar nombre del equipo y nombre del juego en el que se especializa
-- usando unión implícita con WHERE.

SELECT eq.nombre AS nombre_equipo, 
       j.nombre AS nombre_juego 
FROM EQUIPO_JUEGO eq, JUEGO j 
WHERE eq.JUEGO_id = j.id
ORDER BY eq.nombre;


-- CONSULTA 8: Conteo de Juegos por Tipo
-- Descripción: Contar cuántos juegos existen por cada "tipo" (Shooter, MOBA, etc).

SELECT tipo, 
       COUNT(*) AS cantidad 
FROM JUEGO 
GROUP BY tipo 
ORDER BY cantidad DESC;


-- CONSULTA 9: Unión Implícita (Logros y Juegos)
-- Descripción: Listar nombres de logros/trofeos, puntos requeridos y nombre del juego
-- al que pertenecen usando unión implícita.

SELECT lt.nombre AS nombre_logro, 
       lt.puntos_req, 
       j.nombre AS nombre_juego 
FROM LOGRO_TROFEO lt, JUEGO j 
WHERE lt.JUEGO_id = j.id
ORDER BY j.nombre;


-- CONSULTA 10: Unión Implícita con Alias de Tabla (Sesiones y Árbitros)
-- Descripción: Mostrar fecha de sesión de entrenamiento y nombre del árbitro (usuario)
-- con alias de tabla para simplificar WHERE.

SELECT s.fecha_agenda, 
       u.primer_nombre, 
       u.primer_apellido 
FROM SESION_ENTRENAMIENTO s, USUARIO u 
WHERE s.arbitro = u.id
ORDER BY s.fecha_agenda;
