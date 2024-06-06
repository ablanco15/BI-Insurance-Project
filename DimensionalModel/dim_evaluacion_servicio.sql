CREATE TABLE dim_evaluacion_servicio(
    sk_dim_evaluacion_servicio INTEGER PRIMARY KEY,
    cod_evaluacion_servicio INTEGER UNIQUE NOT NULL,
    nb_descip VARCHAR(25) NOT NULL 
);