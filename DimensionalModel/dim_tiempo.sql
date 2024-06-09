create table dim_tiempo(
    sk_dim_tiempo SMALLINT PRIMARY KEY,
    cod_annio SMALLINT NOT NULL,
    cod_mes SMALLINT NOT NULL,
    cod_dia_annio SMALLINT NOT NULL,
    cod_dia_mes SMALLINT NOT NULL,
    cod_dia_semana SMALLINT NOT NULL,
    cod_semana SMALLINT NOT NULL,
    desc_dia_semana varchar(30) NOT NULL,
    desc_dia_semana_corta varchar(5) NOT NULL,
    desc_mes varchar(30) NOT NULL,
    desc_mes_corta varchar(5) NOT NULL, 
    desc_trimestre SMALLINT NOT NULL,
    desc_semestre SMALLINT NOT NULL,
    fecha_completa DATE NOT NULL
);