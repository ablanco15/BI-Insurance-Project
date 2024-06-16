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

