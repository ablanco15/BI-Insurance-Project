CREATE TABLE dim_producto(
    sk_dim_producto INTEGER PRIMARY KEY,
    cod_producto INTEGER NOT NULL UNIQUE,
    nb_producto VARCHAR(25) NOT NULL,
    descrip_producto VARCHAR(25) NOT NULL,
    cod_tipo_producto VARCHAR(25) NOT NULL,
    nb_tipo_prodcuto VARCHAR(25) NOT NULL,
    calificacion INTEGER NOT NULL
);