
CREATE TABLE registro_siniestro(
    nro_siniestro INTEGER PRIMARY KEY, 
    nro_contrato INTEGER NOT NULL, 
    fecha_siniestro DATE NOT NULL,
    fecha_respuesta DATE NOT NULL, 
    id_rechazo VARCHAR(2) CHECK(id_rechazo in ('SI','NO')), 
    monto_reconocido INTEGER NOT NULL, 
    monto_solicitado INTEGER NOT NULL,
    CONSTRAINT contrato_fk FOREIGN KEY(nro_contrato) REFERENCES contrato(nro_contrato)
    );

//Preguntar si monto reconocido tiene que estar not null al igual que id_rechazo

CHECK(nb_tipo_producto in ('PRESTACION DE SERVICIOS','PERSONALES', 'DAÑOS O PATRIMONIALES'))