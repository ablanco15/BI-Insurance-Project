CREATE TABLE dim_contrato(
    sk_dim_contrato INTEGER PRIMARY KEY,
    nro_contrato INTEGER UNIQUE NOT NULL,
    descrip_contrato VARCHAR(25) NOT NULL
);