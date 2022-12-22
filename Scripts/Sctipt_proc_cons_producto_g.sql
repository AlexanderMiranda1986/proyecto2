DELIMITER $$
DROP PROCEDURE IF EXISTS db_inventario.`proc_cons_producto` $$
CREATE PROCEDURE db_inventario.`proc_cons_producto` (
in var_consulta varchar(70),
in var_tipo_cons char(1)
)
BEGIN
  IF var_tipo_cons = 'C' then
      select a.prd_codigo, 
			 a.prd_nombre, 
             a.prd_precio, 
             a.prd_cantidad,
             a.est_codigo,
		     b.est_nombre,
             a.tip_codigo,
             c.tip_nombre,
             a.usu_cod_ingresa,
             date_format(a.prd_fecha_ingresa, "%d/%m/%Y") as prd_fecha_ingresa,
             a.usu_cod_modifica,
             date_format(a.prd_fecha_modifica, "%d/%m/%Y") as prd_fecha_modifica
      from db_inventario.inv_producto a 
		inner join db_inventario.inv_estado_prod b on a.est_codigo = b.est_codigo
        inner join db_inventario.inv_tipo_producto c on a.tip_codigo = c.tip_codigo 
	   where prd_codigo LIKE CONCAT ('%', var_consulta, '%');
  END IF;
  
  IF var_tipo_cons = 'N' then
      select a.prd_codigo, 
			 a.prd_nombre, 
             a.prd_precio, 
             a.prd_cantidad,
             a.est_codigo,
		     b.est_nombre,
             a.tip_codigo,
             c.tip_nombre,
             a.usu_cod_ingresa,
             date_format(a.prd_fecha_ingresa, "%d/%m/%Y") as prd_fecha_ingresa,
             a.usu_cod_modifica,
             date_format(a.prd_fecha_modifica, "%d/%m/%Y") as prd_fecha_modifica
      from db_inventario.inv_producto a 
		inner join db_inventario.inv_estado_prod b on a.est_codigo = b.est_codigo
        inner join db_inventario.inv_tipo_producto c on a.tip_codigo = c.tip_codigo 
	   where prd_nombre LIKE CONCAT ('%', var_consulta, '%');
  END IF;
  
  IF var_tipo_cons = 'T' then
      select a.prd_codigo, 
			 a.prd_nombre, 
             a.prd_precio, 
             a.prd_cantidad,
             a.est_codigo,
		     b.est_nombre,
             a.tip_codigo,
             c.tip_nombre,
             a.usu_cod_ingresa,
             date_format(a.prd_fecha_ingresa, "%d/%m/%Y") as prd_fecha_ingresa,
             a.usu_cod_modifica,
             date_format(a.prd_fecha_modifica, "%d/%m/%Y") as prd_fecha_modifica
      from db_inventario.inv_producto a 
		inner join db_inventario.inv_estado_prod b on a.est_codigo = b.est_codigo
        inner join db_inventario.inv_tipo_producto c on a.tip_codigo = c.tip_codigo; 
  END IF;
  
END $$
DELIMITER ;
