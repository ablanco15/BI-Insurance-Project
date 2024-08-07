DROP TABLE IF EXISTS pais,ciudad,sucursal,tipo_producto,producto,cliente,evaluacion_servicio,recomienda,contrato,registro_contrato,siniestro,registro_siniestro,meta_producto CASCADE;

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
    direccion VARCHAR(30) NOT NULL, 
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
    monto DOUBLE PRECISION NOT NULL,
    estado_contrato VARCHAR(25) NOT NULL CHECK(estado_contrato IN ('ACTIVO','VENCIDO','SUSPENDIDO')),
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
    monto_reconocido NUMERIC NOT NULL, 
    monto_solicitado NUMERIC NOT NULL,
    CONSTRAINT contrato_fk FOREIGN KEY(nro_contrato) REFERENCES contrato(nro_contrato),
    CONSTRAINT siniestro_fk FOREIGN KEY(nro_siniestro) REFERENCES siniestro(nro_siniestro),
    CONSTRAINT registro_siniestro_pk PRIMARY KEY(nro_siniestro,nro_contrato) 
    );

CREATE TABLE meta_producto(
    cod_producto INTEGER NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    meta_renovacion INTEGER NOT NULL,
    meta_asegurados INTEGER NOT NULL,
    ingresos_estimados NUMERIC NOT NULL,
    CONSTRAINT producto_fk FOREIGN KEY (cod_producto) REFERENCES producto(cod_producto),
    CONSTRAINT meta_producto_pk PRIMARY KEY (cod_producto,fecha_inicio,fecha_fin) 
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

INSERT INTO cliente (cod_cliente, nb_cliente, ci_rif, telefono, direccion, sexo, email, cod_sucursal)
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
       (30, 'Sofia Padron ', '534567823', '04149673091', 'Calle El Dorado', 'F', 'sofpad@example.com', 30),
       (31, 'María Rodríguez', '987654322', '04125551213', 'Avenida Bolívar', 'F', 'maria.rodriguez@email.com', 2),
       (32, 'Carlos Gómez', '456789123', '04125551214', 'Calle Los Jazmines', 'M', 'carlos.gomez@email.com', 3),
       (33, 'Laura López', '321654987', '02125551215', 'Avenida Principal', 'F', 'laura.lopez@email.com', 4),
       (34, 'Pedro Fernández', '789456123', '04245551216', 'Calle Los Girasoles', 'M', 'pedro.fernandez@email.com', 5),
       (35, 'Ana Ramírez', '654987321', '04125551217', 'Avenida Bolívar', 'F', 'ana.ramirez@email.com', 5),
       (36, 'Luis González', '456123789', '02125551218', 'Calle Los Claveles', 'M', 'luis.gonzalez@email.com', 7),
       (37, 'Marta Guzmán', '321789654', '04245551219', 'Avenida Principal', 'F', 'marta.guzman@email.com', 8),
       (38, 'Jorge Castillo', '789123456', '04125551220', 'Calle Los Jazmines', 'M', 'jorge.castillo@email.com', 9),
       (39, 'Marcela Paredes', '987321655', '02125551221', 'Calle Los Claveles', 'F', 'marcela.paredes@email.com', 10),
       (40, 'Ricardo Sánchez', '654789321', '04125551222', 'Avenida Principal', 'M', 'ricardo.sanchez@email.com', 12),
       (41, 'Isabel Torres', '321456987', '02125551223', 'Calle Los Jazmines', 'F', 'isabel.torres@email.com', 13),
       (42, 'Andrés Mendoza', '789654123', '04245551224', 'Calle Los Girasoles', 'M', 'andres.mendoza@email.com', 11),
       (43, 'Carolina Vargas', '987123654', '04125551225', 'Avenida Bolívar', 'F', 'carolina.vargas@email.com', 12),
       (44, 'Héctor Castro', '456321789', '02125551226', 'Calle Los Claveles', 'M', 'hector.castro@email.com', 23),
       (45, 'Gabriela Morales', '321987456', '04245551227', 'Avenida Principal', 'F', 'gabriela.morales@email.com', 21),
       (46, 'Roberto Hernández', '789654321', '04125551228', 'Calle Los Jazmines', 'M', 'roberto.hernandez@email.com', 22),
       (47, 'Silvia Castro', '987456321', '02125551229', 'Calle Los Claveles', 'F', 'silvia.castro@email.com', 23),
       (48, 'Pedro López', '456321987', '04245551230', 'Avenida Bolívar', 'M', 'pedro.lopez@email.com', 11),
       (49, 'María Fernández', '321987654', '04125551231', 'Calle Los Girasoles', 'F', 'maria.fernandez@email.com', 25),
       (50, 'Juan Torres', '789654987', '02125551232', 'Avenida Principal', 'M', 'juan.torres@email.com', 26),
       (51, 'Laura García', '987123456', '04245551233', 'Calle Los Jazmines', 'F', 'laura.garcia@email.com', 27),
       (52, 'Carlos Mendoza', '456789321', '04125551234', 'Calle Los Claveles', 'M', 'carlos.mendoza@email.com', 28),
       (53, 'María Torres', '321456988', '02125551235', 'Avenida Bolívar', 'F', 'maria.torres@email.com', 30),
       (54, 'José Ramírez', '789654122', '04245551236', 'Calle Los Girasoles', 'M', 'jose.ramirez@email.com', 10),
       (55, 'Ana Pérez', '987321654', '04125551237', 'Avenida Principal', 'F', 'ana.perez@email.com', 20);
 
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
       (33, 'contrato de seguro de decesos'),
       (34, 'contrato de seguro de decesos'),
       (35, 'Contrato de seguro de vida'),
       (36, 'Contrato de seguro de vida'),
       (37, 'Contrato de seguro de vida'),
       (38, 'Contrato de seguro de vida'),
       (39, 'Contrato de seguro de vida'),
       (40, 'Contrato accid. personales.'),
       (41, 'Contrato accid. personales.'),
       (42, 'Contrato accid. personales.'),
       (43, 'Contrato accid. personales.'),
       (44, 'Contrato accid. personales.'),
       (45, 'contrato de seguro de salud'),
       (46, 'contrato de seguro de salud'),
       (47, 'contrato de seguro de salud'),
       (48, 'contrato de seguro de salud'),
       (49, 'contrato de seguro de salud'),
       (50, 'contrato de invalidez.'),
       (51, 'contrato de invalidez.'),
       (52, 'contrato de invalidez.'),
       (53, 'contrato de invalidez'),
       (54, 'contrato de invalidez'),
       (55, 'Contrato de seguro de hogar'),
       (56, 'Contrato de seguro de hogar'),
       (57, 'contrato de seguro de hogar'),
       (58, 'Contrato de seguro de hogar'),
       (59, 'contrato de seguro de hogar'),
       (60, 'contrato de seguro de auto'),
       (61, 'contrato de seguro de auto'),
       (62, 'contrato de seguro de auto'),
       (63, 'contrato de seguro de auto'),
       (64, 'contrato de seguro de auto'),
       (65, 'contrato de seguro de auto'),
       (66, 'contrato de seguro de viaje'),
       (67, 'contrato de seguro de viaje'),
       (68, 'Contrato de seguro de viaje'),
       (69, 'contrato de seguro de viaje'),
       (70, 'contrato de seguro de viaje'),
       (71, 'Contrato de respons. civil'),
       (72, 'Contrato de respons. civil'),
       (73, 'Contrato de respons. civil'),
       (74, 'Contrato de respons. civil'),
       (75, 'Contrato de respons. civil'),
       (76, 'contrato de asist. en via'),
       (77, 'contrato de asist. en via'),
       (78, 'contrato de asist. en via'),
       (79, 'contrato de asist. en via'),
       (80, 'contrato de asist. en via'),
       (81, 'contrato asist. legal'),
       (82, 'contrato asist. legal'),
       (83, 'contrato asist. legal'),
       (84, 'contrato asist. legal'),
       (85, 'contrato asist. legal'),
       (86, 'contrato de seguro de decesos'),
       (87, 'contrato de seguro de decesos'),
       (88, 'contrato de seguro de decesos'),
       (89, 'contrato de seguro de decesos'),
       (90, 'contrato de seguro de decesos'),
       (91, 'Contrato de seguro de vida'),
       (92, 'Contrato de seguro de vida'),
       (93, 'Contrato de seguro de vida'),
       (94, 'Contrato accid. personales.'),
       (95, 'Contrato accid. personales.'),
       (96, 'Contrato accid. personales.'),
       (97, 'contrato de seguro de salud'),
       (98, 'contrato de seguro de salud'),
       (99, 'contrato de seguro de salud'),
       (100, 'contrato de invalidez.'),
       (101, 'contrato de invalidez.'),
       (102, 'contrato de invalidez.'),
       (103, 'Contrato de seguro de hogar'),
       (104, 'Contrato de seguro de hogar'),
       (105, 'contrato de seguro de hogar'),
       (106, 'contrato de seguro de auto'),
       (107, 'contrato de seguro de auto'),
       (108, 'contrato de seguro de auto'),
       (109, 'contrato de seguro de viaje'),
       (110, 'contrato de seguro de viaje'),
       (111, 'Contrato de seguro de viaje'),
       (112, 'Contrato de respons. civil'),
       (113, 'Contrato de respons. civil'),
       (114, 'Contrato de respons. civil'),
       (115, 'contrato de asist. en via'),
       (116, 'contrato de asist. en via'),
       (117, 'contrato de asist. en via'),
       (118, 'contrato asist. legal'),
       (119, 'contrato asist. legal'),
       (120, 'contrato asist. legal'),
       (121, 'contrato de seguro de decesos'),
       (122, 'contrato de seguro de decesos'),
       (123, 'contrato de seguro de decesos'),
       (124, 'contrato de seguro de decesos'),
       (125, 'Contrato de seguro de vida'),
       (126, 'Contrato de seguro de vida'),
       (127, 'Contrato de seguro de vida'),
       (128, 'Contrato accid. personales.'),
       (129, 'Contrato accid. personales.'),
       (130, 'Contrato accid. personales.'),
       (131, 'Contrato accid. personales.'),
       (132, 'contrato de seguro de salud'),
       (133, 'contrato de seguro de salud'),
       (134, 'contrato de seguro de salud'),
       (135, 'contrato de invalidez.'),
       (136, 'Contrato de seguro de hogar'),
       (137, 'Contrato de seguro de hogar'),
       (138, 'contrato de seguro de hogar'),
       (139, 'contrato de seguro de auto'),
       (140, 'contrato de seguro de auto'),
       (141, 'contrato de seguro de auto'),
       (142, 'contrato de seguro de viaje'),
       (143, 'contrato de seguro de viaje'),
       (144, 'Contrato de seguro de viaje'),
       (145, 'Contrato de respons. civil'),
       (146, 'Contrato de respons. civil'),
       (147, 'Contrato de respons. civil'),
       (148, 'contrato de asist. en via'),
       (149, 'contrato de asist. en via'),
       (150, 'contrato de asist. en via');


----------------INSERTs for registro_contrato-----------------------------

INSERT INTO registro_contrato(nro_contrato,cod_producto,cod_cliente, fecha_inicio, fecha_fin, monto,estado_contrato)
VALUES(1,1,1,'2024-05-06','2025-05-06',5000,'ACTIVO'),
      (2,1,2,'2023-12-25','2024-12-25',5000,'VENCIDO'),
      (3,1,3,'2024-05-14','2025-05-14',4500,'ACTIVO'),
      (4,2,4,'2022-03-06','2023-03-06',2000,'VENCIDO'),
      (5,2,5,'2023-12-25','2024-12-25',2000,'VENCIDO'),
      (6,2,6,'2024-05-07','2025-05-07',2500,'ACTIVO'),
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
      (33,11,30,'2024-03-03','2025-03-03',2500,'VENCIDO'),
      (34,11,15,'2020-07-18','2021-07-18',5050,'SUSPENDIDO'),
      (35,1,30,'2020-06-07','2021-06-07',5550,'VENCIDO'),
      (36,1,29,'2021-12-23','2022-12-23',5030,'SUSPENDIDO'),
      (37,1,28,'2021-06-13','2022-06-13',4580,'SUSPENDIDO'),
      (38,1,27,'2020-05-06','2021-05-06',5120,'VENCIDO'),
      (39,1,26,'2020-11-20','2021-11-20',5450,'VENCIDO'),
      (40,2,25,'2021-07-10','2022-07-10',4555,'SUSPENDIDO'),
      (41,2,24,'2020-06-07','2021-06-07',5580,'VENCIDO'),
      (42,2,23,'2021-08-19','2022-08-19',5070,'SUSPENDIDO'),
      (43,2,22,'2021-01-10','2022-01-10',4680,'SUSPENDIDO'),
      (44,2,21,'2020-10-04','2021-10-04',5520,'VENCIDO'),
      (45,3,20,'2021-02-11','2022-02-11',4255,'SUSPENDIDO'),
      (46,3,19,'2020-05-05','2021-05-05',5540,'VENCIDO'),
      (47,3,18,'2021-03-29','2022-03-29',5230,'SUSPENDIDO'),
      (48,3,17,'2021-02-11','2022-02-11',4120,'SUSPENDIDO'),
      (49,3,16,'2020-12-02','2021-12-02',5540,'VENCIDO'),
      (50,4,15,'2021-03-12','2022-03-12',4243,'SUSPENDIDO'),
      (51,4,14,'2020-05-07','2021-05-07',5512,'VENCIDO'),
      (52,4,13,'2021-04-22','2022-04-22',5211,'SUSPENDIDO'),
      (53,4,12,'2021-05-12','2022-05-12',4145,'SUSPENDIDO'),
      (54,4,11,'2020-11-08','2021-11-08',5230,'VENCIDO'),
      (55,5,10,'2021-03-10','2022-03-10',4545,'SUSPENDIDO'),
      (56,5,9,'2020-05-05','2021-05-05',5230,'VENCIDO'),
      (57,5,8,'2021-03-29','2022-03-29',5250,'SUSPENDIDO'),
      (58,5,7,'2021-03-11','2022-03-11',4123,'SUSPENDIDO'),
      (59,5,6,'2020-12-02','2021-12-02',5521,'VENCIDO'),
      (60,6,5,'2021-10-11','2022-10-11',4315,'SUSPENDIDO'),
      (61,6,4,'2020-03-07','2021-03-07',5520,'VENCIDO'),
      (62,6,3,'2021-01-12','2022-01-12',5110,'SUSPENDIDO'),
      (63,6,2,'2021-09-08','2022-09-08',4543,'SUSPENDIDO'),
      (64,6,1,'2020-07-03','2021-07-03',5111,'VENCIDO'),
      (65,6,1,'2021-12-18','2022-12-18',5545,'SUSPENDIDO'),
      (66,7,2,'2020-03-19','2021-03-19',4230,'VENCIDO'),
      (67,7,2,'2020-03-19','2021-03-19',4230,'VENCIDO'),
      (68,7,3,'2021-04-25','2022-04-25',6250,'SUSPENDIDO'),
      (69,7,4,'2021-04-14','2022-04-14',5123,'SUSPENDIDO'),
      (70,7,5,'2020-12-02','2021-12-02',5000,'VENCIDO'),
      (71,8,6,'2021-05-11','2022-05-11',4000,'SUSPENDIDO'),
      (72,8,7,'2020-06-10','2021-06-10',5300,'VENCIDO'),
      (73,8,8,'2021-07-14','2022-07-14',5289,'SUSPENDIDO'),
      (74,8,9,'2021-04-12','2022-04-12',4000,'SUSPENDIDO'),
      (75,8,10,'2020-01-03','2021-01-03',5123,'VENCIDO'),
      (76,9,11,'2021-04-11','2022-04-11',5545,'SUSPENDIDO'),
      (77,9,12,'2020-06-07','2021-06-07',6000,'VENCIDO'),
      (78,9,13,'2021-05-28','2022-05-28',6250,'SUSPENDIDO'),
      (79,9,14,'2021-04-13','2022-04-13',4130,'SUSPENDIDO'),
      (80,9,15,'2020-11-05','2021-11-05',5550,'VENCIDO'),
      (81,10,16,'2021-04-14','2022-04-14',4500,'SUSPENDIDO'),
      (82,10,17,'2020-03-08','2021-03-08',5200,'VENCIDO'),
      (83,10,18,'2021-01-20','2022-01-20',5200,'SUSPENDIDO'),
      (84,10,19,'2021-02-07','2022-02-07',4000,'SUSPENDIDO'),
      (85,10,20,'2020-12-12','2021-12-12',5100,'VENCIDO'),
      (86,11,21,'2021-04-08','2022-04-08',4545,'SUSPENDIDO'),
      (87,11,22,'2020-02-07','2021-02-07',5330,'VENCIDO'),
      (88,11,23,'2021-05-28','2022-05-28',5399,'SUSPENDIDO'),
      (89,11,24,'2021-03-11','2022-03-11',4150,'SUSPENDIDO'),
      (90,11,25,'2020-11-11','2021-11-11',5510,'VENCIDO'),
      (91,2,32,'2018-07-11','2020-07-11',7200,'SUSPENDIDO'),
      (92,3,33,'2018-11-05','2019-11-05',1950,'VENCIDO'),
      (93,1,34,'2019-02-20','2020-02-20',4800,'VENCIDO'),
      (94,2,35,'2019-06-04','2020-06-04',6100,'VENCIDO'),
      (95,3,36,'2019-10-09','2020-10-09',2550,'SUSPENDIDO'),
      (96,1,37,'2020-01-23','2021-01-23',8900,'VENCIDO'),
      (97,2,38,'2020-05-07','2021-05-07',5300,'VENCIDO'),
      (98,3,39,'2020-09-11','2021-09-11',3200,'VENCIDO'),
      (99,1,40,'2018-04-17','2019-04-17',6400,'VENCIDO'),
      (100,2,41,'2018-08-10','2019-08-10',9300,'VENCIDO'),
      (101,3,42,'2018-12-04','2019-12-04',4650,'SUSPENDIDO'),
      (102,1,43,'2019-03-19','2020-03-19',7100,'VENCIDO'),
      (103,2,44,'2019-07-13','2020-07-13',2900,'VENCIDO'),
      (104,3,45,'2019-11-07','2020-11-07',8700,'VENCIDO'),
      (105,1,46,'2020-02-21','2021-02-21',1200,'VENCIDO'),
      (106,2,47,'2020-06-05','2021-06-05',4500,'VENCIDO'),
      (107,3,48,'2020-10-10','2021-10-10',6200,'SUSPENDIDO'),
      (108,1,49,'2018-05-15','2019-05-15',5800,'VENCIDO'),
      (109,2,50,'2018-09-09','2019-09-09',8100,'VENCIDO'),
      (120,3,51,'2019-01-08','2020-01-08',3400,'VENCIDO'),
      (121,1,52,'2019-04-18','2020-04-18',9000,'VENCIDO'),
      (122,2,53,'2019-08-12','2020-08-12',1500,'VENCIDO'),
      (123,3,54,'2019-12-06','2020-12-06',7400,'SUSPENDIDO'),
      (124,11,55, '2018-05-06', '2019-05-06', 5000,'VENCIDO'),
      (125,10,49, '2018-07-12', '2019-07-12', 6000,'VENCIDO'),
      (126,9,40, '2018-10-18', '2019-10-18', 4500,'VENCIDO'),
      (127,8,41, '2019-02-24', '2020-02-24', 5500,'VENCIDO'),
      (128,7,32, '2019-06-30', '2020-06-30', 4000,'SUSPENDIDO'),
      (129,6,33, '2019-09-05', '2020-09-05', 4800,'VENCIDO'),
      (130,5,34, '2020-01-11', '2021-01-11', 5200,'SUSPENDIDO'),
      (131,4,45, '2020-04-17', '2021-04-17', 5900,'VENCIDO'),
      (132,3,46, '2020-07-23', '2021-07-23', 4300,'SUSPENDIDO'),
      (133,2,47, '2020-10-29', '2021-10-29', 5100,'SUSPENDIDO'),
      (134,1,48, '2018-02-04', '2019-02-04', 4700,'VENCIDO'),
      (135,11,39, '2018-05-12', '2019-05-12', 5400,'VENCIDO'),
      (136,10,30, '2018-05-06', '2019-05-06', 5000,'SUSPENDIDO'),
      (137,9,31, '2018-07-12', '2019-07-12', 6000,'VENCIDO'),
      (138,8,32, '2018-10-18', '2019-10-18', 4500,'SUSPENDIDO'),
      (139,7,33, '2019-02-24', '2020-02-24', 5500,'VENCIDO'),
      (140,6,34, '2019-06-30', '2020-06-30', 4000,'SUSPENDIDO'),
      (141,4,35, '2019-09-05', '2020-09-05', 4800,'VENCIDO'),
      (142,4,36, '2020-01-11', '2021-01-11', 5200,'SUSPENDIDO'),
      (143,8,37, '2020-04-17', '2021-04-17', 5900,'VENCIDO'),
      (144,9,38, '2020-07-23', '2021-07-23', 4300,'SUSPENDIDO'),
      (145,1,39, '2020-10-29', '2021-10-29', 5100,'VENCIDO'),
      (146,1,40, '2021-02-04', '2022-02-04', 4700,'SUSPENDIDO'),
      (147,5,41, '2021-05-12', '2022-05-12', 5400,'VENCIDO'),
      (148,5,42, '2018-05-06', '2019-05-06', 5000,'SUSPENDIDO'),
      (149,4,43, '2018-07-12', '2019-07-12', 6000,'VENCIDO'),
      (150,9,44, '2018-10-18', '2019-10-18', 4500,'SUSPENDIDO');
      


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
      (2,15,'2024-06-01','2024-06-05','SI',17000,15000),
      (3,16,'2022-01-15','2022-01-25','NO',0000,25000),
      (4,14,'2024-11-02','2024-11-15','NO',0000,10000),
      (5,7,'2024-10-10','2024-10-17','SI',8500,9000),
      (6,18,'2024-06-03','2024-06-10','SI',12000,22000),
      (7,4,'2022-05-01','2022-05-03','SI',5500,5000),
      (8,13,'2020-12-25','2021-01-15','NO',0000,10000),
      (9,29,'2021-03-17','2021-03-23','NO',0000,7200),
      (10,8,'2020-07-27','2020-08-03','SI',30000,32000);       


      ------------------ inserts for metas_productos---------------------


INSERT INTO meta_producto(cod_producto, fecha_inicio, fecha_fin, meta_renovacion, meta_asegurados, ingresos_estimados)
VALUES(1, '2021-01-01','2021-12-31',10,5, 200),
      (2, '2021-01-01','2021-12-31',12,6, 1300),
      (3, '2021-01-01','2021-12-31',8, 4, 400),
      (4, '2021-01-01','2021-12-31',5, 3, 300),
      (5, '2021-01-01','2021-12-31',3, 2, 100),
      (6, '2021-01-01','2021-12-31',2, 1, 800),
      (7, '2021-01-01','2021-12-31',7, 4, 600),
      (8, '2021-01-01','2021-12-31',8, 4, 2500),
      (9, '2021-01-01','2021-12-31',13,7, 2000),
      (10,'2021-01-01','2021-12-31',10,5, 500),
      (11,'2021-01-01','2021-12-31',9, 5, 1000),
      (1, '2022-01-01','2022-12-31',4 ,2, 500),
      (2, '2022-01-01','2022-12-31',7, 4, 980),
      (3, '2022-01-01','2022-12-31',6, 3, 1500),
      (4, '2022-01-01','2022-12-31',3, 2, 3000),
      (5, '2022-01-01','2022-12-31',4, 2, 300),
      (6, '2022-01-01','2022-12-31',10,5, 150),
      (7, '2022-01-01','2022-12-31',12,6, 280),
      (8, '2022-01-01','2022-12-31',11,6, 100),
      (9, '2022-01-01','2022-12-31',8 ,4, 1900),
      (10,'2022-01-01','2022-12-31',9 ,5, 700),
      (11,'2022-01-01','2022-12-31',10,5, 250),
      (1, '2023-01-01','2023-12-31',9 ,5, 200),
      (2, '2023-01-01','2023-12-31',8, 4, 1300),
      (3, '2023-01-01','2023-12-31',4, 2, 400),
      (4, '2023-01-01','2023-12-31',7, 4, 300),
      (5, '2023-01-01','2023-12-31',8, 4, 100),
      (6, '2023-01-01','2023-12-31',11,10,800),
      (7, '2023-01-01','2023-12-31',13,7, 600),
      (8, '2023-01-01','2023-12-31',10,5, 2500),
      (9, '2023-01-01','2023-12-31',7 ,4, 2000),
      (10,'2023-01-01','2023-12-31',9 ,5, 500),
      (11,'2023-01-01','2023-12-31',11,6, 1000),
      (1, '2024-01-01','2024-12-31',8, 4, 1200),
      (2, '2024-01-01','2024-12-31',6, 3, 500),
      (3, '2024-01-01','2024-12-31',4, 2, 400),
      (4, '2024-01-01','2024-12-31',9, 5, 300),
      (5, '2024-01-01','2024-12-31',6, 3, 250),
      (6, '2024-01-01','2024-12-31',8, 4, 800),
      (7, '2024-01-01','2024-12-31',7, 4, 600),
      (8, '2024-01-01','2024-12-31',4, 2, 2500),
      (9, '2024-01-01','2024-12-31',10,5, 1500),
      (10,'2024-01-01','2024-12-31',5 ,3, 2500),
      (11,'2024-01-01','2024-12-31',3, 2, 3000);