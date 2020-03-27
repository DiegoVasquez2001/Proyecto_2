-- CREACION DE LA BASE DE DATOS --
CREATE DATABASE sys_nomina;
USE sys_nomina;
-- CREACION DE LAS TABLAS --
CREATE TABLE Departamento
(Id_Departamento Varchar(6) Primary Key,
Nombre_Departamento Varchar(50) Not Null,
Estado_Departamento int Not Null
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE Unidad
(Id_Unidad Varchar(6) Primary Key,
Nombre_Unidad Varchar(50) Not Null,
FK_Departamento Varchar(6) Not Null,
FOREIGN KEY(FK_Departamento) REFERENCES Departamento(Id_Departamento),
Estado_Unidad int Not Null
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE Puesto
(Id_Puesto Varchar(6) Primary Key,
Nombre_Puesto Varchar(15) Not Null,
FK_Unidad Varchar(6) Not Null,
FOREIGN KEY(FK_Unidad) REFERENCES Unidad(Id_Unidad),
Estado_Puesto int Not Null
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE Empleado
(Id_Empleado Varchar(10) Primary Key,
Nombre_Empleado Varchar(50) Not Null,
Apellidos_Empleado Varchar(50) Not Null,
Sueldo_Base Float(10,2) Not Null,
FK_Puesto Varchar(6) Not Null,
FOREIGN KEY(FK_Puesto) REFERENCES Puesto(Id_Puesto),
Estado_Empleado int Not Null
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE Nomina
(Id_Nomina Varchar(20) Primary Key,
Fecha_Inicio Date,
Fecha_Fin Date
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE Detalle_Nomina
(Id_DetalleNomina Varchar(20) Primary Key,
FK_Empleado Varchar(10) Not Null,
FK_Nomina Varchar(20) Not Null,
Ingreso_Bonificacion float(10,2) Not Null,
Ingresos_Varios float(10, 2) Not Null,
Ingresos_Incentivos float(10, 2) Not Null,
Total_Ingresos float(10, 2) Not Null,
Descuento_Igss float(10, 2) Not Null,
Descuento_Isr float(10, 2) Not Null,
Descuentos_Varios float(10, 2) Not Null,
Total_Descuentos float(10, 2) Not Null,
Sueldo_Liquido float(10, 2) Not Null,
FOREIGN KEY(FK_Empleado) REFERENCES Empleado(Id_Empleado),
FOREIGN KEY(FK_Nomina) REFERENCES Nomina(Id_Nomina)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;
