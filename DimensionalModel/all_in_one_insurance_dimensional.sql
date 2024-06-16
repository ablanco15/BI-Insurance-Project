DROP TABLE IF EXISTS dim_cliente, dim_contrato, dim_estado_contrato,
dim_evaluacion_servicio, dim_producto, dim_siniestro, dim_sucursal, dim_tiempo, 
fact_evaluacion_servicio, fact_metas, fact_registro_contrato, fact_registro_siniestro;

CREATE TABLE dim_cliente(
    sk_dim_cliente INTEGER PRIMARY KEY,
    cod_cliente INTEGER NOT NULL UNIQUE,
    nb_cliente VARCHAR(25) NOT NULL,
    ci_rif VARCHAR(45) UNIQUE NOT NULL ,
    telefono VARCHAR(45) UNIQUE NOT NULL,
    direccion VARCHAR(45) NOT NULL,
    sexo VARCHAR(1) NOT NULL CHECK(sexo IN ('F','M')),
    email VARCHAR(45) UNIQUE NOT NULL
);

CREATE TABLE dim_contrato(
    sk_dim_contrato INTEGER PRIMARY KEY,
    nro_contrato INTEGER UNIQUE NOT NULL,
    descrip_contrato VARCHAR(35) NOT NULL
);

CREATE TABLE dim_estado_contrato(
    sk_dim_estado_contrato INTEGER PRIMARY KEY,
    descrip_estado VARCHAR(25) NOT NULL
);

CREATE TABLE dim_evaluacion_servicio(
    sk_dim_evaluacion_servicio INTEGER PRIMARY KEY,
    cod_evaluacion_servicio INTEGER UNIQUE NOT NULL,
    nb_descrip VARCHAR(25) NOT NULL 
);

CREATE TABLE dim_producto(
    sk_dim_producto INTEGER PRIMARY KEY,
    cod_producto INTEGER NOT NULL UNIQUE,
    nb_producto VARCHAR(45) NOT NULL,
    descrip_producto VARCHAR(100) NOT NULL,
    cod_tipo_producto INTEGER NOT NULL,
    nb_tipo_producto VARCHAR(45) NOT NULL,
    calificacion INTEGER NOT NULL
);

CREATE TABLE dim_siniestro(
    sk_dim_siniestro INTEGER PRIMARY KEY,
    nro_siniestro INTEGER UNIQUE NOT NULL,
    descrip_siniestro VARCHAR(50) NOT NULL
);

CREATE TABLE dim_sucursal(
    sk_dim_sucursal INTEGER PRIMARY KEY,
    cod_sucursal INTEGER NOT NULL UNIQUE,
    nb_sucursal VARCHAR(30) NOT NULL,
    cod_ciudad INTEGER NOT NULL,
    nb_ciudad VARCHAR(45) NOT NULL,
    cod_pais INTEGER NOT NULL,
    nb_pais VARCHAR(45) NOT NULL
);

create table dim_tiempo(
    sk_dim_tiempo INTEGER PRIMARY KEY,
    cod_annio INTEGER NOT NULL,
    cod_mes INTEGER NOT NULL,
    cod_dia_annio INTEGER NOT NULL,
    cod_dia_mes INTEGER NOT NULL,
    cod_dia_semana INTEGER NOT NULL,
    cod_semana INTEGER NOT NULL,
    desc_dia_semana varchar(30) NOT NULL,
    desc_dia_semana_corta varchar(5) NOT NULL,
    desc_mes varchar(30) NOT NULL,
    desc_mes_corta varchar(5) NOT NULL, 
    desc_trimestre INTEGER NOT NULL,
    desc_semestre INTEGER NOT NULL,
    fecha_completa DATE NOT NULL
);

CREATE TABLE fact_evaluacion_servicio(
    sk_dim_cliente  INTEGER,
    sk_dim_producto INTEGER, 
    sk_dim_evaluacion_servicio INTEGER,
    cantidad INTEGER,
    recomienda_amigo BOOLEAN NOT NULL,
    CONSTRAINT fk_cliente FOREIGN KEY(sk_dim_cliente) REFERENCES dim_cliente(sk_dim_cliente),
    CONSTRAINT fk_producto FOREIGN KEY(sk_dim_producto) REFERENCES dim_producto(sk_dim_producto),
    CONSTRAINT fk_evaluacion_producto FOREIGN KEY(sk_dim_evaluacion_servicio) REFERENCES dim_evaluacion_servicio(sk_dim_evaluacion_servicio),
    CONSTRAINT pk_fact_evaluacion_Servicio PRIMARY KEY(sk_dim_cliente,sk_dim_producto,sk_dim_evaluacion_servicio)
);

CREATE TABLE fact_metas(
    sk_dim_fecha_inicio_meta INTEGER,
    sk_dim_fecha_fin_meta INTEGER,
    sk_dim_producto INTEGER,
    monto_meta_ingreso NUMERIC,
    meta_renovacion INTEGER,
    meta_asegurados INTEGER,
    CONSTRAINT fk_fecha_inicio FOREIGN KEY(sk_dim_fecha_inicio_meta) REFERENCES dim_tiempo(sk_dim_tiempo),
    CONSTRAINT fk_fecha_fin FOREIGN KEY(sk_dim_fecha_fin_meta) REFERENCES dim_tiempo(sk_dim_tiempo),
    CONSTRAINT fk_producto FOREIGN KEY(sk_dim_producto) REFERENCES dim_producto(sk_dim_producto),
    CONSTRAINT pk_fact_metas PRIMARY KEY(sk_dim_fecha_inicio_meta,sk_dim_fecha_fin_meta,sk_dim_producto) 
);

CREATE TABLE fact_registro_contrato(
    sk_dim_tiempo_fecha_inicio INTEGER,
    sk_dim_tiempo_fecha_fin INTEGER,
    sk_dim_cliente INTEGER,
    sk_dim_contrato INTEGER,
    sk_dim_producto INTEGER, 
    sk_dim_estado_contrato INTEGER,
    monto NUMERIC NOT NULL,
    cantidad INTEGER,
    cantidad_cliente  INTEGER,
    cantidad_producto INTEGER,
    CONSTRAINT fk_tiempo_fecha_inicio FOREIGN KEY(sk_dim_tiempo_fecha_inicio) REFERENCES dim_tiempo(sk_dim_tiempo),
    CONSTRAINT fk_tiempo_fecha_fin FOREIGN KEY(sk_dim_tiempo_fecha_fin) REFERENCES dim_tiempo(sk_dim_tiempo),
    CONSTRAINT fk_cliente FOREIGN KEY(sk_dim_cliente) REFERENCES dim_cliente(sk_dim_cliente),
    CONSTRAINT fk_contrato FOREIGN KEY(sk_dim_contrato) REFERENCES dim_contrato(sk_dim_contrato),
    CONSTRAINT fk_producto FOREIGN KEY(sk_dim_producto) REFERENCES dim_producto(sk_dim_producto),
    CONSTRAINT pk_fact_registro_contrato PRIMARY KEY (sk_dim_tiempo_fecha_inicio,sk_dim_tiempo_fecha_fin,sk_dim_cliente,sk_dim_contrato,sk_dim_producto)
);

CREATE TABLE fact_registro_siniestro(
    sk_dim_fecha_siniestro INTEGER,
    sk_dim_fecha_respuesta INTEGER,
    sk_dim_cliente  INTEGER,
    sk_dim_contrato INTEGER,
    sk_dim_sucursal INTEGER,
    sk_dim_producto INTEGER,
    sk_dim_siniestro INTEGER,
    cantidad INTEGER,
    cantidad_cliente INTEGER,
    cantidad_producto INTEGER,
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

---------------------------------TRIGGERS-------------------------------


------------- fact_registro_contrato

-----cantidad_cliente

CREATE OR REPLACE FUNCTION cantidad_cliente_fact_registro_contrato_function()
RETURNS TRIGGER AS $$
DECLARE 
exists_value INTEGER;
BEGIN

    SELECT COUNT(*) INTO STRICT exists_value
    FROM fact_registro_contrato
    WHERE NEW.sk_dim_cliente = sk_dim_cliente;

    IF (exists_value > 1) THEN
      UPDATE fact_registro_contrato 
      SET cantidad_cliente = 0
      WHERE sk_dim_tiempo_fecha_inicio = NEW.sk_dim_tiempo_fecha_inicio AND
            sk_dim_tiempo_fecha_fin = NEW.sk_dim_tiempo_fecha_fin AND
            sk_dim_cliente = NEW.sk_dim_cliente AND
            sk_dim_contrato = NEW.sk_dim_contrato AND
            sk_dim_producto = NEW.sk_dim_producto AND
            sk_dim_estado_contrato = sk_dim_estado_contrato;
    ELSE
      UPDATE fact_registro_contrato 
      SET cantidad_cliente = 1
      WHERE sk_dim_tiempo_fecha_inicio = NEW.sk_dim_tiempo_fecha_inicio AND
            sk_dim_tiempo_fecha_fin = NEW.sk_dim_tiempo_fecha_fin AND
            sk_dim_cliente = NEW.sk_dim_cliente AND
            sk_dim_contrato = NEW.sk_dim_contrato AND
            sk_dim_producto = NEW.sk_dim_producto AND
            sk_dim_estado_contrato = sk_dim_estado_contrato;     
    END IF;
    RETURN NEW;
END; 
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER cantidad_cliente_fact_registro_contrato_trigger
AFTER INSERT
ON fact_registro_contrato
FOR EACH ROW 
EXECUTE FUNCTION cantidad_cliente_fact_registro_contrato_function();



-----cantidad_producto

CREATE OR REPLACE FUNCTION cantidad_producto_fact_registro_contrato_function()
RETURNS TRIGGER AS $$
DECLARE 
exists_value INTEGER;
BEGIN

    SELECT COUNT(*) INTO STRICT exists_value
    FROM fact_registro_contrato
    WHERE NEW.sk_dim_producto = sk_dim_producto;

    IF (exists_value > 1) THEN
      UPDATE fact_registro_contrato 
      SET cantidad_producto = 0
      WHERE sk_dim_tiempo_fecha_inicio = NEW.sk_dim_tiempo_fecha_inicio AND
            sk_dim_tiempo_fecha_fin = NEW.sk_dim_tiempo_fecha_fin AND
            sk_dim_cliente = NEW.sk_dim_cliente AND
            sk_dim_contrato = NEW.sk_dim_contrato AND
            sk_dim_producto = NEW.sk_dim_producto AND
            sk_dim_estado_contrato = sk_dim_estado_contrato;
    ELSE
      UPDATE fact_registro_contrato 
      SET cantidad_producto = 1
      WHERE sk_dim_tiempo_fecha_inicio = NEW.sk_dim_tiempo_fecha_inicio AND
            sk_dim_tiempo_fecha_fin = NEW.sk_dim_tiempo_fecha_fin AND
            sk_dim_cliente = NEW.sk_dim_cliente AND
            sk_dim_contrato = NEW.sk_dim_contrato AND
            sk_dim_producto = NEW.sk_dim_producto AND
            sk_dim_estado_contrato = sk_dim_estado_contrato;     
    END IF;
    RETURN NEW;
END; 
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER cantidad_producto_fact_registro_contrato_trigger
AFTER INSERT
ON fact_registro_contrato
FOR EACH ROW 
EXECUTE FUNCTION cantidad_producto_fact_registro_contrato_function();

--cantidad

CREATE OR REPLACE FUNCTION cantidad_fact_registro_contrato_function()
RETURNS TRIGGER AS $$
DECLARE 
BEGIN
    UPDATE fact_registro_contrato 
    SET cantidad = 1
    WHERE sk_dim_tiempo_fecha_inicio = NEW.sk_dim_tiempo_fecha_inicio AND
          sk_dim_tiempo_fecha_fin = NEW.sk_dim_tiempo_fecha_fin AND
          sk_dim_cliente = NEW.sk_dim_cliente AND
          sk_dim_contrato = NEW.sk_dim_contrato AND
          sk_dim_producto = NEW.sk_dim_producto AND
          sk_dim_estado_contrato = sk_dim_estado_contrato;
    RETURN NEW;
END; 
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER cantidad_fact_registro_contrato_trigger
AFTER INSERT
ON fact_registro_contrato
FOR EACH ROW 
EXECUTE FUNCTION cantidad_fact_registro_contrato_function();



------------- fact_registro_siniestro

--cantidad

CREATE OR REPLACE FUNCTION cantidad_fact_registro_siniestro_function()
RETURNS TRIGGER AS $$
BEGIN
      UPDATE fact_registro_siniestro 
      SET cantidad = 1
      WHERE sk_dim_fecha_siniestro = NEW.sk_dim_fecha_siniestro AND
            sk_dim_fecha_respuesta = NEW.sk_dim_fecha_respuesta AND
            sk_dim_cliente = NEW.sk_dim_cliente AND
            sk_dim_contrato = NEW.sk_dim_contrato AND
            sk_dim_sucursal = new.sk_dim_sucursal AND 
            sk_dim_producto = NEW.sk_dim_producto AND
            sk_dim_siniestro = NEW.sk_dim_siniestro;
    RETURN NEW;
END; 
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER cantidad_fact_registro_siniestro_trigger
AFTER INSERT
ON fact_registro_siniestro
FOR EACH ROW 
EXECUTE FUNCTION cantidad_fact_registro_siniestro_function();


------------- fact_evaluacion_servicio

--cantidad

CREATE OR REPLACE FUNCTION cantidad_fact_evaluacion_servicio_function()
RETURNS TRIGGER AS $$
BEGIN
      UPDATE fact_evaluacion_servicio
      SET cantidad = 1
      WHERE sk_dim_cliente = NEW.sk_dim_cliente AND
            sk_dim_producto = NEW.sk_dim_producto AND
            sk_dim_evaluacion_servicio = NEW.sk_dim_evaluacion_servicio;
    RETURN NEW;
END; 
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER cantidad_fact_evaluacion_servicio_trigger
AFTER INSERT
ON fact_evaluacion_servicio
FOR EACH ROW 
EXECUTE FUNCTION cantidad_fact_evaluacion_servicio_function();

