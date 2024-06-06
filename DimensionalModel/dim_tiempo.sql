create table dim_tiempo(
    sk_dim_tiempo INTEGER PRIMARY KEY,
    cod_annio INTEGER NOT NULL,
    cod_mes INTEGER NOT NULL,
    cod_dia_annio INTEGER NOT NULL,
    cod_dia_mes INTEGER NOT NULL,
    cod_dia_semana varchar(10) NOT NULL,
    cod_semana INTEGER NOT NULL,
    desc_dia_semana varchar(10) NOT NULL,
    desc_dia_semana_corta varchar(5) NOT NULL,
    desc_mes varchar(20) NOT NULL,
    desc_mes_corta varchar(3) NOT NULL, 
    desc_trimestre INTEGER NOT NULL,
    desc_semestre INTEGER NOT NULL,
    fecha_completa DATE NOT NULL
);