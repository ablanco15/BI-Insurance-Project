--CREATE TABLE fact_registro_contrato(
--    sk_dim_tiempo_fecha_inicio INTEGER,
--    sk_dim_tiempo_fecha_fin INTEGER,
--    sk_dim_cliente INTEGER,
--    sk_dim_contrato INTEGER,
--    sk_dim_producto INTEGER, 
--    sk_dim_estado_contrato INTEGER,
--    monto NUMERIC NOT NULL,
--    cantidad INTEGER,
--    cantidad_cliente  INTEGER,
--    cantidad_producto INTEGER,
--    CONSTRAINT fk_tiempo_fecha_inicio FOREIGN KEY(sk_dim_tiempo_fecha_inicio) REFERENCES dim_tiempo(sk_dim_tiempo),
--    CONSTRAINT fk_tiempo_fecha_fin FOREIGN KEY(sk_dim_tiempo_fecha_fin) REFERENCES dim_tiempo(sk_dim_tiempo),
--    CONSTRAINT fk_cliente FOREIGN KEY(sk_dim_cliente) REFERENCES dim_cliente(sk_dim_cliente),
--    CONSTRAINT fk_contrato FOREIGN KEY(sk_dim_contrato) REFERENCES dim_contrato(sk_dim_contrato),
--    CONSTRAINT fk_producto FOREIGN KEY(sk_dim_producto) REFERENCES dim_producto(sk_dim_producto),
--    CONSTRAINT pk_fact_registro_contrato PRIMARY KEY (sk_dim_tiempo_fecha_inicio,sk_dim_tiempo_fecha_fin,sk_dim_cliente,sk_dim_contrato,sk_dim_producto)
--);

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
    CONSTRAINT fk_estado_contrato FOREIGN KEY(sk_dim_estado_contrato) REFERENCES dim_estado_contrato(sk_dim_estado_contrato),
    CONSTRAINT pk_fact_registro_contrato PRIMARY KEY (sk_dim_tiempo_fecha_inicio,sk_dim_tiempo_fecha_fin,sk_dim_cliente,sk_dim_contrato,sk_dim_producto,sk_dim_estado_contrato)
);