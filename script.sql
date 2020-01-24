drop table if exists u_datos_personales;
drop table if exists n_puntuaciones_usuarios;
drop table if exists n_viajes_usuarios;
drop table if exists u_usuarios;
drop table if exists u_roles;
drop table if exists n_viajes_destinos;
drop table if exists m_ciudades;
drop table if exists m_paises;
drop table if exists n_puntuaciones_viajes;
drop table if exists n_viajes;
drop table if exists n_viajes_historico;
drop table if exists c_etiquetas;
drop table if exists c_componentes;

CREATE TABLE `u_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rol` varchar(12) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

INSERT INTO u_roles (rol, descripcion) 
VALUES 
	('ADMIN', 'Usuario que administra la aplicaci�n.'), 
	('USUARIO', 'Usuario que explota la aplicaci�n.');

CREATE TABLE `u_usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_rol` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(30) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  `last_login` datetime NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `u_usuarios_roles_fk` FOREIGN KEY (`id_rol`) REFERENCES `u_roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

INSERT INTO u_usuarios (id_rol, email, password, created_date, modified_date, last_login) 
values
	(1, 'jmarin@gmail.com', 'abc01234', '2019-02-27 19:19:46.000', '2019-02-27 19:19:46.000', '2019-02-27 19:19:46.000'),
	(2, 'haraceli@gmail.com', 'abc01234', '2019-02-27 19:19:46.000', '2019-02-27 19:19:46.000', '2019-02-27 19:19:46.000');

CREATE TABLE `u_datos_personales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `apellido1` varchar(30) DEFAULT NULL,
  `apellido2` varchar(30) DEFAULT NULL,
  `direccion` varchar(30) DEFAULT NULL,
  `poblacion` varchar(30) DEFAULT NULL,
  `cod_postal` varchar(30) DEFAULT NULL,
  `provincia` varchar(30) DEFAULT NULL,
  `telefono` varchar(30) DEFAULT NULL,
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `u_datos_personales_usuarios_fk` FOREIGN KEY (`id_usuario`) REFERENCES `u_usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

INSERT INTO u_datos_personales (id_usuario, nombre, apellido1, apellido2, direccion, poblacion, cod_postal, provincia, telefono, created_date, modified_date) 
VALUES 
	(1, 'Javier', 'Mar�n', 'Cobos', 'C/ Espronceda n� 70', 'Elche', '03204', 'Alicante', '603031703', '2019-02-27 21:19:46.000', '2019-02-27 21:19:46.000'),
	(2, 'H�ctor', 'Araceli', 'Carbonell', 'C/ Villena n� 89', 'Elche', '03204', 'Alicante', '600300800', '2019-02-27 21:19:46.000', '2019-02-27 21:19:46.000');

CREATE TABLE `m_paises` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cod` varchar(10) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `descripcion` varchar(150) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

INSERT INTO m_paises (cod, nombre, descripcion, created_date, modified_date)
VALUES
	('ESP', 'Espa�a', 'Pa�s del sur de Europa muy soleado.', '2019-02-27 21:47:46.000', '2019-02-27 21:47:46.000'),
	('FRA', 'Francia', 'Pa�s del sur de Europa muy lleno de franceses.', '2019-02-27 21:47:46.000', '2019-02-27 21:47:46.000'),
	('EEUU', 'Estados Unidos', 'Pa�s del norte de Am�rica llena de capitalismo.', '2019-02-27 21:47:46.000', '2019-02-27 21:47:46.000');

CREATE TABLE `m_ciudades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_pais` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `descripcion` varchar(150) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `m_ciudades_paises_fk` FOREIGN KEY (`id_pais`) REFERENCES `m_paises` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

INSERT INTO m_ciudades (id_pais, nombre, descripcion, created_date, modified_date)
VALUES
	(1, 'Madrid', 'Ciudad que es capital de Espa�a.', '2019-02-27 21:47:46.000', '2019-02-27 21:47:46.000'),
	(2, 'Par�s', 'Ciudad que es capital de Francia.', '2019-02-27 21:47:46.000', '2019-02-27 21:47:46.000'),
	(3, 'Nueva York', 'Quiz�s sea la ciudad m�s importante de Estados Unidos.', '2019-02-27 21:47:46.000', '2019-02-27 21:47:46.000');

CREATE TABLE `n_viajes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cod` varchar(10) NOT NULL,
  `titulo` varchar(30) NOT NULL,
  `subtitulo` varchar(150) NOT NULL,
  `cuerpo` varchar(2000) NOT NULL,
  `inicio` datetime NOT NULL,
  `fin` datetime NOT NULL,
  `precio` decimal NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

INSERT INTO n_viajes (cod, titulo, subtitulo, cuerpo, inicio, fin, precio, created_date, modified_date)
VALUES
	('9FX78', 'Viaje a EEUU.', 'Viaje a Nueva York para verano.', 'Se buscan persona agradable y con buen rollo para hacer un viaje a Nueva York en las vacaciones de verano.', '2019-08-10 00:00:00.000', '2019-08-18 00:00:00.000', '1400.00', '2019-02-27 21:47:46.000', '2019-02-27 21:47:46.000'),
	('9FX79', 'Viaje a Par�s.', 'Viaje a Par�s para Semana Santa.', 'Se buscan persona agradable y con buen rollo para hacer un viaje a Par�s en las vacaciones de Semana Santa.', '2019-04-19 00:00:00.000', '2019-04-24 00:00:00.000', '800.00', '2019-02-27 21:47:46.000', '2019-02-27 21:47:46.000'),
	('9FX80', 'Viaje a Madrid.', 'Viaje a Madrid para el puente de Octubre.', 'Se buscan persona agradable y con buen rollo para hacer un viaje a Madrid en el puente de Octubre.', '2019-10-08 00:00:00.000', '2019-10-12 00:00:00.000', '520.00', '2019-02-27 21:47:46.000', '2019-02-27 21:47:46.000');

CREATE TABLE `n_viajes_historico` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cod` varchar(10) NOT NULL,
  `titulo` varchar(30) NOT NULL,
  `subtitulo` varchar(150) NOT NULL,
  `cuerpo` varchar(2000) NOT NULL,
  `inicio` datetime NOT NULL,
  `fin` datetime NOT NULL,
  `precio` decimal NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

INSERT INTO n_viajes_historico (cod, titulo, subtitulo, cuerpo, inicio, fin, precio, created_date, modified_date)
VALUES
	('9FX60', 'Viaje a EEUU.', 'Viaje a Nueva York para verano.', 'Se buscan persona agradable y con buen rollo para hacer un viaje a Nueva York en las vacaciones de verano.', '2019-08-10 00:00:00.000', '2019-08-18 00:00:00.000', '1400.00', '2019-02-27 21:47:46.000', '2019-02-27 21:47:46.000'),
	('9FX61', 'Viaje a Par�s.', 'Viaje a Par�s para Semana Santa.', 'Se buscan persona agradable y con buen rollo para hacer un viaje a Par�s en las vacaciones de Semana Santa.', '2019-04-19 00:00:00.000', '2019-04-24 00:00:00.000', '800.00', '2019-02-27 21:47:46.000', '2019-02-27 21:47:46.000'),
	('9FX62', 'Viaje a Madrid.', 'Viaje a Madrid para el puente de Octubre.', 'Se buscan persona agradable y con buen rollo para hacer un viaje a Madrid en el puente de Octubre.', '2019-10-08 00:00:00.000', '2019-10-12 00:00:00.000', '520.00', '2019-02-27 21:47:46.000', '2019-02-27 21:47:46.000');
	
CREATE TABLE `n_viajes_destinos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_viaje` int(11) NOT NULL,
  `id_pais` int(11) NOT NULL,
  `id_ciudad` int(11) NOT NULL,
  `created_data` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `n_viajes_destinos_viajes_fk` FOREIGN KEY (`id_viaje`) REFERENCES `n_viajes` (`id`),
  CONSTRAINT `m_viajes_destinos_paises_fk` FOREIGN KEY (`id_pais`) REFERENCES `m_paises` (`id`),
  CONSTRAINT `m_viajes_destinos_ciudades_fk` FOREIGN KEY (`id_ciudad`) REFERENCES `m_ciudades` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

INSERT INTO n_viajes_destinos (id_viaje, id_pais, id_ciudad, created_data, modified_date)
VALUES 
	(1, 1, 1, '2019-02-27 21:47:46.000', '2019-02-27 21:47:46.000'),
	(2, 2, 2, '2019-02-27 21:47:46.000', '2019-02-27 21:47:46.000'),
	(3, 3, 3, '2019-02-27 21:47:46.000', '2019-02-27 21:47:46.000');

CREATE TABLE `n_puntuaciones_viajes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_viaje` int(11) NOT NULL,
  `puntuacion` int(11) NOT NULL,
  `comentario` varchar(300) NOT NULL,
  `created_data` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `n_puntuaciones_viajes_fk` FOREIGN KEY (`id_viaje`) REFERENCES `n_viajes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

INSERT INTO n_puntuaciones_viajes (id_viaje, puntuacion, comentario, created_data, modified_date)
VALUES 
	(1, 4, 'El viaje a sido agradable.', '2019-02-27 21:47:46.000', '2019-02-27 21:47:46.000'),
	(2, 5, 'El viaje ha estado bien pero podr�a haber sido mejor.', '2019-02-27 21:47:46.000', '2019-02-27 21:47:46.000'),
	(3, 3, 'El viaje ha sido basura c�smica.', '2019-02-27 21:47:46.000', '2019-02-27 21:47:46.000');

CREATE TABLE `n_puntuaciones_usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `puntuacion` int(11) NOT NULL,
  `comentario` varchar(300) NOT NULL,
  `created_data` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `n_puntuaciones_usuarios_fk` FOREIGN KEY (`id_usuario`) REFERENCES `u_usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

INSERT INTO n_puntuaciones_viajes (id_viaje, puntuacion, comentario, created_data, modified_date)
VALUES 
	(1, 5, 'Es una persona simp�tica y agradable. Perfecto como compa�ero de viaje.', '2019-02-27 21:47:46.000', '2019-02-27 21:47:46.000');

CREATE TABLE `n_viajes_usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `id_viaje` int(11) NOT NULL,
  `creador` tinyint(1) NOT NULL,
  `created_data` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `n_viajes_usuarios_usuario_fk` FOREIGN KEY (`id_usuario`) REFERENCES `u_usuarios` (`id`),
  CONSTRAINT `n_viajes_usuarios_viaje_fk` FOREIGN KEY (`id_viaje`) REFERENCES `n_viajes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

INSERT INTO n_viajes_usuarios (id_usuario, id_viaje, creador, created_data, modified_date)
VALUES 
	(1, 1, 1, '2019-02-27 21:47:46.000', '2019-02-27 21:47:46.000'),
	(2, 2, 1, '2019-02-27 21:47:46.000', '2019-02-27 21:47:46.000'),
	(1, 3, 1, '2019-02-27 21:47:46.000', '2019-02-27 21:47:46.000'),
	(2, 3, 0, '2019-02-27 21:47:46.000', '2019-02-27 21:47:46.000');
	
CREATE TABLE `n_viajes_historico_usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `id_viaje_historico` int(11) NOT NULL,
  `created_data` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `n_viajes_hist_usuarios_usuario_fk` FOREIGN KEY (`id_usuario`) REFERENCES `u_usuarios` (`id`),
  CONSTRAINT `n_viajes_hist_usuarios_viaje_fk` FOREIGN KEY (`id_viaje_historico`) REFERENCES `n_viajes_historico` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

INSERT INTO n_viajes_historico_usuarios (id_usuario, id_viaje_historico, created_data, modified_date)
VALUES 
	(1, 1, '2019-02-27 21:47:46.000', '2019-02-27 21:47:46.000'),
	(2, 2, '2019-02-27 21:47:46.000', '2019-02-27 21:47:46.000'),
	(1, 3, '2019-02-27 21:47:46.000', '2019-02-27 21:47:46.000'),
	(2, 3, '2019-02-27 21:47:46.000', '2019-02-27 21:47:46.000');

CREATE TABLE `c_componentes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

INSERT INTO c_componentes (nombre) 
VALUES 
	('inicio'), 
	('login'), 
	('viaje'),
	('footer');
	
CREATE TABLE `c_etiquetas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_componente` int(11) not NULL,
  `nombre` varchar(25) NOT NULL,
  `castellano` varchar(100) DEFAULT NULL,
  `ingles` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `c_etiquetas_componente_fk` FOREIGN KEY (`id_componente`) REFERENCES `c_componentes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

INSERT INTO c_etiquetas (id_componente, nombre, castellano, ingles) 
VALUES 
	(1, 'titulo', 'Título de la aplicación.', 'Title of the application.'), 
	(1, 'subtitulo', 'Subtítulo de la aplicación.', 'Subtitle of the application.'),
	(1, 'cuerpo', 'Cuerpo de la pantalla principal de la aplicaci�n.', 'Body of the main screen of the application.'),
	(2, 'username', 'Nombre de usuario', 'Username'),
	(2, 'password', 'Contraseña', 'Password'),
	(4, 'privacidad', 'Privacidad', 'Privacity'),
	(4, 'about', 'Sobre nosotros', 'About us'),
	(4, 'contacto', 'Contacto', 'Contact'),
	(4, 'redes', 'Redes sociales', 'Social media');