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
