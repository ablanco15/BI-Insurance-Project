CREATE TABLE dim_cliente(
    sk_dim_cliente DOUBLE PRECISION PRIMARY KEY,
    cod_cliente INTEGER NOT NULL UNIQUE,
    nb_cliente VARCHAR(25) NOT NULL,
    ci_rif VARCHAR(45) UNIQUE NOT NULL ,
    telefono VARCHAR(45) UNIQUE NOT NULL,
    direccion VARCHAR(45) NOT NULL,
    sexo VARCHAR(1) NOT NULL CHECK(sexo IN ('F','M')),
    email VARCHAR(45) UNIQUE NOT NULL
);