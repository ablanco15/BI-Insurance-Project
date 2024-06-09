CREATE TABLE dim_evaluacion_servicio(
    sk_dim_evaluacion_servicio DOUBLE PRECISION PRIMARY KEY,
    cod_evaluacion_servicio INTEGER UNIQUE NOT NULL,
    nb_descrip VARCHAR(25) NOT NULL 
);
