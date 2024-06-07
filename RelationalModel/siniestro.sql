CREATE TABLE siniestro(
    nro_siniestro INTEGER PRIMARY KEY, 
    descripcion_siniestro VARCHAR(50) NOT NULL
);

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
