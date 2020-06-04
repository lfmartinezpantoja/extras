#CREAR BASE DE DATOS
CREATE DATABASE farmatodo

USE farmatodo

#CREAR TABLA CLIENTES
CREATE TABLE `clients` (
  `client_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `age` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `enabled` bit(1) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `identification_number` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `second_name` varchar(255) DEFAULT NULL,
  `sur_name` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`client_id`)
) 

#CREAR TABLA PRODUCTOS

CREATE TABLE `products` (
  `product_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bar_code` varchar(255) DEFAULT NULL,
  `price` double NOT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) 

#CREAR TABLA TIENDA

CREATE TABLE `stores` (
  `store_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `schedule` varchar(255) DEFAULT NULL,
  `store_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`store_id`)
)


#CREAR TABLA PARA AGREGAR PRODUCTOS EN TIENDAS

CREATE TABLE `products_stores` (
  `product_store_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) NOT NULL,
  `store_id` bigint(20) NOT NULL,
  `quantity` bigint(20) NOT NULL,
  PRIMARY KEY (`product_store_id`),
  KEY `product_store_id_FK` (`product_id`),
  KEY `product_store_id_FK_1` (`store_id`),
  CONSTRAINT `product_store_id_FK` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  CONSTRAINT `product_store_id_FK_1` FOREIGN KEY (`store_id`) REFERENCES `stores` (`store_id`)
)


#CREAR TABLA PARA FACTURAS

CREATE TABLE `invoices` (
  `invoice_number` bigint(20) NOT NULL AUTO_INCREMENT,
  `client_id` bigint(20) NOT NULL,
  `store_id` bigint(20) NOT NULL,
  PRIMARY KEY (`invoice_number`),
  KEY `invoices_FK` (`client_id`),
  KEY `invoices_FK_1` (`store_id`),
  CONSTRAINT `invoices_FK` FOREIGN KEY (`client_id`) REFERENCES `clients` (`client_id`),
  CONSTRAINT `invoices_FK_1` FOREIGN KEY (`store_id`) REFERENCES `stores` (`store_id`)
) 

#CREAR TABLA PARA COMPRAS


CREATE TABLE `purchases` (
  `purchase_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) NOT NULL,
  `store_id` bigint(20) NOT NULL,
  `quantity` bigint(20) NOT NULL,
  `invoice_number` bigint(20) NOT NULL,
  PRIMARY KEY (`purchase_id`),
  KEY `purchases_FK_1` (`product_id`),
  KEY `purchases_FK_2` (`store_id`),
  KEY `purchases_FK_3` (`invoice_number`),
  CONSTRAINT `purchases_FK_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  CONSTRAINT `purchases_FK_2` FOREIGN KEY (`store_id`) REFERENCES `stores` (`store_id`),
  CONSTRAINT `purchases_FK_3` FOREIGN KEY (`invoice_number`) REFERENCES `invoices` (`invoice_number`)
) 



