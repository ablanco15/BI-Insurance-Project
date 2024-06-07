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


       
