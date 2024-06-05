CREATE TABLE siniestro(
    nro_siniestro INTEGER PRIMARY KEY, 
    descripcion_siniestro VARCHAR(50) NOT NULL
);


INSERT INTO siniestro (nro_siniestro, descripcion_siniestro)
VALUES (1, 'Robo de vehículo'),
       (2, 'Incendio en vivienda'),
       (3, 'Accidente de tráfico'),
       (4, 'Daños por agua'),
       (5, 'Rotura de cristales');