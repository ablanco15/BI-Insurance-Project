CREATE OR REPLACE FUNCTION cantidad_fact_evaluacion_servicio_function()
RETURNS TRIGGER AS $$
BEGIN
      UPDATE fact_evaluacion_servicio
      SET cantidad = 1
      WHERE sk_dim_cliente = NEW.sk_dim_cliente AND
            sk_dim_producto = NEW.sk_dim_producto AND
            sk_dim_evaluacion_servicio = NEW.sk_dim_evaluacion_servicio;
    RETURN NEW;
END; 
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER cantidad_fact_evaluacion_servicio_trigger
AFTER INSERT
ON fact_evaluacion_servicio
FOR EACH ROW 
EXECUTE FUNCTION cantidad_fact_evaluacion_servicio_function();

