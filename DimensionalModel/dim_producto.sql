CREATE TABLE dim_producto(
    sk_dim_producto INTEGER PRIMARY KEY,
    cod_producto INTEGER NOT NULL UNIQUE,
    nb_producto VARCHAR(45) NOT NULL,
    descrip_producto VARCHAR(100) NOT NULL,
    cod_tipo_producto INTEGER NOT NULL,
    nb_tipo_producto VARCHAR(45) NOT NULL,
    calificacion INTEGER NOT NULL
);
