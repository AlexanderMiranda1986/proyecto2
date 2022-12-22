DELIMITER $$
DROP PROCEDURE IF EXISTS db_inventario.`proc_cons_catalogos` $$
CREATE PROCEDURE db_inventario.`proc_cons_catalogos` (
in var_tipo_cons char(2)
)
BEGIN
  IF var_tipo_cons = 'TP' then
      select tip_codigo, tip_nombre
      from db_inventario.inv_tipo_producto;
  END IF;
  
  IF var_tipo_cons = 'ET' then
      select est_codigo, est_nombre
      from db_inventario.inv_estado_prod;
  END IF;
  
END $$
DELIMITER ;
