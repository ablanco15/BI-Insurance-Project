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