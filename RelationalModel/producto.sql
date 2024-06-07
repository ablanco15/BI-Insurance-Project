CREATE TABLE producto (
    cod_producto INTEGER PRIMARY KEY,
    nb_producto VARCHAR(30) NOT NULL,
    descripcion VARCHAR(100) NOT NULL,
    cod_tipo_producto INTEGER NOT NULL,
    calificacion INTEGER NOT NULL,
    CONSTRAINT tipo_producto_fk FOREIGN KEY(cod_tipo_producto) REFERENCES tipo_producto(cod_tipo_producto) 
);

-------------------- producto/products INSERTS----------

INSERT INTO producto(cod_producto,nb_producto,descripcion,cod_tipo_producto,calificacion)
VALUES (1,'Vida','Brinda una indemnización a los beneficiarios en caso de fallecimiento del asegurado.',2,3),
       (2,'Accidentes personales','cubre los gastos médicos y la pérdida de ingresos en caso de accidentes que causen lesiones.',2,4),
       (3,'Salud','Cubre los gastos médicos, hospitalarios y farmacéuticos en caso de enfermedad o lesión.',2,3),
       (4,'Invalidez','Proporciona una renta si el asegurado quede incapacitado para trabajar debido a una enfermedad.',2,5),
       (5,'Hogar','Cubre los daños a la vivienda y los efectos personales en caso de incendio, inundación o robo.',3,1),
       (6,'Auto','Cubre los daños al vehículo, los daños a terceros y gastos médicos en caso de accidentes.',3,3),
       (7,'Viaje','Cubre los gastos médicos, la pérdida de equipaje, la cancelación o la interrupción del viaje.',3,4),
       (8,'Responsabilidad Civil','Cubre los daños a terceros causados por el asegurado o sus bienes. ',3,4),
       (9,'Asistencia en Carretera','Brinda asistencia si hay avería, remolque del vehículo, cambio de neumáticos, entre otros.',1,5),
       (10,'Asistencia Legal','Cubre los gastos legales en caso de demandas, procesos judiciales o conflictos legales.',1,1),
       (11,'Decesos','Cubre los gastos del funeral y otros trámites relacionados con el fallecimiento del asegurado.',1,3); 