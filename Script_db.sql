CREATE DATABASE planilla_sys;
USE planilla_sys;

CREATE TABLE departamento
(id_departamento Varchar(10) Primary Key,
nombre_departamento Varchar(60) Not Null,
estado_departamento Varchar(1) Not Null
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE puesto
(id_puesto Varchar(10) Primary Key,
nombre_puesto Varchar(60) Not Null,
estado_puesto Varchar(1) Not Null
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE empleado
(carnet_empleado Varchar(15) Primary Key,
dpi_empleado Varchar(15) Not Null Unique,
nombre_empleado Varchar(75) Not Null,
apellidos_empleado Varchar(75) Not Null,
domicilio_empleado Varchar(50) Not Null,
telefono_empleado int(8) Not Null,
celular_empleado int(8) Not Null,
fecha_nacimiento date Not Null,
estatus_empleado Varchar(1) Not Null,
fk_puesto Varchar(10),
fk_departamento Varchar(10),
FOREIGN KEY (fk_puesto) REFERENCES puesto(id_puesto),
FOREIGN KEY (fk_departamento) REFERENCES departamento(id_departamento)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE concepto
(id_concepto Varchar(10) Primary Key,
nombre_concepto Varchar(40) Not Null,
efecto_concepto Varchar(10) Not Null
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE nomina
(id_nomina Varchar(20) Primary Key,
fecha_inicio date Not Null,
fecha_fin date Not Null
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE nomina_empleado
(id_nomEmp Varchar(15) Primary Key,
fk_empleado Varchar(15) Not Null,
fk_nomina Varchar(20) Not Null,
fk_detalle Varchar(15) Not Null
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE detalle_nomina
(id_detalle Varchar(15) Primary Key,
fk_concepto Varchar(10) Not Null,
valor_concepto float(10,2) Not Null
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE nomina_empleado
ADD CONSTRAINT fk_detalle
FOREIGN KEY (fk_detalle) REFERENCES detalle_nomina(id_detalle);

ALTER TABLE nomina_empleado
ADD CONSTRAINT fk_nomina
FOREIGN KEY (fk_nomina) REFERENCES nomina(id_nomina);

ALTER TABLE nomina_empleado
ADD CONSTRAINT fk_empleado
FOREIGN KEY (fk_empleado) REFERENCES empleado(carnet_empleado);

ALTER TABLE detalle_nomina
ADD CONSTRAINT fk_concepto
FOREIGN KEY (fk_concepto) REFERENCES concepto(id_concepto);
