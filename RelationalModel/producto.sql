
CREATE TABLE producto (
    cod_producto INTEGER PRIMARY KEY,
    nb_producto VARCHAR(30) NOT NULL,
    descripcion VARCHAR(100) NOT NULL,
    cod_tipo_producto INTEGER NOT NULL,
    calificacion INTEGER NOT NULL,
    CONSTRAINT tipo_producto_fk FOREIGN KEY(cod_tipo_producto) REFERENCES tipo_producto(cod_tipo_producto) 
);
