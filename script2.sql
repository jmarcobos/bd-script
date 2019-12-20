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


CREATE TABLE `c_componentes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8
CREATE TABLE `m_paises` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cod` varchar(10) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `descripcion` varchar(150) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8
CREATE TABLE `n_viajes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cod` varchar(10) NOT NULL,
  `titulo` varchar(30) NOT NULL,
  `subtitulo` varchar(150) NOT NULL,
  `cuerpo` varchar(2000) NOT NULL,
  `inicio` datetime NOT NULL,
  `fin` datetime NOT NULL,
  `precio` decimal(10,0) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8
CREATE TABLE `n_viajes_historico` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cod` varchar(10) NOT NULL,
  `titulo` varchar(30) NOT NULL,
  `subtitulo` varchar(150) NOT NULL,
  `cuerpo` varchar(2000) NOT NULL,
  `inicio` datetime NOT NULL,
  `fin` datetime NOT NULL,
  `precio` decimal(10,0) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8
CREATE TABLE `u_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rol` varchar(12) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8
CREATE TABLE `c_etiquetas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_componente` int(11) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `castellano` varchar(100) DEFAULT NULL,
  `ingles` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `c_etiquetas_componente_fk` (`id_componente`),
  CONSTRAINT `c_etiquetas_componente_fk` FOREIGN KEY (`id_componente`) REFERENCES `c_componentes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8
CREATE TABLE `m_ciudades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_pais` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `descripcion` varchar(150) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `m_ciudades_paises_fk` (`id_pais`),
  CONSTRAINT `m_ciudades_paises_fk` FOREIGN KEY (`id_pais`) REFERENCES `m_paises` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8
CREATE TABLE `n_puntuaciones_viajes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_viaje` int(11) NOT NULL,
  `puntuacion` int(11) NOT NULL,
  `comentario` varchar(300) NOT NULL,
  `created_data` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `n_puntuaciones_viajes_fk` (`id_viaje`),
  CONSTRAINT `n_puntuaciones_viajes_fk` FOREIGN KEY (`id_viaje`) REFERENCES `n_viajes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8
CREATE TABLE `n_viajes_destinos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_viaje` int(11) NOT NULL,
  `id_pais` int(11) NOT NULL,
  `id_ciudad` int(11) NOT NULL,
  `created_data` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `n_viajes_destinos_viajes_fk` (`id_viaje`),
  KEY `m_viajes_destinos_paises_fk` (`id_pais`),
  KEY `m_viajes_destinos_ciudades_fk` (`id_ciudad`),
  CONSTRAINT `m_viajes_destinos_ciudades_fk` FOREIGN KEY (`id_ciudad`) REFERENCES `m_ciudades` (`id`),
  CONSTRAINT `m_viajes_destinos_paises_fk` FOREIGN KEY (`id_pais`) REFERENCES `m_paises` (`id`),
  CONSTRAINT `n_viajes_destinos_viajes_fk` FOREIGN KEY (`id_viaje`) REFERENCES `n_viajes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8
CREATE TABLE `u_usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_rol` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(30) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  `last_login` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `u_usuarios_roles_fk` (`id_rol`),
  CONSTRAINT `u_usuarios_roles_fk` FOREIGN KEY (`id_rol`) REFERENCES `u_roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8
CREATE TABLE `n_puntuaciones_usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `puntuacion` int(11) NOT NULL,
  `comentario` varchar(300) NOT NULL,
  `created_data` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `n_puntuaciones_usuarios_fk` (`id_usuario`),
  CONSTRAINT `n_puntuaciones_usuarios_fk` FOREIGN KEY (`id_usuario`) REFERENCES `u_usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
CREATE TABLE `n_viajes_historico_usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `id_viaje_historico` int(11) NOT NULL,
  `created_data` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `n_viajes_hist_usuarios_usuario_fk` (`id_usuario`),
  KEY `n_viajes_hist_usuarios_viaje_fk` (`id_viaje_historico`),
  CONSTRAINT `n_viajes_hist_usuarios_usuario_fk` FOREIGN KEY (`id_usuario`) REFERENCES `u_usuarios` (`id`),
  CONSTRAINT `n_viajes_hist_usuarios_viaje_fk` FOREIGN KEY (`id_viaje_historico`) REFERENCES `n_viajes_historico` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8
CREATE TABLE `n_viajes_usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `id_viaje` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `n_viajes_usuarios_usuario_fk` (`id_usuario`),
  KEY `n_viajes_usuarios_viaje_fk` (`id_viaje`),
  CONSTRAINT `n_viajes_usuarios_usuario_fk` FOREIGN KEY (`id_usuario`) REFERENCES `u_usuarios` (`id`),
  CONSTRAINT `n_viajes_usuarios_viaje_fk` FOREIGN KEY (`id_viaje`) REFERENCES `n_viajes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8
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
  KEY `u_datos_personales_usuarios_fk` (`id_usuario`),
  CONSTRAINT `u_datos_personales_usuarios_fk` FOREIGN KEY (`id_usuario`) REFERENCES `u_usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8

INSERT INTO portfolio.u_usuarios (id_rol,email,password,created_date,modified_date,last_login) VALUES 
(1,'jmarin@gmail.com','abc01234','2019-02-27 20:19:46.000','2019-02-27 20:19:46.000','2019-02-27 20:19:46.000')
,(2,'haraceli@gmail.com','abc01234','2019-02-27 20:19:46.000','2019-02-27 20:19:46.000','2019-02-27 20:19:46.000')
;