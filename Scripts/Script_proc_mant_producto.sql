DELIMITER $$
DROP PROCEDURE IF EXISTS db_inventario.`proc_mant_producto` $$
CREATE PROCEDURE db_inventario.`proc_mant_producto` (
in var_codigo varchar(10),
in var_nombre varchar(70),
in var_tipo_prod varchar(3),
in var_precio numeric(18,2),
in var_estado char(1),
in var_usuario varchar(20),
in var_tipo_reg char(1),
OUT var_cod_error int,
OUT var_msj_error varchar(80)
)
BEGIN
  declare var_fecha date;
  set var_cod_error = 0;
  IF var_tipo_reg = 'I' then
     IF exists(select 1 from inv_producto where prd_codigo = var_codigo)
     then
       set var_msj_error = 'PRODUCTO YA EXISTE';
       set var_cod_error = 1;
     else   
	   set var_fecha = curdate();
       INSERT INTO inv_producto (
        prd_codigo, prd_nombre, tip_codigo,
		prd_precio, prd_cantidad, est_codigo, usu_cod_ingresa,
		prd_fecha_ingresa, usu_cod_modifica, prd_fecha_modifica)
        VALUES (
			var_codigo, var_nombre, var_tipo_prod,
			var_precio, 0,var_estado, var_usuario,
			var_fecha, NULL, NULL);
	    set var_msj_error = 'PRODUCTO REGISTRADO';
     end if;
  END IF;
  
  IF var_tipo_reg = 'U' then
     set var_fecha = curdate();
     set SQL_SAFE_UPDATES=0;
     UPDATE inv_producto 
      SET prd_nombre = var_nombre,
		  tip_codigo = var_tipo_prod,
		  prd_precio = var_precio,
		  est_codigo = var_estado,
		  usu_cod_modifica = var_usuario,
		  prd_fecha_modifica = var_fecha
	 WHERE prd_codigo = var_codigo;
     set SQL_SAFE_UPDATES=1;
	 set var_msj_error = 'PRODUCTO ACTUALIZADO';
  END IF;

  IF var_tipo_reg = 'E' then
     IF exists(select 1 from inv_det_movimiento where prd_codigo = var_codigo)
     then
       set var_msj_error = 'PRODUCTO TIENE MOVIMIENTOS';
       set var_cod_error = 1;
     ELSE
       set SQL_SAFE_UPDATES=0;
       DELETE FROM inv_producto 
	   WHERE prd_codigo = var_codigo;
       set SQL_SAFE_UPDATES=1;
       set var_msj_error = 'PRODUCTO ELIMINADO';
     end if;
  END IF;
  
END $$
DELIMITER ;

