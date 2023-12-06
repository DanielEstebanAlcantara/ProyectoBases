use CONCESIONARIA14
GO

/* 
===================================================
					TRIGGERS 
===================================================
*/

/*

	TRIGGER Para coches
	
*/

CREATE OR ALTER TRIGGER COCHE.tgInsertaCocheNuevo
ON COCHE.COCHE
INSTEAD OF INSERT AS 
BEGIN
	IF EXISTS(SELECT matricula FROM 
				COCHE.COCHE
				WHERE matricula = (SELECT matricula FROM inserted))
	BEGIN 
		print 'LA MATRICULA QUE INTENTAS INGRESAR YA HA SIDO REGISTRADA'
	END
	ELSE 
	BEGIN
	INSERT INTO COCHE.COCHE
			SELECT  modelo, extras, matricula, tipoCoche  FROM inserted
	END
END
GO

/*

	TRIGGER Para coches de segunda mano

*/

GO
CREATE OR ALTER TRIGGER COCHE.tgInsertaCocheSegunda
ON COCHE.SEGUNDA
INSTEAD OF INSERT AS 
BEGIN
	IF EXISTS(SELECT id_Coche FROM 
				COCHE.COCHE
				WHERE id_Coche = (SELECT id_Coche FROM inserted))
		AND EXISTS(SELECT id_Cliente FROM 
				CLIENTE.CLIENTE
				WHERE id_Cliente = (SELECT id_Cliente FROM inserted))
	BEGIN
		
		INSERT INTO COCHE.SEGUNDA
			SELECT  id_Coche, fecha, costo, id_Cliente  FROM inserted
		
	END
	ELSE IF NOT EXISTS(SELECT id_Coche FROM 
				COCHE.COCHE
				WHERE id_Coche = (SELECT id_Coche FROM inserted))
		print 'El COCHE NO HA SIDO REGISTRADO'

	ELSE IF NOT EXISTS(SELECT id_Cliente FROM 
				CLIENTE.CLIENTE
				WHERE id_Cliente = (SELECT id_Cliente FROM inserted))
		print 'El CLIENTE NO HA SIDO REGISTRADO'

	ELSE 
	BEGIN
		
	print 'El cliente ni el coche han sido registrados previamente'
	END
END

/*
	TRIGGER para EMPLEADO.MECANICO
*/

GO
CREATE OR ALTER TRIGGER EMPLEADO.tgInsertaMecanico
ON EMPLEADO.MECANICO
INSTEAD OF INSERT AS 
BEGIN
	DECLARE @V_SUELDO MONEY
	SET @V_SUELDO = (SELECT sueldo FROM EMPLEADO.EMPLEADO
					WHERE numEmpleado = (SELECT numEmpleado FROM inserted)
	)
	IF @V_SUELDO < 8000
	BEGIN 
		print 'El sueldo del empleado debe ser por lo menos 8000'
	END
	ELSE 
	BEGIN
	INSERT INTO EMPLEADO.MECANICO
			SELECT  numEmpleado, escolaridad  FROM inserted
	END
END
GO

/*

	TRIGGER Para CLIENTE.CLIENTE
	
*/

GO
CREATE OR ALTER TRIGGER CLIENTE.tgInsertaCliente
ON CLIENTE.CLIENTE
INSTEAD OF INSERT AS 
BEGIN
	DECLARE @V_rfc VARCHAR(18);
	SET @V_rfc=(select rfc FROM inserted);
	IF EXISTS(SELECT rfc FROM 
				CLIENTE.CLIENTE
				WHERE rfc = (SELECT rfc FROM inserted))
	BEGIN 
		print 'EL RFC ya ha sido asociado a otro cliente'
	END
	IF LEN(@V_rfc) != 13
		print 'Numero de caracteres inválidos para el RFC'

	ELSE 
	BEGIN
	INSERT INTO CLIENTE.CLIENTE
			SELECT paterno, materno, nombre, genero, rfc, id_Direccion, id_Aval  FROM inserted
	END
	
END
GO

/*

	TRIGGER Para AVAL.AVAL
	
*/

CREATE OR ALTER TRIGGER AVAL.tgInsertaAval
ON AVAL.AVAL
INSTEAD OF INSERT AS 
BEGIN
	DECLARE @V_curp VARCHAR(18);
	SET @V_curp=(select curp FROM inserted);
	IF EXISTS(SELECT curp FROM 
				AVAL.AVAL
				WHERE curp = (SELECT curp FROM inserted))
	BEGIN 
		print 'EL CURP ya ha sido asociado a otro Aval'
	END
	IF LEN(@V_curp) < 18 OR LEN(@V_curp) > 18
		print 'Numero de caracteres inválidos para el CURP';

	ELSE 
	BEGIN
	INSERT INTO AVAL.AVAL
			SELECT curp, paterno, materno, nombre, id_Direccion FROM inserted
	END
	
END
GO


/*

	TRIGGER Para SERVICIO.SERVICIO

*/

CREATE OR ALTER TRIGGER SERVICIO.tgInsertarServicio
ON SERVICIO.SERVICIO
INSTEAD OF INSERT AS 
BEGIN
	IF NOT EXISTS(SELECT id_Coche FROM 
				VENTA.VENTA
				WHERE id_Coche = (SELECT id_Coche FROM inserted))
	BEGIN 
		print 'Ingrese un coche valido'
	END
	ELSE IF (SELECT id_Cliente FROM inserted) != (SELECT id_Cliente FROM VENTA.VENTA
												WHERE id_Coche = (SELECT id_Coche FROM inserted))
		print('El coche no le pertenece a el cliente específicado')

	ELSE IF (SELECT numEmpleado FROM inserted) NOT IN (SELECT numEmpleado from EMPLEADO.MECANICO)
		print('El empleado no puede realizar este servicio')

	ELSE 
	BEGIN
	INSERT INTO SERVICIO.SERVICIO (id_Coche, id_Cliente, tipoServicio, fecha, hora, motivo, costos, estatus, numEmpleado)
			SELECT   id_Coche, id_Cliente, tipoServicio, fecha,hora, motivo, costos, estatus, numEmpleado  FROM inserted
	END
END
GO


/*

	TRIGGER Para SERVICIO.REVISION

*/

CREATE OR ALTER TRIGGER SERVICIO.tgInserRevision
ON SERVICIO.REVISION
INSTEAD OF INSERT AS 
BEGIN
	IF (SELECT numEmpleado from inserted) IN (SELECT numEmpleado from EMPLEADO.AGENTE_VENTA)
		print('El empleado no puede realizar este servicio')
	ELSE IF (SELECT id_Servicio FROM inserted) NOT IN (SELECT id_Revision FROM CATALOGO.REVISION)
		print('No se ha seleccionado una revision correcta')
	ELSE 
	BEGIN
	INSERT INTO SERVICIO.REVISION (id_Servicio, fechaPlaneacion, fechaRealizacion, id_Revision, numEmpleado)
			SELECT  id_Servicio, fechaPlaneacion, fechaRealizacion, id_Revision, numEmpleado  FROM inserted
	END
END
GO

/*
	TRIGGER CORREO CLIENTE
*/

go
CREATE OR ALTER TRIGGER CLIENTE.tgInsertaCorreoCliente
ON CLIENTE.CORREO
INSTEAD OF INSERT AS 
BEGIN
	IF NOT EXISTS (SELECT * FROM CLIENTE.CLIENTE 
					WHERE id_Cliente = (SELECT id_Cliente FROM inserted))
		PRINT 'EL CLIENTE REFERENCIADO NO EXISTE'
	ELSE IF NOT EXISTS (SELECT * FROM CLIENTE.CORREO 
					WHERE correo = (SELECT correo FROM inserted))

	BEGIN
		INSERT INTO CLIENTE.CORREO
			SELECT  correo, id_Cliente  FROM inserted
	END
	ELSE 
	BEGIN
		print 'El correo ya ha sido registrado para otro cliente'	
	END
END
GO

/*
TRIGGER TELEFNOS 
*/
/*
	TRIGGER para AVAL.TELEFONO
*/

GO
CREATE OR ALTER TRIGGER AVAL.tgInsertaTelefonoAval
ON AVAL.TELEFONO
INSTEAD OF INSERT AS 
BEGIN
	IF LEN(CONVERT(VARCHAR,(SELECT telefono FROM inserted))) <> 10
	BEGIN
		print 'El formato del numero a ingresar no es valido'	
		
	END
	ELSE IF EXISTS(SELECT * FROM AVAL.TELEFONO 
					WHERE telefono = (SELECT TELEFONO FROM inserted))
		print 'El telefono ya ha sido registrado'
	ELSE 
	BEGIN
		INSERT INTO AVAL.TELEFONO
			SELECT  telefono, id_Aval  FROM inserted
	END
END
GO

/*
	TRIGGER para CLIENTE.TELEFONO
*/

CREATE OR ALTER TRIGGER CLIENTE.tgInsertaTelefonoCliente
ON CLIENTE.TELEFONO
INSTEAD OF INSERT AS 
BEGIN
	
	IF LEN(CONVERT(VARCHAR,(SELECT telefono FROM inserted))) <> 10
	BEGIN
		print 'El formato del numero a ingresar no es valido'	
		
	END
	ELSE IF EXISTS(SELECT * FROM CLIENTE.TELEFONO 
					WHERE telefono = (SELECT TELEFONO FROM inserted))
		print 'El telefono ya ha sido registrado'
	ELSE 
	BEGIN
		INSERT INTO CLIENTE.TELEFONO
			SELECT  telefono, id_Cliente  FROM inserted
	END
END
GO



/*
	TRIGGER para EMPLEADO.TELEFONO
*/

CREATE OR ALTER TRIGGER EMPLEADO.tgInsertaTelefonoEmpleado
ON EMPLEADO.TELEFONO
INSTEAD OF INSERT AS 
BEGIN
	IF LEN(CONVERT(VARCHAR,(SELECT telefono FROM inserted))) <> 10
	BEGIN
		print 'El formato del numero a ingresar no es valido'	
		
	END
	ELSE IF EXISTS(SELECT * FROM EMPLEADO.TELEFONO 
					WHERE telefono = (SELECT TELEFONO FROM inserted))
		print 'El telefono ya ha sido registrado'
	ELSE 
	BEGIN
		INSERT INTO EMPLEADO.TELEFONO
			SELECT  telefono, numEmpleado  FROM inserted
	END
END
GO


/*
	TRIGGER para VENTA.VENTA
*/
CREATE OR ALTER TRIGGER VENTA.tr_InsertaVenta
ON VENTA.VENTA
INSTEAD OF INSERT
AS
	BEGIN
		--Validar que el empleado sea agente de ventas
		IF NOT EXISTS(SELECT numEmpleado FROM EMPLEADO.AGENTE_VENTA
			WHERE numEmpleado=(SELECT numEmpleado FROM inserted))
			BEGIN
				PRINT 'El empleado no es un agente de venta'
			END
		--Validar que el coche exista
		ELSE IF NOT EXISTS(SELECT id_Coche FROM COCHE.COCHE 
			WHERE id_Coche=(SELECT id_Coche FROM inserted))
			BEGIN
				PRINT 'El coche referenciado no existe'
			END
		--Validar que el coche no ha sido vendido anteriormente
		ELSE IF EXISTS(SELECT 1 FROM inserted i
			INNER JOIN VENTA.VENTA v ON i.id_Coche=v.id_Coche)
			BEGIN
				PRINT 'El coche ha sido vendido anteriormente'
			END
		--Validar que el cliente exista
		ELSE IF NOT EXISTS(SELECT id_Cliente FROM CLIENTE.CLIENTE
			WHERE id_Cliente=(SELECT id_Cliente FROM inserted))
			BEGIN
				PRINT 'El cliente referenciado no existe'
			END
		--Validar que la venta a credito exista
		ELSE IF NOT EXISTS(SELECT 1 FROM inserted i
			LEFT JOIN VENTA.CREDITO c ON i.id_Credito=c.id_Credito
			WHERE (i.id_Credito IS NULL OR c.id_Credito IS NOT NULL))
			BEGIN
				PRINT 'La venta a credito referenciada no existe o no es nulo'
			END
		--Validar que el cliente no compre el mismo que vendió
		ELSE IF EXISTS(SELECT id_Cliente FROM COCHE.SEGUNDA
			WHERE id_Cliente=(SELECT id_Cliente FROM inserted) 
				AND id_Coche=(SELECT id_Coche FROM inserted))
			BEGIN
				PRINT 'No se permite que el cliente que vaya a comprar, sea el mismo que vendió'
			END
		ELSE
			BEGIN
			INSERT INTO VENTA.VENTA
			SELECT comision,fecha,Extras,CostoTotal,numEmpleado,id_Cliente,id_Coche,id_Credito
			FROM inserted
			END
	END;
GO


/*
	TRIGGER para VENTA.CREDITO
*/

CREATE OR ALTER TRIGGER VENTA.tr_InsertaCredito
ON VENTA.CREDITO
INSTEAD OF INSERT
AS 
	BEGIN
		IF NOT EXISTS(SELECT tipoCredito 
			FROM CATALOGO.CREDITO
			WHERE tipoCredito=(SELECT tipoCredito FROM inserted))
			BEGIN
			PRINT 'El crédito referenciado no existe'
			END
		ELSE IF EXISTS (SELECT numTarjeta FROM VENTA.CREDITO
						WHERE numTarjeta = (SELECT numTarjeta from inserted)	)
			print 'La tarjeta ya ha sido utilizada en otra venta'
		ELSE
			BEGIN
				INSERT INTO VENTA.CREDITO
				SELECT numTarjeta, enganche, interesMensual, deuda, banco, tipoCredito, fecha 
				FROM inserted
			END
	END
GO




/* 
===================================================
				PROCEDIMIENTOS
===================================================
*/


/*

		PROCEDIMIENTO PARA INGRESAR COCHES

*/


GO
CREATE OR ALTER  PROCEDURE COCHE.REGISTRAR_COCHE
    -- Parámetros 
    @P_modelo           varchar(10),       
    @P_extras           varchar(50),        
    @P_matricula		 varchar(6),  
    @P_tipoCoche        char(1),   
	--Los siguientes son parametros para un coche de segunda mano
	@P_fecha            date,
    @P_costo            money,
    @P_id_Cliente       smallint

AS
BEGIN
	DECLARE @V_tipoCoche  char(10) = UPPER(@P_tipoCoche);
	DECLARE @V_modelo varchar(10) = UPPER(@P_modelo);
	DECLARE @V_id_Coche smallint;--Variable de receteo para el id_Coche
	DECLARE @V_tantosCochesDeCliente int;
	DECLARE @V_nuevoCocheid smallint;
	-- recetear la PK de COCHE.COCHE
	SET @V_id_Coche = ISNULL((SELECT MAX(id_Coche) FROM COCHE.COCHE),0);
	DBCC CHECKIDENT ('COCHE.COCHE', RESEED, @V_id_Coche);

	--insertar en COCHE.COCHE si tipo = 'N'
	
		IF  @V_tipoCoche = 'N' 
		BEGIN
			INSERT INTO COCHE.COCHE (modelo, extras, matricula, tipoCoche)
			VALUES (@V_modelo, @P_extras, @P_matricula, 'N')
		END
		ELSE IF  @V_tipoCoche = 'S' 
		BEGIN
		BEGIN TRANSACTION NoCocheSegunda
			SET @V_tantosCochesDeCliente = (SELECT COUNT(id_Cliente) FROM COCHE.SEGUNDA
					WHERE id_Cliente = @P_id_Cliente)
			IF EXISTS (SELECT matricula FROM COCHE.COCHE
						WHERE matricula = @P_matricula )
				PRINT 'LA MATRICULA QUE INTENTAS INGRESAR YA HA SIDO REGISTRADA PR'
			ELSE IF @V_tantosCochesDeCliente < 3 
				BEGIN
					INSERT INTO COCHE.COCHE (modelo, extras, matricula, tipoCoche)
					VALUES (@V_modelo, @P_extras, @P_matricula,'S')
					INSERT INTO COCHE.SEGUNDA (id_Coche, fecha, costo, id_Cliente)
					VALUES (
					(
						SELECT MAX(id_Coche) FROM COCHE.COCHE
						
					),
					@P_fecha, @P_costo, @P_id_Cliente
					)
					
				END
			ELSE IF @V_tantosCochesDeCliente = 3 
				print 'EL CLIENTE YA HA VENDIDO 3 COCHES YA NO SE PUEDE REGISTRAR UNO MAS';
			
			SET @V_nuevoCocheid = ISNULL((SELECT MAX(id_Coche) FROM COCHE.COCHE),0);
			IF @V_id_Coche < @V_nuevoCocheid
				COMMIT TRANSACTION NoCocheSegunda
			ELSE IF @V_id_Coche = @V_nuevoCocheid
				ROLLBACK TRANSACTION NoCocheSegunda
		END
	
		
END

GO        
				/*

						PROCEDIMIENTOS PARA INGRESAR EMPLEADOS

				*/

/*
Procedimiento para EMPLEADO.DIRECCION
*/
CREATE OR ALTER PROCEDURE EMPLEADO.pr_Direccion
	--Parametros
		@P_Calle			varchar(50),
		@P_Municipio		varchar(20),
		@P_Estado			varchar(20),
		@P_Numero			varchar(5)
as 
begin
	DECLARE @V_Direccion smallint
	SET @V_Direccion = (SELECT MAX(id_Direccion) FROM EMPLEADO.DIRECCION);
	IF(@V_Direccion IS NULL)
			BEGIN
				SET @V_Direccion=0;
			END
	DBCC CHECKIDENT('EMPLEADO.DIRECCION', RESEED, @V_Direccion);
	Insert into EMPLEADO.DIRECCION(calle,municipio,estado,numero)
	values(@P_Calle,@P_Municipio,@P_Estado,@P_Numero);
END;
GO
/*
Procedimiento para  EMPLEADO.EMPLEADO
*/

CREATE OR ALTER PROCEDURE EMPLEADO.pr_Empleado
    -- Parametros
    @P_fechaNacimiento date,
    @P_Paterno varchar(25),
    @P_Materno varchar(25),
    @P_Nombre varchar(25),
    @P_Fecha_Ingreso date,
    @P_sueldo money,
    @P_tipoEmpleado char(1),
    @P_id_Direccion smallint,
    @P_Escolaridad varchar(30)
AS
BEGIN
		DECLARE @V_numEmpleado smallint
        SET @V_numEmpleado = (SELECT MAX(numEmpleado) FROM EMPLEADO.EMPLEADO);
		IF(@V_numEmpleado IS NULL)
			BEGIN
				SET @V_numEmpleado=0;
			END
        DBCC CHECKIDENT('EMPLEADO.EMPLEADO', RESEED, @V_numEmpleado);
    IF EXISTS(SELECT 1 FROM EMPLEADO.DIRECCION WHERE id_Direccion = @P_id_Direccion)
    BEGIN
        SET @P_tipoEmpleado = UPPER(@P_tipoEmpleado);

        IF @P_tipoEmpleado = 'T' OR @P_tipoEmpleado = 'M'
        BEGIN
			IF @P_sueldo<8000 
			BEGIN
				PRINT 'El sueldo debe ser por lo menos 8000'
			END
			ELSE IF @P_sueldo IS NULL
				BEGIN
					SET @P_sueldo =8000;
				END
		
		IF	@P_sueldo >=8000
			BEGIN
				INSERT INTO EMPLEADO.EMPLEADO(fechaNacimiento, paterno, materno, nombre, fechaIngreso, sueldo, tipoEmpleado, id_Direccion)
				VALUES(@P_fechaNacimiento, @P_Materno, @P_Paterno, @P_Nombre, @P_Fecha_Ingreso, @P_sueldo, @P_tipoEmpleado, @P_id_Direccion);
            IF @P_tipoEmpleado = 'T'
            BEGIN
                SET @V_numEmpleado = (SELECT MAX(numEmpleado) FROM EMPLEADO.EMPLEADO);
                INSERT INTO EMPLEADO.TECNICO(numEmpleado)
                VALUES(@V_numEmpleado);
            END
            ELSE IF (@P_tipoEmpleado = 'M')
            BEGIN
                SET @V_numEmpleado = (SELECT MAX(numEmpleado) FROM EMPLEADO.EMPLEADO);
                INSERT INTO EMPLEADO.MECANICO(numEmpleado, escolaridad)
                VALUES(@V_numEmpleado, @P_Escolaridad);
            END
        END
		END
        ELSE IF (@P_tipoEmpleado = 'V')
        BEGIN
			INSERT INTO EMPLEADO.EMPLEADO(fechaNacimiento, paterno, materno, nombre, fechaIngreso, sueldo, tipoEmpleado, id_Direccion)
			VALUES(@P_fechaNacimiento, @P_Paterno, @P_Materno, @P_Nombre, @P_Fecha_Ingreso, @P_sueldo, @P_tipoEmpleado, @P_id_Direccion);
            SET @V_numEmpleado = (SELECT MAX(numEmpleado) FROM EMPLEADO.EMPLEADO);
            INSERT INTO EMPLEADO.AGENTE_VENTA(numEmpleado)
            VALUES(@V_numEmpleado);
        END
        ELSE 
        BEGIN
            Print 'El tipo empleado que elijio no es valido debe ser V=Agente de ventas o T=Tecnico o M=Mecanico';
        END
    END
    ELSE
    BEGIN
		DECLARE @V_DIRECCION  VARCHAR(10);
		SET @V_DIRECCION = CAST(@P_id_Direccion AS varchar(10));
        PRINT 'El id  asociada a una direccion no esta registrado :'+@V_DIRECCION ;
    END
END;
GO


/*
Procedimiento para Empleado.TELEFONO
*/

CREATE OR ALTER PROCEDURE EMPLEADO.pr_Telefono
	@P_Telefono		numeric(10,0),
	@P_numEmpleado	smallint
as
begin
		DECLARE @V_telefono smallint
		SET @V_telefono = (SELECT MAX(id_Telefono) FROM EMPLEADO.TELEFONO);
		IF(@V_telefono IS NULL)
			BEGIN
				SET @V_telefono=0;
			END
		DBCC CHECKIDENT('EMPLEADO.TELEFONO', RESEED, @V_telefono);
		if exists(select 1 from EMPLEADO.EMPLEADO where numEmpleado = @P_numEmpleado)
		begin
			insert into EMPLEADO.TELEFONO(telefono,numEmpleado)
			values(@P_Telefono,@P_numEmpleado);
		end
		ELSE
		begin
			DECLARE @V_id	 VARCHAR(10);
			SET @V_id = CAST(@P_numEmpleado AS varchar(10));
		print 'No existe empleado con id :'+@V_id;
	end
end
GO
CREATE OR ALTER PROCEDURE EMPLEADO.PR_REGISTROEMPLEADO
    --Parametros EMPLEADO.EMPLEADO
    @P_fechaNacimiento date,
    @P_Paterno varchar(25),
    @P_Materno varchar(25),
    @P_Nombre varchar(25),
    @P_Fecha_Ingreso date,
    @P_sueldo money,
    @P_tipoEmpleado char(1),
    @P_Escolaridad varchar(30),

    --PARA EMPLEADO.DIRECCION
    @P_Calle varchar(50),
    @P_Municipio varchar(20),
    @P_Estado varchar(20),
    @P_Numero varchar(5),

    --Parametros EMPLEADO.TELEFONO
    @P_Telefono numeric(10,0)
    
AS
BEGIN
    DECLARE @V_ID_DIRECCION SMALLINT;
    DECLARE @V_numEmpleado SMALLINT;
    DECLARE @V_ultimoEmpleado SMALLINT;
    --SET @V_ultimoEmpleado = (SELECT MAX(numEmpleado) FROM EMPLEADO.EMPLEADO);
    SET @V_ultimoEmpleado = ISNULL((SELECT MAX(numEmpleado) FROM EMPLEADO.EMPLEADO), 0);

    BEGIN TRANSACTION INSERTCLIENTE;
    /* INGRESAR A EMPLEADO.DIRECCION */
    EXEC EMPLEADO.pr_Direccion
        @P_Calle,
        @P_Municipio,
        @P_Estado,
        @P_Numero;

    SET @V_ID_DIRECCION = (SELECT MAX(id_Direccion) FROM EMPLEADO.DIRECCION);

    /* INGRESAR A EMPLEADO.EMPLEADO */
    EXEC EMPLEADO.pr_Empleado
        @P_fechaNacimiento,
        @P_Paterno,
        @P_Materno,
        @P_Nombre,
        @P_Fecha_Ingreso,
        @P_sueldo,
        @P_tipoEmpleado,
        @V_ID_DIRECCION,
        @P_Escolaridad;

    /* INGRESAR A EMPLEADO.TELEFONO */
    SET @V_numEmpleado = (SELECT MAX(numEmpleado) FROM EMPLEADO.EMPLEADO);

    
    EXEC EMPLEADO.pr_Telefono
		@P_Telefono,
        @V_numEmpleado;
    IF @V_numEmpleado >@V_ultimoEmpleado
    BEGIN
        COMMIT TRANSACTION INSERTCLIENTE;
    END
    ELSE IF @V_numEmpleado<=@V_ultimoEmpleado
    BEGIN
        rollback TRANSACTION INSERTCLIENTE;
        PRINT 'NO SE REALIZO EL REGISTRO '
    END        
END;





/*
Procedimiento para SERVICIOS
*/
go
CREATE OR ALTER PROCEDURE SERVICIO.REGISTRAR_SERVICIO
    -- Parametros 
    @P_id_Coche smallint,
    @P_id_Cliente smallint,
	@P_tipoServicio char(1),
	@P_numEmpleado smallint,
	@P_fecha date,
	@P_hora datetime,
	@P_motivo varchar(60),
	@P_costos money,
	@P_estatus char(1),
	@P_fechaPlaneacion datetime,
	@P_fechaRealizacion datetime



AS
BEGIN
    
	
	
	DECLARE @V_idRevision smallint;--Variables para guardar el id del catalogo que coincida con el motivo
	DECLARE @V_idReparacion smallint;
	DECLARE @V_id_Servicio smallint;--Variable de receteo para el id_Servicio
	DECLARE @V_tipoEmpleado varchar(1);
	DECLARE @V_nuevoServicio SMALLINT;
	DECLARE @V_cantidad_servicios INT;

	IF @P_tipoServicio = 'C'--Obtener id del catalogo que coinida con el motivo
		SET @V_idRevision = (SELECT MAX(id_Revision) from CATALOGO.REVISION
		WHERE  descripcion LIKE '%' + @P_motivo + '%')
	ELSE
		SET @V_idReparacion = (SELECT MAX(id_Reparacion) from CATALOGO.REPARACION
		WHERE  descripcion LIKE '%' + @P_motivo + '%')
	
	SET @V_tipoEmpleado = (SELECT tipoEmpleado FROM EMPLEADO.EMPLEADO WHERE numEmpleado = @P_numEmpleado);

	SET @V_cantidad_servicios = (SELECT COUNT(id_Servicio) FROM SERVICIO.SERVICIO 
								WHERE id_Cliente = @P_id_Cliente )

	IF @V_cantidad_servicios >= 5 AND @V_idReparacion = 4
	BEGIN
		SET @P_costos = 0;
		SELECT 'Tu cambio de aceite es gratis'
	END 

	-- recetear la PK de servicio.servicio
	--SET @V_id_Servicio = (SELECT MAX(id_Servicio) FROM SERVICIO.SERVICIO);
	SET @V_id_Servicio = ISNULL((SELECT MAX(id_Servicio) FROM SERVICIO.SERVICIO), 0);

	DBCC CHECKIDENT ('SERVICIO.SERVICIO', RESEED, @V_id_Servicio);


    -- Si el tiposervicio es C y el empleado es M entonces insertar en SERVICIO.SERVICIO y especificar numEmpleado
			--insertar en SERVICIO.REVISION y poner numEmpleado como NULL
	BEGIN TRANSACTION nuevoServicio
    IF @P_tipoServicio = 'C' and @V_tipoEmpleado = 'M' 
	BEGIN 
		INSERT INTO SERVICIO.SERVICIO (id_Coche, id_Cliente, tipoServicio, fecha, hora, motivo, costos, estatus, numEmpleado)
		VALUES (@P_id_Coche, @P_id_Cliente, @P_tipoServicio, @P_fecha, @P_hora, @P_motivo, @P_costos, @P_estatus, @P_numEmpleado);
		INSERT INTO SERVICIO.REVISION (id_Servicio, fechaPlaneacion, fechaRealizacion, id_Revision, numEmpleado)
		VALUES ((
			SELECT MAX(id_Servicio) FROM SERVICIO.SERVICIO
		), @P_fechaPlaneacion, @P_fechaRealizacion, @V_idRevision,  NULL);
	END
	-- Si el tipoServicio es C y el empleado es T entonces primero insertar en SERVICIO.SERVICIO con numEmpleado NULL y luego
			--insertar en SERVICIO.REVISION y especificar el numEmpleado
	ELSE IF @P_tipoServicio = 'C' and @V_tipoEmpleado = 'T' 
	BEGIN
		INSERT INTO SERVICIO.SERVICIO (id_Coche, id_Cliente, tipoServicio, fecha, hora, motivo, costos, estatus, numEmpleado)
		VALUES (@P_id_Coche, @P_id_Cliente, @P_tipoServicio, @P_fecha, @P_hora, @P_motivo, @P_costos, @P_estatus, NULL);
		INSERT INTO SERVICIO.REVISION (id_Servicio, fechaPlaneacion, fechaRealizacion, id_Revision, numEmpleado)
		VALUES ((
			SELECT MAX(id_Servicio) FROM SERVICIO.SERVICIO
		), @P_fechaPlaneacion, @P_fechaRealizacion, @V_idRevision,  @P_numEmpleado);
	END
	--Si el tipoServicio es R entonces insertar en SERVICIO.SERVICIO especificando el numEmpleado
			--y despues insertar en SERVICIO.REPARACION
	ELSE IF @P_tipoServicio = 'R' and @V_tipoEmpleado = 'M' 
	BEGIN 
		INSERT INTO SERVICIO.SERVICIO (id_Coche, id_Cliente, tipoServicio, fecha, hora, motivo, costos, estatus, numEmpleado)
		VALUES (@P_id_Coche, @P_id_Cliente, @P_tipoServicio, @P_fecha, @P_hora, @P_motivo, @P_costos, @P_estatus, @P_numEmpleado);
		INSERT INTO SERVICIO.REPARACION (id_Servicio, id_Reparacion )
		VALUES((
			SELECT MAX(id_Servicio) FROM SERVICIO.SERVICIO
		), @V_idReparacion);
	END
	ELSE 
		SELECT 'El tipo de empleado no puede realizar ese servicio'
	
	SET @V_nuevoServicio = ISNULL((SELECT MAX(id_Servicio) FROM SERVICIO.SERVICIO),0);
			IF @V_id_Servicio < @V_nuevoServicio 
				COMMIT TRANSACTION nuevoServicio
			ELSE IF @V_id_Servicio = @V_nuevoServicio 
				ROLLBACK TRANSACTION nuevoServicio


END
GO

				/*

						PROCEDIMIENTOS PARA INGRESAR CLIENTES

				*/

                                  
/*Procedimiento de AVAL.DIRECCION*/

CREATE OR ALTER PROCEDURE AVAL.pr_Direccion
@P_calle		VARCHAR(30),
@P_municipio	VARCHAR(10),
@P_estado		VARCHAR(30),
@P_numero		VARCHAR(5)
as 
BEGIN 
	DECLARE @V_id_Direccion smallint
	SET @V_id_Direccion = (SELECT MAX(id_Direccion) FROM AVAL.DIRECCION);
	IF(@V_id_Direccion IS NULL)
			BEGIN
				SET @V_id_Direccion=0;
			END
	DBCC CHECKIDENT('AVAL.DIRECCION', RESEED, @V_id_Direccion);
	INSERT INTO AVAL.DIRECCION(calle,municipio,estado,numero)
	VALUES(@P_calle,@P_municipio,@P_estado,@P_numero);

END
GO 
                                  
/*
Procedimiento para AVAL.AVAL
*/

CREATE OR ALTER PROCEDURE AVAL.pr_AVAL
@P_Curp			varchar(18),
@P_paterno		varchar(30),
@P_materno		varchar(30),
@P_nombre		varchar(39),
@P_id_Direccion smallint
AS
BEGIN
	IF EXISTS(SELECT 1 FROM AVAL.DIRECCION WHERE id_Direccion=@P_id_Direccion )
    BEGIN
		IF NOT EXISTS(SELECT 1 FROM AVAL.AVAL WHERE curp=@P_Curp )
		BEGIN
			DECLARE @V_id_Aval smallint
			SET @V_id_Aval = (SELECT MAX(id_Aval) FROM AVAL.AVAL);
			IF(@V_id_Aval IS NULL)
			BEGIN
				SET @V_id_Aval=0;
			END
			DBCC CHECKIDENT('AVAL.AVAL', RESEED, @V_id_Aval);
			INSERT INTO AVAL.AVAL(curp,paterno,materno,nombre,id_Direccion)
			VALUES(@P_Curp,@P_paterno,@P_materno,@P_nombre,@P_id_Direccion);
		END
			ELSE
			PRINT 'El curp ya cuenta con registro previo :'+@P_Curp;
	END
	ELSE
	BEGIN
		DECLARE @V_id	 VARCHAR(10);
		SET @V_id = CAST(@P_id_Direccion AS VARCHAR(10));
		print'El id de la direccion no existe :'+@V_id;
	END
END
GO  
                                  
/*Procedimiento AVAL.TELEFONO*/

CREATE OR ALTER PROCEDURE AVAL.pr_Telefono
@P_telefono		NUMERIC(10,0),
@P_id_Aval		SMALLINT
AS
BEGIN
	IF EXISTS(SELECT 1 FROM AVAL.AVAL WHERE id_Aval=@P_id_Aval)
    BEGIN
		DECLARE @V_id_telefono smallint
		SET @V_id_telefono = (SELECT MAX(id_Telefono) FROM AVAL.TELEFONO);
		IF(@V_id_telefono IS NULL)
			BEGIN
				SET @V_id_telefono=0;
			END
		DBCC CHECKIDENT('AVAL.TELEFONO', RESEED, @V_id_telefono);
        INSERT INTO AVAL.TELEFONO(telefono,id_Aval)
        VALUES(@P_telefono,@P_id_Aval);
    END
	ELSE
	BEGIN
	DECLARE @V_id	 VARCHAR(10);
	SET @V_id = CAST(@P_id_Aval AS varchar(10));
	print 'No existe registro de aval con el id :'+@V_id;
	END
END
GO                                  
                                  
  
/*
  Procedimiento CLIENTE - DIRECCION
*/

CREATE OR ALTER PROCEDURE CLIENTE.pr_Direccion
@P_calle		VARCHAR(30),
@P_municipio	VARCHAR(10),
@P_estado		VARCHAR(30),
@P_numero		VARCHAR(5)
as 
BEGIN 
	DECLARE @V_id_Direccion SMALLINT
	SET @V_id_Direccion = (SELECT MAX(id_Direccion) FROM CLIENTE.DIRECCION);
	IF(@V_id_Direccion is null)
	begin 
		set @V_id_Direccion =0;
	end
	DBCC CHECKIDENT('CLIENTE.DIRECCION', RESEED, @V_id_Direccion);
	INSERT INTO CLIENTE.DIRECCION(calle,municipio,estado,numero)
	VALUES(@P_calle,@P_municipio,@P_estado,@P_numero);
END
GO
                                  

--Procedimiento CLIENTE - CLIENTE

CREATE OR ALTER PROCEDURE CLIENTE.pr_Cliente
@P_paterno		VARCHAR(30),
@P_materno		VARCHAR(30),
@P_nombre		VARCHAR(30),
@P_genero       CHAR(1),
@P_rfc          VARCHAR(13),
@P_id_Direccion SMALLINT,
@P_id_Aval      SMALLINT
AS
BEGIN
	IF EXISTS(SELECT 1 FROM CLIENTE.DIRECCION WHERE id_Direccion=@P_id_Direccion )
    BEGIN
		IF not exists(SELECT 1 FROM CLIENTE.CLIENTE WHERE rfc=@P_rfc )
		BEGIN
			IF EXISTS(SELECT 1 FROM AVAL.AVAL WHERE id_Aval=@P_id_Aval)
			BEGIN
				SET @P_genero =UPPER(@P_genero);
				DECLARE @V_id_cliente smallint;
				SET @V_id_cliente = (SELECT MAX(id_Cliente) FROM CLIENTE.CLIENTE);
				IF(@V_id_cliente IS NULL)
				BEGIN
				SET @V_id_cliente=0;
				END
				DBCC CHECKIDENT('CLIENTE.CLIENTE', RESEED, @V_id_cliente);
				INSERT INTO CLIENTE.CLIENTE(paterno,materno,nombre,genero,id_Direccion,id_Aval,rfc)
				VALUES(@P_paterno,@P_materno,@P_nombre,@P_genero,@P_id_Direccion,@P_id_Aval,@P_rfc);
			END
            ELSE
				BEGIN
					DECLARE @V_id	 VARCHAR(10);
					SET @V_id = CAST(@P_id_Aval AS varchar(10));
					PRINT 'El aval proporcionada  con id :'+@V_id+ ' no esta registrado';
				END
		END
			ELSE
			PRINT 'El RFC ya esta asociado con otro cliente :'+@P_rfc +' ,escriba otro';
	END
	ELSE
	BEGIN
		DECLARE @V_idd	 VARCHAR(10);
		SET @V_idd = CAST(@P_id_Direccion AS varchar(10));
		print'El id '+@V_idd +' de direccion no hay registros';
	END
END
GO                                  
/*
   CLIENTE.TELEFONO
*/

CREATE OR ALTER PROCEDURE CLIENTE.pr_Telefono
@P_telefono		NUMERIC(10,0),
@P_id_Cliente	SMALLINT
AS
BEGIN
	IF EXISTS(SELECT 1 FROM CLIENTE.CLIENTE WHERE id_Cliente=@P_id_Cliente)
    BEGIN
		DECLARE @V_id_telefono smallint
		SET @V_id_telefono = (SELECT MAX(id_Telefono) FROM CLIENTE.TELEFONO);
		IF(@V_id_telefono IS NULL)
			BEGIN
				SET @V_id_telefono=0;
			END
		DBCC CHECKIDENT('CLIENTE.TELEFONO', RESEED, @V_id_telefono);
        INSERT INTO CLIENTE.TELEFONO(telefono,id_Cliente)
        VALUES(@P_telefono,@P_id_Cliente);
    END
	ELSE
	BEGIN
	DECLARE @V_id	 VARCHAR(10);
	SET @V_id = CAST(@P_id_Cliente AS VARCHAR(10));
	print 'No existe registro de cliente con el id :'+@V_id;
	END
END
GO

GO
/*
	cliente.correo
*/
CREATE OR ALTER PROCEDURE CLIENTE.prCorreo
@P_correo       VARCHAR(30),
@P_id_Cliente   SMALLINT
AS 
BEGIN
    IF EXISTS(SELECT 1 FROM CLIENTE.CLIENTE WHERE id_Cliente=@P_id_Cliente)
        BEGIN
            IF NOT EXISTS(SELECT 1 FROM CLIENTE.CORREO WHERE CORREO=@P_correo)
                BEGIN
                  	DECLARE @V_id_correo smallint
		            SET @V_id_correo = (SELECT MAX(id_Correo) FROM CLIENTE.CORREO);
		            IF(@V_id_correo IS NULL)
						BEGIN
						SET @V_id_correo=0;
						END
					DBCC CHECKIDENT('CLIENTE.CORREO', RESEED, @V_id_correo);
                    INSERT INTO CLIENTE.CORREO(correo,id_Cliente)
                    VALUES(@P_correo,@P_id_Cliente);  

                END
            ELSE
            print 'Ya  esta registrado el correo :' +@P_correo;    
        END
    ELSE
	BEGIN
		DECLARE @V_id	 VARCHAR(10);
		SET @V_id = CAST(@P_id_Cliente AS varchar(10));
		print'No se realizo el registo ,debido a que no existe cliente correspondiente a su  id : '+@V_id;
	END
END
GO                                  
                                  
/*
    Procedmiento para registro total de cliente
*/

                                  
CREATE OR ALTER PROCEDURE CLIENTE.PR_REGISTROCLIENTE
--Parametros para CLIENTE.CLIENTE:
@P_paterno_CLIENTE		varchar(30),
@P_materno_CLIENTE		varchar(30),
@P_nombre_CLIENTE		VARCHAR(30),
@P_genero_CLIENTE       CHAR(1),
@P_rfc_CLIENTE          VARCHAR(13),
--Parametros para CLIENTE.DIRECCION
@P_calle_CLIENTE		VARCHAR(30),
@P_municipio_CLIENTE	VARCHAR(10),
@P_estado_CLIENTE		VARCHAR(30),
@P_numero_CLIENTE		VARCHAR(5),
---Parametros CLIENTE.TELEFONO
@P_telefono_CLIENTE		numeric(10,0),
--Parametos 
@P_correo_Cliente       varchar(30),

--ParaMetros para AVAL.AVAL
@P_Curp_AVAL			VARCHAR(18),
@P_paterno_AVAL 		VARCHAR(30),
@P_materno_AVAL 		VARCHAR(30),
@P_nombre_AVAL		    VARCHAR(39),
--Parametros para AVAL.DOMICILIO
@P_calle_AVAL		    VARCHAR(30),
@P_municipio_AVAL	    VARCHAR(10),
@P_estado_AVAL		    VARCHAR(30),
@P_numero_AVAL		    VARCHAR(5),

--Parametros para  AVAL.TELEFONO
@P_telefono_AVAL	numeric(10,0)
AS
BEGIN
    /*cliente*/
    DECLARE @V_ID_DIRECCION_cliente SMALLINT;
    DECLARE @V_id_Cliente           SMALLINT;
    DECLARE @V_ultimoCliente        SMALLINT;
    /*Aval */
    DECLARE @V_ID_DIRECCION_aval    SMALLINT;
    DECLARE @V_id_Aval           SMALLINT;
    --DECLARE @V_ultimoAVAl           SMALLINT;
	DECLARE @V_id_Aval_nuevo		SMALLINT;
    --SET @V_ultimoCliente = (SELECT MAX(id_Cliente) FROM CLIENTE.cliente);
    --SET @V_ultimoAVAl = (SELECT MAX(id_Aval) FROM AVAL.AVAL);
	SET @V_ultimoCliente = ISNULL((SELECT MAX(id_Cliente) FROM CLIENTE.cliente), 0);


	BEGIN TRANSACTION INSERTCLIENTE;
            --INGRESO DE REGISTROS EN AVAL.DIRECCION
            EXEC AVAL.pr_Direccion
            @P_calle_AVAL,
            @P_municipio_AVAL,
            @P_estado_AVAL,
            @P_numero_AVAL;

            --INGRESO DE REGISTROS EN AVAL.AVAL
            SET @V_ID_DIRECCION_aval = (SELECT MAX(id_Direccion) FROM AVAL.DIRECCION);
            EXEC AVAL.pr_AVAL
            @P_Curp_AVAL,
            @P_paterno_AVAL,
            @P_materno_AVAL,
            @P_nombre_AVAL,
            @V_ID_DIRECCION_aval;
            --INGRESO DE REGISTROS AVAL.TELEFONO
             SET @V_id_Aval = (SELECT MAX(id_Aval) FROM AVAL.AVAL);
             EXEC AVAL.pr_Telefono
			 @P_telefono_AVAL,
             @V_id_Aval;

           --INGRESO DE REGISTRO EN CLIENTE.DIRECCION
           EXEC CLIENTE.pr_Direccion
           @P_calle_CLIENTE,
           @P_municipio_CLIENTE,
           @P_estado_CLIENTE,
           @P_numero_CLIENTE;
           --INGRESO DE REGISTROS DE CLIENTE.CLIENTE
		 
			SET @V_id_Aval_nuevo = (SELECT MAX(id_Aval) FROM AVAL.AVAL);
            SET @V_ID_DIRECCION_cliente = (SELECT MAX(id_Direccion) FROM CLIENTE.DIRECCION);
           EXEC CLIENTE.pr_Cliente
           @P_paterno_CLIENTE,
           @P_materno_CLIENTE,
           @P_nombre_CLIENTE,
           @P_genero_CLIENTE,
           @P_rfc_CLIENTE,
           @V_ID_DIRECCION_cliente,
           @V_id_Aval_nuevo;
            --INGRESO DE REGISTRO DE CLIENTE.TELEFONO
            SET @V_id_Cliente = (SELECT MAX(id_Cliente) FROM CLIENTE.CLIENTE);
           EXEC CLIENTE.pr_Telefono
            @P_telefono_CLIENTE,
            @V_id_Cliente;
            --INGRESO DE REGISTROS DE CLIENTE.CORREO
            EXEC CLIENTE.prCorreo
            @P_correo_Cliente,
            @V_id_cliente;

    IF @V_id_Cliente >@V_ultimoCliente
            COMMIT transaction INSERTCLIENTE
    ELSE IF @V_id_Cliente <=@V_ultimoCliente
        BEGIN
            rollback transaction INSERTCLIENTE
             PRINT 'NO SE REALIZO EL REGISTRO DE CLIENTE';
		END

 END
 GO


				/*

						PROCEDIMIENTOS PARA INGRESAR VENTAS

				*/

/*
    Procedmiento para registro VENTA.CREDITO
*/
CREATE OR ALTER PROCEDURE pr_insertaCredito
	@v_numTarj NUMERIC(16,0),
	@v_enganche MONEY,
	@v_intMensual MONEY,
	@v_deuda MONEY,
	@v_banco VARCHAR(50),
	@v_meses VARCHAR(30),
	@v_fechaCred DATE
AS
BEGIN
	DECLARE @V_id_credito smallint;
	SET @V_id_credito  = ISNULL((SELECT MAX(id_Credito) FROM VENTA.CREDITO), 0);
	DBCC CHECKIDENT ('VENTA.CREDITO', RESEED, @V_id_credito);	
	INSERT INTO VENTA.CREDITO(numTarjeta, enganche, interesMensual, deuda, banco, tipoCredito,
	fecha)
	VALUES(@v_numTarj, @v_enganche, @v_intMensual, @v_deuda, @v_banco, 
	(SELECT tipoCredito
	FROM CATALOGO.CREDITO WHERE descripcion LIKE '%'+@v_meses+'%') 
	, @v_fechaCred)
END
GO

/*
    Procedmiento para registro VENTA.VENTA
*/CREATE OR ALTER PROCEDURE VENTA.pr_insertarVenta
	@v_comision MONEY,
	@v_fecha DATE,
	@v_extras VARCHAR(90),
	@v_costoT MONEY,
	@v_numEmp INT,
	@v_idCliente INT,
	@v_idCoche INT,
	@p_tipoVenta VARCHAR(1),
	@v_numTarj NUMERIC(16,0),
	@v_enganche MONEY,
	@v_intMensual MONEY,
	@v_banco VARCHAR(50),
	@v_tipoCred VARCHAR(50),
	@v_fechaCred DATE
AS
BEGIN
			DECLARE @V_id_venta smallint
			SET @V_id_venta = ISNULL((SELECT MAX(id_venta) FROM VENTA.VENTA), 0);
			DBCC CHECKIDENT ('VENTA.VENTA', RESEED, @V_id_venta);
	IF (@p_tipoVenta='D')
	--Insertar directamente en venta
		BEGIN
			INSERT INTO VENTA.VENTA(comision, fecha, Extras, CostoTotal, numEmpleado, id_Cliente,
			id_Coche, id_Credito)
			VALUES(@v_comision, @v_fecha, @v_extras, @v_costoT, @v_numEmp, @v_idCliente, @v_idCoche,
			NULL)
			PRINT 'La venta se ha registrado exitosamente'
		END
	ELSE IF(@p_tipoVenta='C')
		BEGIN
			DECLARE @v_idCredito SMALLINT
			DECLARE @v_deuda MONEY = @v_costoT-@v_enganche
			EXEC pr_insertaCredito
			@v_numTarj, @v_enganche, @v_intMensual, @v_deuda, @v_banco, @v_tipoCred, @v_fechaCred
			SET @v_idCredito=(SELECT MAX(id_Credito) FROM VENTA.CREDITO)
			INSERT INTO VENTA.VENTA(comision, fecha, Extras, CostoTotal, numEmpleado, id_Cliente,
			id_Coche,id_Credito)
			VALUES(@v_comision, @v_fecha, @v_extras, @v_costoT, @v_numEmp, @v_idCliente, @v_idCoche,
			(SELECT MAX(id_Credito) FROM VENTA.CREDITO))
			PRINT 'La venta y el crédito se han registrado exitosamente'
		END
END
                                  
                           

                                  
                                  
                                  /*
	PROCEDIMIENTO PARA VENTA.HISTORIAL_PAGO
*/

GO 
CREATE OR ALTER  PROCEDURE VENTA.REALIZA_PAGO
    -- Parámetros 
    @P_id_Venta         SMALLINT,       
    @P_Pago				money

AS
BEGIN
	DECLARE @V_CostoTotal    			money;
	DECLARE @V_deuda		 			money;
	DECLARE @V_enganche		 			money;
	DECLARE @V_DEUDA_RESTANTE			money;
	DECLARE @V_pagos					money;
	DECLARE @V_id_Historial				SMALLINT;
	DECLARE @V_nuevoHistorial			SMALLINT;

	SET @V_id_Historial = ISNULL((SELECT MAX(id_Pago) FROM VENTA.HISTORIAL_PAGO),0);
	DBCC CHECKIDENT ('VENTA.HISTORIAL_PAGO', RESEED, @V_id_Historial);

	--Costo de la venta
	SET @V_CostoTotal = (SELECT CostoTotal FROM VENTA.VENTA 
						WHERE id_Venta = @P_id_Venta)
	--deuda del credito
	SET @V_deuda = (SELECT TOP 1 C.deuda FROM VENTA.CREDITO C
					INNER JOIN VENTA.VENTA V ON V.id_Credito = C.id_Credito
					 WHERE V.id_Venta = @P_id_Venta
					 ORDER BY C.deuda DESC)
	--Enganche en credito				
	SET @V_enganche = (SELECT C.enganche FROM VENTA.CREDITO C
					INNER JOIN VENTA.VENTA V ON V.id_Credito = C.id_Credito
					 WHERE V.id_Venta = @P_id_Venta )
	SET @V_pagos = (SELECT  SUM(pago) FROM VENTA.HISTORIAL_PAGO
							WHERE id_Venta = @P_id_Venta
							 ) + @V_enganche;


	IF @V_deuda = 0
		IF @V_pagos = @V_CostoTotal
			print 'Se ha liquidado la deuda'
		ELSE 
			print 'Hay un error con el historial de tu pago. consutla con el personal'
	ELSE
	 IF @P_Pago > @V_deuda
		BEGIN
		print 'Se esta tratando de realizar un pago superior a la deuda restante'
		END
	ELSE 
		BEGIN 
			BEGIN TRANSACTION pagoRealizado 
			SET @V_DEUDA_RESTANTE = @V_deuda - @P_Pago
			INSERT INTO  VENTA.HISTORIAL_PAGO
			VALUES (@P_id_Venta, @P_Pago, @V_DEUDA_RESTANTE)

			UPDATE VENTA.CREDITO 
			SET deuda = @V_DEUDA_RESTANTE
			WHERE id_Credito = (SELECT C.id_Credito FROM VENTA.CREDITO C
					INNER JOIN VENTA.VENTA V ON V.id_Credito = C.id_Credito
					 WHERE V.id_Venta = @P_id_Venta )

				SET @V_nuevoHistorial = ISNULL((SELECT MAX(id_Pago) FROM VENTA.HISTORIAL_PAGO),0);

			IF @V_id_Historial < @V_nuevoHistorial
				COMMIT TRANSACTION pagoRealizado
			ELSE IF @V_id_Historial = @V_nuevoHistorial
				ROLLBACK TRANSACTION pagoRealizado
		END
			
END
GO
        

                                
                                  
                                  
--MODIFICAR O CANCELAR REPARACION Y REVISION


--REPARACIÓN
CREATE OR ALTER PROCEDURE pr_modificaReparacion
	@p_idServ SMALLINT,
	@n_tipoServ CHAR(1),
	@n_fecha DATE,
	@n_hora DATETIME,
	@n_motivo CHAR(60),
	@n_costo MONEY,
	@n_estatus CHAR(10),
	@n_numEmp SMALLINT
	AS
	BEGIN
		UPDATE SERVICIO.SERVICIO
		SET tipoServicio=@n_tipoServ,
			fecha=@n_fecha,
			hora=@n_hora,
			motivo=@n_motivo,
			costos=@n_costo,
			estatus=@n_estatus,
			numEmpleado=@n_numEmp
		WHERE id_Servicio=@p_idServ AND tipoServicio='R'
	END 	

go

CREATE OR ALTER PROCEDURE pr_eliminarReparacion
	@p_idServicio SMALLINT
	AS
	BEGIN
		DELETE FROM SERVICIO.SERVICIO
		WHERE id_Servicio=@p_idServicio;
	END



	go

--REVISIÓN
CREATE OR ALTER PROCEDURE pr_modificaRevision
	@p_idServ SMALLINT,
	@n_tipoServ CHAR(1),
	@n_fecha DATE,
	@n_hora DATETIME,
	@n_motivo CHAR(60),
	@n_costo MONEY,
	@n_estatus CHAR(10),
	@n_numEmp SMALLINT
	AS
	BEGIN
		UPDATE SERVICIO.SERVICIO
		SET tipoServicio=@n_tipoServ,
			fecha=@n_fecha,
			hora=@n_hora,
			motivo=@n_motivo,
			costos=@n_costo,
			estatus=@n_estatus,
			numEmpleado=@n_numEmp
		WHERE id_Servicio=@p_idServ AND tipoServicio='C'
	END 	

	go

CREATE OR ALTER PROCEDURE pr_eliminarReparacion
	@p_idServicio SMALLINT
	AS
	BEGIN
		DELETE FROM SERVICIO.SERVICIO
		WHERE id_Servicio=@p_idServicio;
	END






/*     
go
CREATE OR ALTER PROCEDURE	BACK.RESE
AS
BEGIN
	DBCC CHECKIDENT ('AVAL.AVAL', RESEED, 0);
	DBCC CHECKIDENT ('AVAL.DIRECCION', RESEED, 0);
	DBCC CHECKIDENT ('AVAL.TELEFONO', RESEED, 0);
	DBCC CHECKIDENT ('CATALOGO.CREDITO', RESEED, 0);
	DBCC CHECKIDENT ('CATALOGO.REPARACION', RESEED, 0);
	DBCC CHECKIDENT ('CATALOGO.REVISION', RESEED, 0);
	DBCC CHECKIDENT ('CLIENTE.CLIENTE', RESEED, 0);
	DBCC CHECKIDENT ('CLIENTE.CORREO', RESEED, 0);
	DBCC CHECKIDENT ('CLIENTE.DIRECCION', RESEED, 0);
	DBCC CHECKIDENT ('CLIENTE.TELEFONO', RESEED, 0);
	DBCC CHECKIDENT ('COCHE.COCHE', RESEED, 0);
	DBCC CHECKIDENT ('EMPLEADO.EMPLEADO', RESEED, 0);
	DBCC CHECKIDENT ('EMPLEADO.DIRECCION', RESEED, 0);
	DBCC CHECKIDENT ('EMPLEADO.TELEFONO', RESEED, 0);
	DBCC CHECKIDENT ('SERVICIO.SERVICIO', RESEED, 0);
	DBCC CHECKIDENT ('VENTA.VENTA', RESEED, 0);
	DBCC CHECKIDENT ('VENTA.CREDITO', RESEED, 0);

END*/
