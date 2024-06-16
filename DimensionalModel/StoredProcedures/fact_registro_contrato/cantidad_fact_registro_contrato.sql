CREATE OR REPLACE FUNCTION cantidad_fact_registro_contrato_function()
RETURNS TRIGGER AS $$
DECLARE 
BEGIN
    UPDATE fact_registro_contrato 
    SET cantidad = 1
    WHERE sk_dim_tiempo_fecha_inicio = NEW.sk_dim_tiempo_fecha_inicio AND
          sk_dim_tiempo_fecha_fin = NEW.sk_dim_tiempo_fecha_fin AND
          sk_dim_cliente = NEW.sk_dim_cliente AND
          sk_dim_contrato = NEW.sk_dim_contrato AND
          sk_dim_producto = NEW.sk_dim_producto AND
          sk_dim_estado_contrato = sk_dim_estado_contrato;
    RETURN NEW;
END; 
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER cantidad_fact_registro_contrato_trigger
AFTER INSERT
ON fact_registro_contrato
FOR EACH ROW 
EXECUTE FUNCTION cantidad_fact_registro_contrato_function();
