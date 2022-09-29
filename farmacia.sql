-- CREACION DE LA BASE DE DATOS--

CREATE database PROYECTO_FARMACIA;

USE PROYECTO_FARMACIA;

-- CREACION DE LAS ENTIDADES--

CREATE TABLE cliente(
idcliente int not null primary key auto_increment,
nombre_apellido text (70) not null,
dni int not null,
telefono int not null,
direccion varchar (100) );

CREATE TABLE laboratorio(
idlaboratorio int not null primary key auto_increment,
nombre text (70) not null,
telefono int not null,
direccion varchar (100) );

CREATE TABLE medio_de_pagos(
idpago int not null primary key auto_increment,
descripcion varchar (70) not null);

CREATE TABLE droguerias(
iddrogueria int not null primary key auto_increment,
nombre text (70) not null,
telefono int not null,
direccion varchar (100), 
idlaboratorio int,
foreign key (idlaboratorio) references laboratorio (idlaboratorio) );

CREATE TABLE productos(
idproducto int not null primary key auto_increment,
nombre varchar (100) not null,
cantidad int not null, 
idpedidos int,
idlaboratorio int,
iddrogueria int,
foreign key (idlaboratorio) references laboratorio (idlaboratorio),
foreign key (iddrogueria) references droguerias (iddrogueria) );

CREATE TABLE pedidos(
idpedidos int not null primary key auto_increment,
cantidad int not null, 
idcliente int,
idproducto int,
foreign key (idcliente) references cliente (idcliente),
foreign key (idproducto) references productos (idproducto) );

CREATE TABLE compra(
idcompra int not null primary key auto_increment,
idpedidos int,
idpago int,
foreign key (idpedidos) references pedidos (idpedidos),
foreign key (idpago) references medio_de_pagos (idpago) );

