USE master;
GO
IF DB_ID (N'Banco') IS NOT NULL
DROP DATABASE Banco
GO
CREATE DATABASE Banco
ON
( NAME =Banco_dat,
FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Banco.mdf',
SIZE = 10,
MAXSIZE = 50,
FILEGROWTH = 5 )

LOG ON
( NAME = Banco_log,
FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Banco.ldf',
SIZE = 5MB,
MAXSIZE = 25MB,
FILEGROWTH = 5MB ) ;
GO
USE Banco
GO
----------------------------------Tablas--------------------------------------
CREATE TABLE ciudad
(
   idCiudad int IDENTITY (1,1),
   CONSTRAINT PK_Ciudad PRIMARY KEY (idCiudad),

   nombreCiudad varchar(20),
   idEstado int NOT NULL,
   estatus bit NOT NULL,
)
GO

CREATE TABLE estado
(
   idEstado int IDENTITY (1,1),
   CONSTRAINT PK_Estado PRIMARY KEY (idEstado),

   nombreEstado varchar(20),
   estatus bit NOT NULL,
)
GO

CREATE TABLE sucursal
(
   idSucursal int IDENTITY (1,1),
   CONSTRAINT PK_Sucursal PRIMARY KEY (idSucursal),

   nombreSucursal varchar(20),
   direccionSucursal varchar(40),
   idCiudad int NOT NULL,
   estatus bit NOT NULL,
)
GO

CREATE TABLE tipoProducto
(
   idTipoProducto int IDENTITY (1,1),
   CONSTRAINT PK_TipoProducto PRIMARY KEY (idTipoProducto),

   nombreTipoProducto varchar(20),
   estatus bit NOT NULL,
)
GO

CREATE TABLE producto
(
   idProducto int IDENTITY (1,1),
   CONSTRAINT PK_Producto PRIMARY KEY (idProducto),

   codigoProducto varchar(20),
   idTipoProducto int NOT NULL,
   idSucursal int NOT NULL,
   estatus bit NOT NULL,
)
GO

CREATE TABLE cliente
(
   idCliente int IDENTITY (1,1),
   CONSTRAINT PK_Cliente PRIMARY KEY (idCliente),

   nombreCliente varchar(20),
   fechaNacimiento datetime,
   direccionCliente varchar(30),
   idCiudad int NOT NULL,
   estatus bit NOT NULL,
)
GO

CREATE TABLE clienteProducto
(
   idClienteProducto int IDENTITY (1,1),
   CONSTRAINT PK_ClienteProducto PRIMARY KEY (idClienteProducto),

   idCliente int NOT NULL,
   idProducto int NOT NULL,
   estatus bit NOT NULL,
)
GO

CREATE TABLE movimiento
(
   idMovimiento int IDENTITY (1,1),
   CONSTRAINT PK_Movimiento PRIMARY KEY (idMovimiento),

   montoMovimiento decimal,
   idProducto int NOT NULL,
   idAutorizacion int NOT NULL,
   estatus bit NOT NULL,
)
GO

CREATE TABLE comision
(
   idComision int IDENTITY (1,1),
   CONSTRAINT PK_Comision PRIMARY KEY (idComision),

   nombreComision varchar(20),
   montoComision decimal NOT NULL,
   estatus bit NOT NULL,
)
GO

CREATE TABLE comisionProducto
(
   idComisionProducto int IDENTITY (1,1),
   CONSTRAINT PK_ComisionProducto PRIMARY KEY (idComisionProducto),

   idComision int NOT NULL,
   idProducto int NOT NULL,
   estatus bit NOT NULL,
)
GO

CREATE TABLE atm
(
   idAtm int IDENTITY (1,1),
   CONSTRAINT PK_Atm PRIMARY KEY (idAtm),

   codigoAtm varchar(20),
   fechaUltimoMantenimiento datetime,
   dinero decimal,
   idSucursal int NOT NULL,
   estatus bit NOT NULL,
)
GO

CREATE TABLE puesto
(
   idPuesto int IDENTITY (1,1),
   CONSTRAINT PK_Puesto PRIMARY KEY (idPuesto),

   nombrePuesto varchar(20),
   estatus bit NOT NULL,
)
GO

CREATE TABLE empleado
(
   idEmpleado int IDENTITY (1,1),
   CONSTRAINT PK_Empleado PRIMARY KEY (idEmpleado),

   nombreEmpleado varchar(20),
   idSucursal int NOT NULL,
   idPuesto int NOT NULL,
   estatus bit NOT NULL,
)
GO

CREATE TABLE autorizacion
(
   idAutorizacion int IDENTITY (1,1),
   CONSTRAINT PK_Autorizacion PRIMARY KEY (idAutorizacion),

   descripcionAutorizacion varchar(20),
   estatus bit NOT NULL,
)
GO

CREATE TABLE domiciliacion
(
   idDomiciliacion int IDENTITY (1,1),
   CONSTRAINT PK_Domiciliacion PRIMARY KEY (idDomiciliacion),

   descripcionDomiciliacion varchar(20),
   montoDomiciliacion decimal,
   idServicio int NOT NULL,
   idProducto int NOT NULL,
   estatus bit NOT NULL,
)
GO

CREATE TABLE servicio
(
   idServicio int IDENTITY (1,1),
   CONSTRAINT PK_Servicio PRIMARY KEY (idServicio),

   descripcionServicio varchar(20),
   estatus bit NOT NULL,
)
GO

CREATE TABLE prestamo
(
   idPrestamo int IDENTITY (1,1),
   CONSTRAINT PK_Prestamo PRIMARY KEY (idPrestamo),

   fechaPrestamo datetime,
   cantidadPrestamo decimal,
   idCliente int NOT NULL,
   estatus bit NOT NULL,
)
GO
CREATE TABLE cliente_historico
(
   idCliente_historico int,
   CONSTRAINT PK_Cliente_historico PRIMARY KEY (idCliente_historico),

   nombreCliente varchar(20),
   fechaNacimiento datetime,
   direccionCliente varchar(30),
   idCiudad int NOT NULL,
   fechaUltimaMod datetime,
   estatus bit NOT NULL,
)
GO
CREATE TABLE producto_historial
(
   idProducto_historial int,
   CONSTRAINT PK_Producto_historial PRIMARY KEY (idProducto_historial),

   codigoProducto varchar(20),
   anteriorCodigo varchar(20) default 0000,
   idTipoProducto int NOT NULL,
   idSucursal int NOT NULL,
   situacion varchar(20),
   fechaUltimaMod varchar(20) default '12/31/99',
   estatus bit NOT NULL,
)
GO
---------------------------------INDEX-------------------------
CREATE INDEX IX_Ciudad ON Ciudad(idCiudad);
GO
CREATE INDEX IX_Estado ON Estado(idEstado);
GO
CREATE INDEX  IX_Sucursal ON Sucursal (idSucursal);
GO
CREATE INDEX  IX_Producto ON Producto (idProducto);
GO
CREATE INDEX  IX_TipoProducto ON TipoProducto (idTipoProducto);
GO
CREATE INDEX IX_Cliente ON Cliente(idCliente);
GO
CREATE INDEX IX_ClienteProducto ON ClienteProducto(idClienteProducto);
GO
CREATE INDEX IX_Movimiento ON Movimiento(idMovimiento);
GO
CREATE INDEX  IX_Comision ON Comision (idComision);
GO
CREATE INDEX  IX_ComisionProducto ON ComisionProducto (idComisionProducto);
GO
CREATE INDEX  IX_Atm ON Atm (idAtm);
GO
CREATE INDEX  IX_Puesto ON Puesto (idPuesto);
GO
CREATE INDEX  IX_Empleado ON Empleado (idEmpleado);
GO
CREATE INDEX IX_Autorizacion ON Autorizacion(idAutorizacion);
GO
CREATE INDEX  IX_Domiciliacion ON Domiciliacion (idDomiciliacion);
GO
CREATE INDEX  IX_Servicio ON Servicio (idServicio);
GO
CREATE INDEX  IX_Prestamo ON Prestamo (idPrestamo);
GO

---------------------------------RELACIONES--------------------
ALTER TABLE Ciudad
ADD CONSTRAINT FK_CiudadEstado
FOREIGN KEY (idEstado) REFERENCES Estado(idEstado);
GO
ALTER TABLE Sucursal
ADD CONSTRAINT FK_SucursalCiudad
FOREIGN KEY (idCiudad) REFERENCES Ciudad(idCiudad);
GO
ALTER TABLE Producto
ADD CONSTRAINT FK_ProductoTipoProducto
FOREIGN KEY (idTipoProducto) REFERENCES TipoProducto(idTipoProducto);
GO
ALTER TABLE Producto
ADD CONSTRAINT FK_ProductoSucursal
FOREIGN KEY (idSucursal) REFERENCES Sucursal(idSucursal);
GO
ALTER TABLE Cliente
ADD CONSTRAINT FK_ClienteCiudad
FOREIGN KEY (idCiudad) REFERENCES Ciudad(idCiudad);
GO

ALTER TABLE ClienteProducto
ADD CONSTRAINT FK_ClienteProductoCliente
FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente);
GO
ALTER TABLE ClienteProducto
ADD CONSTRAINT FK_ClienteProductoProducto
FOREIGN KEY (idProducto) REFERENCES Producto(idProducto);
GO

ALTER TABLE Movimiento
ADD CONSTRAINT FK_MovimientoProducto
FOREIGN KEY (idProducto) REFERENCES Producto(idProducto);
GO
ALTER TABLE Movimiento
ADD CONSTRAINT FK_MovimientoAutorizacion
FOREIGN KEY (idAutorizacion) REFERENCES Autorizacion(idAutorizacion);
GO

ALTER TABLE ComisionProducto
ADD CONSTRAINT FK_ComisionProductoComision
FOREIGN KEY (idComision) REFERENCES Comision(idComision);
GO
ALTER TABLE ComisionProducto
ADD CONSTRAINT FK_ComisionProductoProducto
FOREIGN KEY (idProducto) REFERENCES Producto(idProducto);
GO

ALTER TABLE Atm
ADD CONSTRAINT FK_AtmSucursal
FOREIGN KEY (idSucursal) REFERENCES Sucursal(idSucursal);
GO
ALTER TABLE Empleado
ADD CONSTRAINT FK_EmpleadoSucursal
FOREIGN KEY (idSucursal) REFERENCES Sucursal(idSucursal);
GO
ALTER TABLE Empleado
ADD CONSTRAINT FK_EmpleadoPuesto
FOREIGN KEY (idPuesto) REFERENCES Puesto(idPuesto);
GO
ALTER TABLE Domiciliacion
ADD CONSTRAINT FK_DomiciliacionServicio
FOREIGN KEY (idServicio) REFERENCES Servicio(idServicio);
GO
ALTER TABLE Domiciliacion
ADD CONSTRAINT FK_DomiciliacionProducto
FOREIGN KEY (idProducto) REFERENCES Producto(idProducto);
GO
ALTER TABLE Prestamo
ADD CONSTRAINT FK_PrestamoCliente
FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente);
GO

 IF OBJECT_ID ('trigger1', 'TR') IS NOT NULL
BEGIN
   DROP TRIGGER trigger1;
END
go
    CREATE or ALTER TRIGGER trigger1
    ON cliente
    AFTER INSERT
	AS
    BEGIN
insert into cliente_historico(idCliente_historico,nombreCliente, fechaNacimiento, direccionCliente, idCiudad,fechaUltimaMod,estatus) (select idCliente,nombreCliente, fechaNacimiento, direccionCliente, idCiudad,'12/31/99', 1 from inserted)
--UPDATE cliente_historico SET fechaUltimaMod = '12/31/99';
--insert into cliente_historico(fechaUltimaMod) values ('12/31/99')
    END
GO


 IF OBJECT_ID ('trigger2', 'TR') IS NOT NULL
BEGIN
   DROP TRIGGER trigger2;
END
go
    CREATE or ALTER TRIGGER trigger2
    ON cliente
    AFTER UPDATE
	AS
    BEGIN
UPDATE cliente_historico SET fechaUltimaMod = GetDate() WHERE idCliente_historico=(SELECT idCliente FROM inserted);
UPDATE cliente_historico SET fechaNacimiento = (select fechaNacimiento from inserted) WHERE idCliente_historico=(SELECT idCliente FROM inserted);
--UPDATE cliente_historico SET fechaUltimaMod = GETDATE() where idCliente_historico = ;
--insert into cliente_historico(fechaUltimaMod) values ('12/31/99')
    END
GO
--select * from cliente; select * from cliente_historico;
--UPDATE cliente set fechaNacimiento = '03/13/03' where idCliente = 3
--select * from cliente; select * from cliente_historico;


 IF OBJECT_ID ('trigger3', 'TR') IS NOT NULL
BEGIN
   DROP TRIGGER trigger3;
END
go
    CREATE or ALTER TRIGGER trigger3
    ON cliente
    AFTER DELETE
	AS
    BEGIN
DELETE cliente_historico  WHERE idCliente_historico=(SELECT idCliente FROM deleted);
    END
GO
--select * from cliente;select * from cliente_historico;
--delete cliente where idCliente = 6
--select * from cliente;select * from cliente_historico;

 IF OBJECT_ID ('trigger4', 'TR') IS NOT NULL
BEGIN
   DROP TRIGGER trigger4;
END
go
    CREATE or ALTER TRIGGER trigger4
    ON producto
    AFTER delete
	AS
    BEGIN
	--INSERT producto_eliminado select * from producto where idProducto=old.idProducto
	--INSERT INTO producto_eliminado(idProducto_eliminado, codigoProducto) (SELECT idProducto, codigoProducto FROM deleted);
	insert into producto_historial (idProducto_historial,codigoProducto,idTipoProducto,idSucursal,situacion,estatus)(select idProducto,codigoProducto,idTipoProducto,idSucursal,'eliminado',estatus from deleted)
--DELETE producto_eliminado  WHERE idProducto_eliminado=(SELECT idProducto FROM deleted);
    END
GO

--select * from producto; select * from producto_eliminado;
--delete producto where idProducto = 6;
--select * from producto; select * from producto_eliminado;

 IF OBJECT_ID ('trigger5', 'TR') IS NOT NULL
BEGIN
   DROP TRIGGER trigger5;
END
go
    CREATE or ALTER TRIGGER trigger5
    ON producto
    AFTER insert
	AS
    BEGIN
	insert into producto_historial (idProducto_historial,codigoProducto,idTipoProducto,idSucursal,situacion,estatus) (select idProducto,codigoProducto,idTipoProducto,idSucursal,'agregado',estatus from inserted)
    END
GO
--select * from producto; select * from producto_historial;
--INSERT INTO producto (codigoProducto, idTipoProducto, idSucursal, estatus) VALUES (234,5,4,1);
--select * from producto; select * from producto_historial;

 IF OBJECT_ID ('trigger6', 'TR') IS NOT NULL
BEGIN
   DROP TRIGGER trigger6;
END
go
    CREATE or ALTER TRIGGER trigger6
    ON producto
    AFTER update
	AS
    BEGIN
	UPDATE producto_historial SET fechaUltimaMod = GetDate() WHERE idProducto_historial=(SELECT idProducto FROM inserted);
	UPDATE producto_historial SET situacion = 'actualizado' WHERE idProducto_historial=(SELECT idProducto FROM inserted);
    END
GO
--select * from producto; select * from producto_historial;
--UPDATE producto set codigoProducto = 0963 where idProducto = 5
--select * from producto; select * from producto_historial;

 IF OBJECT_ID ('trigger7', 'TR') IS NOT NULL
BEGIN
   DROP TRIGGER trigger7;
END
go
    CREATE or ALTER TRIGGER trigger7
    ON producto
    after update
	AS
    BEGIN
	UPDATE producto_historial set anteriorCodigo = (select codigoProducto from deleted) where idProducto_historial = (select idProducto from inserted)
	UPDATE producto_historial SET codigoProducto = (select codigoProducto from inserted) where idProducto_historial = (SELECT idProducto FROM inserted);
    END
GO

--select * from producto; select * from producto_historial;
--UPDATE producto set codigoProducto = 0963 where idProducto = 5
--select * from producto; select * from producto_historial;

 IF OBJECT_ID ('trigger8', 'TR') IS NOT NULL
BEGIN
   DROP TRIGGER trigger8;
END
go
    CREATE or ALTER TRIGGER trigger8
    ON empleado
    after insert
	AS
    BEGIN
	declare @Mensaje varchar(200)
	select @Mensaje = 'Nuevo empleado en el banco' 
	raiserror(@Mensaje,0,1)
    END
GO

 IF OBJECT_ID ('trigger9', 'TR') IS NOT NULL
BEGIN
   DROP TRIGGER trigger9;
END
go
    CREATE or ALTER TRIGGER trigger9
    ON empleado
    after update
	AS
    BEGIN
	 select * from empleado;
    END
GO

--select * from empleado;
--UPDATE empleado set nombreEmpleado = 'Amairami Rangel' where idEmpleado = 3

 IF OBJECT_ID ('trigger10', 'TR') IS NOT NULL
BEGIN
   DROP TRIGGER trigger10;
END
go
    CREATE or ALTER TRIGGER trigger10
    ON empleado
    after delete
	AS
    BEGIN
	 select * from empleado;select * from producto_historial;
    END
GO

--delete empleado where idEmpleado = 6;

---------------------------------Procedimientos almacenados--------
 IF OBJECT_ID ('Saludar', 'PR') IS NOT NULL
BEGIN
   DROP PROCEDURE Saludar;
END
go
CREATE or ALTER PROCEDURE  Saludar
      AS
      PRINT 'Hola, Como estas?';
     GO           
   EXECUTE Saludar;  

 IF OBJECT_ID ('Mostrar', 'PR') IS NOT NULL
BEGIN
   DROP PROCEDURE Mostrar;
END
go
CREATE or ALTER PROCEDURE  Mostrar
@Nombre varchar(30)
      AS
	  begin
	  select nombreCliente,fechaNacimiento from cliente where nombreCliente = @Nombre;
	  end
	  go
   --EXECUTE Mostrar 'Juan Perez';  
   --EXECUTE Mostrar 'Maria Maldonado';  
   --EXECUTE Mostrar 'Abelardo Ramirez';  


    IF OBJECT_ID ('Procedimiento3', 'PR') IS NOT NULL
BEGIN
   DROP PROCEDURE Procedimiento3;
END
go
   CREATE PROCEDURE Procedimiento3  
    @NombreCliente nvarchar(50),   
    @FechaNacimiento datetime  
AS   

    SET NOCOUNT ON;  
    SELECT nombreCliente, fechaNacimiento, direccionCliente  
    FROM cliente  
    WHERE nombreCliente = NombreCliente AND fechaNacimiento = @FechaNacimiento  
    AND direccionCliente IS NOT NULL;  
GO  

--execute Procedimiento3 N'Jose Esquivel','04/20/01';

    IF OBJECT_ID ('Procedimiento4', 'PR') IS NOT NULL
BEGIN
   DROP PROCEDURE Procedimiento4;
END
go
CREATE PROCEDURE Procedimiento4
@nombre VARCHAR(50), 
@sucursal int,
@puesto int
AS 
INSERT INTO empleado (nombreEmpleado,idSucursal,idPuesto,estatus)
VALUES (@nombre, @sucursal, @puesto,1) 
GO

--select * from empleado;
--exec Procedimiento4 'juana juana',4,3;
--select * from empleado;

    IF OBJECT_ID ('Procedimiento5', 'PR') IS NOT NULL
BEGIN
   DROP PROCEDURE Procedimiento5;
END
go
CREATE PROCEDURE Procedimiento5
@id INT
AS 
SELECT * FROM empleado WHERE idEmpleado = @id
GO

--select * from empleado;
--exec Procedimiento5 6;
--select * from empleado;


    IF OBJECT_ID ('Procedimiento6', 'PR') IS NOT NULL
BEGIN
   DROP PROCEDURE Procedimiento6;
END
go
CREATE PROCEDURE Procedimiento6 
@id int,
@nombre varchar(20),
@sucursal int,  
@puesto int
AS 
UPDATE empleado SET  
       nombreEmpleado = @nombre,
       [idSucursal] = @sucursal,
	   [idPuesto] = @puesto,
	   [estatus] = 1
       WHERE idEmpleado= @id
GO

--select * from empleado;
--exec Procedimiento6 4,'vasco de mata',2,3;
--select * from empleado;

    IF OBJECT_ID ('Procedimiento7', 'PR') IS NOT NULL
BEGIN
   DROP PROCEDURE Procedimiento7;
END
go
CREATE PROCEDURE Procedimiento7
@id INT
AS 
DELETE FROM empleado WHERE idEmpleado = @id
GO

--select * from empleado;
--exec Procedimiento7 2;
--select * from empleado;

    IF OBJECT_ID ('Procedimiento8', 'PR') IS NOT NULL
BEGIN
   DROP PROCEDURE Procedimiento8;
END
go
CREATE PROCEDURE Procedimiento8
@nombre VARCHAR(50), 
@monto int
AS 
INSERT INTO comision(nombreComision,montoComision,estatus)
VALUES (@nombre, @monto,1) 
GO

--select * from comision;
--exec Procedimiento8 'mantenimiento',1100;
--select * from comision;

    IF OBJECT_ID ('Procedimiento9', 'PR') IS NOT NULL
BEGIN
   DROP PROCEDURE Procedimiento9;
END
go
CREATE PROCEDURE Procedimiento9
@id int
AS 
SELECT * FROM empleado WHERE idEmpleado = @id
GO

--exec Procedimiento9 5;

    IF OBJECT_ID ('Procedimiento10', 'PR') IS NOT NULL
BEGIN
   DROP PROCEDURE Procedimiento10;
END
go
CREATE PROCEDURE Procedimiento10
@id INT
AS 
DELETE FROM empleado WHERE idEmpleado = @id
GO

--select * from empleado;
--exec Procedimiento10 5;
--select * from comision;

-------------------------------Funciones de TSQL
------AGREGATE---------

select count(nombreComision) from comision where montoComision > 15
select sum(montoMovimiento) from movimiento


------GROUPING---------
----MAX
SELECT MAX(montoComision)  
FROM comision;  
GO
---MIN
SELECT MIN(montoComision)  
FROM comision;  
GO



------DATETIME---------
--Obtener la fecha actual del sistema
SELECT CONVERT (DATE, SYSDATETIME())  
    ,CONVERT (DATE, SYSDATETIMEOFFSET())  
    ,CONVERT (DATE, SYSUTCDATETIME())  
    ,CONVERT (DATE, CURRENT_TIMESTAMP)  
    ,CONVERT (DATE, GETDATE())  
    ,CONVERT (DATE, GETUTCDATE());  

--Obtener la hora actual del sistema
SELECT CONVERT (TIME, SYSDATETIME())  
    ,CONVERT (TIME, SYSDATETIMEOFFSET())  
    ,CONVERT (TIME, SYSUTCDATETIME())  
    ,CONVERT (TIME, CURRENT_TIMESTAMP)  
    ,CONVERT (TIME, GETDATE())  
    ,CONVERT (TIME, GETUTCDATE());  

	DECLARE @datetime2 datetime2 = '2007-01-01 13:10:10.1111111';  
	-----obtiene el resultado de la suma de la fecha establecida mas fracciones de fecha
SELECT 'year', DATEADD(year,1,@datetime2)  
UNION ALL  
SELECT 'quarter',DATEADD(quarter,1,@datetime2)  
UNION ALL  
SELECT 'month',DATEADD(month,1,@datetime2)  
UNION ALL  
SELECT 'dayofyear',DATEADD(dayofyear,1,@datetime2)  
UNION ALL  
SELECT 'day',DATEADD(day,1,@datetime2)  
UNION ALL  
SELECT 'week',DATEADD(week,1,@datetime2)  
UNION ALL  
SELECT 'weekday',DATEADD(weekday,1,@datetime2)  
UNION ALL  
SELECT 'hour',DATEADD(hour,1,@datetime2)  
UNION ALL  
SELECT 'minute',DATEADD(minute,1,@datetime2)  
UNION ALL  
SELECT 'second',DATEADD(second,1,@datetime2)  
UNION ALL  
SELECT 'millisecond',DATEADD(millisecond,1,@datetime2)  
UNION ALL  
SELECT 'microsecond',DATEADD(microsecond,1,@datetime2)  
UNION ALL  
SELECT 'nanosecond',DATEADD(nanosecond,1,@datetime2);


------STRING---------

SELECT ASCII('A') AS A, ASCII('B') AS B,   
ASCII('a') AS a, ASCII('b') AS b,  
ASCII(1) AS [1], ASCII(2) AS [2];
GO

SELECT CHARINDEX ( 'TEST',  
       'This is a Test'  
       COLLATE Latin1_General_CI_AS);  
GO

SELECT CONCAT( nombreCliente, fechaNacimiento, direccionCliente ) AS Result  
FROM cliente;  
GO
------CONVERT---------
SELECT PARSE('Monday, 13 December 2010' AS datetime2 USING 'en-US') AS Result;  
SELECT PARSE('Monday, 13 December 2010' AS datetime USING 'en-US') AS Result; 
select 'El monto de comision de ' + nombreComision + ' es ' + cast(montoComision as varchar(15)) as textoprecio from comision
select 'El monto del movimiento ' + cast(idMovimiento as varchar(15)) + ' es ' + convert(varchar(15), montoMovimiento) as textoprecio from movimiento 
go

---------------------------------------------------views
DROP VIEW IF EXISTS view_movimiento
GO
CREATE VIEW view_movimiento AS
SELECT montoMovimiento, idProducto
FROM movimiento
WHERE idMovimiento > 0 and idMovimiento <6;
go

--select * from view_movimiento;
--go

DROP VIEW IF EXISTS view_producto
GO
CREATE VIEW view_producto
AS
select p.idProducto AS [ProductIdNumber] , 
p.codigoProducto AS [ProductName],
p.idTipoProducto [ProductTypeNumber] from [producto] p 
     
    WHERE idProducto >0
go
--select * from view_producto
--go

DROP VIEW IF EXISTS view_producto
GO
CREATE VIEW view_producto
AS
select p.idProducto AS [ProductIdNumber] , 
p.codigoProducto AS [ProductName],
p.idTipoProducto [ProductMainNumber],
p.idSucursal as [ProductModelName]  from producto p 
go
--select * from view_producto
--go

DROP VIEW IF EXISTS vista4
GO
CREATE VIEW vista4
 AS SELECT idCliente, idCiudad
 FROM cliente
 WHERE (SELECT DATEDIFF_BIG(day, fechaNacimiento, GETDATE()))  >= 8030
 go
-- select * from vista4
--go

DROP VIEW IF EXISTS vista5
GO
CREATE VIEW vista5
 AS SELECT idAtm, codigoAtm
 FROM atm
 WHERE (SELECT DATEDIFF_BIG(day, fechaUltimoMantenimiento, GETDATE()))  <= 150
 go
-- select * from vista5
--go

DROP VIEW IF EXISTS vista6
GO
CREATE VIEW vista6
 AS SELECT idPrestamo, cantidadPrestamo
 FROM prestamo
 WHERE (SELECT DATEDIFF_BIG(day, fechaPrestamo, GETDATE()))  <= 45
 go
 select * from vista6
go

DROP VIEW IF EXISTS vista7
GO
CREATE VIEW vista7
 AS SELECT idSucursal, nombreSucursal
 FROM sucursal
 WHERE (select len(direccionSucursal)) <= 20
 go
-- select * from vista7
--go

DROP VIEW IF EXISTS vista8
GO
CREATE VIEW vista8
 AS SELECT idSucursal, nombreSucursal
 FROM sucursal
 WHERE (select len(direccionSucursal)) <= 20
 go
-- select * from vista8
--go

DROP VIEW IF EXISTS vista9
GO
CREATE VIEW vista9
 AS SELECT idProducto, codigoProducto
 FROM producto
 WHERE codigoProducto >= 1000
 go
-- select * from vista9
--go

DROP VIEW IF EXISTS vista10
GO
CREATE VIEW vista10
 AS SELECT idAtm, codigoAtm,fechaUltimoMantenimiento
 FROM atm
 WHERE fechaUltimoMantenimiento between '12/31/17' and '01/01/20'
 go
-- select * from vista10
--go

------------------------------//POBLACION//------------------------------------
INSERT INTO estado (nombreEstado, estatus)
VALUES ('Coahuila',1),
	   ('Durango',1),
	   ('Zacatecas',1),
	   ('Chihuahua',1),
	   ('Hidalgo',1);
INSERT INTO ciudad (nombreCiudad, idEstado, estatus)
VALUES ('monclova',1, 1),
	   ('Lerdo',2, 1),
	   ('Parral',4,1),
	   ('Fresnillo',3, 1),
	   ('Pachuca',5, 1);
INSERT INTO sucursal (nombreSucursal, direccionSucursal,idCiudad, estatus)
VALUES ('pape','juan alvarez 14 Jardines de guadalupe',1,1),
	   ('sarabia','alberto rodriguez 178 Centro', 2,1),
	   ('desierto','Aguacate 3 Pemex', 3,1),
	   ('oro','manzana 85 Zapata', 4,1),
	   ('tula','ahuitzol 15 Tlaloc', 5,1);
INSERT INTO tipoProducto (nombreTipoProducto, estatus)
VALUES ('cuentaCorriente', 1),
       ('cuentaAhorro', 1),
	   ('tarjetaDebito', 1),
	   ('tarjetaCredito', 1),
	   ('cuentaNomina', 1);
INSERT INTO producto (codigoProducto, idTipoProducto, idSucursal, estatus)
VALUES (0546,2,5,1),
	   (2985,1,4,1),
	   (3542,3,2,1),
	   (8654,4,1,1),
	   (5974,5,3,1),
	   (0123,1,2,1);

INSERT INTO cliente (nombreCliente, fechaNacimiento, direccionCliente, idCiudad, estatus)
VALUES ('Juan Perez','09/13/94','roble 89 Fovisste',3,1),
       ('Maria Maldonado','02/28/95','gonzalez 97 aviacion',5,1),
	   ('Jose Esquivel','04/20/01','principal 667 refugio',4,1),
	   ('Antonieta Mendoza','11/14/64','francisco mina 24 heroes',1,1),
	   ('Eleazar Arevalo','07/22/89','primo de verdad 997 americas',2,1),
	   ('Filomena Ruiz','01/02/03','hermano del mar 123 san jose',4,1);
INSERT INTO clienteProducto (idCliente, idProducto, estatus)
VALUES (2,3,1),
       (1,5,1),
	   (3,4,1),
	   (5,2,1),
	   (4,1,1);
INSERT INTO autorizacion (descripcionAutorizacion, estatus)
VALUES ('cargo',1),
       ('abono',1),
	   ('transferencia',1),
	   ('denegado',1),
	   ('espera',1);
INSERT INTO movimiento (montoMovimiento, idProducto, idAutorizacion, estatus)
VALUES (9000,1,4,1),
       (20000,2,3,1),
	   (4000,3,2,1),
	   (10000,5,1,1),
	   (31000,4,5,1);
INSERT INTO comision (nombreComision, montoComision,estatus)
VALUES ('apertura',0,1),
       ('anualidad',100,1),
	   ('renovacion',5,1),
	   ('mantenimiento',2000,1),
	   ('interes',200,1);
INSERT INTO comisionProducto (idComision, idProducto, estatus)
VALUES (1,1,1),
       (2,4,1),
	   (3,3,1),
	   (4,2,1),
	   (5,5,1);
INSERT INTO atm (codigoAtm, fechaUltimoMantenimiento, dinero, idSucursal, estatus)
VALUES (3425,'12/23/20',100500,5,1),
       (5432,'05/31/19',50600,3,1),
	   (7654,'03/02/21',90300,2,1),
	   (4567,'06/12/18',110700,4,1),
	   (8765,'04/17/21',30600,1,1);
INSERT INTO puesto (nombrePuesto, estatus)
VALUES ('guardia',1),
       ('intendente',1),
	   ('cajero',1),
	   ('secretario',1),
	   ('ejecutivo',1);
INSERT INTO empleado (nombreEmpleado, idSucursal, idPuesto, estatus)
VALUES ('Eduardo Jimenez',2,3,1),
       ('Araceli Mendoza',3,4,1),
	   ('Juana de la Garza',4,5,1),
	   ('Luisa de las Nieves',5,1,1),
	   ('Alejandro Moreno',1,2,1),
	   ('Ximena Martinez',4,3,1);
INSERT INTO servicio(descripcionServicio, estatus)
VALUES ('gas',1),
       ('agua',1),
	   ('luz',1),
	   ('cable',1),
	   ('internet',1),
	   ('telefono',1);
INSERT INTO domiciliacion (descripcionDomiciliacion, montoDomiciliacion, idServicio, idProducto, estatus)
VALUES ('pagado',1500,2,4,1),
       ('pagado',3000,2,4,1),
	   ('adeudo',4500,1,5,1),
	   ('adeudo',1500,3,3,1),
	   ('pagado',2700,4,1,1),
	   ('adeudo',1000,6,2,1),
	   ('entram',5000,5,2,1),
	   ('adeudo',2400,6,2,1),
	   ('pagado',3300,2,2,1),
	   ('adeudo',1100,4,2,1);

INSERT INTO prestamo (fechaPrestamo, cantidadPrestamo, idCliente, estatus)
VALUES ('01/09/14',4700,1,1),
       ('09/12/15',1500,5,1),
	   ('08/11/21',5400,4,1),
	   ('04/21/19',2000,2,1),
	   ('02/20/20',1000,1,1);

SELECT * FROM Ciudad
SELECT * FROM Estado
SELECT * FROM Sucursal
SELECT * FROM tipoProducto
SELECT * FROM producto
SELECT * FROM cliente
SELECT * FROM clienteProducto
SELECT * FROM movimiento
SELECT * FROM comision
SELECT * FROM comisionProducto
SELECT * FROM atm
SELECT * FROM puesto
SELECT * FROM empleado
SELECT * FROM autorizacion
SELECT * FROM domiciliacion
SELECT * FROM servicio
SELECT * FROM prestamo
SELECT * FROM cliente_historico
SELECT * FROM producto_historial
GO;

--UPDATE Estado SET nombreEstado = 'tlaxcala' where idEstado = 4;

--DELETE FROM Ciudad WHERE idCiudad=5;

----------triggers-----------------
--CREATE or ALTER TRIGGER trigger_historico
--ON cliente 
--AFTER INSERT 
--AS
--BEGIN
----lineas de cógido SQL que se ejecutarán
--INSERT INTO cliente_historico(nombreCliente,fechaNacimiento,direccionCliente)
--VALUES(NEW.nombreCliente,NEW.fechaNacimiento,NEW.direccionCliente,CURDATE());

-- Borramos el Trigger si existise
--IF OBJECT_ID ('StatusChangeDateTrigger', 'TR') IS NOT NULL
--BEGIN
--   DROP TRIGGER StatusChangeDateTrigger;
--END;
 
--GO -- Necesario
 
-- IF OBJECT_ID ('trigger1', 'TR') IS NOT NULL
--BEGIN
--   DROP TRIGGER trigger1;
--END
--go
--    CREATE or ALTER TRIGGER trigger1
--    ON cliente
--    AFTER INSERT
--	AS
--    BEGIN
--insert into cliente_historico(nombreCliente, fechaNacimiento, direccionCliente, idCiudad,estatus) (select nombreCliente, fechaNacimiento, direccionCliente, idCiudad, 1 from inserted)
--    END
--GO

--INSERT INTO cliente (nombreCliente, fechaNacimiento, direccionCliente, idCiudad, estatus)
--VALUES ('Alejandro Barboza','10/14/95','pino 90 astillero',4,1);
--select * from cliente;
--select * from cliente_historico;
--GO

