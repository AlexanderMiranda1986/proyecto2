DELIMITER $$
DROP PROCEDURE IF EXISTS db_inventario.`proc_cons_usuario` $$
CREATE PROCEDURE db_inventario.`proc_cons_usuario` (
in var_usuario varchar(20),
in var_clave varchar(50),
OUT var_cod_consulta int
)
BEGIN
  set var_cod_consulta = 0;
  IF exists(select 1 from db_inventario.inv_usuario
		    where usu_codigo = var_usuario and usu_clave = var_clave)
  then
     set var_cod_consulta = 1;
  end if;
END $$
DELIMITER ;