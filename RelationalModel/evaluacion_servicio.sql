CREATE TABLE evaluacion_servicio(
    cod_evaluacion_servicio INTEGER PRIMARY KEY, 
    nb_descripcion VARCHAR(10) NOT NULL CHECK(nb_descripcion in ('MALO','REGULAR','BUENO','MUY BUENO','EXCELENTE'))
); 


INSERT INTO evaluacion_servicio( cod_evaluacion_servicio,nb_descripcion)
VALUES(1,'MALO'),
      (2,'REGULAR'),
      (3,'BUENO'),
      (4,'MUY BUENO'),
      (5,'EXCELENTE');
