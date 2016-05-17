
CREATE TABLE administrador_botilleria (
	id_admin char(36) NOT NULL,
	nombre varchar(255) NOT NULL,
	apellido varchar(255) NOT NULL,
	email varchar(255) NOT NULL,
	contrasena varchar(255) NOT NULL,
	PRIMARY KEY (id_admin)
);

CREATE TABLE botilleria (
	id_botilleria char(36) NOT NULL,
	nombre varchar(255) NOT NULL,
	direccion varchar(255) NOT NULL,
	hora_apertura TIME,
	hora_cierre TIME,
	id_admin_fk char(36) NOT NULL,
	PRIMARY KEY (id_botilleria),
	FOREIGN KEY (id_admin_fk) REFERENCES administrador_botilleria(id_admin) ON DELETE CASCADE
);

CREATE TABLE metodos_pago (
	id_metodos char(36) NOT NULL,
	nombre varchar(255) NOT NULL,
	id_botilleria_fk char(36) NOT NULL,
	PRIMARY KEY (id_metodos),
	FOREIGN KEY (id_botilleria_fk) REFERENCES botilleria(id_botilleria) ON DELETE CASCADE
);

CREATE TABLE promocion (
	id_promo char(36) NOT NULL,
	glosa varchar(255) NOT NULL,
	precio int NOT NULL,
	id_botilleria_fk char(36) NOT NULL,
	PRIMARY KEY (id_promo),
	FOREIGN KEY (id_botilleria_fk) REFERENCES botilleria(id_botilleria) ON DELETE CASCADE
);

CREATE TABLE usuario (
	id_usuario char(36) NOT NULL,
	nombre varchar(255) NOT NULL,
	edad int,
	email varchar(255) NOT NULL,
	contrasena varchar(255) NOT NULL,
	PRIMARY KEY (id_usuario)
);

CREATE TABLE appcoholazo (
	id_app char(36) NOT NULL,
	glosa varchar(255) NOT NULL,
	precio int NOT NULL,
	fecha date NOT NULL,
	id_botilleria_fk char(36) NOT NULL,
	PRIMARY KEY (id_app),
	FOREIGN KEY (id_botilleria_fk) REFERENCES botilleria(id_botilleria) ON DELETE CASCADE
);

CREATE TABLE usuario_appcoholazo (
	id_usr_app char(36) NOT NULL,
	codigo varchar(255) NOT NULL,
	id_usuario_fk char(36) NOT NULL,
	id_app_fk char(36) NOT NULL,
	PRIMARY KEY (id_usr_app),
	FOREIGN KEY (id_usuario_fk) REFERENCES usuario(id_usuario) ON DELETE CASCADE,
	FOREIGN KEY (id_app_fk) REFERENCES appcoholazo(id_app) ON DELETE CASCADE
);

CREATE TABLE producto (
	id_producto char(36) NOT NULL,
	nombre varchar(255) NOT NULL,
	marca varchar(255) NOT NULL,
	tipo_producto varchar(255) NOT NULL,
	PRIMARY KEY (id_producto)
);

CREATE TABLE promocion_producto (
	id_promo_producto char(36) NOT NULL,
	id_promo_fk char(36) NOT NULL,
	id_producto_fk char(36) NOT NULL,
	PRIMARY KEY (id_promo_producto),
	FOREIGN KEY (id_promo_fk) REFERENCES promocion(id_promo) ON DELETE CASCADE,
	FOREIGN KEY (id_producto_fk) REFERENCES producto(id_producto) ON DELETE CASCADE
);

CREATE TABLE producto_botilleria (
	id_pro_boti char(36) NOT NULL,
	precio_producto int NOT NULL,
	id_producto_fk char(36) NOT NULL,
	id_botilleria_fk char(36) NOT NULL,
	PRIMARY KEY (id_pro_boti),
	FOREIGN KEY (id_producto_fk) REFERENCES producto(id_producto) ON DELETE CASCADE,
	FOREIGN KEY (id_botilleria_fk) REFERENCES botilleria(id_botilleria) ON DELETE CASCADE
);

CREATE TABLE producto_appcoholazo (
	id_prod_app char(36) NOT NULL,
	id_app_fk char(36) NOT NULL,
	id_producto_fk char(36) NOT NULL,
	PRIMARY KEY (id_prod_app),
	FOREIGN KEY (id_app_fk) REFERENCES appcoholazo(id_app) ON DELETE CASCADE,
	FOREIGN KEY (id_producto_fk) REFERENCES producto(id_producto) ON DELETE CASCADE
);