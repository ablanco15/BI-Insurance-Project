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
