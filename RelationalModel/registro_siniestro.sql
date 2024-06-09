CREATE TABLE registro_siniestro(
    nro_siniestro INTEGER NOT NULL, 
    nro_contrato INTEGER NOT NULL, 
    fecha_siniestro DATE NOT NULL,
    fecha_respuesta DATE NOT NULL, 
    id_rechazo VARCHAR(2) CHECK(id_rechazo in ('SI','NO')), 
    monto_reconocido NUMERIC NOT NULL, 
    monto_solicitado NUMERIC NOT NULL,
    CONSTRAINT contrato_fk FOREIGN KEY(nro_contrato) REFERENCES contrato(nro_contrato),
    CONSTRAINT siniestro_fk FOREIGN KEY(nro_siniestro) REFERENCES siniestro(nro_siniestro),
    CONSTRAINT registro_siniestro_pk PRIMARY KEY(nro_siniestro,nro_contrato) 
    );

--------------- INSERTS for registro_siniestro------------------


INSERT INTO registro_siniestro(nro_siniestro,nro_contrato,fecha_siniestro,fecha_respuesta,id_rechazo,monto_reconocido,monto_solicitado)
VALUES(1,17,'2022-09-01','2022-09-10','SI',15000,20000),
      (2,15,'2024-06-01','2024-06-05','SI',17000,15000),
      (3,16,'2022-01-15','2022-01-25','NO',0000,25000),
      (4,14,'2024-11-02','2024-11-15','NO',0000,10000),
      (5,7,'2024-10-10','2024-10-17','SI',8500,9000),
      (6,18,'2024-06-03','2024-06-10','SI',12000,22000),
      (7,4,'2022-05-01','2022-05-03','SI',5500,5000),
      (8,13,'2020-12-25','2021-01-15','NO',0000,10000),
      (9,29,'2021-03-17','2021-03-23','NO',0000,7200),
      (10,8,'2020-07-27','2020-08-03','SI',30000,32000);       