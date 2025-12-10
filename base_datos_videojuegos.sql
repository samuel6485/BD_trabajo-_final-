
-- BASE DE DATOS: PLATAFORMA DE VIDEOJUEGOS


-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS PLATAFORMA_VIDEOJUEGOS;
USE PLATAFORMA_VIDEOJUEGOS;


-- CREAR TABLAS


-- Tabla: CONTROL
CREATE TABLE CONTROL (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre_serie VARCHAR(45) NOT NULL,
    tipo VARCHAR(45) NOT NULL,
    CONSOLA_id INT
);

-- Tabla: INT (tabla de referencia)
CREATE TABLE INT_TABLE (
    id INT PRIMARY KEY AUTO_INCREMENT,
    descripcion VARCHAR(45)
);

-- Tabla: CONSOLA
CREATE TABLE CONSOLA (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(45) NOT NULL,
    numero_serie VARCHAR(45) NOT NULL,
    existencia_inventario INT
);

-- Tabla: TIPO_USUARIO
CREATE TABLE TIPO_USUARIO (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(45) NOT NULL,
    descripcion VARCHAR(45)
);

-- Tabla: COMUNA_BARRIO
CREATE TABLE COMUNA_BARRIO (
    id INT PRIMARY KEY AUTO_INCREMENT,
    COMUNA VARCHAR(45) NOT NULL,
    barrio VARCHAR(45) NOT NULL
);

-- Tabla: USUARIO
CREATE TABLE USUARIO (
    id INT PRIMARY KEY AUTO_INCREMENT,
    tipo_documento VARCHAR(45) NOT NULL,
    numero_documento VARCHAR(45) NOT NULL,
    primer_nombre VARCHAR(45) NOT NULL,
    segundo_nombre VARCHAR(45),
    primer_apellido VARCHAR(45) NOT NULL,
    segundo_apellido VARCHAR(45),
    fecha_nacimiento DATE,
    sexo VARCHAR(1),
    direccion_domicilio VARCHAR(45),
    nickname VARCHAR(45),
    clave VARCHAR(45),
    acidembe INT,
    COMUNA_BARRIO_id INT,
    TIPO_USUARIO_id INT,
    FOREIGN KEY (COMUNA_BARRIO_id) REFERENCES COMUNA_BARRIO(id),
    FOREIGN KEY (TIPO_USUARIO_id) REFERENCES TIPO_USUARIO(id)
);

-- Tabla: PLATAFORMA
CREATE TABLE PLATAFORMA (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(45) NOT NULL,
    marca VARCHAR(45)
);

-- Tabla: JUEGO
CREATE TABLE JUEGO (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(45) NOT NULL,
    clasificacion_ESRB VARCHAR(45),
    estudio_dev VARCHAR(45) NOT NULL,
    plataformas_disponibles VARCHAR(45),
    numero_jugadores VARCHAR(45),
    tipo VARCHAR(45),
    PLATAFORMA_id INT,
    FOREIGN KEY (PLATAFORMA_id) REFERENCES PLATAFORMA(id)
);

-- Tabla: LOGRO_TROFEO
CREATE TABLE LOGRO_TROFEO (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(45) NOT NULL,
    puntos_req INT,
    JUEGO_id INT,
    FOREIGN KEY (JUEGO_id) REFERENCES JUEGO(id)
);

-- Tabla: EQUIPO_JUEGO
CREATE TABLE EQUIPO_JUEGO (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(45) NOT NULL,
    horas INT,
    rival INT,
    JUEGO_id INT,
    FOREIGN KEY (JUEGO_id) REFERENCES JUEGO(id)
);

-- Tabla: SESION_ENTRENAMIENTO
CREATE TABLE SESION_ENTRENAMIENTO (
    id INT PRIMARY KEY AUTO_INCREMENT,
    fecha_agenda DATE NOT NULL,
    hora_in DATETIME NOT NULL,
    hora_fin DATETIME NOT NULL,
    JUEGO_id INT,
    arbitro INT,
    FOREIGN KEY (JUEGO_id) REFERENCES JUEGO(id),
    FOREIGN KEY (arbitro) REFERENCES USUARIO(id)
);

-- Tabla: TELEFONO
CREATE TABLE TELEFONO (
    id INT PRIMARY KEY AUTO_INCREMENT,
    numero VARCHAR(45) NOT NULL,
    tipo VARCHAR(45),
    USUARIO_id INT,
    FOREIGN KEY (USUARIO_id) REFERENCES USUARIO(id)
);


-- INSERTS DE DATOS

-- Inserts en TIPO_USUARIO
INSERT INTO TIPO_USUARIO (nombre, descripcion) VALUES
('Jugador', 'Usuario que juega en la plataforma'),
('Árbitro', 'Usuario que arbitrae sesiones'),
('Admin', 'Administrador del sistema'),
('Entrenador', 'Entrenador de equipo'),
('Scout', 'Buscador de talentos'),
('Espectador', 'Usuario que ve transmisiones'),
('Analista', 'Analista de gameplay'),
('Moderador', 'Moderador de la comunidad'),
('Desarrollador', 'Desarrollador de contenido'),
('VIP', 'Usuario premium');

-- Inserts en COMUNA_BARRIO
INSERT INTO COMUNA_BARRIO (COMUNA, barrio) VALUES
('Engativá', 'Barrio 1'),
('Engativá', 'Barrio 2'),
('Usaquén', 'Barrio 3'),
('Usaquén', 'Barrio 4'),
('Teusaquillo', 'Barrio 5'),
('Teusaquillo', 'Barrio 6'),
('La Candelaria', 'Barrio 7'),
('La Candelaria', 'Barrio 8'),
('Puente Aranda', 'Barrio 9'),
('Puente Aranda', 'Barrio 10'),
('Mártires', 'Barrio 11'),
('Mártires', 'Barrio 12'),
('Chapinero', 'Barrio 13'),
('Chapinero', 'Barrio 14'),
('Santa Fe', 'Barrio 15'),
('Santa Fe', 'Barrio 16'),
('San Cristóbal', 'Barrio 17'),
('San Cristóbal', 'Barrio 18'),
('Usme', 'Barrio 19'),
('Usme', 'Barrio 20');

-- Inserts en USUARIO
INSERT INTO USUARIO (tipo_documento, numero_documento, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, fecha_nacimiento, sexo, direccion_domicilio, nickname, clave, acidembe, COMUNA_BARRIO_id, TIPO_USUARIO_id) VALUES
('CC', '1001234567', 'Juan', 'Carlos', 'García', 'López', '2000-05-15', 'M', 'Calle 123', 'JuanG90', 'pass123', 1, 1, 1),
('CC', '1001234568', 'María', 'Andrea', 'Rodríguez', 'Martínez', '2001-06-20', 'F', 'Calle 124', 'MariRM', 'pass123', 2, 2, 1),
('CC', '1001234569', 'Carlos', 'Felipe', 'López', 'González', '1999-07-25', 'M', 'Calle 125', 'CarlosG', 'pass123', 3, 3, 2),
('CC', '1001234570', 'Ana', 'María', 'Pérez', 'Silva', '2002-08-10', 'F', 'Calle 126', 'AnaPérez', 'pass123', 4, 4, 1),
('CC', '1001234571', 'David', 'Fernando', 'Díaz', 'Ruiz', '1998-09-12', 'M', 'Calle 127', 'DavidDR', 'pass123', 5, 5, 3),
('CC', '1001234572', 'Elena', 'Sofía', 'Moreno', 'Torres', '2003-10-30', 'F', 'Calle 128', 'ElenaMT', 'pass123', 6, 6, 1),
('CC', '1001234573', 'Miguel', 'Ángel', 'Jiménez', 'Vargas', '1997-11-14', 'M', 'Calle 129', 'MiguelJV', 'pass123', 7, 7, 4),
('CC', '1001234574', 'Francisca', 'Isabel', 'Ramírez', 'Flores', '2004-12-22', 'F', 'Calle 130', 'FranciscaRF', 'pass123', 8, 8, 1),
('CC', '1001234575', 'Roberto', 'Luis', 'Sánchez', 'Muñoz', '1996-01-05', 'M', 'Calle 131', 'RobertoSM', 'pass123', 9, 9, 2),
('CC', '1001234576', 'Valentina', 'Lucía', 'Castro', 'Acosta', '2005-02-18', 'F', 'Calle 132', 'ValentinaCA', 'pass123', 10, 10, 1),
('CC', '1001234577', 'Alejandro', 'Javier', 'Gómez', 'Navarro', '1995-03-08', 'M', 'Calle 133', 'AlejandroGN', 'pass123', 11, 11, 5),
('CC', '1001234578', 'Patricia', 'Juliana', 'Ortiz', 'Romero', '2006-04-25', 'F', 'Calle 134', 'PatriciaOR', 'pass123', 12, 12, 1),
('CC', '1001234579', 'Gustavo', 'Andrés', 'Romero', 'Mendoza', '1994-05-30', 'M', 'Calle 135', 'GustavoRM', 'pass123', 13, 13, 6),
('CC', '1001234580', 'Susana', 'Gabriela', 'Herrera', 'Delgado', '2007-06-12', 'F', 'Calle 136', 'SusanaHD', 'pass123', 14, 14, 1),
('CC', '1001234581', 'Fernando', 'Enrique', 'Domínguez', 'Vallejo', '1993-07-19', 'M', 'Calle 137', 'FernandoDV', 'pass123', 15, 15, 7),
('CC', '1001234582', 'Roxana', 'Beatriz', 'Velázquez', 'Montes', '2008-08-27', 'F', 'Calle 138', 'RoxanaVM', 'pass123', 16, 16, 1),
('CC', '1001234583', 'Héctor', 'Mauricio', 'Valdés', 'Cortés', '1992-09-03', 'M', 'Calle 139', 'HectorVC', 'pass123', 17, 17, 8),
('CC', '1001234584', 'Mercedes', 'Rosa', 'Rojas', 'Soto', '2009-10-11', 'F', 'Calle 140', 'MercedesRS', 'pass123', 18, 1, 1),
('CC', '1001234585', 'Raúl', 'Patricio', 'Parra', 'Iglesias', '1991-11-16', 'M', 'Calle 141', 'RaulPI', 'pass123', 19, 19, 3),
('CC', '1001234586', 'Lorena', 'Marcela', 'Ríos', 'Cabrera', '2010-12-24', 'F', 'Calle 142', 'LorenaRC', 'pass123', 20, 20, 1),
('CC', '1001234587', 'Osvaldo', 'Ricardo', 'Medina', 'Fuentes', '1990-01-09', 'M', 'Calle 143', 'OsvaldoMF', 'pass123', 1, 2),
('CC', '1001234588', 'Margarita', 'Elena', 'Riquelme', 'Gutiérrez', '2011-02-14', 'F', 'Calle 144', 'MargaritaRG', 'pass123', 2, 4);

-- Inserts en PLATAFORMA
INSERT INTO PLATAFORMA (nombre, marca) VALUES
('PlayStation 5', 'Sony'),
('Xbox Series X', 'Microsoft'),
('Nintendo Switch', 'Nintendo'),
('PC', 'Valve'),
('PlayStation 4', 'Sony'),
('Xbox One', 'Microsoft'),
('Nintendo Wii U', 'Nintendo'),
('PC Steam', 'Valve'),
('Cloud Gaming', 'Google'),
('Mobile', 'Android/iOS');

-- Inserts en JUEGO
INSERT INTO JUEGO (nombre, clasificacion_ESRB, estudio_dev, plataformas_disponibles, numero_jugadores, tipo, PLATAFORMA_id) VALUES
('Elden Ring', 'M', 'FromSoftware', 'Multi', '1-4', 'RPG', 1),
('Call of Duty Modern Warfare II', 'M', 'Infinity Ward', 'Multi', '2-150', 'Shooter', 1),
('League of Legends', 'T', 'Riot Games', 'PC', '5v5', 'MOBA', 4),
('Valorant', 'M', 'Riot Games', 'PC', '5v5', 'Shooter', 4),
('Fortnite', 'T', 'Epic Games', 'Multi', '100', 'Battle Royale', 1),
('Dota 2', 'T', 'Valve', 'PC', '5v5', 'MOBA', 4),
('Counter-Strike 2', 'M', 'Valve', 'PC', '10', 'Shooter', 4),
('The Legend of Zelda: Tears of the Kingdom', 'E10+', 'Nintendo', 'Switch', '1-2', 'Adventure', 3),
('Super Smash Bros Ultimate', 'T', 'Bandai Namco', 'Switch', '1-8', 'Fighting', 3),
('Minecraft', 'E10+', 'Mojang', 'Multi', '1-Survival', 'Sandbox', 3),
('Overwatch 2', 'T', 'Blizzard', 'Multi', '12-vs-12', 'Shooter', 1),
('Final Fantasy XVI', 'M', 'Square Enix', 'PS5', '1', 'RPG', 1),
('Starfield', 'M', 'Bethesda', 'Xbox/PC', '1', 'RPG', 2),
('Baldur\'s Gate 3', 'M', 'Larian Studios', 'PC/PS5', '1-4', 'RPG', 4),
('Street Fighter 6', 'T', 'Capcom', 'Multi', '1-2', 'Fighting', 1),
('Tekken 8', 'T', 'Bandai Namco', 'Multi', '1-2', 'Fighting', 1),
('Gran Turismo 7', 'E', 'Polyphony Digital', 'PS5', '1-12', 'Racing', 1),
('Forza Motorsport', 'E', '343 Industries', 'Xbox', '1-24', 'Racing', 2),
('Helldivers 2', 'M', 'Arrowhead Game Studios', 'PS5/PC', '1-4', 'Shooter', 1),
('Palworld', 'T', 'Pocketpair', 'Multi', '1-4', 'Adventure', 4),
('Monster Hunter Now', 'T', 'Capcom', 'Mobile', '1-4', 'Action RPG', 10),
('PUBG Mobile', 'M', 'Tencent', 'Mobile', '100', 'Battle Royale', 10);

-- Inserts en LOGRO_TROFEO
INSERT INTO LOGRO_TROFEO (nombre, puntos_req, JUEGO_id) VALUES
('Primer Asesinato', 10, 2),
('Especialista en Rifles', 50, 2),
('Campeón Invencible', 100, 1),
('Completar Campaña', 50, 1),
('Primera Victoria', 10, 3),
('Pentakill', 100, 3),
('Defuser Expert', 75, 7),
('Doble Headshot', 50, 7),
('Salvaje Completado', 100, 8),
('Todas las Semillas', 150, 10),
('Campeón en Línea', 200, 6),
('Control de Mapa', 100, 6),
('Ult Perfecta', 75, 11),
('Poder Supremo', 150, 12),
('Starborn Completado', 200, 13),
('Aventurero Legendario', 250, 14),
('Combo de 10 Golpes', 100, 15),
('Rey del Ring', 200, 16),
('Primera Carrera', 25, 17),
('Primer Lugar', 100, 18),
('Estrategia Ganadora', 150, 19),
('Mundo Completado', 200, 20);

-- Inserts en EQUIPO_JUEGO
INSERT INTO EQUIPO_JUEGO (nombre, horas, rival, JUEGO_id) VALUES
('Team Dragon', 120, 2, 3),
('Thunder Squad', 150, 1, 3),
('Phoenix Rising', 180, 3, 6),
('Titans Elite', 200, 4, 6),
('Shadow Warriors', 90, 5, 4),
('Echo Force', 110, 6, 4),
('Vortex Gaming', 140, 7, 2),
('Storm Riders', 160, 8, 2),
('Nexus Pro', 130, 9, 3),
('Apex Legends Team', 170, 10, 6),
('Velocity Squad', 100, 11, 4),
('Cipher Gaming', 145, 12, 2),
('Radiant Angels', 155, 13, 3),
('Nova Force', 185, 14, 6),
('Steel Titans', 125, 15, 4),
('Eclipse Gaming', 165, 16, 2),
('Orion Squad', 135, 17, 3),
('Quantum Legends', 175, 18, 6),
('Celestial Warriors', 105, 19, 4),
('Infinity Team', 195, 20, 2),
('Spectrum Gaming', 115, 1, 3),
('Unity Esports', 205, 2, 6);

Inserts en SESION_ENTRENAMIENTO
INSERT INTO SESION_ENTRENAMIENTO (fecha_agenda, hora_in, hora_fin, JUEGO_id, arbitro) VALUES
('2024-01-15', '2024-01-15 18:00:00', '2024-01-15 20:00:00', 3, 3),
('2024-01-16', '2024-01-16 19:00:00', '2024-01-16 21:00:00', 6, 9),
('2024-01-17', '2024-01-17 18:30:00', '2024-01-17 20:30:00', 4, 3),
('2024-01-18', '2024-01-18 17:00:00', '2024-01-18 19:00:00', 2, 9),
('2024-01-19', '2024-01-19 20:00:00', '2024-01-19 22:00:00', 3, 3),
('2024-01-20', '2024-01-20 18:00:00', '2024-01-20 20:00:00', 6, 9),
('2024-01-21', '2024-01-21 19:00:00', '2024-01-21 21:00:00', 4, 3),
('2024-01-22', '2024-01-22 18:00:00', '2024-01-22 20:00:00', 2, 9),
('2024-01-23', '2024-01-23 17:30:00', '2024-01-23 19:30:00', 3, 3),
('2024-01-24', '2024-01-24 20:00:00', '2024-01-24 22:00:00', 6, 9),
('2024-01-25', '2024-01-25 18:00:00', '2024-01-25 20:00:00', 4, 3),
('2024-01-26', '2024-01-26 19:00:00', '2024-01-26 21:00:00', 2, 9),
('2024-01-27', '2024-01-27 18:30:00', '2024-01-27 20:30:00', 3, 3),
('2024-01-28', '2024-01-28 17:00:00', '2024-01-28 19:00:00', 6, 9),
('2024-01-29', '2024-01-29 20:00:00', '2024-01-29 22:00:00', 4, 3),
('2024-01-30', '2024-01-30 18:00:00', '2024-01-30 20:00:00', 2, 9),
('2024-01-31', '2024-01-31 19:00:00', '2024-01-31 21:00:00', 3, 3),
('2024-02-01', '2024-02-01 18:30:00', '2024-02-01 20:30:00', 6, 9),
('2024-02-02', '2024-02-02 17:00:00', '2024-02-02 19:00:00', 4, 3),
('2024-02-03', '2024-02-03 20:00:00', '2024-02-03 22:00:00', 2, 9),
('2024-02-04', '2024-02-04 18:00:00', '2024-02-04 20:00:00', 3, 3),
('2024-02-05', '2024-02-05 19:00:00', '2024-02-05 21:00:00', 6, 9);

-- Inserts en TELEFONO
INSERT INTO TELEFONO (numero, tipo, USUARIO_id) VALUES
('3101234567', 'Celular', 1),
('3101234568', 'Celular', 2),
('3101234569', 'Celular', 3),
('3101234570', 'Celular', 4),
('3101234571', 'Celular', 5),
('3101234572', 'Celular', 6),
('3101234573', 'Celular', 7),
('3101234574', 'Celular', 8),
('3101234575', 'Celular', 9),
('3101234576', 'Celular', 10),
('3101234577', 'Celular', 11),
('3101234578', 'Celular', 12),
('3101234579', 'Celular', 13),
('3101234580', 'Celular', 14),
('3101234581', 'Celular', 15),
('3101234582', 'Celular', 16),
('3101234583', 'Celular', 17),
('3101234584', 'Celular', 18),
('3101234585', 'Celular', 19),
('3101234586', 'Celular', 20),
('3101234', 'Fijo', 21),
('3101236', 'Fijo', 22);

-- Inserts en CONSOLA
INSERT INTO CONSOLA (nombre, numero_serie, existencia_inventario) VALUES
('PlayStation 5', 'PS5-2024-001', 5),
('Xbox Series X', 'XBOX-2024-001', 3),
('Nintendo Switch', 'NS-2024-001', 8),
('PlayStation 5', 'PS5-2024-002', 4),
('Xbox Series X', 'XBOX-2024-002', 2);

-- Inserts en CONTROL
INSERT INTO CONTROL (nombre_serie, tipo, CONSOLA_id) VALUES
('CTRL-PS5-001', 'DualSense', 1),
('CTRL-PS5-002', 'DualSense', 1),
('CTRL-XBOX-001', 'Xbox Series', 2),
('CTRL-XBOX-002', 'Xbox Series', 2),
('CTRL-NS-001', 'Joy-Con', 3);


--CONSULTAS SOLICITADAS


-- CONSULTA 1: Conteo de Usuarios
-- SELECT COUNT(*) AS total_usuarios FROM USUARIO;

-- CONSULTA 2: Agrupación de Barrios por Comuna
-- SELECT COMUNA, COUNT(*) AS cantidad_barrios FROM COMUNA_BARRIO GROUP BY COMUNA ORDER BY COMUNA;

-- CONSULTA 3: Alias en Columnas (Juegos)
-- SELECT nombre AS 'Título del Juego', estudio_dev AS 'Empresa Desarrolladora' FROM JUEGO;

-- CONSULTA 4: Unión Implícita (Usuarios y Barrios)
-- SELECT u.primer_nombre, u.primer_apellido, cb.barrio 
-- FROM USUARIO u, COMUNA_BARRIO cb 
-- WHERE u.COMUNA_BARRIO_id = cb.id
-- ORDER BY u.primer_nombre;

-- CONSULTA 5: Conteo de Juegos por Plataforma
-- SELECT PLATAFORMA_id, COUNT(*) AS cantidad_juegos FROM JUEGO GROUP BY PLATAFORMA_id ORDER BY PLATAFORMA_id;

-- CONSULTA 6: Alias en Columnas (Equipos)
-- SELECT nombre AS 'Squad', horas AS 'Tiempo Jugado' FROM EQUIPO_JUEGO;

-- CONSULTA 7: Unión Implícita (Equipos y Juegos)
-- SELECT eq.nombre AS nombre_equipo, j.nombre AS nombre_juego 
-- FROM EQUIPO_JUEGO eq, JUEGO j 
-- WHERE eq.JUEGO_id = j.id
-- ORDER BY eq.nombre;

-- CONSULTA 8: Conteo de Juegos por Tipo
-- SELECT tipo, COUNT(*) AS cantidad FROM JUEGO GROUP BY tipo ORDER BY cantidad DESC;

-- CONSULTA 9: Unión Implícita (Logros y Juegos)
-- SELECT lt.nombre AS nombre_logro, lt.puntos_req, j.nombre AS nombre_juego 
-- FROM LOGRO_TROFEO lt, JUEGO j 
-- WHERE lt.JUEGO_id = j.id
-- ORDER BY j.nombre;

-- CONSULTA 10: Unión Implícita con Alias de Tabla (Sesiones y Árbitros)
-- SELECT s.fecha_agenda, u.primer_nombre, u.primer_apellido 
-- FROM SESION_ENTRENAMIENTO s, USUARIO u 
-- WHERE s.arbitro = u.id
-- ORDER BY s.fecha_agenda;
