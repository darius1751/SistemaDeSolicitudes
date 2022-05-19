CREATE DATABASE sistemaDeSolicitudes;
USE sistemaDeSolicitudes;
CREATE TABLE Administrador(
	id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
	Usuario VARCHAR(20) NOT NULL UNIQUE,
	password VARCHAR(20) NOT NULL,
	
);
CREATE TABLE Facultad(
	codigo INT PRIMARY KEY NOT NULL,
	nombre VARCHAR(50) NOT NULL
);
CREATE TABLE Area(
	codigo INT PRIMARY KEY NOT NULL,
	nombre VARCHAR(50) NOT NULL
);
CREATE TABLE Estado(
	codigo INT PRIMARY KEY NOT NULL,
	nombre VARCHAR(50) NOT NULL
);
CREATE TABLE Estudiante
(
	identificacion VARCHAR(15) PRIMARY KEY,
	nombre VARCHAR(50) NOT NULL,
	email VARCHAR(100) NULL DEFAULT NULL,
	celular VARCHAR(15) NULL DEFAULT NULL
);
CREATE TABLE solicitudes(
	consecutivo INT PRIMARY KEY AUTO_INCREMENT NOT NULL, 
	fecha DATE NOT NULL DEFAULT CURRENT_TIMESTAMP,
	identificacion VARCHAR(15) REFERENCES Estudiante(identificacion),
	cod_facultad INT REFERENCES facultad(codigo) ,
	cod_area INT REFERENCES area(codigo),
	requerimiento VARCHAR(100) NULL DEFAULT NULL,
	cod_estado INT REFERENCES estado(codigo)
);
ALTER TABLE solicitudes ADD FOREIGN KEY(cod_facultad) REFERENCES facultad(codigo);
ALTER TABLE solicitudes ADD FOREIGN KEY(cod_area) REFERENCES area(codigo);
ALTER TABLE solicitudes ADD FOREIGN KEY(cod_estado)REFERENCES estado(codigo);
ALTER TABLE solicitudes ADD FOREIGN KEY(identificacion) REFERENCES estudiante(identificacion);
INSERT INTO Administrador(Usuario,password)
VALUES('Juan','789'),('Jorge','234'),('Ana','673');
INSERT INTO Estado(codigo,nombre) 
VALUES(1,'Pendiente'),(2,'En Tramite'),(3,'Contestada');
INSERT INTO Facultad(codigo,nombre) 
VALUES(1,'Ingenieria'),(2,'Artes'),(3,'Ciencias Exactas'),(4,'Ciencias Economicas')
;
INSERT INTO Area(codigo,nombre) VALUES(1,'Trabajo de Grado'),(2,'Homologacion'),(3,'Graduacion'),(4,'Matricula')
;
