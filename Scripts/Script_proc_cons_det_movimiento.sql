DELIMITER $$
DROP PROCEDURE IF EXISTS db_inventario.`proc_cons_det_movimiento` $$
CREATE PROCEDURE db_inventario.`proc_cons_det_movimiento` (
in var_cab_secuencia int
)
BEGIN
  select a.cab_secuencia, a.det_secuencia, 
	a.prd_codigo as 'Cod. Producto',
	 b.prd_nombre as 'Nom. Producto',
	 a.det_cantidad as 'Cantidad'
	from db_inventario.inv_det_movimiento a inner join db_inventario.inv_producto b
	on a.prd_codigo = b.prd_codigo
	where a.cab_secuencia = var_cab_secuencia 
	order by a.det_secuencia;
  
END $$
DELIMITER ;
