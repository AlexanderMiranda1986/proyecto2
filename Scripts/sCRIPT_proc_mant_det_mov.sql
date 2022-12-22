DELIMITER $$
DROP PROCEDURE IF EXISTS db_inventario.`proc_mant_det_mov` $$
CREATE PROCEDURE db_inventario.`proc_mant_det_mov` (
in var_sec_cab int,
in var_cod_producto varchar(10),
in var_cant_producto int,
in var_tip_mov char(1),
OUT var_msj_error varchar(80)
)
BEGIN
  declare var_secuencia_det int;
  set var_secuencia_det = 0;
  if exists(select 1 from db_inventario.inv_det_movimiento where cab_secuencia = var_sec_cab) then
    set var_secuencia_det = (select max(det_secuencia) from db_inventario.inv_det_movimiento
                         where cab_secuencia = var_sec_cab);
  end if;
  set var_secuencia_det = var_secuencia_det + 1;
  
  insert into db_inventario.inv_det_movimiento(cab_secuencia, det_secuencia, prd_codigo,det_cantidad)
  values (var_sec_cab,var_secuencia_det,var_cod_producto, var_cant_producto);
  
  if var_tip_mov = 'I' then
	  set SQL_SAFE_UPDATES=0;
	  UPDATE db_inventario.inv_producto 
		 SET prd_cantidad = prd_cantidad + var_cant_producto
		 WHERE prd_codigo = var_cod_producto;
	   set SQL_SAFE_UPDATES=1;
   else
	  set SQL_SAFE_UPDATES=0;
	  UPDATE db_inventario.inv_producto 
		 SET prd_cantidad = prd_cantidad - var_cant_producto
		 WHERE prd_codigo = var_cod_producto;
	   set SQL_SAFE_UPDATES=1;     
   end if;  
  set var_msj_error = 'REGISTRO DE DETALLE INGRESADO';
END $$
DELIMITER ;
