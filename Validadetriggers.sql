USE CONCESIONARIA
GO
/*
VALIDACION DE TRIGGERS
*/
/*validacion de trigger de tgInsertaCocheNuevo*/

INSERT INTO COCHE.COCHE (modelo, extras, matricula, tipoCoche)
VALUES
    ('Sedan', 'Aire', 'A3002', 'N');                                  

/*Validacion de trigger tgInsertaCocheSegunda*/
INSERT INTO COCHE.SEGUNDA (costo,fecha,id_Cliente,id_Coche)
VALUES(58261,GETDATE(),22,2);


/*Validacion de trigger tgInsertaCocheSegunda*/
INSERT INTO COCHE.SEGUNDA (costo,fecha,id_Cliente,id_Coche)
VALUES(58261,GETDATE(),2,100);

/*Validacion de trigger tgInsertaCocheSegunda*/
INSERT INTO COCHE.SEGUNDA (costo,fecha,id_Cliente,id_Coche)
VALUES(58261,GETDATE(),10000,100);


INSERT INTO EMPLEADO.EMPLEADO VALUES(GETDATE(),'JOGO','GOKU','NARUTO',GETDATE(),6000,'M',2);
/*Validacion de trigger tgInsertaMecanico*/
INSERT INTO EMPLEADO.MECANICO(numEmpleado,escolaridad)
VALUES(22,'TECNICO');
SELECT * FROM CLIENTE.CLIENTE;


/*Validacion de trigger tgInsertaCliente*/
INSERT INTO CLIENTE.CLIENTE(genero,id_Aval,id_Direccion,materno,nombre,paterno,rfc)
VALUES('F',3,3,'PARKER','PETER B','STARK','GOMA891110XXX');


/*Validacion de trigger tgInsertaCliente*/
INSERT INTO CLIENTE.CLIENTE(genero,id_Aval,id_Direccion,materno,nombre,paterno,rfc)
VALUES('F',3,3,'PARKER','PETER B','STARK','10XXX');

SELECT * FROM AVAL.AVAL

/*Validacion de trigger tgInsertAval*/
INSERT INTO AVAL.AVAL(id_Direccion,materno,nombre,paterno,curp)
VALUES(3,'PARKER','PETER B','STARK','RODR930712MDFNNSS2');


/*Validacion de trigger tgInsertAval*/
INSERT INTO AVAL.AVAL(id_Direccion,materno,nombre,paterno,curp)
VALUES(3,'PARKER','PETER B','STARK','NNSS2');

/*Validacion de trigger tgInsertAval*/
INSERT INTO AVAL.AVAL(id_Direccion,materno,nombre,paterno,curp)
VALUES(3,'PARKER','PETER B','STARK','N00000221216NS');

/*Validacion de trigger tgInsertServicio*/
INSERT INTO SERVICIO.SERVICIO(costos,estatus,fecha,hora,id_Cliente,id_Coche,motivo,numEmpleado,tipoServicio)
VALUES(10000,'P',GETDATE(),'2023-01-01 08:00:00' ,2,100,'ACEITE',20,'C');



/*Validacion de trigger tgInsertServicio*/
INSERT INTO SERVICIO.SERVICIO(costos,estatus,fecha,hora,id_Cliente,id_Coche,motivo,numEmpleado,tipoServicio)
VALUES(10000,'P',GETDATE(),'2023-01-01 08:00:00' ,2,10,'ACEITE',20,'C');


/*Validacion de trigger tgInsertServicio*/
INSERT INTO SERVICIO.SERVICIO(costos,estatus,fecha,hora,id_Cliente,id_Coche,motivo,numEmpleado,tipoServicio)
VALUES(10000,'P',GETDATE(),'2023-01-01 08:00:00' ,2,2,'ACEITE',14,'C');



/*Validacion de trigger tgInsertServicio*/
INSERT INTO SERVICIO.SERVICIO(costos,estatus,fecha,hora,id_Cliente,id_Coche,motivo,numEmpleado,tipoServicio)
VALUES(10000,'P',GETDATE(),'2023-01-01 08:00:00' ,2,2,'ACEITE',20,'C');

/*Validacion de trigger tgInserREVISION*/
INSERT INTO SERVICIO.REVISION(fechaPlaneacion,fechaRealizacion,id_Revision,id_Servicio,numEmpleado)
VALUES(GETDATE(),GETDATE(),1,27,1);

/*Validacion de trigger tgInserREVISION*/
INSERT INTO SERVICIO.REVISION(fechaPlaneacion,fechaRealizacion,id_Revision,id_Servicio,numEmpleado)
VALUES(GETDATE(),GETDATE(),27,27,20);


/*Validacion de trigger tgInsertCorreoCliente*/
INSERT INTO CLIENTE.CORREO(correo,id_Cliente)
values ('isabella.thomas@example.com',7);

/*Validacion de trigger tgInsertaTelefonoAval*/
INSERT INTO AVAL.TELEFONO(id_Aval,telefono)
values (5,859136);

/*Validacion de trigger tgInsertaTelefonoAval*/
INSERT INTO AVAL.TELEFONO(id_Aval,telefono)
values (5,5544556677)

/*Validacion de trigger tgInsertaTelefonoCliente*/
INSERT INTO CLIENTE.TELEFONO(id_Cliente,telefono)
values (5,55556677)

/*Validacion de trigger tgInsertaTelefonoCliente*/
INSERT INTO CLIENTE.TELEFONO(id_Cliente,telefono)
values (5,5567890123)

/*Validacion de trigger tgInsertaTelefonoEmpleado*/
INSERT INTO EMPLEADO.TELEFONO(numEmpleado,telefono)
values (5,5565667788)


