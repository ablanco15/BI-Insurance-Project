
CREATE TABLE producto (
    cod_producto INTEGER PRIMARY KEY,
    nb_producto VARCHAR(30) NOT NULL,
    descripcion VARCHAR(100) NOT NULL,
    cod_tipo_producto INTEGER NOT NULL,
    calificacion INTEGER NOT NULL CHECK(calificacion in (1,2,3,4,5)),
    CONSTRAINT tipo_producto_fk FOREIGN KEY(cod_tipo_producto) REFERENCES tipo_producto(cod_tipo_producto) 
);

-------------------- producto/products INSERTS----------

INSERT INTO producto(cod_producto,nb_producto,descripcion,cod_tipo_producto,calificacion)
VALUES (1,'Automóvil','Seguro para automovil',1,5),
       (2,'Crédito y Caución','Seguro para creditos',2,3),
       (3,'Incendios','Seguro para incendios',3,4),
       (4,'Salud','Seguro para el bienestar',2,2),
       (5,'Vida','Seguro para el bienestar de la familia',2,4);
