CREATE TABLE dim_estado_contrato(
    sk_dim_estado_contrato DOUBLE PRECISION PRIMARY KEY,
    --cod_estado INTEGER NOT NULL UNIQUE,
    descrip_estado VARCHAR(25) NOT NULL
);