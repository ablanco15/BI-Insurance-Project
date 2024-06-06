CREATE TABLE fact_registro_contrato(
    sk_dim_tiempo_fecha_inicio_meta INTEGER,
    sk_dim_tiempo_fecha_fin_meta INTEGER,
    sk_dim_cliente INTEGER,
    sk_dim_contrato INTEGER,
    sk_dim_producto INTEGER, 
    sk_dim_estado_contrato INTEGER,
    monto NUMERIC NOT NULL,
    cantidad INTEGER NOT NULL,
    cantidad_cliente INTEGER NOT NULL,
    cantidad_producto INTEGER NOT NULL,
    cantidad_contrato INTEGER NOT NULL,
    CONSTRAINT fk_tiempo_fecha_inicio_meta FOREIGN KEY(sk_dim_tiempo_fecha_inicio_meta) REFERENCES dim_tiempo(sk_dim_tiempo),
    CONSTRAINT fk_tiempo_fecha_fin_meta FOREIGN KEY(sk_dim_tiempo_fecha_fin_meta) REFERENCES dim_tiempo(sk_dim_tiempo),
    CONSTRAINT fk_cliente FOREIGN KEY(sk_dim_cliente) REFERENCES dim_cliente(sk_dim_cliente),
    CONSTRAINT fk_contrato FOREIGN KEY(sk_dim_contrato) REFERENCES dim_contrato(sk_dim_contrato),
    CONSTRAINT fk_producto FOREIGN KEY(sk_dim_producto) REFERENCES dim_producto(sk_dim_producto),
    CONSTRAINT pk_fact_registro_contrato PRIMARY KEY (sk_dim_tiempo_fecha_inicio_meta,sk_dim_tiempo_fecha_fin_meta,sk_dim_cliente,sk_dim_contrato,sk_dim_producto)
);