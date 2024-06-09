DROP TABLE IF EXISTS dim_cliente, dim_contrato, dim_estado_contrato,
dim_evaluacion_servicio, dim_producto, dim_siniestro, dim_sucursal, dim_tiempo, 
fact_evaluacion_servicio, fact_metas, fact_registro_contrato, fact_registro_siniestro;

CREATE TABLE dim_cliente(
    sk_dim_cliente DOUBLE PRECISION PRIMARY KEY,
    cod_cliente INTEGER NOT NULL UNIQUE,
    nb_cliente VARCHAR(25) NOT NULL,
    ci_rif VARCHAR(45) UNIQUE NOT NULL ,
    telefono VARCHAR(45) UNIQUE NOT NULL,
    direccion VARCHAR(45) NOT NULL,
    sexo VARCHAR(1) NOT NULL CHECK(sexo IN ('F','M')),
    email VARCHAR(45) UNIQUE NOT NULL
);

CREATE TABLE dim_contrato(
    sk_dim_contrato DOUBLE PRECISION PRIMARY KEY,
    nro_contrato INTEGER UNIQUE NOT NULL,
    descrip_contrato VARCHAR(35) NOT NULL
);

CREATE TABLE dim_estado_contrato(
    sk_dim_estado_contrato DOUBLE PRECISION PRIMARY KEY,
    --cod_estado INTEGER NOT NULL UNIQUE,
    descrip_estado VARCHAR(25) NOT NULL
);

CREATE TABLE dim_evaluacion_servicio(
    sk_dim_evaluacion_servicio DOUBLE PRECISION PRIMARY KEY,
    cod_evaluacion_servicio INTEGER UNIQUE NOT NULL,
    nb_descrip VARCHAR(25) NOT NULL 
);

CREATE TABLE dim_producto(
    sk_dim_producto DOUBLE PRECISION PRIMARY KEY,
    cod_producto INTEGER NOT NULL UNIQUE,
    nb_producto VARCHAR(45) NOT NULL,
    descrip_producto VARCHAR(100) NOT NULL,
    cod_tipo_producto INTEGER NOT NULL,
    nb_tipo_producto VARCHAR(45) NOT NULL,
    calificacion INTEGER NOT NULL
);

--CREATE INDEX idx_dim_producto_lookup ON dim_producto(sk_dim_producto, cod_producto, nb_producto, descrip_producto, cod_tipo_producto, nb_tipo_producto, calificacion);


CREATE TABLE dim_siniestro(
    sk_dim_siniestro DOUBLE PRECISION PRIMARY KEY,
    nro_siniestro INTEGER UNIQUE NOT NULL,
    descrip_siniestro VARCHAR(50) NOT NULL
);

CREATE TABLE dim_sucursal(
    sk_dim_sucursal DOUBLE PRECISION PRIMARY KEY,
    cod_sucursal INTEGER NOT NULL UNIQUE,
    nb_sucursal VARCHAR(30) NOT NULL,
    cod_ciudad INTEGER NOT NULL,
    nb_ciudad VARCHAR(45) NOT NULL,
    cod_pais INTEGER NOT NULL,
    nb_pais VARCHAR(45) NOT NULL
);

create table dim_tiempo(
    sk_dim_tiempo SMALLINT PRIMARY KEY,
    cod_annio SMALLINT NOT NULL,
    cod_mes SMALLINT NOT NULL,
    cod_dia_annio SMALLINT NOT NULL,
    cod_dia_mes SMALLINT NOT NULL,
    cod_dia_semana SMALLINT NOT NULL,
    cod_semana SMALLINT NOT NULL,
    desc_dia_semana varchar(30) NOT NULL,
    desc_dia_semana_corta varchar(5) NOT NULL,
    desc_mes varchar(30) NOT NULL,
    desc_mes_corta varchar(5) NOT NULL, 
    desc_trimestre SMALLINT NOT NULL,
    desc_semestre SMALLINT NOT NULL,
    fecha_completa DATE NOT NULL
);

CREATE TABLE fact_evaluacion_servicio(
    sk_dim_cliente DOUBLE PRECISION,
    sk_dim_producto DOUBLE PRECISION, 
    sk_dim_evaluacion_servicio DOUBLE PRECISION,
    --cantidad INTEGER NOT NULL,
    recomienda_amigo BOOLEAN NOT NULL,
    CONSTRAINT fk_cliente FOREIGN KEY(sk_dim_cliente) REFERENCES dim_cliente(sk_dim_cliente),
    CONSTRAINT fk_producto FOREIGN KEY(sk_dim_producto) REFERENCES dim_producto(sk_dim_producto),
    CONSTRAINT fk_evaluacion_producto FOREIGN KEY(sk_dim_evaluacion_servicio) REFERENCES dim_evaluacion_servicio(sk_dim_evaluacion_servicio),
    CONSTRAINT pk_fact_evaluacion_Servicio PRIMARY KEY(sk_dim_cliente,sk_dim_producto,sk_dim_evaluacion_servicio)
);

CREATE TABLE fact_metas(
    sk_dim_fecha_inicio_meta INTEGER,
    sk_dim_fecha_fin_meta INTEGER,
    sk_dim_cliente INTEGER,
    sk_dim_contrato INTEGER,
    monto_meta_ingerso NUMERIC,
    meta_renovacion INTEGER,
    meta_asegurados INTEGER,
    CONSTRAINT fk_fecha_inicio FOREIGN KEY(sk_dim_fecha_inicio_meta) REFERENCES dim_tiempo(sk_dim_tiempo),
    CONSTRAINT fk_fecha_fin FOREIGN KEY(sk_dim_fecha_fin_meta) REFERENCES dim_tiempo(sk_dim_tiempo),
    CONSTRAINT fk_cliente FOREIGN KEY(sk_dim_cliente) REFERENCES dim_cliente(sk_dim_cliente),
    CONSTRAINT fk_contrato FOREIGN KEY(sk_dim_contrato) REFERENCES dim_contrato(sk_dim_contrato),
    CONSTRAINT pk_fact_metas PRIMARY KEY(sk_dim_fecha_inicio_meta,sk_dim_fecha_fin_meta,sk_dim_cliente,sk_dim_contrato) 
);

CREATE TABLE fact_registro_contrato(
    sk_dim_tiempo_fecha_inicio SMALLINT,
    sk_dim_tiempo_fecha_fin SMALLINT,
    sk_dim_cliente DOUBLE PRECISION,
    sk_dim_contrato DOUBLE PRECISION,
    sk_dim_producto DOUBLE PRECISION, 
    sk_dim_estado_contrato DOUBLE PRECISION,
    monto NUMERIC NOT NULL,
    --cantidad INTEGER NOT NULL,
    --cantidad_cliente INTEGER NOT NULL,
    --cantidad_producto INTEGER NOT NULL,
    --cantidad_contrato INTEGER NOT NULL,
    CONSTRAINT fk_tiempo_fecha_inicio FOREIGN KEY(sk_dim_tiempo_fecha_inicio) REFERENCES dim_tiempo(sk_dim_tiempo),
    CONSTRAINT fk_tiempo_fecha_fin FOREIGN KEY(sk_dim_tiempo_fecha_fin) REFERENCES dim_tiempo(sk_dim_tiempo),
    CONSTRAINT fk_cliente FOREIGN KEY(sk_dim_cliente) REFERENCES dim_cliente(sk_dim_cliente),
    CONSTRAINT fk_contrato FOREIGN KEY(sk_dim_contrato) REFERENCES dim_contrato(sk_dim_contrato),
    CONSTRAINT fk_producto FOREIGN KEY(sk_dim_producto) REFERENCES dim_producto(sk_dim_producto),
    CONSTRAINT pk_fact_registro_contrato PRIMARY KEY (sk_dim_tiempo_fecha_inicio,sk_dim_tiempo_fecha_fin,sk_dim_cliente,sk_dim_contrato,sk_dim_producto)
);

CREATE TABLE fact_registro_siniestro(
    sk_dim_fecha_siniestro SMALLINT,
    sk_dim_fecha_respuesta SMALLINT,
    sk_dim_cliente DOUBLE PRECISION,
    sk_dim_contrato DOUBLE PRECISION,
    sk_dim_sucursal DOUBLE PRECISION,
    sk_dim_producto DOUBLE PRECISION,
    sk_dim_siniestro DOUBLE PRECISION,
    --cantidad INTEGER NOT NULL,
    monto_reconocido NUMERIC NOT NULL,
    monto_solicitado NUMERIC NOT NULL,
    id_rechazo VARCHAR(2) NOT NULL CHECK(id_rechazo IN ('SI','NO')),
    CONSTRAINT fk_fecha_siniestro FOREIGN KEY(sk_dim_fecha_siniestro) REFERENCES dim_tiempo(sk_dim_tiempo),
    CONSTRAINT fk_fecha_respuesta FOREIGN KEY(sk_dim_fecha_respuesta) REFERENCES dim_tiempo(sk_dim_tiempo),
    CONSTRAINT fk_cliente FOREIGN KEY(sk_dim_cliente) REFERENCES dim_cliente(sk_dim_cliente),
    CONSTRAINT fk_contrato FOREIGN KEY(sk_dim_contrato) REFERENCES dim_contrato(sk_dim_contrato),
    CONSTRAINT fk_producto FOREIGN KEY(sk_dim_producto) REFERENCES dim_producto(sk_dim_producto),
    CONSTRAINT fk_siniestro FOREIGN KEY(sk_dim_siniestro) REFERENCES dim_siniestro(sk_dim_siniestro),
    CONSTRAINT pk_fact_registro_siniestro PRIMARY KEY (sk_dim_fecha_siniestro,sk_dim_fecha_respuesta,sk_dim_cliente,sk_dim_contrato,sk_dim_producto,sk_dim_siniestro)    
);

