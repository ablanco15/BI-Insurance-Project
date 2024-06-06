DROP TABLE IF EXISTS pais,ciudad,sucursal,tipo_producto,producto,cliente,evaluacion_servicio,recomienda,contrato,registro_contrato,siniestro,registro_siniestro CASCADE;

CREATE TABLE pais(
    cod_pais INTEGER PRIMARY KEY,
    nb_pais VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE ciudad (
    cod_ciudad INTEGER PRIMARY KEY,
    nb_ciudad VARCHAR(30) NOT NULL,
    cod_pais INTEGER NOT NULL,
    CONSTRAINT pais_fk FOREIGN KEY (cod_pais) REFERENCES pais(cod_pais)
);

CREATE TABLE sucursal(
    cod_sucursal INTEGER PRIMARY KEY,
    nb_sucursal VARCHAR(30) NOT NULL,
    cod_ciudad INTEGER NOT NULL,
    CONSTRAINT ciudad_fk FOREIGN KEY (cod_ciudad) REFERENCES ciudad(cod_ciudad)   
);

CREATE TABLE tipo_producto(
    cod_tipo_producto INTEGER PRIMARY KEY, 
    nb_tipo_producto VARCHAR(45) NOT NULL CHECK(nb_tipo_producto in ('PRESTACION DE SERVICIOS','PERSONALES', 'DAÑOS O PATRIMONIALES'))
);

CREATE TABLE producto (
    cod_producto INTEGER PRIMARY KEY,
    nb_producto VARCHAR(30) NOT NULL,
    descripcion VARCHAR(100) NOT NULL,
    cod_tipo_producto INTEGER NOT NULL,
    calificacion INTEGER NOT NULL,
    CONSTRAINT tipo_producto_fk FOREIGN KEY(cod_tipo_producto) REFERENCES tipo_producto(cod_tipo_producto) 
);

CREATE TABLE cliente(
    cod_cliente INTEGER PRIMARY KEY,
    nb_cliente VARCHAR(40) NOT NULL,
    ci_rif VARCHAR(10) UNIQUE,
    telefono VARCHAR(12) NOT NULL UNIQUE, 
    dirección VARCHAR(30) NOT NULL, 
    sexo VARCHAR(1) NOT NULL CHECK(sexo in ('M','F')), 
    email VARCHAR(45) NOT NULL UNIQUE,
    cod_sucursal INTEGER NOT NULL,
    CONSTRAINT sucursal_fk FOREIGN KEY (cod_sucursal) REFERENCES sucursal(cod_sucursal)    
);    

CREATE TABLE evaluacion_servicio(
    cod_evaluacion_servicio INTEGER PRIMARY KEY, 
    nb_descripcion VARCHAR(10) NOT NULL CHECK(nb_descripcion in ('MALO','REGULAR','BUENO','MUY BUENO','EXCELENTE'))
); 

CREATE TABLE  recomienda (
    cod_cliente INTEGER NOT NULL, 
    cod_evaluacion_servicio INTEGER NOT NULL , 
    cod_producto INTEGER NOT NULL,
    recomienda_amigo BOOLEAN NOT NULL,
    CONSTRAINT cliente_fk FOREIGN KEY(cod_cliente) REFERENCES cliente(cod_cliente),
    CONSTRAINT evaluacion_servicio_fk FOREIGN KEY(cod_evaluacion_servicio) REFERENCES evaluacion_servicio(cod_evaluacion_servicio),
    CONSTRAINT producto_fk FOREIGN KEY(cod_producto) REFERENCES producto(cod_producto),
    CONSTRAINT pais_fk FOREIGN KEY(cod_evaluacion_servicio) REFERENCES evaluacion_servicio(cod_evaluacion_servicio),
    CONSTRAINT recomienda_pk PRIMARY KEY(cod_cliente,cod_evaluacion_servicio,cod_producto)
);

CREATE TABLE contrato(
    nro_contrato INTEGER PRIMARY KEY,
    descrip_contrato VARCHAR(30) NOT NULL
);

CREATE TABLE registro_contrato(
    nro_contrato INTEGER PRIMARY KEY, 
    cod_producto INTEGER NOT NULL, 
    cod_cliente INTEGER NOT NULL, 
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    monto INTEGER NOT NULL,
    estado_contrato VARCHAR NOT NULL CHECK(estado_contrato IN ('activo','vencido','suspendido')),
    CONSTRAINT producto_fk FOREIGN KEY(cod_producto) REFERENCES producto(cod_producto),
    CONSTRAINT cliente_fk FOREIGN KEY(cod_cliente) REFERENCES cliente(cod_cliente) 
);

CREATE TABLE siniestro(
    nro_siniestro INTEGER PRIMARY KEY, 
    descripcion_siniestro VARCHAR(50) NOT NULL
);

CREATE TABLE registro_siniestro(
    nro_siniestro INTEGER PRIMARY KEY, 
    nro_contrato INTEGER NOT NULL, 
    fecha_siniestro DATE NOT NULL,
    fecha_respuesta DATE NOT NULL, 
    id_rechazo VARCHAR(2) CHECK(id_rechazo in ('SI','NO')), 
    monto_reconocido INTEGER NOT NULL, 
    monto_solicitado INTEGER NOT NULL,
    CONSTRAINT contrato_fk FOREIGN KEY(nro_contrato) REFERENCES contrato(nro_contrato)
    );