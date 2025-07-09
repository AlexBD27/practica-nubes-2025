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
  telefono varchar(255),
  id_procedencia INT,

  FOREIGN KEY (id_procedencia) REFERENCES procedencia(id)
);

INSERT INTO procedencia(id, distrito, provincia, departamento)
VALUES (1, 'Nuevo Chimbote', 'Santa', 'Ancash'),
(2, 'Cajamarca', 'Cajamarca', 'Cajamarca'),
(3, 'Casma', 'Santa', 'Ancash'),
(4, 'Huaraz', 'Huaraz', 'Ancash'),
(5, 'La Esperanza', 'Trujillo', 'La Libertad');

INSERT INTO pacientes(id, nombre, ap_paterno, ap_materno, fec_nacimiento, edad, telefono, id_procedencia)
VALUES (1, 'Pedro', 'Martinez', 'Lopez', '1990-05-16', 35, '958459652', 1),
(2, 'Juan', 'Fernandez', 'Aguirre', '1995-05-16', 30, '954856321', 2),
(3, 'Luz', 'Morales', 'Andrada', '1980-05-12', 45, '954585632', 3),
(4, 'Fernando', 'Palomo', 'Lopez', '1970-05-16', 55, '958459652', 4),
(5, 'Lucero', 'Palomino', 'Lopez', '2000-05-16', 25, '968563254', 5);
