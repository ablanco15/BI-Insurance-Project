CREATE TABLE recomienda (
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


---------------------------------INSERTS for recomienda---------------

INSERT INTO recomienda(cod_cliente,cod_evaluacion_servicio,cod_producto,recomienda_amigo)
VALUES(1,3,1,TRUE),
      (2,2,1,FALSE),
      (3,4,1,TRUE),
      (4,1,2,FALSE),
      (5,5,2,TRUE),
      (6,3,2,FALSE),
      (7,3,3,TRUE),
      (8,2,3,FALSE),
      (9,4,3,TRUE),
      (10,1,4,FALSE),
      (11,4,4,TRUE),
      (12,3,4,FALSE),
      (13,5,5,TRUE),
      (14,1,5,FALSE),
      (15,5,5,TRUE),
      (16,1,6,FALSE),
      (17,5,6,TRUE),
      (18,2,6,FALSE),
      (19,5,7,TRUE),
      (20,3,7,FALSE),
      (21,5,7,TRUE),
      (22,5,8,TRUE),
      (23,3,8,TRUE),
      (24,4,8,TRUE),
      (25,2,9,FALSE),
      (26,3,9,FALSE),
      (27,1,9,FALSE),
      (28,1,10,FALSE),
      (29,4,10,TRUE),
      (30,5,10,TRUE),
      (1,4,11,TRUE),
      (15,1,11,FALSE),
      (30,3,11,FALSE);
