
CREATE TABLE tipo_producto(
    cod_tipo_producto INTEGER PRIMARY KEY, 
    nb_tipo_producto VARCHAR(20) NOT NULL CHECK(nb_tipo_producto in ('PRESTACION DE SERVICIOS','PERSONALES', 'DAÑOS O PATRIMONIALES'))
);
