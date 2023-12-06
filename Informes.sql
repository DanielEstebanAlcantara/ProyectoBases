USE CONCESIONARIA
GO
/*Estadisticos*/
------------------------------------------------------------------------------------
                                  --INFORMES
-----------------------------------------------------------------------------------

--a) Qué agente de ventas realiza más ventas en un periodo de tiempo:
CREATE OR ALTER FUNCTION VENTA.emp_masVentas(@fechaInicio DATE, @fechaFin DATE)
	RETURNS TABLE
	AS
		RETURN(SELECT TOP 1 v.numEmpleado 'ID AGENTE VENTA', 
		RTRIM(nombre)+' '+TRIM(paterno)+' '+LTRIM(isnull(materno, '-')) AS 'NOMBRE AGENTE', 
		COUNT(*) AS 'TOTAL VENTAS'
		FROM
        VENTA.VENTA v
		JOIN EMPLEADO.EMPLEADO e ON v.numEmpleado = e.numEmpleado
		WHERE fecha BETWEEN @FechaInicio AND @FechaFin
		GROUP BY e.nombre, e.paterno, v.numEmpleado, e.materno
		ORDER BY 'TOTAL VENTAS' DESC)
GO
--Comprobación
SELECT * FROM VENTA.emp_masVentas('2023-05-01','2023-05-31')
GO





--b) En qué época del año se realizan más ventas
CREATE OR ALTER FUNCTION VENTA.epoca_masVentas(@fechaInicio DATE, @fechaFin DATE)
	RETURNS TABLE
	AS
		RETURN(SELECT TOP 1 MONTH(fecha) 'MES', FORMAT(fecha, 'MMMM', 'es-ES') AS 'NOMBRE MES',
		COUNT(*) as 'TOTAL VENTAS'
		FROM VENTA.VENTA
		WHERE fecha BETWEEN @fechaInicio AND @fechaFin
		GROUP BY MONTH(fecha), FORMAT(fecha, 'MMMM', 'es-ES')
		ORDER BY 'TOTAL VENTAS' DESC)
GO
--Comprobación
SELECT * FROM VENTA.epoca_masVentas('2023-01-01','2023-12-31')
GO




--c) Qué mecánicos realizan el mayor número de revisiones y reparaciones,
CREATE OR ALTER FUNCTION SERVICIO.mecanicosMasServicios()
	RETURNS TABLE
	AS
		RETURN(SELECT TOP 3 s.numEmpleado 'ID MECANICO', 
		RTRIM(nombre)+' '+TRIM(paterno)+' '+LTRIM(isnull(materno, '-')) AS 'NOMBRE AGENTE', 
		COUNT(*) 'TOTAL SERVICIOS' 
		FROM SERVICIO.SERVICIO s
		INNER JOIN EMPLEADO.EMPLEADO e ON s.numEmpleado=e.numEmpleado
		WHERE tipoServicio IN('C', 'R')
		GROUP BY s.numEmpleado, nombre, paterno, materno
		ORDER BY 'TOTAL SERVICIOS' DESC)
GO

--Comprobación
SELECT * FROM SERVICIO.mecanicosMasServicios()
GO





--d) los servicios más solicitados
--Reparaciones
CREATE OR ALTER FUNCTION SERVICIO.RepMasSolicitado()
	RETURNS TABLE
	AS
		RETURN(SELECT TOP 3 tipoServicio, cr.descripcion, COUNT(*) 'TOTAL SOLICITUDES'
		FROM SERVICIO.SERVICIO s
		INNER JOIN SERVICIO.REPARACION rp ON s.id_Servicio=rp.id_Servicio
		INNER JOIN CATALOGO.REPARACION cr ON rp.id_Reparacion=cr.id_Reparacion 
		GROUP BY tipoServicio, cr.descripcion
		ORDER BY 'TOTAL SOLICITUDES' DESC)
GO
SELECT * FROM SERVICIO.RepMasSolicitado()
--Revisiones
GO
CREATE OR ALTER FUNCTION SERVICIO.RevMasSolicitado()
	RETURNS TABLE
	AS
		RETURN(SELECT TOP 3 tipoServicio, cc.descripcion, COUNT(*) 'TOTAL SOLICITUDES'
		FROM SERVICIO.SERVICIO s
		INNER JOIN SERVICIO.REVISION rv ON s.id_Servicio=rv.id_Servicio
		INNER JOIN CATALOGO.REVISION cc ON rv.id_Revision=cc.id_Revision
		GROUP BY tipoServicio, cc.descripcion
		ORDER BY 'TOTAL SOLICITUDES' DESC)
GO

SELECT * FROM SERVICIO.RevMasSolicitado()
GO




--e) Los 5 vehículos más vendidos
CREATE OR ALTER FUNCTION VENTA.autos_masVendidos()
	RETURNS TABLE
	AS
		RETURN(SELECT TOP 5 modelo 'MODELO', COUNT(*) 'TOTAL VENTAS' 
		FROM VENTA.VENTA v
		INNER JOIN COCHE.COCHE c ON v.id_Coche=c.id_Coche 
		GROUP BY modelo
		ORDER BY 'TOTAL VENTAS' DESC)
GO

SELECT * FROM VENTA.autos_masVendidos()
GO



--f) total de reparaciones y revisiones (por tipo) en un periodo de tiempo
CREATE OR ALTER FUNCTION SERVICIO.totalServicios(@fechaInicio DATE, @fechaFin DATE)
	RETURNS TABLE
	AS
		RETURN(SELECT TOP 2 tipoServicio 'SERVICIO', COUNT(*) 'TOTAL SOLICITUDES'
		FROM SERVICIO.SERVICIO
		WHERE fecha BETWEEN @fechaInicio AND @fechaFin
		GROUP BY tipoServicio
		ORDER BY 'TOTAL SOLICITUDES' DESC)
GO

--Comprobación
SELECT * FROM SERVICIO.totalServicios('2023-01-01','2023-01-10')
GO





--g) se requiere obtener el agente de ventas del mes, nombre completo, total de autos
--vendidos, monto y teléfono
CREATE OR ALTER FUNCTION VENTA.agenteDelMes(@mes INT, @año INT)
	RETURNS TABLE
	AS
		RETURN(SELECT TOP 1 v.numEmpleado 'ID AGENTE VENTA', 
		RTRIM(nombre)+' '+TRIM(paterno)+' '+LTRIM(isnull(materno, '-')) AS 'NOMBRE AGENTE',
		COUNT(*) AS 'TOTAL AUTOS VENDIDOS', SUM(v.costoTotal) 'MONTO TOTAL', t.telefono
		FROM VENTA.VENTA v
		INNER JOIN EMPLEADO.EMPLEADO e ON v.numEmpleado=e.numEmpleado
		INNER JOIN EMPLEADO.TELEFONO t ON e.numEmpleado=t.numEmpleado
		WHERE MONTH(fecha)=@mes AND YEAR(fecha)=@año
		GROUP BY v.numEmpleado, nombre, paterno, materno, telefono
		ORDER BY 'TOTAL AUTOS VENDIDOS' DESC)
GO

--Comprobación
SELECT * FROM VENTA.agenteDelMes(5, 2023)
GO





--Obtener el reporte mensual de las ventas (datos del auto, del cliente, costo, monto pagado y adeudo).
CREATE OR ALTER FUNCTION VENTA.reporteMensual(@mes INT, @año INT)
	RETURNS TABLE
	AS
		RETURN(SELECT c.modelo 'MODELO', c.extras 'EXTRAS', c.matricula 'MATRICULA', c.tipoCoche 'TIPO COCHE',
		RTRIM(nombre)+' '+TRIM(paterno)+' '+LTRIM(isnull(materno, '-')) AS 'NOMBRE CLIENTE', genero 'GENERO',
		rfc 'RFC', telefono 'TELEFONO', CostoTotal 'COSTO', montoTotal 'MONTO PAGADO', deuda 'DEUDA',
		RTRIM(calle)+' '+TRIM(numero)+' '+TRIM(municipio)+' '+LTRIM(estado) AS 'DIRECCION CLIENTE'
		FROM COCHE.COCHE c
		INNER JOIN VENTA.VENTA v ON c.id_Coche=v.id_Coche
		INNER JOIN CLIENTE.CLIENTE cl ON v.id_Cliente=cl.id_Cliente
		INNER JOIN VENTA.CREDITO cr ON v.id_Credito=cr.id_Credito
		INNER JOIN CLIENTE.DIRECCION d ON cl.id_Direccion=d.id_Direccion
		INNER JOIN CLIENTE.TELEFONO t ON cl.id_Cliente=t.id_Cliente
		WHERE MONTH(v.fecha)=@mes AND YEAR(v.fecha)=@año)
GO

--Comprobación
SELECT * FROM VENTA.reporteMensual (12,2023)
