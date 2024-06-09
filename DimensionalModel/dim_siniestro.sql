CREATE TABLE dim_siniestro(
    sk_dim_siniestro DOUBLE PRECISION PRIMARY KEY,
    nro_siniestro INTEGER UNIQUE NOT NULL,
    descrip_siniestro VARCHAR(50) NOT NULL
);