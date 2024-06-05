CREATE TABLE pais(
    cod_pais INTEGER PRIMARY KEY,
    nb_pais VARCHAR(20) NOT NULL UNIQUE
);
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
