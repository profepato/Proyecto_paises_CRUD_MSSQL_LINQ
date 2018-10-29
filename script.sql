CREATE DATABASE bd_paises;
GO
USE bd_paises;
GO

CREATE TABLE Pais(
	id INT IDENTITY(1,1),
	nombre VARCHAR(100),
	PRIMARY KEY(id)
);

INSERT INTO Pais(nombre) VALUES('Argentina');

SELECT * FROM Pais;