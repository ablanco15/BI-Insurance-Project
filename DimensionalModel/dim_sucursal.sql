CREATE TABLE dim_sucursal(
    sk_dim_sucursal INTEGER PRIMARY KEY,
    cod_sucursal INTEGER NOT NULL UNIQUE,
    nb_sucursal VARCHAR(25) NOT NULL,
    cod_ciudad INTEGER NOT NULL,
    nb_ciudad VARCHAR(45) NOT NULL,
    cod_pais INTEGER NOT NULL,
    nb_pais VARCHAR(45) NOT NULL
);
