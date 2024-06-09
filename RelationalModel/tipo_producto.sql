CREATE TABLE tipo_producto(
    cod_tipo_producto INTEGER PRIMARY KEY, 
    nb_tipo_producto VARCHAR(45) NOT NULL UNIQUE CHECK(nb_tipo_producto in ('PRESTACION DE SERVICIOS','PERSONALES', 'DAÑOS O PATRIMONIALES'))
);

INSERT INTO tipo_producto (cod_tipo_producto, nb_tipo_producto)
VALUES (1,'PRESTACION DE SERVICIOS'),
       (2,'PERSONALES'),
       (3,'DAÑOS O PATRIMONIALES');
