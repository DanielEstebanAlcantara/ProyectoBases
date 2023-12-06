

	------DDL PROYECTO FINAL---------
------EQUIPO 6 CONCESIONARIA-------
/*

Script con la cereaci�n de las tablas y sus relaciones de la base de datos

*/

CREATE DATABASE [CONCESIONARIA]
GO

USE CONCESIONARIA
GO

CREATE SCHEMA EMPLEADO
GO

CREATE SCHEMA CLIENTE
GO

CREATE SCHEMA AVAL
GO

CREATE SCHEMA SERVICIO
GO

CREATE SCHEMA CATALOGO
GO

CREATE SCHEMA COCHE
GO

CREATE SCHEMA VENTA
GO
/* 
 * TABLE: EMPLEADO ,Superclase de mecanico ,agente de ventas, tecnico 
 */

CREATE TABLE EMPLEADO.EMPLEADO(
    numEmpleado        smallint    NOT NULL identity (1,1),
    fechaNacimiento    date        NOT NULL,
    paterno            char(25)    NOT NULL,
    materno            char(25)    NOT NULL,
    nombre             char(25)    NOT NULL,
    fechaIngreso       date        NOT NULL,
    sueldo             money	NOT NULL,
    tipoEmpleado       char(10)    NOT NULL,
    id_Direccion        smallint   NOT NULL,
    CONSTRAINT PK_EMPLEADO PRIMARY KEY CLUSTERED (numEmpleado)
)
go


-- 17/11 agregar concideraci�n semantica al tipoEmpleado Agente de venta = V, Tecnico = T y Mecanico = M
ALTER TABLE EMPLEADO.EMPLEADO
ALTER COLUMN tipoEmpleado char(1) NOT NULL;
ALTER TABLE EMPLEADO.EMPLEADO
ADD CONSTRAINT tipoEmpleado_ck CHECK  (tipoEmpleado in('V','M', 'T'));


/*
Table :Agente de venta
*/
CREATE TABLE EMPLEADO.AGENTE_VENTA(
    numEmpleado    smallint    NOT NULL,
    CONSTRAINT PK_AGENTE_VENTA PRIMARY KEY CLUSTERED (numEmpleado)
)
go
/*
Table :Tecnico
*/

CREATE TABLE EMPLEADO.TECNICO(
    numEmpleado    smallint    NOT NULL,
    CONSTRAINT PK_TECNICO_EMP PRIMARY KEY CLUSTERED (numEmpleado)
)
/* 
 * TABLE: MECANICO 
 */

CREATE TABLE EMPLEADO.MECANICO(
    numEmpleado    smallint         NOT NULL,
    escolaridad    varchar(30)			NOT NULL,
    CONSTRAINT PK_EMP_MECANICO PRIMARY KEY CLUSTERED (numEmpleado)
)
go

ALTER TABLE  EMPLEADO.MECANICO
ALTER COLUMN escolaridad    varchar(30)	NULL

/*
TABLE EMPLEADO.CURSO
*/
CREATE TABLE EMPLEADO.CURSO(
    id_Curso        Smallint      NOT NULL identity (1,1),
	Curso          VARCHAR(20)    NOT NULL,
	numEmpleado    smallint         NOT NULL,
    CONSTRAINT PK_CURSO PRIMARY KEY CLUSTERED (id_Curso)
)
go
-- 18/11 Ajuste de tama�o para campo Curso 
ALTER TABLE EMPLEADO.CURSO 
ALTER COLUMN Curso VARCHAR(100)  NOT NULL

/* 
 * TABLE: DIRECCION_EMPLEADO 
*/
CREATE TABLE EMPLEADO.DIRECCION(
    id_Direccion    smallint   NOT NULL identity (1,1),
    calle          varchar(20)    NOT NULL,
    municipio      varchar(20)    NOT NULL,
    estado         varchar(20)    NOT NULL,
    numero         varchar(5)    NOT NULL,
    CONSTRAINT PK_DIRECCION_EMP PRIMARY KEY CLUSTERED (id_Direccion)
)
go

ALTER TABLE EMPLEADO.DIRECCION
ALTER COLUMN calle VARCHAR(50) NOT NULL
ALTER TABLE EMPLEADO.DIRECCION
ALTER COLUMN municipio VARCHAR(30) NOT NULL


/* 
 * TABLE: TELEFONO_EMPLEADO 
 */

CREATE TABLE EMPLEADO.TELEFONO(
    id_Telefono     smallint              NOT NULL identity (1,1),
    telefono       numeric(10, 0)    NOT NULL,
	numEmpleado        smallint    NOT NULL,
    CONSTRAINT PK_TEL_EMP PRIMARY KEY CLUSTERED (id_Telefono),
	CONSTRAINT TELEFONO_EMPLEADO_UNIQUE UNIQUE(telefono)
)

/* 
 * TABLE: CLIENTE 
 */

CREATE TABLE CLIENTE.CLIENTE(
    id_Cliente      smallint    NOT NULL identity (1,1),
    paterno         char(30)    NOT NULL,
    materno         char(30)    NOT NULL,
    nombre          char(30)    NOT NULL,
    genero		    char(1)     NOT NULL,
    rfc		        varchar(13)    NOT NULL,
    id_Direccion    smallint	NOT NULL,
    id_Aval         smallint	NOT NULL,
    CONSTRAINT PK_CLIENTE PRIMARY KEY CLUSTERED (id_Cliente),
	CONSTRAINT GENERO_CK CHECK (genero in('H','M')),
	CONSTRAINT RFC_UNIQUE UNIQUE (RFC)
)
go
--20/11 Agregar valor por DEFAULT a RFC, el de publico en general
ALTER TABLE CLIENTE.CLIENTE
ADD CONSTRAINT DF_rfc DEFAULT 'XAXX010101000' FOR rfc;
/* 
 * TABLE: CORREO 
 */

CREATE TABLE CLIENTE.CORREO(
    id_Correo    smallint     NOT NULL identity (1,1),
    correo       varchar(30)	  NOT NULL,
	id_Cliente      smallint    NOT NULL
    CONSTRAINT PK_CORREO_CL PRIMARY KEY CLUSTERED (id_Correo),
	CONSTRAINT CORREO_UNIQUE UNIQUE(correo)
)
go
/* 
 * TABLE: CLIENTE.DIRECCION
 */

CREATE TABLE CLIENTE.DIRECCION(
    id_Direccion   smallint     NOT NULL identity (1,1),
    calle          varchar(30)		NOT NULL,
    municipio      varchar(10)		NOT NULL,
    estado         varchar(10)		NOT NULL,
    numero         varchar(5)		NOT NULL,
    CONSTRAINT PK_cliente_DIR PRIMARY KEY CLUSTERED (id_Direccion)
)
go
-- 18/11 Cambio de tama�o de campo estado 
ALTER TABLE CLIENTE.DIRECCION
ALTER COLUMN estado varchar(30) NOT NULL

ALTER TABLE CLIENTE.DIRECCION
ALTER COLUMN municipio VARCHAR(30) NOT NULL

/* 
 * TABLE: TELEFONO_CLIENTE 
 */

CREATE TABLE CLIENTE.TELEFONO(
    id_Telefono   smallint               NOT NULL identity (1,1),
    telefono      numeric(10, 0)	 NOT NULL,
	id_Cliente      smallint    NOT NULL
    CONSTRAINT PK_CLIENTE_TEL PRIMARY KEY CLUSTERED (id_Telefono),
	CONSTRAINT TELEFONO_UNIQUE_CLIENTE UNIQUE(telefono)
)
go



/* 
 * TABLE: AVAL 
 */

CREATE TABLE AVAL.AVAL(
    id_Aval         smallint         NOT NULL identity (1,1),
    curp			varchar(18)    NOT NULL,
    paterno			char(30)    NOT NULL,
    materno			char(30)    NOT NULL,
    nombre			char(30)    NOT NULL,
    id_Direccion    smallint         NOT NULL,
    CONSTRAINT PK_AVAL PRIMARY KEY CLUSTERED (id_Aval),
	CONSTRAINT CURP_AVAL UNIQUE(curp)
)
go
/*
Table CLIENTE.AVAL_DIRECCION
*/

CREATE TABLE AVAL.DIRECCION(
    id_Direccion   smallint        NOT NULL identity (1,1),
    calle          varchar(30)    NOT NULL,
    municipio      varchar(10)    NOT NULL,
    estado         varchar(10)    NOT NULL,
    numero         varchar(5)    NOT NULL,
    CONSTRAINT PK_DIR_AVAL PRIMARY KEY CLUSTERED (id_Direccion)
)
go
--18/11 Ajuste del tama�o de estado
ALTER TABLE AVAL.DIRECCION
ALTER COLUMN estado varchar(30) NOT NULL
ALTER TABLE AVAL.DIRECCION
ALTER COLUMN municipio VARCHAR(30) NOT NULL


/*
Table :AVAL.TELEFONO
*/
CREATE TABLE AVAL.TELEFONO(
    id_Telefono    smallint          NOT NULL identity (1,1),
    telefono      numeric(10, 0)	 NOT NULL,
	id_Aval         smallint         NOT NULL,
    CONSTRAINT PK_AVAL_TEL PRIMARY KEY CLUSTERED (id_Telefono),
	CONSTRAINT TELEFONO_UNIQUE_AVAL UNIQUE(telefono)
)
go

/* 
 * TABLE: SERVICIO.servicio
 */

CREATE TABLE SERVICIO.SERVICIO(
    id_Servicio        smallint         IDENTITY(1,1),
    id_Coche           smallint         NOT NULL,
    id_Cliente         smallint         NOT NULL,
    tipoServicio	   char(10)         NOT NULL,
    fecha              date             NOT NULL,
    hora               datetime         NOT NULL,
    motivo             char(20)         NOT NULL,
    costos			   money	        NOT NULL,
	costoTotal		   as(costos*0.16),
    estatus			   char(10)         NOT NULL,
    numEmpleado        smallint         NOT NULL,
    CONSTRAINT PK_SERVICIO PRIMARY KEY CLUSTERED (id_Servicio),
	CONSTRAINT ESTATUS_OPC CHECK(estatus in('P','C','E'))
)
go
--Consideraci�n semantica para tipoServicio Revision(C check) Reparacion(R repair)
ALTER TABLE SERVICIO.SERVICIO
ALTER COLUMN tipoServicio CHAR(1) NOT NULL
ALTER TABLE SERVICIO.SERVICIO
ADD CONSTRAINT tipoServicio_CK CHECK (tipoServicio in ('C', 'R'))
--18/11 numEmpleado cambia a NULL pq un mecanico no necesariamente participa en un servicio
ALTER TABLE SERVICIO.SERVICIO
ALTER COLUMN numEmpleado smallint NULL
--18/11 Ajuste tama�o motivo
ALTER TABLE SERVICIO.SERVICIO
ALTER COLUMN motivo varchar(60) NOT NULL

--23/11 Corecci�n del calculo

ALTER TABLE SERVICIO.SERVICIO
DROP COLUMN costoTotal;

ALTER TABLE SERVICIO.SERVICIO
ADD costoTotal AS (costos + costos * 0.16);



CREATE TABLE SERVICIO.REPARACION(
    id_Servicio      smallint    NOT NULL,
    id_Reparacion    smallint    NOT NULL,
    CONSTRAINT PK_REPARACION PRIMARY KEY CLUSTERED (id_Servicio)
)
go
/* 
 * TABLE: REVISION 
 */

CREATE TABLE SERVICIO.REVISION(
    id_Servicio         smallint          NOT NULL,
    fechaPlaneacion     datetime          NOT NULL,
    fechaRealizacion    datetime          NOT NULL,
    monto               money             NOT NULL,
    id_Revision			smallint          NOT NULL,
    numEmpleado         smallint          NOT NULL,
    CONSTRAINT PK_REVISION PRIMARY KEY CLUSTERED (id_Servicio)
) 
go

--18/11 fechaRealizaci�n pasa a NULL
ALTER TABLE SERVICIO.REVISION
ALTER COLUMN fechaRealizacion  datetime NULL

ALTER TABLE SERVICIO.REVISION
ALTER COLUMN numEmpleado smallint NULL

--23/11 quitar columna redundante monto
ALTER TABLE SERVICIO.REVISION
DROP COLUMN monto


/* 
 * TABLE: CATALOGO.Reperacion 
 */

CREATE TABLE CATALOGO.REPARACION(
    id_Reparacion    smallint         NOT NULL identity (1,1),
    descripcion		 varchar(20)    NOT NULL,
    CONSTRAINT PK_CATALOGO_REP PRIMARY KEY CLUSTERED (id_Reparacion)
)
go
--Ajuste de tama�o de descripcion 
ALTER TABLE CATALOGO.REPARACION
ALTER COLUMN descripcion varchar(60) NOT NULL


/* 
 * TABLE: CATOLOGO.REVISION 
 */

CREATE TABLE CATALOGO.REVISION(
    id_Revision		   smallint         NOT NULL identity (1,1),
    descripcion        varchar(20)			NOT NULL,
    CONSTRAINT PK_CATALGO_REV PRIMARY KEY CLUSTERED (id_Revision)
)
go
--Ajuste de tama�o de descripcion 
ALTER TABLE CATALOGO.REVISION
ALTER COLUMN descripcion varchar(60) NOT NULL


/* 
 * TABLE: COCHE 
 */

CREATE TABLE COCHE.COCHE(
    id_Coche         smallint         NOT NULL identity (1,1),
    modelo           varchar(10)         NOT NULL,
    extras           varchar(10)         NULL,
    matricula		 varchar(6)    NOT NULL,
    tipoCoche        char(10)         NOT NULL,
    CONSTRAINT PK_COCHE PRIMARY KEY CLUSTERED (id_Coche),
	CONSTRAINT MATRICULA_UNIQUE UNIQUE(matricula)
)
go
--18/11 Ajustar tama�o campo extras
ALTER TABLE COCHE.COCHE
ALTER COLUMN extras varchar(50) NULL
--Check en tipoCoche
ALTER TABLE COCHE.COCHE 
ADD CONSTRAINT tipoCochcePS CHECK (tipoCoche in ('S', 'N'));
/* 
 * TABLE: COCHE.SEGUNDA_MANO 
 */

CREATE TABLE COCHE.SEGUNDA(
    id_Coche         smallint	NOT NULL,
    id_Segunda		 smallint   NOT NULL,
    fecha            date		NOT NULL,
    costo            smallint	NOT NULL,
    id_Cliente       smallint	NOT NULL,
    CONSTRAINT PK_COCHE_SEGUNDA PRIMARY KEY CLUSTERED (id_Coche),
	CONSTRAINT UNIQUE_SEGUNDA UNIQUE (id_Segunda)
)
go
-- 18/11 eliminar campo id_Segunda
ALTER TABLE COCHE.SEGUNDA
DROP CONSTRAINT UNIQUE_SEGUNDA
-- 18/11 cambiar tipo de dato en costo a MONEY
ALTER TABLE COCHE.SEGUNDA
ALTER COLUMN  costo MONEY NOT NULL

ALTER TABLE COCHE.SEGUNDA
DROP COLUMN id_Segunda

/* 
 * TABLE: VENTA.VENTA 
 */

CREATE TABLE VENTA.VENTA(
    id_Venta                    smallint			NOT NULL identity (1,1),
    comision                    money					NOT NULL,
    fecha                       date				NOT NULL,
    Extras                      varchar(20)			NOT NULL,
    CostoTotal                  money			NOT NULL,
    CostoCancelacion			as(0.15*CostoTotal)	PERSISTED,
    numEmpleado                 smallint			NOT NULL,
    id_Cliente                  smallint			NOT NULL,
    id_Coche                    smallint			NOT NULL,
    id_Credito                  smallint			NOT NULL,
    CONSTRAINT PK_VENTA PRIMARY KEY CLUSTERED (id_Venta)
)
go
--18/11 Cambio id_Credito de NOT NULL a NULL
ALTER TABLE VENTA.VENTA
ALTER COLUMN id_Credito smallint NULL
ALTER TABLE VENTA.VENTA
ALTER COLUMN Extras varchar(50) NULL


-- TABLE: VENTA.CREDITO 


CREATE TABLE VENTA.CREDITO(
    id_Credito           smallint           NOT NULL identity (1,1),
    numTarjeta           numeric(16, 0)		NOT NULL,
    enganche             money				NOT NULL,
    interesMensual       money				NOT NULL,
    montoTotal           as(enganche+
							interesMensual) PERSISTED,
	deuda				 money				NOT NULL,
    banco                varchar(20)		NOT NULL,
    tipoCredito			 smallint			NOT NULL,
    fecha                date				NOT NULL,
    CONSTRAINT PK_CREDITO PRIMARY KEY CLUSTERED (id_Credito),
	CONSTRAINT UNIQUE_TARJETA UNIQUE(numTarjeta)
)
go

-- 23/11 Eliminar constraint de UNIQUE_TARJETA pq un empleado puede pagar dos creditos con la misma tarjeta
ALTER TABLE VENTA.CREDITO
DROP CONSTRAINT UNIQUE_TARJETA

/*Catalago tipo de credito
TABLE Catalago.creditdo
*/
CREATE TABLE CATALOGO.CREDITO(
	tipoCredito		smallint	NOT NULL identity (1,1),
	descripcion		varchar(25)	NOT NULL,
	CONSTRAINT PK_TIPOCREDITO PRIMARY KEY CLUSTERED(tipoCredito)
)
go

/* 
 * TABLE: HISTORIAL_PAGO 
 */

CREATE TABLE VENTA.HISTORIAL_PAGO(
    id_Pago			smallint      NOT NULL identity (1,1),
    id_Venta		smallint      NOT NULL,
    Pago			money      NOT NULL,
	deuda_rest		money		NOT NULL,
    CONSTRAINT PK_HISTORIALPAGO PRIMARY KEY CLUSTERED (id_Pago, id_venta)
)
go

/*Realizacion de alters para hacer uso de FK */


--EMPLEADO-DIRECCION
								/*ALTER TABLE EMPLEADO.EMPLEADO ADD CONSTRAINT FK_DIRECCION_EMPLEADO
									FOREIGN KEY (id_Direccion)
									REFERENCES EMPLEADO.DIRECCION(id_Direccion)
								go*/

								--ADD On Delete Cascade                                  
								/*ALTER TABLE  EMPLEADO.EMPLEADO
								DROP CONSTRAINT FK_DIRECCION_EMPLEADO;*/

ALTER TABLE EMPLEADO.EMPLEADO ADD CONSTRAINT FK_DIRECCION_EMPLEADO
    FOREIGN KEY (id_Direccion)
    REFERENCES EMPLEADO.DIRECCION(id_Direccion)
ON DELETE CASCADE;

--EMPLEADO-TELEFONO
									-- 17/11
									/*ALTER TABLE EMPLEADO.TELEFONO ADD CONSTRAINT FK_TELEFONO_EMPLEADO
										FOREIGN KEY (numEmpleado)
										REFERENCES EMPLEADO.EMPLEADO(numEmpleado)
									go

									-- Agregar ON DELETE CASCADE
									ALTER TABLE EMPLEADO.TELEFONO
									DROP CONSTRAINT FK_TELEFONO_EMPLEADO;*/

ALTER TABLE EMPLEADO.TELEFONO
ADD CONSTRAINT FK_TELEFONO_EMPLEADO
FOREIGN KEY (numEmpleado)
REFERENCES EMPLEADO.EMPLEADO(numEmpleado)
ON DELETE CASCADE;

--EMPLEADO-AGENTE DE VENTA
								/*ALTER TABLE EMPLEADO.AGENTE_VENTA ADD CONSTRAINT FK_EMPLEADO_AGENTE 
									FOREIGN KEY (numEmpleado)
									REFERENCES EMPLEADO.EMPLEADO(numEmpleado)
								go

								--ON DELETE CASACADE
								ALTER TABLE EMPLEADO.AGENTE_VENTA
								DROP CONSTRAINT FK_EMPLEADO_AGENTE;*/

ALTER TABLE EMPLEADO.AGENTE_VENTA
ADD CONSTRAINT FK_EMPLEADO_AGENTE
FOREIGN KEY (numEmpleado)
REFERENCES EMPLEADO.EMPLEADO(numEmpleado)
ON DELETE CASCADE;


--EMPLEADO-TECNICO
									/*ALTER TABLE EMPLEADO.TECNICO ADD CONSTRAINT FK_EMPLEADO_TECNICO 
										FOREIGN KEY (numEmpleado)
										REFERENCES EMPLEADO.EMPLEADO(numEmpleado)
									go

									--AGREGAR ON DELETE CASCADE
									ALTER TABLE EMPLEADO.TECNICO
									DROP CONSTRAINT FK_EMPLEADO_TECNICO;*/

ALTER TABLE EMPLEADO.TECNICO
ADD CONSTRAINT FK_EMPLEADO_TECNICO
FOREIGN KEY (numEmpleado)
REFERENCES EMPLEADO.EMPLEADO(numEmpleado)
ON DELETE CASCADE;


--EMPLEADO-MECANICO
									/*ALTER TABLE EMPLEADO.MECANICO ADD CONSTRAINT FK_EMPLEADO_MECANICO 
										FOREIGN KEY (numEmpleado)
										REFERENCES EMPLEADO.EMPLEADO(numEmpleado)
									go

									-- ON DELETE CASCADE
									ALTER TABLE EMPLEADO.MECANICO
									DROP CONSTRAINT FK_EMPLEADO_MECANICO;*/

ALTER TABLE EMPLEADO.MECANICO
ADD CONSTRAINT FK_EMPLEADO_MECANICO
FOREIGN KEY (numEmpleado)
REFERENCES EMPLEADO.EMPLEADO(numEmpleado)
ON DELETE CASCADE;


--MECANICO-CURSO
--11/17
									/*ALTER TABLE EMPLEADO.CURSO ADD CONSTRAINT FK_EMPLEADO_CURSO 
										FOREIGN KEY (numEmpleado)
										REFERENCES EMPLEADO.MECANICO(numEmpleado)
									go


									--ON DELETE CASCADE EMPLEADO CURSO
									ALTER TABLE EMPLEADO.CURSO
									DROP CONSTRAINT FK_EMPLEADO_CURSO;*/

ALTER TABLE EMPLEADO.CURSO
ADD CONSTRAINT FK_EMPLEADO_CURSO
FOREIGN KEY (numEmpleado)
REFERENCES EMPLEADO.MECANICO(numEmpleado)
ON DELETE CASCADE;



--CORREO - CLIENTE
--11/17
									/*ALTER TABLE CLIENTE.CORREO ADD CONSTRAINT FK_CLIENTE_CORREO
										FOREIGN KEY (id_cliente)
										REFERENCES CLIENTE.CLIENTE(id_cliente)
									go

									--ON DELETE CASCADE CORREO CLIENTE
									ALTER TABLE CLIENTE.CORREO
									DROP CONSTRAINT FK_CLIENTE_CORREO;*/

ALTER TABLE CLIENTE.CORREO
ADD CONSTRAINT FK_CLIENTE_CORREO
FOREIGN KEY (id_cliente)
REFERENCES CLIENTE.CLIENTE(id_cliente)
ON DELETE CASCADE;


--DIRECCION CLIENTE
									/*ALTER TABLE CLIENTE.CLIENTE ADD CONSTRAINT FK_CLIENTE_DIRECCION
										FOREIGN KEY (id_Direccion)
										REFERENCES CLIENTE.DIRECCION(id_Direccion)
									go
                                  
									--ON DELETE CASCADE DIRECCION CLIENTE
									ALTER TABLE CLIENTE.CLIENTE
									DROP CONSTRAINT FK_CLIENTE_DIRECCION;*/

ALTER TABLE CLIENTE.CLIENTE
ADD CONSTRAINT FK_CLIENTE_DIRECCION
FOREIGN KEY (id_Direccion)
REFERENCES CLIENTE.DIRECCION(id_Direccion)
ON DELETE CASCADE;
                                  
                                  
--AVAL-CLIENTE
									/*ALTER TABLE CLIENTE.CLIENTE ADD CONSTRAINT FK_CLIENTE_AVAL
										FOREIGN KEY (id_Aval)
										REFERENCES AVAL.AVAL(id_Aval)
									go

									--ON DELETE CASCADE AVAL CLIENTE
									ALTER TABLE CLIENTE.CLIENTE
									DROP CONSTRAINT FK_CLIENTE_AVAL;*/

ALTER TABLE CLIENTE.CLIENTE
ADD CONSTRAINT FK_CLIENTE_AVAL
FOREIGN KEY (id_Aval)
REFERENCES AVAL.AVAL(id_Aval)
ON DELETE CASCADE;

--TELEFONO-CLIENTE
									--17/11
									/*ALTER TABLE CLIENTE.TELEFONO ADD CONSTRAINT FK_CLIENTE_TELEFONO
										FOREIGN KEY (id_Cliente)
										REFERENCES CLIENTE.CLIENTE(id_Cliente)
									go
                                  
									ALTER TABLE CLIENTE.TELEFONO
									DROP CONSTRAINT FK_CLIENTE_TELEFONO;*/

ALTER TABLE CLIENTE.TELEFONO ADD CONSTRAINT FK_CLIENTE_TELEFONO
    FOREIGN KEY (id_Cliente)
    REFERENCES CLIENTE.CLIENTE(id_Cliente)
ON DELETE CASCADE; 



--Aval-direccion
										/*ALTER TABLE AVAL.AVAL ADD CONSTRAINT FK_AVAL_DIRECCION
											FOREIGN KEY (id_Direccion)
											REFERENCES AVAL.DIRECCION(id_Direccion)
										go
										--ADD On Delete Cascade                                  
										ALTER TABLE  AVAL.AVAL
										DROP CONSTRAINT FK_AVAL_DIRECCION;*/

ALTER TABLE AVAL.AVAL ADD CONSTRAINT FK_AVAL_DIRECCION
    FOREIGN KEY (id_Direccion)
    REFERENCES AVAL.DIRECCION(id_Direccion)
ON DELETE CASCADE;


--AVAL-TELEFONO
--11/17


ALTER TABLE AVAL.TELEFONO
ADD CONSTRAINT FK_AVAL_TELEFONO
FOREIGN KEY (id_aval)
REFERENCES AVAL.AVAL(id_aval)
ON DELETE CASCADE;  


--SERVICIO-COCHE
ALTER TABLE SERVICIO.SERVICIO ADD CONSTRAINT FK_SERVICIO_COCHE
    FOREIGN KEY (id_Coche)
    REFERENCES  COCHE.COCHE(id_Coche)
go

--SERVICIO-CLIENTE
ALTER TABLE SERVICIO.SERVICIO ADD CONSTRAINT FK_SERVICIO_CLIENTE
    FOREIGN KEY (id_Cliente)
    REFERENCES  CLIENTE.CLIENTE(id_Cliente)

-----SERVICIO-MEC�NICO
ALTER TABLE SERVICIO.SERVICIO ADD CONSTRAINT FK_MECANICO_SERV
	FOREIGN KEY (numEmpleado) REFERENCES EMPLEADO.MECANICO
go




--SERVICIO -REPARACION
						/*ALTER TABLE SERVICIO.REPARACION ADD CONSTRAINT FK_SERVICIO_REPARACION
							FOREIGN KEY (id_Servicio)
							REFERENCES  SERVICIO.SERVICIO(id_Servicio)
						go
                                  
						--ADD On Delete Cascade                                  
						ALTER TABLE SERVICIO.REPARACION
						DROP CONSTRAINT FK_SERVICIO_REPARACION;*/

ALTER TABLE SERVICIO.REPARACION ADD CONSTRAINT FK_SERVICIO_REPARACION
    FOREIGN KEY (id_Servicio)
    REFERENCES  SERVICIO.SERVICIO(id_Servicio)
ON DELETE CASCADE;


--SERVICIO-REVISION
						/*ALTER TABLE SERVICIO.REVISION ADD CONSTRAINT FK_SERVICIO_REVISON
							FOREIGN KEY (id_Servicio)
							REFERENCES  SERVICIO.SERVICIO(id_Servicio)

						 -- Agregar ON DELETE CASCADE
						ALTER TABLE SERVICIO.REVISION
						DROP CONSTRAINT FK_SERVICIO_REVISON;*/

ALTER TABLE SERVICIO.REVISION ADD CONSTRAINT FK_SERVICIO_REVISON
    FOREIGN KEY (id_Servicio)
    REFERENCES  SERVICIO.SERVICIO(id_Servicio)
ON DELETE CASCADE;                                 
                  


-----SERVICICO-TECNICO
ALTER TABLE SERVICIO.REVISION ADD CONSTRAINT FK_TECNICO_REV
	FOREIGN KEY (numEmpleado) REFERENCES EMPLEADO.TECNICO (numEmpleado)
go

--SERVICIO REPARACION-CATALOGO
ALTER TABLE SERVICIO.REPARACION ADD CONSTRAINT FK_SERVICIO_REPARACION_CATALOGO
    FOREIGN KEY (id_Reparacion)
    REFERENCES  CATALOGO.REPARACION(id_Reparacion)
go

--SERVICION REVISION-CATALOGO
ALTER TABLE SERVICIO.REVISION ADD CONSTRAINT FK_SERVICIO_REVISION_REVISON
    FOREIGN KEY (id_Revision)
    REFERENCES  CATALOGO.REVISION(id_Revision)
go

--COCHE-SEGUNDA MANO
							/*ALTER TABLE COCHE.SEGUNDA ADD CONSTRAINT FK_COCHE_SEGUNDA
								FOREIGN KEY (id_Coche)
								REFERENCES  COCHE.COCHE(id_Coche)
							 -- Agregar ON DELETE CASCADE*/

ALTER TABLE COCHE.SEGUNDA ADD CONSTRAINT FK_COCHE_SEGUNDA
    FOREIGN KEY (id_Coche)
    REFERENCES  COCHE.COCHE(id_Coche)
ON DELETE CASCADE; 

--CLIENTE-SEGUNDA MANO
ALTER TABLE COCHE.SEGUNDA ADD CONSTRAINT FK_CLIENTE_SEGUNDA
    FOREIGN KEY(id_Cliente)
    REFERENCES CLIENTE.CLIENTE(id_Cliente)
go



--VENTA-CLIENTE
ALTER TABLE VENTA.VENTA ADD CONSTRAINT FK_VENTA_CLIENTE
    FOREIGN KEY(id_Cliente)
    REFERENCES CLIENTE.CLIENTE(id_Cliente)

-----VENTA-AGENTE



ALTER TABLE VENTA.VENTA ADD CONSTRAINT FK_AGENTE_VENTA
	FOREIGN KEY (numEmpleado) REFERENCES EMPLEADO.AGENTE_VENTA(numEmpleado)
ON DELETE CASCADE; 

--VENTA-COCHE
ALTER TABLE VENTA.VENTA ADD CONSTRAINT FK_VENTA_COCHE
    FOREIGN KEY(id_Coche)
    REFERENCES COCHE.COCHE(id_Coche)
go
--VENTA-CREDITO
ALTER TABLE VENTA.VENTA ADD CONSTRAINT FK_VENTA_CREDITO
    FOREIGN KEY(id_Credito)
    REFERENCES VENTA.CREDITO(id_Credito)
go
--VENTA.CREDITO-CATALAGO CREDITO
ALTER TABLE VENTA.CREDITO ADD CONSTRAINT FK_TIPO_CREDITO
    FOREIGN KEY(tipoCredito)
    REFERENCES CATALOGO.CREDITO(tipoCredito)
go

--HISTORIAL DE PAGO - VENTA
ALTER TABLE VENTA.HISTORIAL_PAGO ADD CONSTRAINT FK_HISTORIAL_CREDITO
    FOREIGN KEY(id_venta)
    REFERENCES VENTA.VENTA(id_venta)
go