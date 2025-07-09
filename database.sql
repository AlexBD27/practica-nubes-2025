CREATE DATABASE practica;
use practica;

CREATE TABLE procedencia(
  id INT PRIMARY KEY,
  distrito varchar(255) NOT NULL,
  provincia varchar(255) NOT NULL,
  departamento varchar(255) NOT NULL
);

CREATE TABLE pacientes(
  id INT PRIMARY KEY,
  nombre varchar(255) not null,
  ap_paterno varchar(255) not null,
  ap_materno varchar(255) not null,
  fec_nacimiento DATE,
  edad INT,
  telefono1 varchar(255) NOT NULL,
  telefono2 varchar(255) NULL,
  id_procedencia INT,

  FOREIGN KEY (id_procedencia) REFERENCES procedencia(id)
);

INSERT INTO procedencia(id, distrito, provincia, departamento)
VALUES (1, 'Nuevo Chimbote', 'Santa', 'Ancash'),
(2, 'Cajamarca', 'Cajamarca', 'Cajamarca'),
(3, 'Casma', 'Santa', 'Ancash'),
(4, 'Huaraz', 'Huaraz', 'Ancash'),
(5, 'La Esperanza', 'Trujillo', 'La Libertad');

INSERT INTO pacientes(id, nombre, ap_paterno, ap_materno, fec_nacimiento, edad, telefono1, telefono2, id_procedencia)
VALUES (1, 'Pedro', 'Martinez', 'Lopez', '1990-05-16', 35, '958459652', null, 1),
(2, 'Juan', 'Fernandez', 'Aguirre', '1995-05-16', 30, '954856321', '957854625', 2),
(3, 'Luz', 'Morales', 'Andrada', '1980-05-12', 45, '954585632', '968745321', 3),
(4, 'Fernando', 'Palomo', 'Lopez', '1970-05-16', 55, '958459652', null, 4),
(5, 'Alex', 'Tirado', 'Mendoza', '2003-07-27', 21, '958459652', null, 2),
(6, 'Almendra', 'Perez', 'Lopez', '1970-05-16', 55, '958459652', null, 4),
(7, 'Lucero', 'Palomino', 'Lopez', '2000-05-16', 25, '968563254', null, 5);
