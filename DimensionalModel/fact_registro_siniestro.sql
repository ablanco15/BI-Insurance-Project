CREATE TABLE fact_registro_siniestro(
    sk_dim_fecha_siniestro INTEGER,
    sk_dim_fecha_respuesta INTEGER,
    sk_dim_cliente INTEGER,
    sk_dim_contrato INTEGER,
    sk_dim_producto INTEGER,
    sk_dim_siniestro INTEGER,
    cantidad INTEGER NOT NULL,
    monto_reconocido NUMERIC NOT NULL,
    monto_solicitado NUMERIC NOT NULL,
    id_rechazo VARCHAR(2) NOT NULL CHECK(id_rechazo IN ('si','no')),
    CONSTRAINT fk_fecha_siniestro FOREIGN KEY(sk_dim_fecha_siniestro) REFERENCES dim_tiempo(sk_dim_tiempo),
    CONSTRAINT fk_fecha_respuesta FOREIGN KEY(sk_dim_fecha_respuesta) REFERENCES dim_tiempo(sk_dim_tiempo),
    CONSTRAINT fk_cliente FOREIGN KEY(sk_dim_cliente) REFERENCES dim_cliente(sk_dim_cliente),
    CONSTRAINT fk_contrato FOREIGN KEY(sk_dim_contrato) REFERENCES dim_contrato(sk_dim_contrato),
    CONSTRAINT fk_producto FOREIGN KEY(sk_dim_producto) REFERENCES dim_producto(sk_dim_producto),
    CONSTRAINT fk_siniestro FOREIGN KEY(sk_dim_siniestro) REFERENCES dim_siniestro(sk_dim_siniestro),
    CONSTRAINT pk_fact_registro_siniestro PRIMARY KEY (sk_dim_fecha_siniestro,sk_dim_fecha_respuesta,sk_dim_cliente,sk_dim_contrato,sk_dim_producto,sk_dim_siniestro)    
);