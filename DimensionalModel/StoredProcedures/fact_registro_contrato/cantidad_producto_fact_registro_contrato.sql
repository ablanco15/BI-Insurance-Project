CREATE OR REPLACE FUNCTION cantidad_producto_fact_registro_contrato_function()
RETURNS TRIGGER AS $$
DECLARE 
exists_value INTEGER;
BEGIN

    SELECT COUNT(*) INTO STRICT exists_value
    FROM fact_registro_contrato
    WHERE NEW.sk_dim_producto = sk_dim_producto;

    IF (exists_value > 1) THEN
      UPDATE fact_registro_contrato 
      SET cantidad_producto = 0
      WHERE sk_dim_tiempo_fecha_inicio = NEW.sk_dim_tiempo_fecha_inicio AND
            sk_dim_tiempo_fecha_fin = NEW.sk_dim_tiempo_fecha_fin AND
            sk_dim_cliente = NEW.sk_dim_cliente AND
            sk_dim_contrato = NEW.sk_dim_contrato AND
            sk_dim_producto = NEW.sk_dim_producto AND
            sk_dim_estado_contrato = sk_dim_estado_contrato;
    ELSE
      UPDATE fact_registro_contrato 
      SET cantidad_producto = 1
      WHERE sk_dim_tiempo_fecha_inicio = NEW.sk_dim_tiempo_fecha_inicio AND
            sk_dim_tiempo_fecha_fin = NEW.sk_dim_tiempo_fecha_fin AND
            sk_dim_cliente = NEW.sk_dim_cliente AND
            sk_dim_contrato = NEW.sk_dim_contrato AND
            sk_dim_producto = NEW.sk_dim_producto AND
            sk_dim_estado_contrato = sk_dim_estado_contrato;     
    END IF;
    RETURN NEW;
END; 
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER cantidad_producto_fact_registro_contrato_trigger
AFTER INSERT
ON fact_registro_contrato
FOR EACH ROW 
EXECUTE FUNCTION cantidad_producto_fact_registro_contrato_function();
