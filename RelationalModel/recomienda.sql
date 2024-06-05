
CREATE TABLE  recomienda (
    cod_cliente INTEGER NOT NULL, 
    cod_evaluacion_servicio INTEGER NOT NULL , 
    cod_producto INTEGER NOT NULL,
    recomienda_amigo BOOLEAN NOT NULL,
    CONSTRAINT cliente_fk FOREIGN KEY(cod_cliente) REFERENCES cliente(cod_cliente),
    CONSTRAINT evaluacion_servicio_fk FOREIGN KEY(cod_evaluacion_servicio) REFERENCES evaluacion_servicio(cod_evaluacion_servicio),
    CONSTRAINT producto_fk FOREIGN KEY(cod_producto) REFERENCES producto(cod_producto),
    CONSTRAINT pais_fk FOREIGN KEY(cod_evaluacion_servicio) REFERENCES evaluacion_servicio(cod_evaluacion_servicio),
    CONSTRAINT recomienda_pk PRIMARY KEY(cod_cliente,cod_evaluacion_servicio,cod_producto)
);