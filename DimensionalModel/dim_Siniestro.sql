CREATE TABLE dim_siniestro(
    sk_dim_siniestro INTEGER PRIMARY KEY,
    nro_siniestro INTEGER UNIQUE NOT NULL,
    descrip_siniestro VARCHAR(25) NOT NULL
);