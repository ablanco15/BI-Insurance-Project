
CREATE TABLE sucursal(
    cod_sucursal INTEGER PRIMARY KEY,
    nb_sucursal VARCHAR(30) NOT NULL,
    cod_ciudad INTEGER NOT NULL,
    CONSTRAINT ciudad_fk FOREIGN KEY (cod_ciudad) REFERENCES ciudad(cod_ciudad)   
);

---------------- sucursal/branch INSERTS -------------------------------------------------------



INSERT INTO sucursal (cod_sucursal, nb_sucursal, cod_ciudad)
VALUES (1, 'La Plata', 11), --Branch in Buenos Aires
       (2, 'Nueva Córdoba', 12), --Branch in Cordoba
       (3, 'Pellegrini', 13),--Branch in Rosario
       (4, 'La Recoleta', 14),--Branch in Sucre
       (5, 'El Alto', 15),--Branch in La Paz
       (6, 'Buena Vista', 16),--Branch in Santa Cruz De La Sierra
       (7, 'Plano Piloto', 17),--Branch in Brasilia
       (8, 'Barra da Tijuca', 18),--Branch in Rio De Janeiro
       (9, 'Itaim Bibi', 19),--Branch in Sao Paulo
       (10, 'Metropolitana', 20),--Branch in Santiago
       (11, 'La Sebastiana', 21),--Branch in Valparaiso
       (12, 'Nonguén', 22),--Branch in Concepcion
       (13, 'La Calera', 23),--Branch in Bogota
       (14, 'El Poblado', 24),--Branch in Medellin
       (15, 'Rio Cauca', 25),--Branch in Cali
       (16, 'Uruca', 26),--Branch in San jose
       (17, 'La Fortuna', 27),--Branch in  Alajuela 
       (18, 'Moracia', 28),--Branch in Liberia
       (19, 'Cienaga', 29),--Branch in La Habana
       (20, 'El Caney', 30),--Branch in  Santiago de Cuba
       (21, 'Puerto Principe', 31),--Branch in Camaguey
       (22, 'Cristo Rey', 32),--Branch in Santo Domingo
       (23, 'La Herradura', 33),--Branch in Santiago de los Caballeros 
       (24, 'Verón', 34),--Branch in Punta Cana
       (25, 'Calderon', 35),--Branch in Quito
       (26, 'La Alborada', 36),--Branch Guayaquil
       (27, 'El Batán', 37),--Branch in Cuenca
       (28, 'Cuscatlán', 38),--Branch in San Salvador 
       (29, 'Loma Linda', 39),--Branch Santa Ana
       (30, 'Pacífica', 40);--Branch in San Miguel