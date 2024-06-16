CREATE OR REPLACE FUNCTION cantidad_fact_registro_siniestro_function()
RETURNS TRIGGER AS $$
BEGIN
      UPDATE fact_registro_siniestro 
      SET cantidad = 1
      WHERE sk_dim_fecha_siniestro = NEW.sk_dim_fecha_siniestro AND
            sk_dim_fecha_respuesta = NEW.sk_dim_fecha_respuesta AND
            sk_dim_cliente = NEW.sk_dim_cliente AND
            sk_dim_contrato = NEW.sk_dim_contrato AND
            sk_dim_sucursal = new.sk_dim_sucursal AND 
            sk_dim_producto = NEW.sk_dim_producto AND
            sk_dim_siniestro = NEW.sk_dim_siniestro;
    RETURN NEW;
END; 
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER cantidad_fact_registro_siniestro_trigger
AFTER INSERT
ON fact_registro_siniestro
FOR EACH ROW 
EXECUTE FUNCTION cantidad_fact_registro_siniestro_function();
