DELIMITER $$
DROP PROCEDURE IF EXISTS db_inventario.`proc_cons_cab_movimiento` $$
CREATE PROCEDURE db_inventario.`proc_cons_cab_movimiento` (
in var_fecha_inicio varchar(10),
in var_fecha_fin varchar(10),
in var_tipo_mov char(1)
)
BEGIN
  select cab_secuencia, 
         cab_referencia as 'Referencia', 
         cab_fecha as 'Fecha', 
         usu_codigo as 'Usuario_cabecera' 
   from db_inventario.inv_cab_movimiento
 where cab_fecha >= var_fecha_inicio and var_fecha_fin <= var_fecha_fin
	and cab_tipo = var_tipo_mov;
  
END $$
DELIMITER ;
