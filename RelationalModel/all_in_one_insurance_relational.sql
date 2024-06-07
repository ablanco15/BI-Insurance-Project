DROP TABLE IF EXISTS pais,ciudad,sucursal,tipo_producto,producto,cliente,evaluacion_servicio,recomienda,contrato,registro_contrato,siniestro,registro_siniestro CASCADE;

CREATE TABLE pais(
    cod_pais INTEGER PRIMARY KEY,
    nb_pais VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE ciudad (
    cod_ciudad INTEGER PRIMARY KEY,
    nb_ciudad VARCHAR(30) NOT NULL,
    cod_pais INTEGER NOT NULL,
    CONSTRAINT pais_fk FOREIGN KEY (cod_pais) REFERENCES pais(cod_pais)
);

CREATE TABLE sucursal(
    cod_sucursal INTEGER PRIMARY KEY,
    nb_sucursal VARCHAR(30) NOT NULL,
    cod_ciudad INTEGER NOT NULL,
    CONSTRAINT ciudad_fk FOREIGN KEY (cod_ciudad) REFERENCES ciudad(cod_ciudad)   
);

CREATE TABLE tipo_producto(
    cod_tipo_producto INTEGER PRIMARY KEY, 
    nb_tipo_producto VARCHAR(45) NOT NULL UNIQUE CHECK(nb_tipo_producto in ('PRESTACION DE SERVICIOS','PERSONALES', 'DAÑOS O PATRIMONIALES'))
);

CREATE TABLE producto (
    cod_producto INTEGER PRIMARY KEY,
    nb_producto VARCHAR(30) NOT NULL,
    descripcion VARCHAR(100) NOT NULL,
    cod_tipo_producto INTEGER NOT NULL,
    calificacion INTEGER NOT NULL,
    CONSTRAINT tipo_producto_fk FOREIGN KEY(cod_tipo_producto) REFERENCES tipo_producto(cod_tipo_producto) 
);

CREATE TABLE cliente(
    cod_cliente INTEGER PRIMARY KEY,
    nb_cliente VARCHAR(40) NOT NULL,
    ci_rif VARCHAR(10) UNIQUE,
    telefono VARCHAR(12) NOT NULL UNIQUE, 
    dirección VARCHAR(30) NOT NULL, 
    sexo VARCHAR(1) NOT NULL CHECK(sexo in ('M','F')), 
    email VARCHAR(45) NOT NULL UNIQUE,
    cod_sucursal INTEGER NOT NULL,
    CONSTRAINT sucursal_fk FOREIGN KEY (cod_sucursal) REFERENCES sucursal(cod_sucursal)    
);    

CREATE TABLE evaluacion_servicio(
    cod_evaluacion_servicio INTEGER PRIMARY KEY, 
    nb_descripcion VARCHAR(10) NOT NULL CHECK(nb_descripcion in ('MALO','REGULAR','BUENO','MUY BUENO','EXCELENTE'))
); 

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

CREATE TABLE contrato(
    nro_contrato INTEGER PRIMARY KEY,
    descrip_contrato VARCHAR(30) NOT NULL
);

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

CREATE TABLE siniestro(
    nro_siniestro INTEGER PRIMARY KEY, 
    descripcion_siniestro VARCHAR(50) NOT NULL
);

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

    ----------------------------------------------------------INSERTS---------------------------------------------------------------------

    ---------- pais/countries INSERTS -----------------


    INSERT INTO pais (cod_pais, nb_pais) 
    VALUES (1, 'Argentina'), -- 1. Argentina
           (2, 'Bolivia'), -- 2. Bolivia
           (3, 'Brazil'),-- 3. Brazil
           (4, 'Chile'),-- 4. Chile
           (5, 'Colombia'),-- 5. Colombia
           (6, 'Costa Rica'), -- 6. Costa Rica
           (7, 'Cuba'), -- 7. Cuba
           (8, 'Republica Dominicana'), -- 8. Republica Dominicana 
           (9, 'Ecuador'),-- 9. Ecuador
           (10, 'El Salvador');-- 10. El Salvador

----------------ciudad/cities INSERTS-------------------------------------

-- cities for Argentina
INSERT INTO ciudad (cod_ciudad, nb_ciudad, cod_pais)
VALUES (11, 'Buenos Aires', 1),
       (12, 'Córdoba', 1),
       (13, 'Rosario', 1);

-- cities for Bolivia
INSERT INTO ciudad (cod_ciudad, nb_ciudad, cod_pais) 
VALUES (14, 'Sucre', 2),
       (15, 'La Paz', 2),
       (16, 'Santa Cruz de la Sierra', 2);

-- cities for Brazil
INSERT INTO ciudad (cod_ciudad, nb_ciudad, cod_pais) 
VALUES (17, 'Brasilia', 3),
       (18, 'Rio de Janeiro', 3),
       (19, 'São Paulo', 3);

-- cities for Chile
INSERT INTO ciudad (cod_ciudad, nb_ciudad, cod_pais)
VALUES (20, 'Santiago', 4),
       (21, 'Valparaíso', 4),
       (22, 'Concepción', 4);

-- cities for Colombia
INSERT INTO ciudad (cod_ciudad, nb_ciudad, cod_pais) 
VALUES (23, 'Bogotá', 5),
       (24, 'Medellín', 5),
       (25, 'Cali', 5);

-- cities for Costa Rica
INSERT INTO ciudad (cod_ciudad, nb_ciudad, cod_pais) 
VALUES (26, 'San José', 6),
       (27, 'Alajuela', 6),
       (28, 'Liberia', 6);

-- cities for Cuba
INSERT INTO ciudad (cod_ciudad, nb_ciudad, cod_pais) 
VALUES (29, 'La Habana', 7),
       (30, 'Santiago de Cuba', 7),
       (31, 'Camagüey', 7);

-- cities for Republica Dominicana 
INSERT INTO ciudad (cod_ciudad, nb_ciudad, cod_pais) 
VALUES (32, 'Santo Domingo', 8),
       (33, 'Santiago de los Caballeros', 8),
       (34, 'Punta Cana', 8);

-- cities for Ecuador
INSERT INTO ciudad (cod_ciudad, nb_ciudad, cod_pais) 
VALUES (35, 'Quito', 9),
       (36, 'Guayaquil', 9),
       (37, 'Cuenca', 9);

-- cities for El Salvador
INSERT INTO ciudad (cod_ciudad, nb_ciudad, cod_pais) 
VALUES (38, 'San Salvador', 10),
       (39, 'Santa Ana', 10),
       (40, 'San Miguel', 10);


---------------- sucursal/branch INSERTS -------------------------------------------------------



INSERT INTO sucursal (cod_sucursal, nb_sucursal, cod_ciudad)
VALUES (1, 'La Plata', 11), --Branch in Buenos Aires, Argentina
       (2, 'Nueva Córdoba', 12), --Branch in Cordoba, Argentina
       (3, 'Pellegrini', 13),--Branch in Rosario, Argentina
       (4, 'La Recoleta', 14),--Branch in Sucre, Bolivia
       (5, 'El Alto', 15),--Branch in La Paz, Bolivia
       (6, 'Buena Vista', 16),--Branch in Santa Cruz De La Sierra, Bolivia
       (7, 'Plano Piloto', 17),--Branch in Brasilia, Brasil
       (8, 'Barra da Tijuca', 18),--Branch in Rio De Janeiro, Brasil
       (9, 'Itaim Bibi', 19),--Branch in Sao Paulo, Brasil
       (10, 'Metropolitana', 20),--Branch in Santiago, Chile
       (11, 'La Sebastiana', 21),--Branch in Valparaiso, Chile
       (12, 'Nonguén', 22),--Branch in Concepcion, Chile
       (13, 'La Calera', 23),--Branch in Bogota, Colombia
       (14, 'El Poblado', 24),--Branch in Medellin, Colombia
       (15, 'Rio Cauca', 25),--Branch in Cali, Colombia
       (16, 'Uruca', 26),--Branch in San jose, Costa Rica
       (17, 'La Fortuna', 27),--Branch in  Alajuela, Costa Rica 
       (18, 'Moracia', 28),--Branch in Liberia, Costa Rica
       (19, 'Cienaga', 29),--Branch in La Habana, Cuba
       (20, 'El Caney', 30),--Branch in  Santiago de Cuba, Cuba
       (21, 'Puerto Principe', 31),--Branch in Camaguey, Cuba
       (22, 'Cristo Rey', 32),--Branch in Santo Domingo, Republica Dominicana
       (23, 'La Herradura', 33),--Branch in Santiago de los Caballeros, Republica Dominicana 
       (24, 'Verón', 34),--Branch in Punta Cana, Republica Dominicana
       (25, 'Calderon', 35),--Branch in Quito, Ecuador
       (26, 'La Alborada', 36),--Branch Guayaquil, Ecuador
       (27, 'El Batán', 37),--Branch in Cuenca, Ecuador
       (28, 'Cuscatlán', 38),--Branch in San Salvador, El Salvador 
       (29, 'Loma Linda', 39),--Branch Santa Ana, El Salvador
       (30, 'Pacífica', 40);--Branch in San Miguel, El Salvador

       --------INSERTS tipo_producto-------------------------------------------

       
INSERT INTO tipo_producto (cod_tipo_producto, nb_tipo_producto)
VALUES (1,'PRESTACION DE SERVICIOS'),
       (2,'PERSONALES'),
       (3,'DAÑOS O PATRIMONIALES');


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


----------------- cliente INSERTS-------------------------------


----INSERTS are in six branches/sucursales 1-> La Plata, 8-> Barra Da Tijuaca 14-> El Poblado, 19-> Cienaga, 24-> Verón, 30 -> pacífica

INSERT INTO cliente (cod_cliente, nb_cliente, ci_rif, telefono, dirección, sexo, email, cod_sucursal)
VALUES (1, 'Juan Pérez', '123456789', '02125551212', 'Calle Los Claveles', 'M', 'juan.perez@email.com', 1),
       (2, 'María González', '987654321', '04141234567', 'Avenida Libertador', 'F', 'maria.gonzalez@email.com', 14),
       (3, 'Carlos López', '778899001', '02954433221', 'Calle Principal', 'M', 'carlos.lopez@email.com', 19),
       (4, 'Ana Rodríguez', '665544332', '02615544332', 'Avenida Bolívar', 'F', 'ana.rodriguez@email.com', 24),
       (5, 'David Martínez', '556677889', '02412233445', 'Calle Sucre', 'M', 'david.martinez@email.com', 1),
       (6, 'Sandra Flores', '445566778', '02813322110', 'Avenida Las Américas', 'F', 'sandra.flores@email.com', 14),
       (7, 'José García', '334455667', '02744411223', 'Calle Miranda', 'M', 'jose.garcia@email.com', 19),
       (8, 'Isabel Ramírez', '223344556', '02515566778', 'Avenida Libertador', 'F', 'isabel.ramirez@email.com', 24),
       (9, 'Luis Moreno', '112233445', '02398877665', 'Calle Carabobo', 'M', 'luis.moreno@email.com', 1),
       (10, 'Carmen Blanco', '001122334', '02255433221', 'Avenida Venezuela', 'F', 'carmen.blanco@email.com', 14),
       (11, 'Pedro Silva', '000111222', '02519876543', 'Calle Principal', 'M', 'pedro.silva@email.com', 19),
       (12, 'Ana Gómez', '74638212', '04247654321', 'Avenida Libertador', 'F', 'anagomez@email.com', 24),
       (13, 'Carlos Rodríguez', '6432343465', '04165554444', 'Boulevard Central', 'M', 'carlosrod@email.com', 1),
       (14, 'Luisa Martínez', '543532512', '04266667777', 'Sector Este 321', 'F', 'luisamarti@email.com', 14),
       (15, 'David Sánchez', '95780647', '04148888999', 'Residencial Oeste 456', 'M', 'davidsanchez@email.com', 19),
       (16, 'Matías Ramírez', '78901234', '04165678901', 'Calle 19', 'M', 'matias@example.com', 24),
       (17, 'Lucía Torres', '89012345', '04266789012', 'Avenida 20', 'F', 'lucia@example.com', 1),
       (18, 'Daniel Hernández', '90123456', '04147890123', 'Calle 21', 'M', 'daniel@example.com', 14),
       (19, 'Isabella Herrera', '23456789', '04160123456', 'Avenida 14', 'F', 'isabella@example.com', 19),
       (20, 'Javier Pérez', '34567890', '04261234567', 'Calle 15', 'M', 'javier@example.com', 24),
       (21, 'Paul Gamboa', '342321334', '04263476345', 'Avenida Lemus', 'M', 'paulg@example.com', 5),
       (22, 'Eduardo Rumbos', '26543123', '041434100978', 'Calle Venezuela', 'M', 'edurum@example.com', 5),
       (23, 'David Roldan', '324976345', '04161230984', 'Avenida Esequibo', 'M', 'davidr@example.com', 5),
       (24, 'Luigi Bastidas', '342452542', '0426785423', 'Calle Brazil', 'M', 'Luigib@example.com', 5),
       (25, 'Alfonso Blanco', '28938210', '04261932245', 'Calle Barinas', 'M', 'aalfonso@example.com', 8),
       (26, 'Roseilyn Mederos', '23984564', '042612674534', 'Calle montalban', 'F', 'rrmederos@example.com', 8),
       (27, 'Sebastian Diaz', '20324123', '0424431311', 'Calle Argentina', 'M', 'sebasdi@example.com', 8),
       (28, 'Nelson Delgado', '230982123', '04262309555', 'Calle San Martin', 'M', 'ndelgado@example.com', 8),
       (29, 'Maria Fuentes', '12341123', '04247843190', 'Calle La Vega', 'F', 'marfuen@example.com', 30),
       (30, 'Sofia Padron ', '534567823', '04149673091', 'Calle El Dorado', 'F', 'sofpad@example.com', 30);

---------------------- INSERTS for evaluacion_servicio---------

INSERT INTO evaluacion_servicio( cod_evaluacion_servicio,nb_descripcion)
VALUES(1,'MALO'),
      (2,'REGULAR'),
      (3,'BUENO'),
      (4,'MUY BUENO'),
      (5,'EXCELENTE');


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


----------------INSERTs for contrato-----------------------------

INSERT INTO contrato (nro_contrato, descrip_contrato)
VALUES (1, 'Contrato de seguro de vida'),
       (2, 'Contrato de seguro de vida'),
       (3, 'Contrato de seguro de vida'),
       (4, 'Contrato accid. personales.'),
       (5, 'Contrato accid. personales.'),
       (6, 'Contrato accid. personales.'),
       (7, 'contrato de seguro de salud'),
       (8, 'contrato de seguro de salud'),
       (9, 'contrato de seguro de salud'),
       (10, 'contrato de invalidez.'),
       (11, 'contrato de invalidez.'),
       (12, 'contrato de invalidez.'),
       (13, 'Contrato de seguro de hogar'),
       (14, 'Contrato de seguro de hogar'),
       (15, 'contrato de seguro de hogar'),
       (16, 'contrato de seguro de auto'),
       (17, 'contrato de seguro de auto'),
       (18, 'contrato de seguro de auto'),
       (19, 'contrato de seguro de viaje'),
       (20, 'contrato de seguro de viaje'),
       (21, 'Contrato de seguro de viaje'),
       (22, 'Contrato de respons. civil'),
       (23, 'Contrato de respons. civil'),
       (24, 'Contrato de respons. civil'),
       (25, 'contrato de asist. en via'),
       (26, 'contrato de asist. en via'),
       (27, 'contrato de asist. en via'),
       (28, 'contrato asist. legal'),
       (29, 'contrato asist. legal'),
       (30, 'contrato asist. legal'),
       (31, 'contrato de seguro de decesos'),
       (32, 'contrato de seguro de decesos'),
       (33, 'contrato de seguro de decesos');


----------------INSERTs for registro_contrato-----------------------------

INSERT INTO registro_contrato(nro_contrato,cod_producto,cod_cliente, fecha_inicio, fecha_fin, monto,estado_contrato)
VALUES(1,1,1,'2024-06-06','2025-06-06',5000,'ACTIVO'),
      (2,1,2,'2023-12-25','2024-12-25',5000,'VENCIDO'),
      (3,1,3,'2024-05-14','2025-05-14',4500,'ACTIVO'),
      (4,2,4,'2022-03-06','2023-03-06',2000,'VENCIDO'),
      (5,2,5,'2023-12-25','2024-12-25',2000,'VENCIDO'),
      (6,2,6,'2024-05-14','2025-05-14',2500,'ACTIVO'),
      (7,3,7,'2024-01-01','2025-01-01',6000,'SUSPENDIDO'),
      (8,3,8,'2020-02-01','2021-02-01',6200,'VENCIDO'),
      (9,3,9,'2021-02-18','2022-02-18',6500,'VENCIDO'),
      (10,4,10,'2024-04-21','2025-04-21',1500,'ACTIVO'),
      (11,4,11,'2023-12-20','2024-12-20',2500,'ACTIVO'),
      (12,4,12,'2020-11-21','2021-11-21',3500,'VENCIDO'),
      (13,5,13,'2020-10-15','2021-10-15',8000,'VENCIDO'),
      (14,5,14,'2024-01-05','2025-01-05',7500,'ACTIVO'),
      (15,5,15,'2024-03-21','2025-03-21',8500,'SUSPENDIDO'),
      (16,6,16,'2021-04-01','2022-04-01',13500,'VENCIDO'),
      (17,6,17,'2022-07-24','2023-07-24',12000,'VENCIDO'),
      (18,6,18,'2024-01-25','2025-01-25',13000,'ACTIVO'),
      (19,7,19,'2023-11-08','2024-11-08',5000,'ACTIVO'),
      (20,7,20,'2022-12-01','2023-12-01',5000,'VENCIDO'),
      (21,7,21,'2024-02-01','2025-02-01',5100,'ACTIVO'),
      (22,8,22,'2021-07-07','2022-07-07',8000,'VENCIDO'),
      (23,8,23,'2023-01-03','2024-01-03',9000,'VENCIDO'),
      (24,8,24,'2024-03-17','2025-03-17',12000,'SUSPENDIDO'),
      (25,9,25,'2023-11-13','2024-11-13',7500,'SUSPENDIDO'),
      (26,9,26,'2022-10-10','2023-10-10',3200,'VENCIDO'),
      (27,9,27,'2023-09-08','2024-09-08',8900,'ACTIVO'),
      (28,10,28,'2024-05-11','2025-05-12',10000,'ACTIVO'),
      (29,10,29,'2020-02-10','2021-02-10',2500,'VENCIDO'),
      (30,10,30,'2023-09-08','2024-09-08',3750,'ACTIVO'),
      (31,11,1,'2022-03-10','2023-03-10',4500,'VENCIDO'),
      (32,11,15,'2020-07-15','2021-07-14',5050,'VENCIDO'),
      (33,11,30,'2024-03-03','2025-03-03',2500,'VENCIDO');


--------------- INSERTS for siniestro------------------


INSERT INTO siniestro (nro_siniestro, descripcion_siniestro)
VALUES (1, 'Robo'),
       (2, 'Incendio'),
       (3, 'Accidente de tráfico'),
       (4, 'Inundación'),
       (5, 'Daños por animales'),
       (6, 'Terremoto'),
       (7, 'Daños por vandalismo'),
       (8, 'Problemas eléctricos'),
       (9, 'Ciberataques'),
       (10, 'Errores profesionales');


--------------- INSERTS for registro_siniestro------------------


INSERT INTO registro_siniestro(nro_siniestro,nro_contrato,fecha_siniestro,fecha_respuesta,id_rechazo,monto_reconocido,monto_solicitado)
VALUES(1,17,'2022-09-01','2022-09-10','SI',15000,20000),
      (2,15,'2024-06-01','2024-05-05','SI',17000,15000),
      (3,16,'2022-01-15','2022-01-25','NO',0000,25000),
      (4,14,'2024-11-02','2024-11-15','NO',0000,10000),
      (5,7,'2024-10-10','2024-10-17','SI',8500,9000),
      (6,18,'2024-06-03','2024-06-10','SI',12000,22000),
      (7,4,'2022-05-01','2022-05-03','SI',5500,5000),
      (8,13,'2020-12-25','2021-01-15','NO',0000,10000),
      (9,29,'2021-03-17','2021-03-23','NO',0000,7200),
      (10,8,'2020-07-27','2020-08-03','SI',30000,32000);       