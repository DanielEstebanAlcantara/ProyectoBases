/*

		SCRIPT CON LA CARGA DE DATOS PARA LA BASE

*/


use Concesionaria_PF_PRUEBA
GO
SELECT * FROM COCHE.SEGUNDA
BEGIN TRAN

/*
	Registros tabla 
	EMPLEADO.DIRECCION
*/
--DBCC CHECKIDENT ('EMPLEADO.DIRECCION', RESEED,0);-- Resetear la PK
go
INSERT INTO EMPLEADO.DIRECCION (calle, municipio, estado, numero)
VALUES
    ('Ramos Milla', 'Cuauhtemoc', 'Ciudad de Mexico', '123'),
    ('De los toltecas', 'Benito Juarez', 'Ciudad de Mexico', '456'),
    ('Bodas de Figaro', 'Coyoacan', 'Ciudad de Mexico', '789'),
    ('Sonora', 'Miguel Hidalgo', 'Ciudad de Mexico', '101'),
    ('Oriente', 'Cuauhtemoc', 'Ciudad de Mexico', '112'),
    ('Calle 11', 'Benito Juarez', 'Ciudad de Mexico', '131'),
    ('Calzada de los Remedios', 'Coyoacan', 'Ciudad de Mexico', '415'),
    ('Andador 7', 'Miguel Hidalgo', 'Ciudad de Mexico', '516'),
    ('Campeche', 'Cuauhtemoc', 'Ciudad de Mexico', '617'),
    ('Colina del silencia', 'Benito Juarez', 'Ciudad de Mexico', '718'),
    ('Veracruz', 'Coyoacan', 'Ciudad de Mexico', '819'),
    ('Tajin', 'Miguel Hidalgo', 'Ciudad de Mexico', '920'),
    ('Guanajuato', 'Cuauhtemoc', 'Ciudad de Mexico', '521'),
    ('Pirana', 'Benito Juarez', 'Ciudad de Mexico', '422'),
    ('Nayarit', 'Coyoacan', 'Ciudad de Mexico', '323'),
    ('Santa Ursula', 'Miguel Hidalgo', 'Ciudad de Mexico', '224'),
    ('Moras', 'Cuauhtemoc', 'Ciudad de Mexico', '125'),
    ('Eduardo Jenner', 'Benito Juarez', 'Ciudad de Mexico', '326'),
    ('Topacio', 'Coyoacan', 'Ciudad de Mexico', '427'),
    ('Santo Tomas', 'Miguel Hidalgo', 'Ciudad de Mexico', '828');


/*
	Registros tabla 
	EMPLEADO.EMPLEADO
*/
--DBCC CHECKIDENT ('EMPLEADO.EMPLEADO', RESEED,0);-- Resetear la PK 
go
INSERT INTO EMPLEADO.EMPLEADO (fechaNacimiento, paterno, materno, nombre, fechaIngreso, sueldo, tipoEmpleado, id_Direccion)
VALUES
    ('1990-03-15', 'Gomez', 'Lopez', 'Juan', '2010-05-20', 35000.00, 'V', 1),
    ('1985-08-22', 'Martinez', 'Ramirez', 'Ana', '2009-11-10', 42000.00, 'V', 2),
    ('1988-12-05', 'Rodriguez', 'Garcia', 'Carlos', '2012-08-15', 38000.00, 'V', 3),
    ('1992-06-18', 'Hernandez', 'Martinez', 'Laura', '2015-02-28', 30000.00, 'V', 4),
    ('1980-04-02', 'Gutierrez', 'Perez', 'Miguel', '2007-07-05', 45000.00, 'V', 5),
    ('1995-09-14', 'Diaz', 'Fernandez', 'Isabel', '2023-02-12', 8000.00, 'M', 6),
    ('1987-11-30', 'Lopez', 'Sanchez', 'Francisco', '2013-10-22', 37000.00, 'T', 7),
    ('1993-01-08', 'Flores', 'Torres', 'Elena', '2016-06-17', 34000.00, 'M', 8),
    ('1982-07-25', 'Ortiz', 'Jimenez', 'Javier', '2011-09-08', 40000.00, 'T', 9),
    ('1998-05-09', 'Ramirez', 'Gomez', 'Sergio', '2020-03-25', 28000.00, 'V', 10),
    ('1984-02-11', 'Gonzalez', 'Hernandez', 'Luisa', '2008-12-01', 43000.00, 'M', 11),
    ('1991-10-07', 'Vargas', 'Diaz', 'Roberto', '2014-01-14', 36000.00, 'T', 12),
    ('1989-03-28', 'Cruz', 'Soto', 'Carmen', '2017-08-09', 31000.00, 'M', 13),
    ('1994-04-19', 'Moreno', 'Luna', 'Alejandro', '2022-11-03', 8000.00, 'T', 14),
    ('1983-09-03', 'Rojas', 'Reyes', 'Maria', '2012-01-30', 39000.00, 'V', 15),
    ('1997-12-10', 'Mendoza', 'Navarro', 'Pablo', '2021-06-08', 27000.00, 'T', 16),
    ('1986-06-28', 'Delgado', 'Guerrero', 'Silvia', '2010-10-05', 41000.00, 'M', 17),
    ('1996-08-17', 'Nunez', 'Cortes', 'Ricardo', '2018-11-18', 30000.00, 'T', 18),
    ('1981-01-25', 'Salazar', 'Mendoza', 'Gabriela', '2006-04-07', 46000.00, 'V', 19),
    ('1990-07-12', 'Castillo', 'Romero', 'Hector', '2023-04-23', 8000.00, 'M', 20);

/*
	Registros tabla 
	EMPLEADO.TELEFONO
*/
--DBCC CHECKIDENT ('EMPLEADO.TELEFONO', RESEED,0);-- Resetear la PK
go
INSERT INTO EMPLEADO.TELEFONO
    VALUES
        (5512345678, 1),
        (5623456789, 2),
        (5545678901, 3),
        (5656789012, 4),
        (5567890123, 5),
        (5678901234, 6),
        (5589012345, 7),
        (5690123456, 8),
        (5511223344, 9),
        (5543445566, 10),
        (5654556677, 11),
        (5565667788, 12),
        (5676778899, 13),
        (5587889900, 14),
        (5698990011, 15),
        (5519900112, 16),
        (5621000113, 17),
        (5541110011, 18),
        (5651000112, 19),
		(5622334455, 20);

--==============================
SELECT 'EMPLEADOS' AS EMPLEADOS
SELECT * FROM EMPLEADO.DIRECCION
SELECT * FROM EMPLEADO.EMPLEADO
SELECT * FROM EMPLEADO.TELEFONO
--==============================


/*
Inserta Empleados cuyo tipo es 'V' dentro de tabla EMPLEADO.AGENTE_VENTA
*/

DECLARE @v_cantidad_empleados int = (SELECT COUNT (numEmpleado)
FROM EMPLEADO.EMPLEADO
where tipoEmpleado = 'V')

WHILE ((SELECT COUNT (numEmpleado) FROM EMPLEADO.AGENTE_VENTA) <  @v_cantidad_empleados)
BEGIN 
	INSERT INTO EMPLEADO.AGENTE_VENTA
	VALUES ((SELECT top 1 e.numEmpleado 
			FROM EMPLEADO.EMPLEADO e
			left join EMPLEADO.AGENTE_VENTA v ON e.numEmpleado = v.numEmpleado
			where v.numEmpleado is null and e.tipoEmpleado = 'V'))
END
GO

/*
Inserta Empleados cuyo tipo es 'T' dentro de tabla EMPLEADO.TECNICO
*/

DECLARE @v_cantidad_empleados int = (SELECT COUNT (numEmpleado)
FROM EMPLEADO.EMPLEADO
where tipoEmpleado = 'T')

WHILE ((SELECT COUNT (numEmpleado) FROM EMPLEADO.TECNICO) <  @v_cantidad_empleados)
BEGIN 
	INSERT INTO EMPLEADO.TECNICO
	VALUES ((SELECT top 1 e.numEmpleado 
			FROM EMPLEADO.EMPLEADO e
			left join EMPLEADO.TECNICO t ON e.numEmpleado = t.numEmpleado
			where t.numEmpleado is null and e.tipoEmpleado = 'T'))
END
GO



/*
Inserta Empleados cuyo tipo es 'M' dentro de tabla EMPLEADO.MECANICO
*/

DECLARE @v_cantidad_empleados int = (SELECT COUNT (numEmpleado)
FROM EMPLEADO.EMPLEADO
where tipoEmpleado = 'M')

WHILE ((SELECT COUNT (numEmpleado) FROM EMPLEADO.MECANICO) <  @v_cantidad_empleados)
BEGIN 
	INSERT INTO EMPLEADO.MECANICO  (numEmpleado)
	VALUES ((SELECT top 1 e.numEmpleado 
			FROM EMPLEADO.EMPLEADO e
			left join EMPLEADO.MECANICO m ON e.numEmpleado = m.numEmpleado
			where m.numEmpleado is null and e.tipoEmpleado = 'M'))
END
GO

/*
	Agregando informaci�n sobre escolaridad
*/

UPDATE EMPLEADO.MECANICO
set escolaridad = 'Tecnico Bachillerato'
where escolaridad is null


/*
	Registros para EMPLEADO.CURSO
*/
--DBCC CHECKIDENT ('EMPLEADO.CURSO', RESEED,0);
GO
INSERT INTO EMPLEADO.CURSO (Curso, numEmpleado)
VALUES
    ('AfinaciOn de Motores con InyecciOn ElectrOnica', 6),
    ('Mantenimiento de Transmision Automatica', 8),
    ('Reparacion de Sistema de Frenos Convencionales, ABS y Electronicos', 11),
    ('Suspension y Direccion', 13),
    ('Transmision Manual y Embrague', 17),
    ('Mantenimiento de Transmision Automatica', 20);

--==============================
SELECT * FROM EMPLEADO.AGENTE_VENTA
SELECT * FROM EMPLEADO.TECNICO
SELECT * FROM EMPLEADO.MECANICO
SELECT * FROM EMPLEADO.CURSO

--==============================


/*
	Registros para AVAL.DIRECCION 
*/


--DBCC CHECKIDENT ('AVAL.DIRECCION', RESEED,0);-- Resetear la PK 
go

INSERT INTO AVAL.DIRECCION (calle, municipio, estado, numero)
VALUES('Pira�a', 'Cuauhtemoc', 'Ciudad de Mexico', '3'),
        ('Durango', 'Benito', 'Ciudad de Mexico', '46'),
        ('Hidalgo', 'Coyoacan', 'Ciudad de Mexico', '63'),
        ('Zaragoza', 'Miguel', 'Ciudad de Mexico', '15'),
        ('Madero', 'Cuauhtemoc', 'Ciudad de Mexico', '162'),
        ('Calle 14', 'Benito', 'Ciudad de Mexico', '60'),
        ('Neza', 'Coyoacan', 'Ciudad de Mexico', '96'),
        ('Andador 7', 'Miguel', 'Ciudad de Mexico', '616'),
        ('Independencia', 'Cuauhtemoc', 'Ciudad de Mexico', '10'),
        ('Nuevo leon', 'Benito', 'Ciudad de Mexico', '5'),
        ('Roma', 'Coyoacan', 'Ciudad de Mexico', '45'),
        ('Oriente', 'Miguel', 'Ciudad de Mexico', '12'),
        ('Madero', 'Cuauhtemoc', 'Ciudad de Mexico', '521'),
        ('Pirando', 'Benito', 'Ciudad de Mexico', '4'),
        ('Nayarit', 'Coyoacan', 'Ciudad de Mexico', '2'),
        ('Santa Domingo', 'Miguel', 'Ciudad de Mexico', '524'),
        ('P.P', 'Cuauhtemoc', 'Ciudad de Mexico', '16'),
        ('Messi', 'Benito', 'Ciudad de Mexico', '10'),
        ('Portales', 'Coyoacan', 'Ciudad de Mexico', '523'),
        ('San Juan', 'Miguel', 'Ciudad de Mexico', '82');

/*
	Registros para AVAL.AVAL
*/
--DBCC CHECKIDENT ('AVAL.AVAL', RESEED,0)
GO

INSERT INTO AVAL.AVAL (curp, paterno, materno, nombre, id_Direccion)
VALUES ('LOMA940514MDFNNSS0', 'Lopez', 'Maldonado', 'Ana', 1),
        ('GARC940223HDFNNS00', 'Garcia', 'Santos', 'Carlos', 2),
        ('RODR930712MDFNNSS2', 'Rodriguez', 'Lara', 'Rosa', 3),
        ('HERN951015HDFNNS00', 'Hernandez', 'Martinez', 'Luis', 4),
        ('MORA910308MDFNNSS4', 'Morales', 'Gomez', 'Maria', 5),
        ('DIAZ980521HDFNNS00', 'Diaz', 'Fernandez', 'Javier', 6),
        ('LOPE871112MDFNNSS6', 'Lopez', 'Sanchez', 'Laura', 7),
        ('GOME900216HDFNNS00', 'Gomez', 'Ramirez', 'Miguel', 8),
        ('PENA940601MDFNNSS8', 'Pena', 'Cruz', 'Sandra', 9),
        ('SANT960723HDFNNS00', 'Santos', 'Mendoza', 'Roberto', 10),
        ('TORR930824MDFNNSS0', 'Torres', 'Gutierrez', 'Elena', 11),
        ('MEND950405HDFNNS10', 'Mendez', 'Rojas', 'Carlos', 12),
        ('RAMI910709MDFNNSS2', 'Ramirez', 'Ortega', 'Patricia', 13),
        ('CAST880530HDFNNS10', 'Castro', 'Vega', 'Luis', 14),
        ('JUAN900102MDFNNSS4', 'Juarez', 'Moreno', 'Ana', 15),
        ('PERE960216HDFNNS10', 'Perez', 'Soto', 'Jose', 16),
        ('GUIL940330MDFNNSS6', 'Guillen', 'Luna', 'Marta', 17),
        ('REYE931124HDFNNS10', 'Reyes', 'Gomez', 'Victor', 18),
        ('LOPE891215MDFNNS18', 'Lopez', 'Velasquez', 'Diana', 19),
        ('TORR970706HDFNNS19', 'Torres', 'Guzman', 'Alejandro', 20);


/*
	Registros para AVAL.TELEFONO
*/
--DBCC CHECKIDENT ('AVAL.TELEFONO', RESEED,0);-- Resetear la PK
go
INSERT INTO AVAL.TELEFONO(telefono, id_Aval) 
VALUES
        (5512345678, 1),
        (5523456789, 2),
        (5534567890, 3),
        (5545678901, 4),
        (5556789012, 5),
        (5567890123, 6),
        (5578901234, 7),
        (5589012345, 8),
        (5590123456, 9),
        (5501234567, 10),
        (5511223344, 11),
        (5522334455, 12),
        (5533445566, 13),
        (5544556677, 14),
        (5555667788, 15),
        (5566778899, 16),
        (5577889900, 17),
        (5588990011, 18),
        (5599001122, 19),
        (5500112233, 20);


--==============================
SELECT 'AVAL' as AVAL
SELECT * FROM AVAL.DIRECCION
SELECT * FROM AVAL.TELEFONO
SELECT * FROM AVAL.AVAL


--==============================


/*
	Registros para tabla CLIENTE.DIRECCION	
*/
--DBCC CHECKIDENT ('CLIENTE.DIRECCION', RESEED,0);
GO
INSERT INTO CLIENTE.DIRECCION (calle, municipio, estado, numero)
VALUES
    ('Aleta', 'Cuauhtemoc', 'Ciudad de Mexico', '2'),
    ('Allende', 'Benito', 'Ciudad de Mexico', '62'),
    ('Paraiso', 'Coyoacan', 'Ciudad de Mexico', '85'),
    ('Pera', 'Miguel', 'Ciudad de Mexico', '8'),
    ('Pino', 'Cuauhtemoc', 'Ciudad de Mexico', '54'),
    ('Calle 16', 'Benito', 'Ciudad de Mexico', '77'),
    ('Uva', 'Coyoacan', 'Ciudad de Mexico', '61'),
    ('Sol', 'Miguel', 'Ciudad de Mexico', '62'),
    ('Xola', 'Cuauhtemoc', 'Ciudad de Mexico', '69'),
    ('Sinfonica', 'Benito', 'Ciudad de Mexico', '20'),
    ('Reno', 'Coyoacan', 'Ciudad de Mexico', '28'),
    ('Rosa', 'Miguel', 'Ciudad de Mexico', '6'),
    ('Rojo ', 'Cuauhtemoc', 'Ciudad de Mexico', '84'),
    ('OPorto', 'Benito', 'Ciudad de Mexico', '96'),
    ('Sonora', 'Coyoacan', 'Ciudad de Mexico', '64'),
    ('Santa Ana', 'Miguel', 'Ciudad de Mexico', '75'),
    ('Quinto', 'Cuauhtemoc', 'Ciudad de Mexico', '78'),
    ('Parka', 'Benito', 'Ciudad de Mexico', '72'),
    ('Walkirias', 'Coyoacan', 'Ciudad de Mexico', '29'),
    ('Zapo', 'Miguel', 'Ciudad de Mexico', '79'); 




/*
	Registros para tabla CLIENTE.CLIENTE
*/
--DBCC CHECKIDENT ('CLIENTE.CLIENTE', RESEED,0);
GO
INSERT INTO CLIENTE.CLIENTE (paterno, materno, nombre, genero, rfc, id_Direccion, id_Aval)
VALUES
    ('Hernandez', 'Gutierrez', 'Laura', 'M', '1234567890123', 1, 1),
    ('Gomez', 'Martinez', 'Alejandro', 'H', 'GOMA891110XXX', 2, 2),
    ('Diaz', 'Sanchez', 'Isabel', 'M', 'DIAI950504XXX', 3, 3),
    ('Torres', 'Lopez', 'Ricardo', 'H', 'TORR870720XXX', 4, 4),
    ('Cruz', 'Rojas', 'Patricia', 'M', 'CRUP900305XXX', 5, 5),
    ('Soto', 'Gonzalez', 'Raul', 'H', 'SORG980112XXX', 6, 6),
    ('Lara', 'Ramirez', 'Diana', 'M', 'LARD871212XXX', 7, 7),
    ('Vega', 'Hernandez', 'Oscar', 'H', 'VEGO900515XXX', 8, 8),
    ('Reyes', 'Gomez', 'Natalia', 'M', 'REYN951030XXX', 9, 9),
    ('Flores', 'Perez', 'Javier', 'H', 'FLPJ910204XXX', 10, 10),
    ('Gutierrez', 'Gonzalez', 'Maria', 'M', 'GUMR940729XXX', 11, 11),
    ('Mendoza', 'Torres', 'Victor', 'H', 'MENV960622XXX', 12, 12),
    ('Sanchez', 'Diaz', 'Marta', 'M', 'SAMT921125XXX', 13, 13),
    ('Velasquez', 'Mendoza', 'Raul', 'H', 'VERR900802XXX', 14, 14),
    ('Moreno', 'Pena', 'Carmen', 'M', 'MOPC880423XXX', 15, 15),
    ('Santos', 'Juarez', 'Fernando', 'H', 'SAJF900710XXX', 16, 16),
    ('Luna', 'Santos', 'Leticia', 'M', 'LUSL910302XXX', 17, 17),
    ('Ortega', 'Vega', 'Hector', 'H', 'ORVH950811XXX', 18, 18),
    ('Rojas', 'Reyes', 'Ana', 'M', 'RORA920620XXX', 19, 19),
    ('Guzman', 'Flores', 'Gabriel', 'H', 'GUGF900402XXX', 20, 20);

	select * from CLIENTE.CLIENTE
/*
	Registros para tabla CLIENTE.TELEFONO
*/
--DBCC CHECKIDENT ('CLIENTE.TELEFONO', RESEED,0);-- Resetear la PK
go
INSERT INTO CLIENTE.TELEFONO (telefono, id_Cliente) 
VALUES
        (5533445566, 1),
        (5544556677, 2),
        (5555667787, 3),
        (5566785899, 4),
        (5577889900, 5),
        (5588990011, 6),
        (5599001122, 7),
        (5500112233, 8),
        (5511223344, 9),
        (5522334455, 10),
        (5567890123, 11),
        (5578901234, 12),
        (5589012345, 13),
        (5590123456, 14),
        (5501234567, 15),
        (5512375678, 16),
        (5523456789, 17),
        (5534567890, 18),
        (5545678901, 19),
        (5556789012, 20);

/*
	Registros para tabla CLIENTE.CORREO
*/
--DBCC CHECKIDENT ('CLIENTE.CORREO', RESEED,0);-- Resetear la PK
go

INSERT INTO CLIENTE.CORREO (correo, id_Cliente)
VALUES 
    ('john.doe@example.com', 1),
    ('jane.smith@example.com', 2),
    ('bob.jones@example.com', 3),
    ('alice.johnson@example.com', 4),
    ('charlie.brown@example.com', 5),
    ('emma.white@example.com', 6),
    ('michael.davis@example.com', 7),
    ('olivia.moore@example.com', 8),
    ('ryan.wilson@example.com', 9),
    ('sophia.anderson@example.com', 10),
    ('david.martin@example.com', 11),
    ('isabella.thomas@example.com', 12),
    ('ethan.miller@example.com', 13),
    ('ava.jones@example.com', 14),
    ('noah.taylor@example.com', 15),
    ('grace.robinson@example.com', 16),
    ('logan.hall@example.com', 17),
    ('mia.clark@example.com', 18),
    ('owen.green@example.com', 19),
    ('lily.wright@example.com', 20); 

--==============================
SELECT 'CLIENTE' AS CLIENTES
SELECT * FROM CLIENTE.DIRECCION
SELECT * FROM CLIENTE.CLIENTE
SELECT * FROM CLIENTE.TELEFONO
SELECT * FROM CLIENTE.CORREO
--==============================


/*
	Registros tabla COCHE.COCHE
*/
--DBCC CHECKIDENT ('COCHE.COCHE', RESEED,0);-- Resetear la PK
go
SELECT * FROM COCHE.COCHE WHERE matricula = 'GHI789'
SELECT * FROM COCHE.COCHE

INSERT INTO COCHE.COCHE (modelo, extras, matricula, tipoCoche)
VALUES
    ('Sedan', 'Aire', 'ABC123', 'N'),
    ('SUV', 'GPS', 'DEF456', 'S'),
    ('Compacto', 'Bluetooth', 'GHI789', 'S'),
    ('Pickup', 'Asientos de cuero', 'JKL012', 'S'),
    ('Hatchback', 'Camara de reversa', 'MNO345', 'N'),
    ('Sedan', NULL, 'PQR678', 'S'),
    ('Camioneta', 'Techo solar', 'STU901', 'S'),
    ('Compacto', 'Asientos calefaccionados', 'VWX234', 'N'),
    ('SUV', 'Sistema de sonido premium', 'YZA567', 'N'),
    ('Hatchback', 'Puertas electricas', 'BCD890', 'S'),
    ('Pickup', 'Asientos de tela', 'EFG123', 'N'),
    ('Sedan', 'Sensores de estacionamiento', 'HIJ456', 'N'),
    ('Compacto', NULL, 'KLM789', 'S'),
    ('SUV', 'Sistema de entretenimiento', 'NOP012', 'N'),
    ('Hatchback', 'Control de crucero', 'QRS345', 'S'),
    ('Pickup', 'Faros LED', 'TUV678', 'S'),
    ('Sedan', 'Asientos plegables', 'WXY901', 'S'),
    ('Compacto', 'Volante multifuncion', 'ZAB234', 'N'),
    ('SUV', NULL, 'CDE567', 'N'),
    ('Pickup', 'Sistema de traccion en las cuatro ruedas', 'FGH890', 'N');

/*
	Registros tabla COCHE.SEGUNDA
*/

INSERT INTO COCHE.SEGUNDA (id_Coche, fecha, costo, id_Cliente)
VALUES 
    (2, '2023-01-01', 50000, 5),
    (6, '2023-02-01', 60000, 10),
    (3, '2023-03-01', 70000, 5),
    (4, '2023-04-01', 80000, 3),
    (9, '2023-05-01', 90000, 18),
    (13,'2023-06-01', 40000, 7),
    (7, '2023-07-01', 60000, 12),
    (10,'2023-08-01', 70000, 20),
    (15,'2023-09-01', 60000, 5 ),
    (16,'2023-10-01', 45000, 17);


/*
	-- Segunda mano
DECLARE @v_cantidad_Segundas int = (SELECT COUNT (id_Coche)
FROM COCHE.SEGUNDA
)

WHILE ((SELECT COUNT (id_Coche) FROM COCHE.COCHE WHERE tipoCoche = 'S') <  @v_cantidad_Segundas)
BEGIN 
	
	UPDATE COCHE.COCHE
		set tipoCoche = 'S'
		where id_Coche = (select top 1 c.id_Coche from COCHE.COCHE c
				INNER JOIN COCHE.SEGUNDA S ON c.id_Coche = s.id_Coche 
				where c.tipoCoche != 'S'
				)
END
GO

	--Primera 

WHILE ((SELECT COUNT (id_Coche) FROM COCHE.COCHE WHERE tipoCoche = 'N') < (SELECT COUNT (id_Coche) FROM COCHE.COCHE WHERE tipoCoche != 'S') )
BEGIN 
	
	UPDATE COCHE.COCHE
		set tipoCoche = 'N'
		where id_Coche = (select top 1 id_Coche from COCHE.COCHE
				where tipoCoche != 'S' and tipoCoche != 'N'
				)
END
GO
*/

--==============================
SELECT 'COCHES' 
SELECT * FROM COCHE.COCHE
SELECT * FROM COCHE.SEGUNDA
--==============================


/*

	Registros para CATALOGO.CREDITO
*/
--DBCC CHECKIDENT ('CATALOGO.CREDITO', RESEED,0);-- Resetear la PK
go
INSERT INTO CATALOGO.CREDITO (descripcion)
VALUES 
	('12 MESES'),
    ('24 MESES'),
    ('36 MESES'),
    ('48 MESES');

/*

	Registros para VENTA.CREDITO
*/
--DBCC CHECKIDENT ('VENTA.CREDITO', RESEED,0);-- Resetear la PK
go
INSERT INTO VENTA.CREDITO (numTarjeta, enganche, interesMensual, deuda, banco, tipoCredito, fecha)
VALUES 
    (6834567890123456, 25000, 18750,200000, 'Banorte', 1, '2023-01-01'),
    (9345678901234867, 10000, 3500, 50000, 'Santander', 2, '2023-02-01'),
    (8456789012345678, 10000, 2222, 70000, 'HSBC', 3, '2023-03-01'),
    (0567890123456789, 10000, 1875, 80000, 'Inbursa', 4, '2023-04-01'),
    (1678901234567890, 50000, 4583.34,500000, 'Scotiabank', 1, '2023-05-01'),
    (5789012345678901, 10000, 2917, 60000, 'Santander', 2, '2023-06-01'),
    (3890123456789012, 15000, 2084, 60000, 'BBVA', 3, '2023-07-01'),
    (2901234567890123, 35000, 7917, 345000, 'Santander', 4, '2023-08-01'),
    (1012345678901234, 10000, 7542, 80500, 'BBVA', 1, '2023-09-01'),
    (9234567890123456, 25000, 3542, 60000, 'HSBC', 2, '2023-10-01'),
    (7345078901234567, 40000, 10472,337000, 'Banorte', 3, '2023-11-01'),
    (1456789012345678, 30000, 6250, 270000, 'Inbursa', 4, '2023-12-01'),
    (1567890123456789, 10000, 3930, 37150, 'Inbursa', 1, '2024-01-01'),
    (2678901234567890, 40000, 16350,353000, 'HSBC', 2, '2024-02-01'),
    (8789012345678903, 10000, 2223, 80000, 'HSBC', 3, '2024-03-01');

	
	

/*

	Registros para VENTA.VENTA
*/
--DBCC CHECKIDENT ('VENTA.VENTA', RESEED,0);
INSERT INTO VENTA.VENTA (comision, fecha, Extras, CostoTotal, numEmpleado, id_Cliente, id_Coche, id_Credito)
VALUES
    (10000.00, '2023-01-01', 'Seguro', 225000.00, 1, 1, 1, 1),
    (12000.50, '2023-02-01', 'GPS', 60000.00, 2, 2, 2, 2),
    (9000.75, '2023-03-01', 'Asientos de Cuero', 80000.00, 3, 3, 3, 3),
    (8000.20, '2023-04-01', 'Paquete de Mantenimiento', 90000.00, 4, 4, 4, 4),
    (11000.00, '2023-05-01', 'Llantas de Invierno', 550000.00, 5, 5, 5, 5),
    (9500.50, '2023-06-01', 'Asistencia en Carretera', 70000.00, 10, 6, 6, 6),
    (10500.25, '2023-07-01', 'Quemacocos', 75000.00, 15, 7, 7, 7),
    (11500.75, '2023-08-01', 'Techo Solar', 380000.00, 19, 8, 8, 8),
    (8800.90, '2023-09-01', 'Asientos con Calefacci�n', 90500.00, 1, 9, 9, 9),
    (13000.00, '2023-10-01', 'Sistema de Entretenimiento', 85000.00, 2, 10, 10, 10),
    (7500.40, '2023-11-01', 'Sistema de Navegaci�n', 377000.00, 3, 11, 11, 11),
    (10200.80, '2023-12-01', 'Seguro contra Robo', 300000.00, 4, 12, 12, 12),
    (9400.30, '2024-01-01', 'Paquete de Servicios', 47150.00, 5, 13, 13, 13),
    (7800.60, '2024-02-01', 'Asientos Deportivos', 393000.00, 10, 14, 14, 14),
    (8500.00, '2024-03-01', 'Reproductor de DVD', 80000.00, 15, 15, 15, 15),
    (12000.25, '2024-04-01', 'Seguro contra Colisiones', 90000.50, 19, 16, 16, NULL),
    (9800.70, '2024-05-01', 'Sistema de Sonido Premium', 493500.00, 1, 17, 17, NULL),
    (11000.90, '2024-06-01', 'Asientos El�ctricos', 554500.00, 2, 18, 18, NULL),
    (8200.40, '2024-07-01', 'Pintura Personalizada', 412000.00, 3, 19, 19, NULL),
    (10700.80, '2024-08-01', 'Cobertura Extendida', 539000.00, 4, 20, 20, NULL);

--==============================
SELECT 'VENTAS'
SELECT * FROM CATALOGO.CREDITO
SELECT * FROM VENTA.CREDITO
SELECT * FROM VENTA.VENTA
--==============================

/*
	Registros para tabla CATALOGO.REPARACION
*/
--DBCC CHECKIDENT ('CATALOGO.REPARACION', RESEED,0);
INSERT INTO CATALOGO.REPARACION (descripcion)
VALUES
    ('Afinacion'),                                                            
    ('Cambio de las escobillas limpiaparabrisas'),
    ('Cambio del filtro de aire'),
    ('Cambio  de aceite'),                              
    ('Cambio filtro de aceite'),
    ('Cambio filtro de gasonalina'),                                                            
    ('Mantenimiento programado'),
    ('Cambio de Llantas'),
    ('Cambio de bacteria'),
    ('Reparacion de frenos'),
    ('Anticongelante adicional'),
    ('Afinaci�n del motor'),
    ('Alineacion/balanceo de llantas'),
    ('Reparacion caja de cambios'),
    ('Cambios de bujias'),
  	('Remplazo de neumaticos'),
    ('Cambio de liquido de frenos'),
    ('Remplazo de bateria'),
    ('Cambio de luces');

--DBCC CHECKIDENT ('CATALOGO.REVISION', RESEED,0);
INSERT INTO CATALOGO.REVISION (descripcion)
VALUES
      ('Revision de aceite'),
      ('Revision de filtro de aceite'),
      ('Revision de filtros de aire'),
  	 ('Revision de filtros de gasolina'),
      ('Revision de frenos'),
      ('Revision de neumaticos'),
      ('Revsion de suspecion y amortiguadores'),
      ('Revision de bateria'),
      ('Revision de luz'),
      ('Revision de transmicion ');


/*
	Registros para tabla SERVICIO.SERVICIO
*/
--DBCC CHECKIDENT ('SERVICIO.SERVICIO', RESEED,0);
INSERT INTO SERVICIO.SERVICIO (id_Coche, id_Cliente, tipoServicio, fecha, hora, motivo, costos, estatus, numEmpleado)
VALUES
    (1, 1, 'R', '2023-01-01', '2023-01-01 08:00:00', 'Cambio de aceite', 300.00, 'P', 6),
    (2, 2, 'C', '2023-01-02', '2023-01-02 09:30:00', 'Frenos', 500.00, 'P', NULL),
    (3, 3, 'C', '2023-01-03', '2023-01-03 11:45:00', 'Servicio programado', 600.00, 'C', NULL),
    (4, 4, 'R', '2023-01-04', '2023-01-04 14:15:00', 'Reemplazo de bateria', 1700.00, 'C', 8),
    (5, 5, 'R', '2023-01-05', '2023-01-05 16:30:00', 'Cambio de filtros', 350.00, 'P', 11),
    (6, 6, 'R', '2023-01-06', '2023-01-06 18:45:00', 'Reparacion de luces', 1500.00, 'E', 13),
    (7, 7, 'R', '2023-01-07', '2023-01-07 20:00:00', 'Cambio de bujias', 300.00, 'C', 17),
    (8, 8, 'R', '2023-01-08', '2023-01-08 22:15:00', 'Reemplazo de neum�ticos', 10000.00, 'P', 20),
    (9, 9, 'C', '2023-01-09', '2023-01-09 05:30:00', 'Revision de Frenos', 150.00, 'P', NULL),
    (10, 10, 'R', '2023-01-10', '2023-01-10 07:45:00', 'Reparacion de transmision', 3000.00, 'C', 6),
    (11, 11, 'R', '2023-01-11', '2023-01-11 10:00:00', 'Cambio de aceite', 300.00, 'P', 8),
    (12, 12, 'C', '2023-01-12', '2023-01-12 12:15:00', 'Revision frenos', 150.00, 'P', NULL),
    (13, 13, 'R', '2023-01-13', '2023-01-13 14:30:00', 'Alineaci�n y balanceo', 300.00, 'C', 8),
    (14, 14, 'R', '2023-01-14', '2023-01-14 16:45:00', 'Reemplazo de bateria', 1700.00, 'C', 11),
    (15, 15, 'R', '2023-01-15', '2023-01-15 19:00:00', 'Cambio de filtros', 350.00, 'P', 13),
    (16, 16, 'R', '2023-01-16', '2023-01-16 21:15:00', 'Reparacion de luces', 1500.00, 'E', 17),
    (17, 17, 'R', '2023-01-17', '2023-01-17 23:30:00', 'Cambio de bujias', 300.00, 'C', 20),
    (18, 18, 'R', '2023-01-18', '2023-01-18 02:45:00', 'Reemplazo de neumaticos', 10000.00, 'P', 6),
    (19, 19, 'R', '2023-01-19', '2023-01-19 05:00:00', 'Cambio de aceite', 300.00, 'P', 8),
    (20, 20, 'R', '2023-01-20', '2023-01-20 07:15:00', 'Reparacion de frenos', 700.00, 'P', 11);



/*

	Registros para tabla SERVICIO.REPARACION
*/

INSERT INTO SERVICIO.REPARACION (id_Servicio, id_Reparacion)
VALUES
    (1, 4),
    (4, 18),
    (5, 5),
    (6, 19),
    (7, 15),
    (8, 16),
    (10, 14),
    (11, 4),
    (13, 13),
    (14, 18),
    (15, 3),
    (16, 19),
    (17, 15),
    (18, 16),
    (19, 4),
    (20, 10);

/*
	Registros para tabla SERVICIO.REVISION
*/
INSERT INTO SERVICIO.REVISION (id_Servicio, fechaPlaneacion, fechaRealizacion, id_Revision, numEmpleado)
VALUES
(2, '2023-01-01 10:00:00', '2023-01-01 12:00:00',  5, 7),
(3, '2023-01-02 11:30:00', '2023-01-02 14:00:00', 3, 12),
(9, '2023-01-03 13:45:00', '2023-01-03 16:30:00',  5, 14),
(12, '2023-01-04 16:15:00', '2023-01-04 18:45:00', 5, 18);



/*
	REGISTROS PARA COCHES HECHO CON PROCEDIMIENTOS Y EXISTENCIA DE TRIGGERS
*/



--REGISTROS DE CLIENTES
-- Bloque 1
EXEC CLIENTE.PR_REGISTROCLIENTE
    @P_paterno_CLIENTE = 'Hernandez',
    @P_materno_CLIENTE = 'Gutierrez',
    @P_nombre_CLIENTE = 'Laura',
    @P_genero_CLIENTE = 'M',
    @P_rfc_CLIENTE = 'HERG920215XXX',
    @P_calle_CLIENTE = 'Aleta',
    @P_municipio_CLIENTE = 'Cuauhtemoc',
    @P_estado_CLIENTE = 'Ciudad de Mexico',
    @P_numero_CLIENTE = '2',
    @P_telefono_CLIENTE =5533445566,
    @P_correo_Cliente = 'laura.hernandez@example.com',
    @P_Curp_AVAL = 'LOMA940514MDFNpSS0',
    @P_paterno_AVAL = 'Lopez',
    @P_materno_AVAL = 'Maldonado',
    @P_nombre_AVAL = 'Ana',
    @P_calle_AVAL = 'Piraña',
    @P_municipio_AVAL = 'Cuauhtemoc',
    @P_estado_AVAL = 'Ciudad de Mexico',
    @P_numero_AVAL = '3',
    @P_telefono_AVAL =5512345678;

-- Bloque 2
EXEC CLIENTE.PR_REGISTROCLIENTE
    @P_paterno_CLIENTE = 'Gomez',
    @P_materno_CLIENTE = 'Martinez',
    @P_nombre_CLIENTE = 'Alejandro',
    @P_genero_CLIENTE = 'H',
    @P_rfc_CLIENTE = 'GOMA891110XXX',
    @P_calle_CLIENTE = 'Allende',
    @P_municipio_CLIENTE = 'Cuauhtemoc',
    @P_estado_CLIENTE = 'Ciudad de Mexico',
    @P_numero_CLIENTE = '62',
    @P_telefono_CLIENTE = 5544556677,
    @P_correo_Cliente = 'alejandro.gomez@example.com',
    @P_Curp_AVAL = 'GARC940223HDFNNS00',
    @P_paterno_AVAL = 'Garcia',
    @P_materno_AVAL = 'Santos',
    @P_nombre_AVAL = 'Carlos',
    @P_calle_AVAL = 'Durango',
    @P_municipio_AVAL = 'Benito',
    @P_estado_AVAL = 'Ciudad de Mexico',
    @P_numero_AVAL = '46',
    @P_telefono_AVAL = 5523456789;

-- Bloque 3
EXEC CLIENTE.PR_REGISTROCLIENTE
    @P_paterno_CLIENTE = 'Diaz',
    @P_materno_CLIENTE = 'Sanchez',
    @P_nombre_CLIENTE = 'Alejandro',
    @P_genero_CLIENTE = 'H',
    @P_rfc_CLIENTE = 'DIAI950504XXXX',
    @P_calle_CLIENTE = 'Allende',
    @P_municipio_CLIENTE = 'Cuauhtemoc',
    @P_estado_CLIENTE = 'Ciudad de Mexico',
    @P_numero_CLIENTE = '62',
    @P_telefono_CLIENTE = 5555667787,
    @P_correo_Cliente = 'alejandro.diaz@example.com',
    @P_Curp_AVAL = 'RODR930982MDFNNSS2',
    @P_paterno_AVAL = 'Garcia',
    @P_materno_AVAL = 'Santos',
    @P_nombre_AVAL = 'Carlos',
    @P_calle_AVAL = 'Durango',
    @P_municipio_AVAL = 'Benito',
    @P_estado_AVAL = 'Ciudad de Mexico',
    @P_numero_AVAL = '46',
    @P_telefono_AVAL = 5534567890;

-- Bloque 4
EXEC CLIENTE.PR_REGISTROCLIENTE
    @P_paterno_CLIENTE = 'Gonzalez',
    @P_materno_CLIENTE = 'Martinez',
    @P_nombre_CLIENTE = 'Maria',
    @P_genero_CLIENTE = 'M',
    @P_rfc_CLIENTE = 'TORR870720XXX',
    @P_calle_CLIENTE = 'Reforma',
    @P_municipio_CLIENTE = 'Coyoaca',
    @P_estado_CLIENTE = 'Ciudad de Mexico',
    @P_numero_CLIENTE = '234',
    @P_telefono_CLIENTE = 5566785899,
    @P_correo_Cliente = 'maria.gonzalez@example.com',
    @P_Curp_AVAL = 'RODR930712MDFNNSS2',
    @P_paterno_AVAL = 'Martinez',
    @P_materno_AVAL = 'Gomez',
    @P_nombre_AVAL = 'Ricardo',
    @P_calle_AVAL = 'Colima',
    @P_municipio_AVAL = 'neza',
    @P_estado_AVAL = 'Ciudad de Mexico',
    @P_numero_AVAL = '567',
    @P_telefono_AVAL = 5545678901;

-- Bloque 5
EXEC CLIENTE.PR_REGISTROCLIENTE
    @P_paterno_CLIENTE = 'Santos',
    @P_materno_CLIENTE = 'Gomez',
    @P_nombre_CLIENTE = 'Leticia',
    @P_genero_CLIENTE = 'M',
    @P_rfc_CLIENTE = 'CRUP900305XXX',
    @P_calle_CLIENTE = 'Roma',
    @P_municipio_CLIENTE = 'Monaco',
    @P_estado_CLIENTE = 'Ciudad de Mexico',
    @P_numero_CLIENTE = '345',
    @P_telefono_CLIENTE = 5566778890,
    @P_correo_Cliente = 'leticia.santos@example.com',
    @P_Curp_AVAL = 'MORA910308MDFNNSS4',
    @P_paterno_AVAL = 'Gomez',
    @P_materno_AVAL = 'Ramirez',
    @P_nombre_AVAL = 'Hector',
    @P_calle_AVAL = 'Nayarit',
    @P_municipio_AVAL = 'Tlapan',
    @P_estado_AVAL = 'Ciudad de Mexico',
    @P_numero_AVAL = '901',
    @P_telefono_AVAL = 5556789012;

-- Bloque 6
EXEC CLIENTE.PR_REGISTROCLIENTE
    @P_paterno_CLIENTE = 'Gutierrez',
    @P_materno_CLIENTE = 'Ramirez',
    @P_nombre_CLIENTE = 'Alejandro',
    @P_genero_CLIENTE = 'H',
    @P_rfc_CLIENTE = 'SORG980112XXX',
    @P_calle_CLIENTE = 'Walkirias',
    @P_municipio_CLIENTE = 'kwie',
    @P_estado_CLIENTE = 'Ciudad de Mexico',
    @P_numero_CLIENTE = '678',
    @P_telefono_CLIENTE = 5588990011,
    @P_correo_Cliente = 'alejandro.gutierrez@example.com',
    @P_Curp_AVAL = 'DIAZ980521HDFNNS00',
    @P_paterno_AVAL = 'Ramirez',
    @P_materno_AVAL = 'Ortega',
    @P_nombre_AVAL = 'Patricia',
    @P_calle_AVAL = 'Rosa',
    @P_municipio_AVAL = 'Oporto',
    @P_estado_AVAL = 'Ciudad de Mexico',
    @P_numero_AVAL = '234',
    @P_telefono_AVAL = 5567890123;

-- Bloque 7
EXEC CLIENTE.PR_REGISTROCLIENTE
    @P_paterno_CLIENTE = 'Vega',
    @P_materno_CLIENTE = 'Hernandez',
    @P_nombre_CLIENTE = 'Oscar',
    @P_genero_CLIENTE = 'H',
    @P_rfc_CLIENTE = 'LARD871212XXX',
    @P_calle_CLIENTE = 'Xola',
    @P_municipio_CLIENTE = 'VI',
    @P_estado_CLIENTE = 'Ciudad de Mexico',
    @P_numero_CLIENTE = '456',
    @P_telefono_CLIENTE = 5599001122,
    @P_correo_Cliente = 'oscar.vega@example.com',
    @P_Curp_AVAL = 'LOPE871112MDFNNSS6',
    @P_paterno_AVAL = 'Hernandez',
    @P_materno_AVAL = 'Martinez',
    @P_nombre_AVAL = 'Luis',
    @P_calle_AVAL = 'Sonora',
    @P_municipio_AVAL = 'Grill',
    @P_estado_AVAL = 'Ciudad de Mexico',
    @P_numero_AVAL = '890',
    @P_telefono_AVAL = 5578901234;

-- Bloque 8
EXEC CLIENTE.PR_REGISTROCLIENTE
    @P_paterno_CLIENTE = 'Reyes',
    @P_materno_CLIENTE = 'Gomez',
    @P_nombre_CLIENTE = 'Natalia',
    @P_genero_CLIENTE = 'M',
    @P_rfc_CLIENTE = 'VEGO900515XXX',
    @P_calle_CLIENTE = 'Santa Ana',
    @P_municipio_CLIENTE = 'Piraña ',
    @P_estado_CLIENTE = 'Ciudad de Mexico',
    @P_numero_CLIENTE = '567',
    @P_telefono_CLIENTE = 5512375678,
    @P_correo_Cliente = 'natalia.reyes@example.com',
    @P_Curp_AVAL = 'GOME900216HDFNNS00',
    @P_paterno_AVAL = 'Gomez',
    @P_materno_AVAL = 'Victor',
    @P_nombre_AVAL = 'Victor',
    @P_calle_AVAL = 'Quinto',
    @P_municipio_AVAL = 'XOCHI',
    @P_estado_AVAL = 'Ciudad de Mexico',
    @P_numero_AVAL = '345',
    @P_telefono_AVAL = 5589012345;

-- Bloque 9
EXEC CLIENTE.PR_REGISTROCLIENTE
    @P_paterno_CLIENTE = 'Flores',
    @P_materno_CLIENTE = 'Perez',
    @P_nombre_CLIENTE = 'Javier',
    @P_genero_CLIENTE = 'H',
    @P_rfc_CLIENTE = 'REYN951030XXX',
    @P_calle_CLIENTE = 'Reno',
    @P_municipio_CLIENTE = 'porto',
    @P_estado_CLIENTE = 'Ciudad de Mexico',
    @P_numero_CLIENTE = '678',
    @P_telefono_CLIENTE = 5511223344,
    @P_correo_Cliente = 'javier.flores@example.com',
    @P_Curp_AVAL = 'PENA940601MDFNNSS8',
    @P_paterno_AVAL = 'Perez',
    @P_materno_AVAL = 'Soto',
    @P_nombre_AVAL = 'Jose',
    @P_calle_AVAL = 'Parka',
    @P_municipio_AVAL = 'Espain',
    @P_estado_AVAL = 'Ciudad de Mexico',
    @P_numero_AVAL = '901',
    @P_telefono_AVAL = 5590123456;

-- Bloque 10
EXEC CLIENTE.PR_REGISTROCLIENTE
    @P_paterno_CLIENTE = 'Gutierrez',
    @P_materno_CLIENTE = 'Gonzalez',
    @P_nombre_CLIENTE = 'Maria',
    @P_genero_CLIENTE = 'M',
    @P_rfc_CLIENTE = 'FLPJ910204XXX',
    @P_calle_CLIENTE = 'Madero',
    @P_municipio_CLIENTE = 'Coyo',
    @P_estado_CLIENTE = 'Ciudad de México',
    @P_numero_CLIENTE = '789',
    @P_telefono_CLIENTE = 5522334455,
    @P_correo_Cliente = 'maria.gutierrez@example.com',
    @P_Curp_AVAL = 'SANT960723HDFNNS00',
    @P_paterno_AVAL = 'Gonzalez',
    @P_materno_AVAL = 'Moreno',
    @P_nombre_AVAL = 'Ana',
    @P_calle_AVAL = 'Walkirias',
    @P_municipio_AVAL = 'Tlapan',
    @P_estado_AVAL = 'Ciudad de Mexico',
    @P_numero_AVAL = '234',
    @P_telefono_AVAL = 5501234567;
-- Bloque 11
EXEC CLIENTE.PR_REGISTROCLIENTE
    @P_paterno_CLIENTE = 'Mendoza',
    @P_materno_CLIENTE = 'Torres',
    @P_nombre_CLIENTE = 'Victor',
    @P_genero_CLIENTE = 'H',
    @P_rfc_CLIENTE = 'GUMR940729XXX',
    @P_calle_CLIENTE = 'Santa Ana',
    @P_municipio_CLIENTE = 'San Angel',
    @P_estado_CLIENTE = 'Ciudad de Mexico',
    @P_numero_CLIENTE = '345',
    @P_telefono_CLIENTE = 5567890123,
    @P_correo_Cliente = 'victor.mendoza@example.com',
    @P_Curp_AVAL = 'TORR930824MDFNNSS0',
    @P_paterno_AVAL = 'Torres',
    @P_materno_AVAL = 'Gutierrez',
    @P_nombre_AVAL = 'Elena',
    @P_calle_AVAL = 'Quinto',
    @P_municipio_AVAL = 'Nopalera',
    @P_estado_AVAL = 'Ciudad de Mexico',
    @P_numero_AVAL = '345',
    @P_telefono_AVAL = 5511223344;

-- Bloque 12
EXEC CLIENTE.PR_REGISTROCLIENTE
    @P_paterno_CLIENTE = 'Sanchez',
    @P_materno_CLIENTE = 'Diaz',
    @P_nombre_CLIENTE = 'Marta',
    @P_genero_CLIENTE = 'M',
    @P_rfc_CLIENTE = 'MENV960622XXX',
    @P_calle_CLIENTE = 'Uva',
    @P_municipio_CLIENTE = 'Xochimilco',
    @P_estado_CLIENTE = 'Ciudad de Mexico',
    @P_numero_CLIENTE = '456',
    @P_telefono_CLIENTE = 5578901234,
    @P_correo_Cliente = 'marta.sanchez@example.com',
    @P_Curp_AVAL = 'MEND950405HDFNNS10',
    @P_paterno_AVAL = 'Sanchez',
    @P_materno_AVAL = 'Ortega',
    @P_nombre_AVAL = 'Patricia',
    @P_calle_AVAL = 'Sonora',
    @P_municipio_AVAL = 'PEPE',
    @P_estado_AVAL = 'Ciudad de Mexico',
    @P_numero_AVAL = '890',
    @P_telefono_AVAL = 5522334455;

-- Bloque 13
EXEC CLIENTE.PR_REGISTROCLIENTE
    @P_paterno_CLIENTE = 'Velasquez',
    @P_materno_CLIENTE = 'Mendoza',
    @P_nombre_CLIENTE = 'Raul',
    @P_genero_CLIENTE = 'H',
    @P_rfc_CLIENTE = 'SAMT921125XXX',
    @P_calle_CLIENTE = 'Rosa',
    @P_municipio_CLIENTE = 'Constitucion',
    @P_estado_CLIENTE = 'Ciudad de Mexico',
    @P_numero_CLIENTE = '567',
    @P_telefono_CLIENTE = 5589012345,
    @P_correo_Cliente = 'raul.velasquez@example.com',
    @P_Curp_AVAL = 'RAMI910709MDFNNSS2',
    @P_paterno_AVAL = 'Ramirez',
    @P_materno_AVAL = 'Castro',
    @P_nombre_AVAL = 'Luis',
    @P_calle_AVAL = 'OPorto',
    @P_municipio_AVAL = 'Parque de los venda',
    @P_estado_AVAL = 'Ciudad de Mexico',
    @P_numero_AVAL = '901',
    @P_telefono_AVAL = 5533445566;

-- Bloque 14
EXEC CLIENTE.PR_REGISTROCLIENTE
    @P_paterno_CLIENTE = 'Pena',
    @P_materno_CLIENTE = 'Cruz',
    @P_nombre_CLIENTE = 'Sandra',
    @P_genero_CLIENTE = 'M',
    @P_rfc_CLIENTE = 'VERR900802XXX',
    @P_calle_CLIENTE = 'Walkirias',
    @P_municipio_CLIENTE = 'Porto',
    @P_estado_CLIENTE = 'Ciudad de Mexico',
    @P_numero_CLIENTE = '678',
    @P_telefono_CLIENTE = 5590123456,
    @P_correo_Cliente = 'sandra.pena@example.com',
    @P_Curp_AVAL = 'CAST880530HDFNNS10',
    @P_paterno_AVAL = 'Pena',
    @P_materno_AVAL = 'Soto',
    @P_nombre_AVAL = 'Jose',
    @P_calle_AVAL = 'Zapo',
    @P_municipio_AVAL = 'Roma',
    @P_estado_AVAL = 'Ciudad de Mexico',
    @P_numero_AVAL = '901',
    @P_telefono_AVAL = 5544556677;

-- Bloque 15
EXEC CLIENTE.PR_REGISTROCLIENTE
    @P_paterno_CLIENTE = 'Guzman',
    @P_materno_CLIENTE = 'Flores',
    @P_nombre_CLIENTE = 'Gabriel',
    @P_genero_CLIENTE = 'H',
    @P_rfc_CLIENTE = 'MOPC880423XXX',
    @P_calle_CLIENTE = 'Parka',
    @P_municipio_CLIENTE = 'San Gregorio',
    @P_estado_CLIENTE = 'Ciudad de Mexico',
    @P_numero_CLIENTE = '789',
    @P_telefono_CLIENTE = 5501234567,
    @P_correo_Cliente = 'gabriel.guzman@example.com',
    @P_Curp_AVAL = 'JUAN900102MDFNNSS4',
    @P_paterno_AVAL = 'Guzman',
    @P_materno_AVAL = 'Gomez',
    @P_nombre_AVAL = 'Victor',
    @P_calle_AVAL = 'Andador 7',
    @P_municipio_AVAL = 'Puerto',
    @P_estado_AVAL = 'Ciudad de Mexico',
    @P_numero_AVAL = '902',
    @P_telefono_AVAL = 5555667788;
-- Bloque 16
EXEC CLIENTE.PR_REGISTROCLIENTE
    @P_paterno_CLIENTE = 'Vega',
    @P_materno_CLIENTE = 'Hernandez',
    @P_nombre_CLIENTE = 'Diana',
    @P_genero_CLIENTE = 'M',
    @P_rfc_CLIENTE = 'SAJF900710XXX',
    @P_calle_CLIENTE = 'Quinto',
    @P_municipio_CLIENTE = 'Vilgo',
    @P_estado_CLIENTE = 'Ciudad de Mexico',
    @P_numero_CLIENTE = '890',
    @P_telefono_CLIENTE = 5502375678,
    @P_correo_Cliente = 'diana.vega@example.com',
    @P_Curp_AVAL = 'PERE960216HDFNNS10',
    @P_paterno_AVAL = 'Vega',
    @P_materno_AVAL = 'Hernandez',
    @P_nombre_AVAL = 'Alejandro',
    @P_calle_AVAL = 'Santa Domingo',
    @P_municipio_AVAL = 'Lomas',
    @P_estado_AVAL = 'Ciudad de Mexico',
    @P_numero_AVAL = '903',
    @P_telefono_AVAL = 5566778899;

-- Bloque 17
EXEC CLIENTE.PR_REGISTROCLIENTE
    @P_paterno_CLIENTE = 'Lopez',
    @P_materno_CLIENTE = 'Velasquez',
    @P_nombre_CLIENTE = 'Diana',
    @P_genero_CLIENTE = 'M',
    @P_rfc_CLIENTE = 'LUSL910302XXX',
    @P_calle_CLIENTE = 'OPorto',
    @P_municipio_CLIENTE = 'Tuyel',
    @P_estado_CLIENTE = 'Ciudad de Mexico',
    @P_numero_CLIENTE = '876',
    @P_telefono_CLIENTE = 5523456789,
    @P_correo_Cliente = 'diana.lopez@example.com',
    @P_Curp_AVAL = 'GUIL940330MDFNNSS6',
    @P_paterno_AVAL = 'Lopez',
    @P_materno_AVAL = 'Sanchez',
    @P_nombre_AVAL = 'Laura',
    @P_calle_AVAL = 'Roma',
    @P_municipio_AVAL = 'Italy',
    @P_estado_AVAL = 'Ciudad de México',
    @P_numero_AVAL = '904',
    @P_telefono_AVAL = 5577889900;

-- Bloque 18
EXEC CLIENTE.PR_REGISTROCLIENTE
    @P_paterno_CLIENTE = 'Ramirez',
    @P_materno_CLIENTE = 'Ortega',
    @P_nombre_CLIENTE = 'Patricia',
    @P_genero_CLIENTE = 'M',
    @P_rfc_CLIENTE = 'ORVH950811XXX',
    @P_calle_CLIENTE = 'Messi',
    @P_municipio_CLIENTE = 'Puerto',
    @P_estado_CLIENTE = 'Ciudad de Mexico',
    @P_numero_CLIENTE = '543',
    @P_telefono_CLIENTE = 5534567890,
    @P_correo_Cliente = 'patricia.ramirez@example.com',
    @P_Curp_AVAL = 'REYE931124HDFNNS10',
    @P_paterno_AVAL = 'Perez',
    @P_materno_AVAL = 'Soto',
    @P_nombre_AVAL = 'Jose',
    @P_calle_AVAL = 'Oriente',
    @P_municipio_AVAL = 'Hola',
    @P_estado_AVAL = 'Ciudad de Mexico',
    @P_numero_AVAL = '905',
    @P_telefono_AVAL = 5588990011;

-- Bloque 19
EXEC CLIENTE.PR_REGISTROCLIENTE
    @P_paterno_CLIENTE = 'Castro',
    @P_materno_CLIENTE = 'Vega',
    @P_nombre_CLIENTE = 'Luis',
    @P_genero_CLIENTE = 'H',
    @P_rfc_CLIENTE = 'RORA920620XXX',
    @P_calle_CLIENTE = 'Walkirias',
    @P_municipio_CLIENTE = 'Olivos',
    @P_estado_CLIENTE = 'Ciudad de Mexico',
    @P_numero_CLIENTE = '456',
    @P_telefono_CLIENTE = 5545678901,
    @P_correo_Cliente = 'luis.castro@example.com',
    @P_Curp_AVAL = 'LOPE891215MDFNNS18',
    @P_paterno_AVAL = 'Castro',
    @P_materno_AVAL = 'Luna',
    @P_nombre_AVAL = 'Marta',
    @P_calle_AVAL = 'Zapo',
    @P_municipio_AVAL = 'Calle 11',
    @P_estado_AVAL = 'Ciudad de Mexico',
    @P_numero_AVAL = '906',
    @P_telefono_AVAL = 5599001122;

-- Bloque 20
EXEC CLIENTE.PR_REGISTROCLIENTE
    @P_paterno_CLIENTE = 'Reyes',
    @P_materno_CLIENTE = 'Gomez',
    @P_nombre_CLIENTE = 'Victor',
    @P_genero_CLIENTE = 'H',
    @P_rfc_CLIENTE = 'GUGF900402XXX',
    @P_calle_CLIENTE = 'Sonora',
    @P_municipio_CLIENTE = 'neza',
    @P_estado_CLIENTE = 'Ciudad de Mexico',
    @P_numero_CLIENTE = '789',
    @P_telefono_CLIENTE = 5556789012,
    @P_correo_Cliente = 'victor.reyes@example.com',
    @P_Curp_AVAL = 'TORR970706HDFNNS19',
    @P_paterno_AVAL = 'Ramos',
    @P_materno_AVAL = 'Gonzalez',
    @P_nombre_AVAL = 'Ana',
    @P_calle_AVAL = 'Santa Ana',
    @P_municipio_AVAL = 'Neza',
    @P_estado_AVAL = 'Ciudad de Mexico',
    @P_numero_AVAL = '907',
    @P_telefono_AVAL = 5500112233;




/*EMPLEADO 1*/
EXEC EMPLEADO.PR_REGISTROEMPLEADO
    @P_fechaNacimiento = '1990-03-15',
    @P_Paterno = 'Gomez',
    @P_Materno = 'Lopez',
    @P_Nombre = 'Juan',
    @P_Fecha_Ingreso = '2010-05-20',
    @P_sueldo = 35000.00,
    @P_tipoEmpleado = 'V',
    @P_Escolaridad = NULL, 
    @P_Calle = 'Ramos Milla',
    @P_Municipio = 'Cuauhtemoc',
    @P_Estado = 'Ciudad de Mexico',
    @P_Numero = '123',
    @P_Telefono = 5512345678;

/*EMPLEADO 2*/
EXEC EMPLEADO.PR_REGISTROEMPLEADO
    @P_fechaNacimiento = '1985-08-22',
    @P_Paterno = 'Martinez',
    @P_Materno = 'Ramirez',
    @P_Nombre = 'Ana',
    @P_Fecha_Ingreso = '2009-11-10',
    @P_sueldo = 42000.00,
    @P_tipoEmpleado = 'V',
    @P_Escolaridad = NULL,
    @P_Calle = 'De los toltecas',
    @P_Municipio = 'Benito Juarez',
    @P_Estado = 'Ciudad de Mexico',
    @P_Numero = '456',
    @P_Telefono = 5623456789;

/*Empleado 3*/

EXEC EMPLEADO.PR_REGISTROEMPLEADO
    @P_fechaNacimiento = '1990-12-05',
    @P_Paterno = 'Rodriguez',
    @P_Materno = 'Garcia',
    @P_Nombre = 'Carlos',
    @P_Fecha_Ingreso = '2012-08-15',
    @P_sueldo = 38000.00,
    @P_tipoEmpleado = 'V',
    @P_Escolaridad = NULL,
    @P_Calle = 'Bodas de Figaro',
    @P_Municipio = 'Coyoacan',
    @P_Estado = 'Ciudad de Mexico',
    @P_Numero = '789',
    @P_Telefono = 5545678901;

/*EMPLEADO 4*/
EXEC EMPLEADO.PR_REGISTROEMPLEADO
    @P_fechaNacimiento = '1992-06-18',
    @P_Paterno = 'Hernandez',
    @P_Materno = 'Martinez',
    @P_Nombre = 'Laura',
    @P_Fecha_Ingreso = '2015-02-28',
    @P_sueldo = 30000.00,
    @P_tipoEmpleado = 'V',
    @P_Escolaridad = NULL,
    @P_Calle = 'Sonora',
    @P_Municipio = 'Miguel Hidalgo',
    @P_Estado = 'Ciudad de Mexico',
    @P_Numero = '101',
    @P_Telefono = 5656789012;
/*
Empleado 5
*/
EXEC EMPLEADO.PR_REGISTROEMPLEADO
    @P_fechaNacimiento = '1980-04-02',
    @P_Paterno = 'Gutierrez',
    @P_Materno = 'Perez',
    @P_Nombre = 'Miguel',
    @P_Fecha_Ingreso = '2007-07-05',
    @P_sueldo = 45000.00,
    @P_tipoEmpleado = 'V',
    @P_Escolaridad = NULL,
    @P_Calle = 'Oriente',
    @P_Municipio = 'Cuauhtemoc',
    @P_Estado = 'Ciudad de Mexico',
    @P_Numero = '112',
    @P_Telefono = 5567890123;
/*EMPLEADO 6*/
EXEC EMPLEADO.PR_REGISTROEMPLEADO
    @P_fechaNacimiento = '1995-09-14',
    @P_Paterno = 'Diaz',
    @P_Materno = 'Fernandez',
    @P_Nombre = 'Isabel',
    @P_Fecha_Ingreso = '2023-02-12',
    @P_sueldo = 8000.00,
    @P_tipoEmpleado = 'M',
    @P_Escolaridad = 'Tecnico Bachillerato',
    @P_Calle = 'Calle 11',
    @P_Municipio = 'Benito Juarez',
    @P_Estado = 'Ciudad de Mexico',
    @P_Numero = '131',
    @P_Telefono = 5678901234;
/*EMPLEADO 7*/
EXEC EMPLEADO.PR_REGISTROEMPLEADO
    @P_fechaNacimiento = '1987-11-30',
    @P_Paterno = 'Lopez',
    @P_Materno = 'Sanchez',
    @P_Nombre = 'Francisco',
    @P_Fecha_Ingreso = '2013-10-22',
    @P_sueldo = 37000.00,
    @P_tipoEmpleado = 'T',
    @P_Escolaridad = NULL,
    @P_Calle = 'Calzada de los Remedios',
    @P_Municipio = 'Miguel Hidalgo',
    @P_Estado = 'Ciudad de Mexico',
    @P_Numero = '415',
    @P_Telefono = 5589012345;
/*EMPLEADO 8*/

EXEC EMPLEADO.PR_REGISTROEMPLEADO
    @P_fechaNacimiento = '1993-01-08',
    @P_Paterno = 'Flores',
    @P_Materno = 'Torres',
    @P_Nombre = 'Elena',
    @P_Fecha_Ingreso = '2016-06-17',
    @P_sueldo = 34000.00,
    @P_tipoEmpleado = 'M',
    @P_Escolaridad = 'Tecnico Bachillerato',
    @P_Calle = 'Andador 7',
    @P_Municipio = 'Miguel Hidalgo',
    @P_Estado = 'Ciudad de Mexico',
    @P_Numero = '516',
    @P_Telefono = 5690123456;
/*EMPLEADO 9*/
EXEC EMPLEADO.PR_REGISTROEMPLEADO
    @P_fechaNacimiento = '1982-07-25',
    @P_Paterno = 'Ortiz',
    @P_Materno = 'Jimenez',
    @P_Nombre = 'Javier',
    @P_Fecha_Ingreso = '2011-09-08',
    @P_sueldo = 40000.00,
    @P_tipoEmpleado = 'T',
    @P_Escolaridad = NULL,
    @P_Calle = 'Campeche',
    @P_Municipio = 'Cuauhtemoc',
    @P_Estado = 'Ciudad de Mexico',
    @P_Numero = '617',
    @P_Telefono = 5511223344;
/*EMPLEADO 10*/
EXEC EMPLEADO.PR_REGISTROEMPLEADO
    @P_fechaNacimiento = '1998-05-09',
    @P_Paterno = 'Ramirez',
    @P_Materno = 'Gomez',
    @P_Nombre = 'Sergio',
    @P_Fecha_Ingreso = '2020-03-25',
    @P_sueldo = 28000.00,
    @P_tipoEmpleado = 'V',
    @P_Escolaridad = NULL,
    @P_Calle = 'Colina del silencia',
    @P_Municipio = 'Benito Juarez',
    @P_Estado = 'Ciudad de Mexico',
    @P_Numero = '718',
    @P_Telefono = 5543445566;
/*EMPLEADO 11*/
EXEC EMPLEADO.PR_REGISTROEMPLEADO
    @P_fechaNacimiento = '1984-02-11',
    @P_Paterno = 'Gonzalez',
    @P_Materno = 'Hernandez',
    @P_Nombre = 'Luisa',
    @P_Fecha_Ingreso = '2008-12-01',
    @P_sueldo = 43000.00,
    @P_tipoEmpleado = 'M',
    @P_Escolaridad = 'Tecnico Bachillerato',
    @P_Calle = 'Veracruz',
    @P_Municipio = 'Coyoacan',
    @P_Estado = 'Ciudad de Mexico',
    @P_Numero = '819',
    @P_Telefono = 5654556677;
/*EMPLEADO 12*/
EXEC EMPLEADO.PR_REGISTROEMPLEADO
    @P_fechaNacimiento = '1991-10-07',
    @P_Paterno = 'Vargas',
    @P_Materno = 'Diaz',
    @P_Nombre = 'Roberto',
    @P_Fecha_Ingreso = '2014-01-14',
    @P_sueldo = 36000.00,
    @P_tipoEmpleado = 'T',
    @P_Escolaridad = NULL,
    @P_Calle = 'Tajin',
    @P_Municipio = 'Miguel Hidalgo',
    @P_Estado = 'Ciudad de Mexico',
    @P_Numero = '920',
    @P_Telefono = 5565667788;
/*EMPLEADO 13*/
EXEC EMPLEADO.PR_REGISTROEMPLEADO
    @P_fechaNacimiento = '1989-03-28',
    @P_Paterno = 'Cruz',
    @P_Materno = 'Soto',
    @P_Nombre = 'Carmen',
    @P_Fecha_Ingreso = '2017-08-09',
    @P_sueldo = 31000.00,
    @P_tipoEmpleado = 'M',
    @P_Escolaridad = 'Tecnico Bachillerato',
    @P_Calle = 'Guanajuato',
    @P_Municipio = 'Cuauhtemoc',
    @P_Estado = 'Ciudad de Mexico',
    @P_Numero = '521',
    @P_Telefono = 5676778899;
/*EMPLEADO 14*/
EXEC EMPLEADO.PR_REGISTROEMPLEADO
    @P_fechaNacimiento = '1994-04-19',
    @P_Paterno = 'Moreno',
    @P_Materno = 'Luna',
    @P_Nombre = 'Alejandro',
    @P_Fecha_Ingreso = '2022-11-03',
    @P_sueldo = 8000.00,
    @P_tipoEmpleado = 'T',
    @P_Escolaridad = NULL,
    @P_Calle = 'Pirana',
    @P_Municipio = 'Benito Juarez',
    @P_Estado = 'Ciudad de Mexico',
    @P_Numero = '422',
    @P_Telefono = 5587889900;
/*EMPLEADO 15*/
EXEC EMPLEADO.PR_REGISTROEMPLEADO
    @P_fechaNacimiento = '1983-09-03',
    @P_Paterno = 'Rojas',
    @P_Materno = 'Reyes',
    @P_Nombre = 'Maria',
    @P_Fecha_Ingreso = '2012-01-30',
    @P_sueldo = 39000.00,
    @P_tipoEmpleado = 'V',
    @P_Escolaridad = NULL,
    @P_Calle = 'Nayarit',
    @P_Municipio = 'Coyoacan',
    @P_Estado = 'Ciudad de Mexico',
    @P_Numero = '323',
    @P_Telefono = 5698990011;
/*EMPLEADO 16*/
EXEC EMPLEADO.PR_REGISTROEMPLEADO
    @P_fechaNacimiento = '1997-12-10',
    @P_Paterno = 'Mendoza',
    @P_Materno = 'Navarro',
    @P_Nombre = 'Pablo',
    @P_Fecha_Ingreso = '2021-06-08',
    @P_sueldo = 27000.00,
    @P_tipoEmpleado = 'T',
    @P_Escolaridad = NULL,
    @P_Calle = 'Santa Ursula',
    @P_Municipio = 'Miguel Hidalgo',
    @P_Estado = 'Ciudad de Mexico',
    @P_Numero = '224',
    @P_Telefono = 5622334455;
/*EMPLEADO 17*/
EXEC EMPLEADO.PR_REGISTROEMPLEADO
    @P_fechaNacimiento = '1986-06-28',
    @P_Paterno = 'Delgado',
    @P_Materno = 'Guerrero',
    @P_Nombre = 'Silvia',
    @P_Fecha_Ingreso = '2010-10-05',
    @P_sueldo = 41000.00,
    @P_tipoEmpleado = 'M',
    @P_Escolaridad = 'Tecnico Bachillerato',
    @P_Calle = 'Moras',
    @P_Municipio = 'Cuauhtemoc',
    @P_Estado = 'Ciudad de Mexico',
    @P_Numero = '125',
    @P_Telefono = 5541110011;
/*EMPLEADO 18*/
EXEC EMPLEADO.PR_REGISTROEMPLEADO
    @P_fechaNacimiento = '1996-08-17',
    @P_Paterno = 'Nunez',
    @P_Materno = 'Cortes',
    @P_Nombre = 'Ricardo',
    @P_Fecha_Ingreso = '2018-11-18',
    @P_sueldo = 30000.00,
    @P_tipoEmpleado = 'T',
    @P_Escolaridad = NULL,
    @P_Calle = 'Eduardo Jenner',
    @P_Municipio = 'Benito Juarez',
    @P_Estado = 'Ciudad de Mexico',
    @P_Numero = '326',
    @P_Telefono = 5651000112;
/*EMPLEADO 19*/
EXEC EMPLEADO.PR_REGISTROEMPLEADO
    @P_fechaNacimiento = '1981-01-25',
    @P_Paterno = 'Salazar',
    @P_Materno = 'Mendoza',
    @P_Nombre = 'Gabriela',
    @P_Fecha_Ingreso = '2006-04-07',
    @P_sueldo = 46000.00,
    @P_tipoEmpleado = 'V',
    @P_Escolaridad = NULL,
    @P_Calle = 'Topacio',
    @P_Municipio = 'Coyoacan',
    @P_Estado = 'Ciudad de Mexico',
    @P_Numero = '427',
    @P_Telefono = 5684556677;
/*EMPLEADO 20*/
EXEC EMPLEADO.PR_REGISTROEMPLEADO
    @P_fechaNacimiento = '1990-07-12',
    @P_Paterno = 'Castillo',
    @P_Materno = 'Romero',
    @P_Nombre = 'Hector',
    @P_Fecha_Ingreso = '2023-04-23',
    @P_sueldo = 8000.00,
    @P_tipoEmpleado = 'M',
    @P_Escolaridad ='Tecnico Bachillerato',
    @P_Calle = 'Santo Tomas',
    @P_Municipio = 'Miguel Hidalgo',
    @P_Estado = 'Ciudad de Mexico',
    @P_Numero = '828',
    @P_Telefono = 5595667788;



---registros previos
EXEC COCHE.REGISTRAR_COCHE 'Sedan', 'Aire', 'ABC123', 'N', NULL, NULL, NULL;
EXEC COCHE.REGISTRAR_COCHE 'SUV', 'GPS', 'DEF456', 'S', '2023-01-01', 25000.00, 1;
EXEC COCHE.REGISTRAR_COCHE 'Compacto', 'Bluetooth', 'GHI789', 'S', '2023-02-01', 18000.00, 2;
EXEC COCHE.REGISTRAR_COCHE 'Pickup', 'Asientos de cuero', 'JKL012', 'S', '2023-03-01', 30000.00, 3;
EXEC COCHE.REGISTRAR_COCHE 'Hatchback', 'Camara de reversa', 'MNO345', 'N', NULL, NULL, NULL;
EXEC COCHE.REGISTRAR_COCHE 'Sedan', NULL, 'PQR678', 'S', '2023-04-01', 20000.00, 4;
EXEC COCHE.REGISTRAR_COCHE 'Camioneta', 'Techo solar', 'STU901', 'S', '2023-05-01', 28000.00, 5;
EXEC COCHE.REGISTRAR_COCHE 'Compacto', 'Asientos calefaccionados', 'VWX234', 'N', NULL, NULL, NULL;
EXEC COCHE.REGISTRAR_COCHE 'SUV', 'Sistema de sonido premium', 'YZA567', 'N', NULL, NULL, NULL;
EXEC COCHE.REGISTRAR_COCHE 'Hatchback', 'Puertas electricas', 'BCD890', 'S', '2023-06-01', 22000.00, 6;
EXEC COCHE.REGISTRAR_COCHE 'Pickup', 'Asientos de tela', 'EFG123', 'N', NULL, NULL, NULL;
EXEC COCHE.REGISTRAR_COCHE 'Sedan', 'Sensores de estacionamiento', 'HIJ456', 'N', NULL, NULL, NULL;
EXEC COCHE.REGISTRAR_COCHE 'Compacto', NULL, 'KLM789', 'S', '2023-07-01', 19000.00, 7;
EXEC COCHE.REGISTRAR_COCHE 'SUV', 'Sistema de entretenimiento', 'NOP012', 'N', NULL, NULL, NULL;
EXEC COCHE.REGISTRAR_COCHE 'Hatchback', 'Control de crucero', 'QRS345', 'S', '2023-08-01', 21000.00, 8;
EXEC COCHE.REGISTRAR_COCHE 'Pickup', 'Faros LED', 'TUV678', 'S', '2023-09-01', 32000.00, 9;
EXEC COCHE.REGISTRAR_COCHE 'Sedan', 'Asientos plegables', 'WXY901', 'S', '2023-10-01', 23000.00, 10;
EXEC COCHE.REGISTRAR_COCHE 'Compacto', 'Volante multifuncion', 'ZAB234', 'N', NULL, NULL, NULL;
EXEC COCHE.REGISTRAR_COCHE 'SUV', NULL, 'CDE567', 'N', NULL, NULL, NULL;
EXEC COCHE.REGISTRAR_COCHE 'Pickup', 'Sistema de traccion en las cuatro ruedas', 'FGH890', 'N', NULL, NULL, NULL;


-- Focus (10 registros)
EXECUTE COCHE.REGISTRAR_COCHE 'Focus', 'Navegacion', 'IJKL01', 'N', NULL, NULL, NULL;
EXECUTE COCHE.REGISTRAR_COCHE 'Focus', 'Asientos con memoria', 'MNOP02', 'N', NULL, NULL, NULL;
EXECUTE COCHE.REGISTRAR_COCHE 'Focus', 'Sistema de audio premium', 'QRST03', 'N', NULL, NULL, NULL;
EXECUTE COCHE.REGISTRAR_COCHE 'Focus', 'Camara 360 grados', 'UVWX04', 'N', NULL, NULL, NULL;
EXECUTE COCHE.REGISTRAR_COCHE 'Focus', 'Puertos USB adicionales', 'YZAB05', 'N', NULL, NULL, NULL;
EXECUTE COCHE.REGISTRAR_COCHE 'Focus', 'Techo panoramico', 'CDEF06', 'N', NULL, NULL, NULL;
EXECUTE COCHE.REGISTRAR_COCHE 'Focus', 'Sistema de arranque sin llave', 'GHIJ07', 'N', NULL, NULL, NULL;
EXECUTE COCHE.REGISTRAR_COCHE 'Focus', 'Asientos ventilados', 'JKLM08', 'N', NULL, NULL, NULL;
EXECUTE COCHE.REGISTRAR_COCHE 'Focus', 'Sistema de navegacion', 'NOPQ09', 'N', NULL, NULL, NULL;
EXECUTE COCHE.REGISTRAR_COCHE 'Focus', 'Estribos laterales', 'RSTU10', 'N', NULL, NULL, NULL;


-- Versa (9 registros)
EXECUTE COCHE.REGISTRAR_COCHE 'Versa', 'Calefaccion en los asientos traseros', 'VWXY11', 'N', NULL, NULL, NULL;
EXECUTE COCHE.REGISTRAR_COCHE 'Versa', 'Techo convertible', 'ZABC12', 'N', NULL, NULL, NULL;
EXECUTE COCHE.REGISTRAR_COCHE 'Versa', 'Control de crucero adaptativo', 'DEFG13', 'N', NULL, NULL, NULL;
EXECUTE COCHE.REGISTRAR_COCHE 'Versa', 'Sensores de lluvia', 'HIJK14', 'N', NULL, NULL, NULL;
EXECUTE COCHE.REGISTRAR_COCHE 'Versa', 'Ganchos de remolque', 'LMNO15', 'N', NULL, NULL, NULL;
EXECUTE COCHE.REGISTRAR_COCHE 'Versa', 'Sistema de mantenimiento de carril', 'PQRS16', 'N', NULL, NULL, NULL;
EXECUTE COCHE.REGISTRAR_COCHE 'Versa', 'Cargador inal�mbrico', 'TUVW17', 'N', NULL, NULL, NULL;
EXECUTE COCHE.REGISTRAR_COCHE 'Versa', 'Sistema de parqueo autom�tico', 'XYZA18', 'N', NULL, NULL, NULL;
EXECUTE COCHE.REGISTRAR_COCHE 'Versa', 'Control de tracci�n', 'BCDE19', 'N', NULL, NULL, NULL;


-- Rio Sedan (8 registros)
EXECUTE COCHE.REGISTRAR_COCHE 'Rio Sedan', 'Faros antiniebla', 'FGHI20', 'N', NULL, NULL, NULL;
EXECUTE COCHE.REGISTRAR_COCHE 'Rio Sedan', 'Asistente de colisi�n frontal', 'IJKL21', 'N', NULL, NULL, NULL;
EXECUTE COCHE.REGISTRAR_COCHE 'Rio Sedan', 'Sistema de reconocimiento de se�ales de tr�fico', 'MNOP22', 'N', NULL, NULL, NULL;
EXECUTE COCHE.REGISTRAR_COCHE 'Rio Sedan', 'Alerta de punto ciego', 'QRST23', 'N', NULL, NULL, NULL;
EXECUTE COCHE.REGISTRAR_COCHE 'Rio Sedan', 'Puerta trasera con apertura sin manos', 'UVWX24', 'N', NULL, NULL, NULL;
EXECUTE COCHE.REGISTRAR_COCHE 'Rio Sedan', 'Frenado autom�tico de emergencia', 'YZAB25', 'N', NULL, NULL, NULL;
EXECUTE COCHE.REGISTRAR_COCHE 'Rio Sedan', 'Sistema de monitoreo de presi�n de neum�ticos', 'CDEF26', 'N', NULL, NULL, NULL;
EXECUTE COCHE.REGISTRAR_COCHE 'Rio Sedan', 'Tecnolog�a Start-Stop', 'GHIJ27', 'N', NULL, NULL, NULL;


-- Aveo (7 registros)
EXECUTE COCHE.REGISTRAR_COCHE 'Aveo', 'Asistente de estacionamiento', 'JKLM28', 'N', NULL, NULL, NULL;
EXECUTE COCHE.REGISTRAR_COCHE 'Aveo', 'Sistema de escape deportivo', 'NOPQ29', 'N', NULL, NULL, NULL;
EXECUTE COCHE.REGISTRAR_COCHE 'Aveo', 'Cubierta de la caja con cerradura', 'RSTU30', 'N', NULL, NULL, NULL;
EXECUTE COCHE.REGISTRAR_COCHE 'Aveo', 'Control de estabilidad', 'VWXY31', 'N', NULL, NULL, NULL;
EXECUTE COCHE.REGISTRAR_COCHE 'Aveo', 'Sistema de reconocimiento de voz', 'ZABC32', 'N', NULL, NULL, NULL;
EXECUTE COCHE.REGISTRAR_COCHE 'Aveo', 'Sistema de asistencia en pendientes', 'DEFG33', 'N', NULL, NULL, NULL;
EXECUTE COCHE.REGISTRAR_COCHE 'Aveo', 'Asientos traseros abatibles', 'HIJK34', 'N', NULL, NULL, NULL;


-- Hilux (6 registros)
EXECUTE COCHE.REGISTRAR_COCHE 'Hilux', 'Puertos de carga en la caja', 'LMNO35', 'N', NULL, NULL, NULL;
EXECUTE COCHE.REGISTRAR_COCHE 'Hilux', 'Sistema de iluminaci�n ambiental', 'PQRS36', 'N', NULL, NULL, NULL;
EXECUTE COCHE.REGISTRAR_COCHE 'Hilux', 'Sistema de detecci�n de fatiga', 'TUVW37', 'N', NULL, NULL, NULL;
EXECUTE COCHE.REGISTRAR_COCHE 'Hilux', 'Rieles de techo', 'XYZA38', 'N', NULL, NULL, NULL;
EXECUTE COCHE.REGISTRAR_COCHE 'Hilux', 'Frenos antibloqueo (ABS)', 'BCDE39', 'N', NULL, NULL, NULL;
EXECUTE COCHE.REGISTRAR_COCHE 'Hilux', 'Sistema de audio con pantalla t�ctil', 'FGHI40', 'N', NULL, NULL, NULL;


-- Mazda (3 registros)
EXECUTE COCHE.REGISTRAR_COCHE 'Mazda', 'Sistema de frenado regenerativo', 'IJKL41', 'N', NULL, NULL, NULL;
EXECUTE COCHE.REGISTRAR_COCHE 'Mazda', 'Asientos con ajuste lumbar', 'MNOP42', 'N', NULL, NULL, NULL;
EXECUTE COCHE.REGISTRAR_COCHE 'Mazda', 'Asistente de mantenimiento de carril', 'QRST43', 'N', NULL, NULL, NULL;


-- Kwid (3 registros)
EXECUTE COCHE.REGISTRAR_COCHE 'Kwid', 'Sistema de direcci�n asistida el�ctricamente', 'UVWX44', 'N', NULL, NULL, NULL;
EXECUTE COCHE.REGISTRAR_COCHE 'Kwid', 'Faros LED', 'YZAB45', 'N', NULL, NULL, NULL;
EXECUTE COCHE.REGISTRAR_COCHE 'Kwid', 'Sistema de tracci�n en las cuatro ruedas', 'CDEF46', 'N', NULL, NULL, NULL;


-- City (4 registros)
EXECUTE COCHE.REGISTRAR_COCHE 'City', 'Asientos plegables', 'GHIJ47', 'N', NULL, NULL, NULL;
EXECUTE COCHE.REGISTRAR_COCHE 'City', 'Volante multifunci�n', 'JKLM48', 'N', NULL, NULL, NULL;
EXECUTE COCHE.REGISTRAR_COCHE 'City', 'Sistema de entretenimiento', 'NOPQ49', 'N', NULL, NULL, NULL;
EXECUTE COCHE.REGISTRAR_COCHE 'City', 'Control de crucero', 'RSTU50', 'N', NULL, NULL, NULL;


-- Tesla (5 registros)
EXECUTE COCHE.REGISTRAR_COCHE 'Tesla', 'Autopilot', 'TES001', 'N', NULL, NULL, NULL;
EXECUTE COCHE.REGISTRAR_COCHE 'Tesla', 'Asientos de cuero sint�tico', 'TES002', 'N', NULL, NULL, NULL;
EXECUTE COCHE.REGISTRAR_COCHE 'Tesla', 'Sistema de entretenimiento premium', 'TES003', 'N', NULL, NULL, NULL;
EXECUTE COCHE.REGISTRAR_COCHE 'Tesla', 'Carga r�pida', 'TES004', 'N', NULL, NULL, NULL;
EXECUTE COCHE.REGISTRAR_COCHE 'Tesla', 'Tejido solar panor�mico','TES005','N', NULL, NULL, NULL;


-- CR-V (6 registros)
EXECUTE COCHE.REGISTRAR_COCHE 'CR-V', 'Sistema de navegaci�n', 'CRV001', 'N', NULL, NULL, NULL;
EXECUTE COCHE.REGISTRAR_COCHE 'CR-V', 'Asientos de cuero', 'CRV002', 'N', NULL, NULL, NULL;
EXECUTE COCHE.REGISTRAR_COCHE 'CR-V', 'Techo panor�mico', 'CRV003', 'N', NULL, NULL, NULL;
EXECUTE COCHE.REGISTRAR_COCHE 'CR-V', 'C�mara de visi�n trasera', 'CRV004', 'N', NULL, NULL, NULL;
EXECUTE COCHE.REGISTRAR_COCHE 'CR-V', 'Sistema de sonido premium', 'CRV005', 'N', NULL, NULL, NULL;
EXECUTE COCHE.REGISTRAR_COCHE 'CR-V', 'Faros LED', 'CRV006', 'N', NULL, NULL, NULL;


-- Jetta (4 registros)
EXECUTE COCHE.REGISTRAR_COCHE 'Jetta', 'Asientos de tela', 'JET001', 'N', NULL, NULL, NULL;
EXECUTE COCHE.REGISTRAR_COCHE 'Jetta', 'Sistema de entretenimiento', 'JET002', 'N', NULL, NULL, NULL;
EXECUTE COCHE.REGISTRAR_COCHE 'Jetta', 'Control de crucero', 'JET003', 'N', NULL, NULL, NULL;
EXECUTE COCHE.REGISTRAR_COCHE 'Jetta', 'Asientos calefaccionados', 'JET004', 'N', NULL, NULL, NULL;


-- RAM (3 registros)
EXECUTE COCHE.REGISTRAR_COCHE 'RAM', 'Asientos de cuero', 'RAM001', 'N', NULL, NULL, NULL;
EXECUTE COCHE.REGISTRAR_COCHE 'RAM', 'Sistema de tracci�n en las cuatro ruedas', 'RAM002', 'N', NULL, NULL, NULL;
EXECUTE COCHE.REGISTRAR_COCHE 'RAM', 'Techo solar', 'RAM003', 'N', NULL, NULL, NULL;


-- Sorento (2 registros)
EXECUTE COCHE.REGISTRAR_COCHE 'Sorento', 'Asientos de cuero', 'SOR001', 'N', NULL, NULL, NULL;
EXECUTE COCHE.REGISTRAR_COCHE 'Sorento', 'Sistema de entretenimiento', 'SOR002', 'N', NULL, NULL, NULL;


-- A3 (5 registros)
EXECUTE COCHE.REGISTRAR_COCHE 'A3', 'Sistema de navegaci�n', 'A3001', 'N', NULL, NULL, NULL;
EXECUTE COCHE.REGISTRAR_COCHE 'A3', 'Asientos de cuero', 'A3002', 'N', NULL, NULL, NULL;
EXECUTE COCHE.REGISTRAR_COCHE 'A3', 'Techo panor�mico', 'A3003', 'N', NULL, NULL, NULL;
EXECUTE COCHE.REGISTRAR_COCHE 'A3', 'Faros LED', 'A3004', 'N', NULL, NULL, NULL;
EXECUTE COCHE.REGISTRAR_COCHE 'A3', 'Sistema de sonido premium', 'A3005', 'N', NULL, NULL, NULL;

-- Para SEGUNDA MANO
EXECUTE COCHE.REGISTRAR_COCHE 'Sorento', 'Faros LED', 'A3014', 'S', '2023-11-05', 250000, 3;
EXECUTE COCHE.REGISTRAR_COCHE 'A3', 'Sistema de sonido premium', 'A3015', 's', '2023-11-01', 255000, 3;






EXEC VENTA.pr_insertarVenta
	1500.00, '2023-05-15', 'Garant�a extendida', 25000.50, 1, 1, 21, 'D', 1234567899876547, 20000, 2000, 
	'BBVA', '24 MESES', '2023-05-15'

EXEC VENTA.pr_insertarVenta
	3200.00, '2023-05-22', 'Paquete de lujo', 48000.75, 1, 1, 22, 'C', 1234567890123456, 10000, 1000, 
	'SANTANDER', '12 MESES', '2023-05-22'

EXEC VENTA.pr_insertarVenta
	800.00, '2023-05-10', 'Servicio de mantenimiento', 18000.25, 1, 1, 23, 'D', 1234567899876547, 20000, 2000, 
	'BBVA', '24 MESES', '2023-05-10'

EXEC VENTA.pr_insertarVenta
	4200.00, '2023-05-05', 'Accesorios personalizados', 53000.00, 1, 1, 24, 'C', 9876543210987654, 15000, 1500, 
	'HSBC', '24 MESES', '2023-05-05'

EXEC VENTA.pr_insertarVenta
	2000.00, '2023-05-18', 'Seguro de veh�culo', 32000.80, 1, 2, 25, 'D', 1234567899876547, 20000, 2000, 
	'BBVA', '24 MESES', '2023-05-18'
--5
EXEC VENTA.pr_insertarVenta
	1800.00, '2023-05-05', 'Paquete de Entretenimiento', 30000.75, 1, 2, 26, 'C', 1111222233334444, 5000, 1000, 
	'BANAMEX', '36 MESES', '2023-05-05'

EXEC VENTA.pr_insertarVenta
	2500.00, '2023-05-12', 'Sistema de Navegaci�n', 42000.50, 1, 2, 27, 'D', 1234567899876547, 20000, 2000, 
	'BBVA', '24 MESES', '2023-05-12'

EXEC VENTA.pr_insertarVenta
	1200.00, '2023-05-20', 'Paquete Deportivo', 22000.25, 1, 2, 28, 'C', 5555666677778888, 12000, 1200, 
	'INBURSA', '48 MESES', '2023-05-20'

EXEC VENTA.pr_insertarVenta
	3500.00, '2023-05-02', 'Asientos de Cuero', 58000.00, 1, 3, 29, 'D', 1234567899876547, 20000, 2000, 
	'BBVA', '24 MESES', '2023-05-02'

EXEC VENTA.pr_insertarVenta
	3000.00, '2023-05-15', 'Paquete de Seguridad', 48000.80, 1, 3, 30, 'C', 9999888877776666, 15000, 1500, 
	'BBVA', '12 MESES', '2023-05-15'
--10	
EXEC VENTA.pr_insertarVenta
	2000.00, '2023-05-01', 'Paquete de Iluminaci�n LED', 35000.75, 1, 3, 31, 'D', 1234567899876547, 20000, 2000,
	'BBVA', '24 MESES', '2023-05-01'

EXEC VENTA.pr_insertarVenta
	2800.00, '2023-05-10', 'Sistema de Sonido Premium', 52000.50, 1, 3, 32, 'C', 4444333322221111, 18000, 1800, 
	'SANTANDER', '24 MESES', '2023-05-10'
	
EXEC VENTA.pr_insertarVenta
	1500.00, '2023-05-18', 'Paquete de Confort', 25000.25, 2, 4, 33, 'D', 1234567899876547, 20000, 2000, 
	'BBVA', '24 MESES', '2023-05-18'
	
EXEC VENTA.pr_insertarVenta
	3900.00, '2023-05-25', 'Techo Solar Panor�mico', 62000.00, 2, 4, 34, 'C', 8888777766665555, 13000, 1500, 
	'INBURSA', '36 MESES', '2023-05-25'
	
EXEC VENTA.pr_insertarVenta
	3200.00, '2023-05-05', 'Asistente de Estacionamiento', 48000.80, 2, 4, 35, 'D', 1234567899876547, 20000, 
	2000, 'BBVA', '24 MESES', '2023-11-23'
--15
EXEC VENTA.pr_insertarVenta
	1800.00, '2023-06-10', 'Paquete de Seguridad Avanzada', 30000.75, 2, 4, 36, 'C', 1234987654321098, 10000, 
	5000, 'BBVA', '12 MESES', '2023-06-10'
	
EXEC VENTA.pr_insertarVenta
	2400.00, '2023-06-15', 'Asientos con Masaje', 42000.50, 2, 5, 37, 'D', 1234567899876547, 20000, 2000, 
	'BBVA', '24 MESES', '2023-11-23'

EXEC VENTA.pr_insertarVenta
	1300.00, '2023-06-20', 'Paquete de Tecnolog�a', 22000.25, 2, 5, 38, 'C', 8765123456789012, 10000, 1000,
	'INBURSA', '48 MESES', '2023-06-20'
	
EXEC VENTA.pr_insertarVenta
	3600.00, '2023-06-25', 'Sistema de Asistencia al Conductor', 58000.00, 2, 5, 39, 'D', 1234567899876547, 20000, 
	2000, 'BBVA', '24 MESES', '2023-11-23'
	
EXEC VENTA.pr_insertarVenta
	3100.00, '2023-06-30', 'Paquete Familiar', 48000.80, 2, 5, 40, 'C', 1111222233334444, 12000, 2000, 
	'HSBC', '12 MESES', '2023-06-30'
--20
EXEC VENTA.pr_insertarVenta
	1700.00, '2023-06-05', 'Paquete de Conectividad', 28000.75, 3, 6, 41, 'D', 1234567899876547, 20000, 2000, 
	'BBVA', '24 MESES', '2023-06-05'

EXEC VENTA.pr_insertarVenta
	2600.00, '2023-06-10', 'Asientos Deportivos', 48000.50, 3, 6, 42, 'C', 9876123456789012, 14000, 2000, 
	'BANORTE', '24 MESES', '2023-06-10'

EXEC VENTA.pr_insertarVenta
	1400.00, '2023-06-11', 'Paquete Todo Terreno', 20000.25, 3, 6, 43, 'D', 1234567899876547, 20000, 2000, 
	'BBVA', '24 MESES', '2023-06-11'


