
CREATE TABLE cliente(
    cod_cliente INTEGER PRIMARY KEY,
    nb_cliente VARCHAR(40) NOT NULL,
    ci_rif VARCHAR(10) UNIQUE,
    telefono VARCHAR(12) NOT NULL UNIQUE, 
    dirección VARCHAR(30) NOT NULL, 
    sexo VARCHAR(1) NOT NULL CHECK(sexo in ('M','F')), 
    email VARCHAR(20) NOT NULL UNIQUE,
    cod_sucursal INTEGER NOT NULL,
    CONSTRAINT sucursal_fk FOREIGN KEY (cod_sucursal) REFERENCES sucursal(cod_sucursal)    
);