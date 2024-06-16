CREATE TABLE sucursal(
    cod_sucursal INTEGER PRIMARY KEY,
    nb_sucursal VARCHAR(30) NOT NULL,
    cod_ciudad INTEGER NOT NULL,
    CONSTRAINT ciudad_fk FOREIGN KEY (cod_ciudad) REFERENCES ciudad(cod_ciudad)   
);

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
