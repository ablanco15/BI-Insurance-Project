CREATE TABLE registro_contrato(
    nro_contrato INTEGER, 
    cod_producto INTEGER NOT NULL, 
    cod_cliente INTEGER NOT NULL, 
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    monto INTEGER NOT NULL,
    estado_contrato VARCHAR NOT NULL CHECK(estado_contrato IN ('ACTIVO','VENCIDO','SUSPENDIDO')),
    CONSTRAINT producto_fk FOREIGN KEY(cod_producto) REFERENCES producto(cod_producto),
    CONSTRAINT contrato_fk FOREIGN KEY(nro_contrato) REFERENCES contrato(nro_contrato),
    CONSTRAINT cliente_fk FOREIGN KEY(cod_cliente) REFERENCES cliente(cod_cliente),
    CONSTRAINT registro_contrato_pk PRIMARY KEY(nro_contrato,cod_producto,cod_cliente)
);