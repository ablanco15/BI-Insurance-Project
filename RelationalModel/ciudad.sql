CREATE TABLE ciudad (
    cod_ciudad INTEGER PRIMARY KEY,
    nb_ciudad VARCHAR(30) NOT NULL,
    cod_pais INTEGER NOT NULL,
    CONSTRAINT pais_fk FOREIGN KEY (cod_pais) REFERENCES pais(cod_pais)
);

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
