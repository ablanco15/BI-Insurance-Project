CREATE TABLE ciudad (
    cod_ciudad INTEGER PRIMARY KEY,
    nb_ciudad VARCHAR(30) NOT NULL,
    cod_pais INTEGER NOT NULL,
    CONSTRAINT pais_fk FOREIGN KEY (cod_pais) REFERENCES pais(cod_pais)
);