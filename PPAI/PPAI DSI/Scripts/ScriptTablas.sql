--CREATE DATABASE [PPAI_DSI] -- Ejecutar solo primero, despues comentar y ejecutar lo otro

USE [PPAI_DSI]
GO
-------------------------------------------------------------------------------------------------- ESCUELAS
create table ESCUELAS
	(Id_Escuela int identity(1, 1) not null primary key,
	Nombre varchar(50),
	Email varchar(50) unique,
	Domicilio varchar(100),
	NroTelefono bigint)

-------------------------------------------------------------------------------------------------- CARGOS
create table CARGOS
	(Id_Cargo int identity(1, 1) not null primary key,
	Nombre varchar(50),
	Descripcion varchar(200))

-------------------------------------------------------------------------------------------------- DIAS
create table DIAS
	(Id_Dia int identity(1, 1) not null primary key,
	Nombre varchar(30))

-------------------------------------------------------------------------------------------------- HORARIOSTRABAJOS
/*Con PK simple*/
create table HORARIOSTRABAJOS
	(Id_HorarioTrabajo int identity(1, 1) not null primary key,
	HoraEntrada time,
	HoraSalida time,
	Id_Dia int)

/*Con PK compuesta*/
--create table HORARIOSTRABAJOS
--	(HoraEntrada time,
--	HoraSalida time,
--	Id_Dia int,
--	constraint PK_HORARIOSTRABAJOS primary key(HoraEntrada, HoraSalida),
--	constraint FK_DIAS0 foreign key (Id_Dia) references DIAS(Id_Dia))

-------------------------------------------------------------------------------------------------- EMPLEADOS
--create table EMPLEADOS
--	(Id_Empleado int identity(1, 1) not null primary key,
--	Nombre varchar(50),
--	Apellido varchar(50),
--	CodigoValidacion varchar(50),
--	Cuit int,
--	Dni int,
--	Domicilio varchar(100),
--	FechaIngreso date,
--	FechaNacimiento date,
--	Email varchar(50) unique,
--	Sexo varchar(20),
--	NroTelefono int,
--	Id_Cargo int,
--	Id_HorarioEntrada time,
--	Id_HorarioSalida time,
--	constraint FK_CARGOS1 foreign key(Id_Cargo) references CARGOS(Id_Cargo),
--	constraint FK_HORARIOSTRABAJOS foreign key (Id_HorarioEntrada, Id_HorarioSalida) references HORARIOSTRABAJOS(HoraEntrada, HoraSalida)))

create table EMPLEADOS
	(Id_Empleado int identity(1, 1) not null primary key,
	Nombre varchar(50),
	Apellido varchar(50),
	CodigoValidacion varchar(50),
	Cuit bigint,
	Dni int,
	Domicilio varchar(100),
	FechaIngreso date,
	FechaNacimiento date,
	Email varchar(50) unique,
	Sexo varchar(20),
	NroTelefono bigint,
	Id_Cargo int,
	Id_HorarioTrabajo int,
	constraint FK_CARGOS1 foreign key(Id_Cargo) references CARGOS(Id_Cargo),
	constraint FK_HORARIOSTRABAJOS foreign key (Id_HorarioTrabajo) references HORARIOSTRABAJOS(Id_HorarioTrabajo))

-------------------------------------------------------------------------------------------------- USUARIOS
create table USUARIOS
	(Id_Usuario int identity(1, 1) not null primary key,
	Nombre varchar(50),
	Contrasenia varchar(50),
	Id_Empleado int,
	constraint FK_EMPLEADOS0 foreign key (Id_Empleado) references EMPLEADOS(Id_Empleado))

-------------------------------------------------------------------------------------------------- SESION
create table SESION
	(Id_Sesion int identity(1, 1) not null primary key,
	FechaInicio date,
	FechaFin date,
	HoraFin time,
	HoraInicio time,
	Id_Usuario int,
	constraint FK_USUARIOS0 foreign key(Id_Usuario) references USUARIOS(Id_Usuario))

----------------------------------------------------------------------------------------------- PUBLICOSDESTINO
create table PUBLICOSDESTINO
	(Id_PublicoDestino int identity(1, 1) not null primary key,
	Caracteristicas varchar(200),
	Nombre varchar(50))

-------------------------------------------------------------------------------------------------- TIPOSEXPOSICION
create table TIPOSEXPOSICION
	(Id_TipoExposicion int identity(1, 1) not null primary key,
	Nombre varchar(50),
	Descripcion varchar(200))

-------------------------------------------------------------------------------------------------- OBRAS
/*Parcialmente completo (faltan las relaciones)*/
create table OBRAS
	(Id_Obra int identity(1, 1) not null primary key,
	Nombre varchar(50), 
	FechaCreacion date, 
	FechaPrimerIngreso date, 
	Descripcion varchar(150), 
	DuracionExtendida varchar(50), 
	DuracionResumida varchar(50), 
	Alto int, 
	Ancho int, 
	Peso int, 
	Valuacion int, 
	CodigoSensor int)

-------------------------------------------------------------------------------------------------- DETALLESEXPOSICION
create table DETALLESEXPOSICION
	(Id_DetalleExposicion int identity(1, 1) not null primary key,
	LugarAsignado varchar(50),
	Id_Obra int,
	constraint FK_OBRAS0 foreign key (Id_Obra) references OBRAS(Id_Obra))

-------------------------------------------------------------------------------------------------- EXPOSICIONES
create table EXPOSICIONES
	(Id_Exposicion int identity(1, 1) not null primary key,
	Nombre varchar(50),
	FechaInicio date,
	FechaInicioReplanificada date,
	FechaFin date,
	FechaFinReplanificada date,
	HoraApertura time,
	HoraCierre time,
	Id_TipoExposicion int,
	Id_DetalleExposicion int,
	Id_PublicoDestino int,
	constraint FK_TIPOSEXPOSICION0 foreign key (Id_TipoExposicion) references TIPOSEXPOSICION(Id_TipoExposicion),
	constraint FK_DETALLESEXPOSICION0 foreign key(Id_DetalleExposicion) references DETALLESEXPOSICION(Id_DetalleExposicion),
	constraint FK_PUBLICOSDESTINO0 foreign key (Id_PublicoDestino) references PUBLICOSDESTINO(Id_PublicoDestino))

-------------------------------------------------------------------------------------------------- SEDES
create table SEDES
	(Id_Sede int identity(1, 1) not null primary key,
	Nombre varchar(50),
	CantidadMaximaVisitantes int,
	CantidadMaximaPorGuia int,
	Id_Exposicion int,
	constraint FK_EXPOSICIONES0 foreign key(Id_Exposicion) references EXPOSICIONES(Id_Exposicion))

-------------------------------------------------------------------------------------------------- ASIGNACIONESVISITA
create table ASIGNACIONESVISITA
	(Id_AsignacionVisita int identity(1, 1) not null primary key,
	FechaHoraInicio date, 
	FechaHoraFin date,
	Id_Empleado int,
	constraint FK_EMPLEADOS1 foreign key (Id_Empleado) references EMPLEADOS(Id_Empleado))

-------------------------------------------------------------------------------------------------- ESTADOS
create table ESTADOS -- Estados de Reserva
	(Id_Estado int identity(1, 1) not null primary key,
	Nombre varchar(50),
	Descripcion varchar (200))

-------------------------------------------------------------------------------------------------- CAMBIOSESTADOS
/*Con FK compuesta*/
--create table CAMBIOSESTADOS
--	(FechaHoraInicio datetime,
--	FechaHoraFin datetime,
--	Id_Estado int,
--	constraint PK_CAMBIOSESTADOS1 primary key(FechaHoraInicio, Id_Estado),
--	constraint FK_ESTADOS0 foreign key (Id_Estado) references ESTADOS(Id_Estado))

create table CAMBIOSESTADOS
	(Id_CambioEstado int identity(1, 1) not null primary key,
	FechaHoraInicio datetime,
	FechaHoraFin datetime,
	Id_Estado int,
	constraint FK_ESTADOS0 foreign key (Id_Estado) references ESTADOS(Id_Estado))

-------------------------------------------------------------------------------------------------- RESERVAS
create table RESERVAS
	(Id_Reserva int identity(1, 1) not null primary key,
	DuracionEstimada varchar(150), 
	FechaHoraCreacion date, 
	FechaHoraReserva date, 
	HoraInicioReal time, 
	HoraFinReal time, 
	CantidadAlumnos int, 
	CantidadAlumnosConfirmados int,
	Id_Sede int,
	Id_AsignacionVisita int,
	Id_Exposicion int,
	Id_Empleado int,
	Id_CambioEstado int,
	constraint FK_SEDES0 foreign key (Id_Sede) references SEDES(Id_Sede),
	constraint FK_ASIGNACIONESVISITA0 foreign key(Id_AsignacionVisita) references ASIGNACIONESVISITA(Id_AsignacionVisita),
	constraint FK_EXPOSICION0 foreign key (Id_Exposicion) references EXPOSICIONES(Id_Exposicion),
	constraint FK_EMPLEADOS2 foreign key (Id_Empleado) references EMPLEADOS(Id_Empleado),
	constraint FK_CAMBIOSESTADOS foreign key (Id_CambioEstado) references CAMBIOSESTADOS(Id_CambioEstado))

-------------------------------------------------------------------------------------------------- TIPOSVISITA
create table TIPOSVISITA
	(Id_TipoVisita int identity(1, 1) not null primary key,
	Nombre varchar(50))