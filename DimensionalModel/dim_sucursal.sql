CREATE TABLE dim_sucursal(
    sk_dim_sucursal DOUBLE PRECISION PRIMARY KEY,
    cod_sucursal INTEGER NOT NULL UNIQUE,
    nb_sucursal VARCHAR(30) NOT NULL,
    cod_ciudad INTEGER NOT NULL,
    nb_ciudad VARCHAR(45) NOT NULL,
    cod_pais INTEGER NOT NULL,
    nb_pais VARCHAR(45) NOT NULL
);

