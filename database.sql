CREATE DATABASE practica;
USE practica;

CREATE TABLE procedencia(
  id INT PRIMARY KEY,
  distrito VARCHAR(255) NOT NULL,
  provincia VARCHAR(255) NOT NULL,
  departamento VARCHAR(255) NOT NULL
);

CREATE TABLE pacientes(
  id INT PRIMARY KEY,
  nombre VARCHAR(255) NOT NULL,
  ap_paterno VARCHAR(255) NOT NULL,
  ap_materno VARCHAR(255) NOT NULL,
  fec_nacimiento DATE,
  edad INT,
  telefono1 VARCHAR(255) NOT NULL,
  telefono2 VARCHAR(255) NULL,
  id_procedencia INT,
  FOREIGN KEY (id_procedencia) REFERENCES procedencia(id)
);

DELIMITER $$
CREATE TRIGGER trg_pacientes_insert
BEFORE INSERT ON pacientes
FOR EACH ROW
BEGIN
  SET NEW.edad = TIMESTAMPDIFF(YEAR, NEW.fec_nacimiento, CURDATE());
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER trg_pacientes_update
BEFORE UPDATE ON pacientes
FOR EACH ROW
BEGIN
  SET NEW.edad = TIMESTAMPDIFF(YEAR, NEW.fec_nacimiento, CURDATE());
END$$
DELIMITER ;

INSERT INTO procedencia(id, distrito, provincia, departamento)
VALUES 
  (1, 'Nuevo Chimbote', 'Santa', 'Ancash'),
  (2, 'Cajamarca', 'Cajamarca', 'Cajamarca'),
  (3, 'Casma', 'Santa', 'Ancash'),
  (4, 'Huaraz', 'Huaraz', 'Ancash'),
  (5, 'La Esperanza', 'Trujillo', 'La Libertad');

INSERT INTO pacientes(id, nombre, ap_paterno, ap_materno, fec_nacimiento, telefono1, telefono2, id_procedencia)
VALUES 
  (1, 'Pedro', 'Martinez', 'Lopez', '1990-05-16', '958459652', NULL, 1),
  (2, 'Juan', 'Fernandez', 'Aguirre', '1995-05-16', '954856321', '957854625', 2),
  (3, 'Luz', 'Morales', 'Andrada', '1980-05-12', '954585632', '968745321', 3),
  (4, 'Fernando', 'Palomo', 'Lopez', '1970-05-16', '958459652', NULL, 4),
  (5, 'Alex', 'Tirado', 'Mendoza', '2003-07-27', '958459652', NULL, 2),
  (6, 'Almendra', 'Perez', 'Lopez', '1970-05-16', '958459652', NULL, 4),
  (7, 'Lucero', 'Palomino', 'Lopez', '2000-05-16', '968563254', NULL, 5);
