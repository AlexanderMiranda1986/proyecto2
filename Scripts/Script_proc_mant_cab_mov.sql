DELIMITER $$
DROP PROCEDURE IF EXISTS db_inventario.`proc_mant_cab_mov` $$
CREATE PROCEDURE db_inventario.`proc_mant_cab_mov` (
in var_referencia varchar(20),
in var_fecha varchar(10),
in var_tipo char(1),
in var_usuario varchar(20),
OUT var_secuencia int,
OUT var_msj_error varchar(80)
)
BEGIN
  if exists(select 1 from db_inventario.inv_cab_movimiento) then
    set var_secuencia = (select max(cab_secuencia) from db_inventario.inv_cab_movimiento);
    set var_secuencia = var_secuencia + 1;
  else
    set var_secuencia  = 1;
  end if;
  
  insert into db_inventario.inv_cab_movimiento(cab_secuencia, cab_referencia, cab_fecha,
											   cab_tipo, usu_codigo)
  values (var_secuencia,var_referencia,var_fecha, var_tipo, var_usuario);
  set var_msj_error = 'REGISTRO DE CABECERA INGFRESDO';
END $$
DELIMITER ;

