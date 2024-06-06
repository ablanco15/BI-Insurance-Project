CREATE TABLE registro_contrato(
    nro_contrato INTEGER PRIMARY KEY, 
    cod_producto INTEGER NOT NULL, 
    cod_cliente INTEGER NOT NULL, 
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    monto INTEGER NOT NULL,
    estado_contrato VARCHAR NOT NULL CHECK(estado_contrato IN ('activo','vencido','suspendido')),
    CONSTRAINT producto_fk FOREIGN KEY(cod_producto) REFERENCES producto(cod_producto),
    CONSTRAINT cliente_fk FOREIGN KEY(cod_cliente) REFERENCES cliente(cod_cliente) 
);