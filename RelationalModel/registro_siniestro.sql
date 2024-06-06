CREATE TABLE registro_siniestro(
    nro_siniestro INTEGER NOT NULL, 
    nro_contrato INTEGER NOT NULL, 
    fecha_siniestro DATE NOT NULL,
    fecha_respuesta DATE NOT NULL, 
    id_rechazo VARCHAR(2) CHECK(id_rechazo in ('SI','NO')), 
    monto_reconocido INTEGER NOT NULL, 
    monto_solicitado INTEGER NOT NULL,
    CONSTRAINT contrato_fk FOREIGN KEY(nro_contrato) REFERENCES contrato(nro_contrato),
    CONSTRAINT siniestro_fk FOREIGN KEY(nro_siniestro) REFERENCES siniestro(nro_siniestro),
    CONSTRAINT registro_siniestro_pk PRIMARY KEY(nro_siniestro,nro_contrato) 
);