
drop table db_inventario.inv_producto;

create table db_inventario.inv_producto (
prd_codigo varchar(10),
prd_nombre varchar(70),
tip_codigo varchar(3),
prd_precio numeric(18,2),
prd_cantidad int,
est_codigo char(1),
usu_cod_ingresa varchar(20),
prd_fecha_ingresa date,
usu_cod_modifica varchar(20),
prd_fecha_modifica date
);

drop table db_inventario.inv_tipo_producto;

create table db_inventario.inv_tipo_producto (
tip_codigo varchar(3),
tip_nombre varchar(60)
);

create table db_inventario.inv_estado_prod (
est_codigo char(1),
est_nombre varchar(20)
);

create table db_inventario.inv_usuario (
usu_codigo varchar(20),
usu_nombre varchar(50),
usu_apellido varchar(50),
usu_clave varchar(50),
usu_email varchar(30),
usu_estado char(1),
usu_fecha_ingreso datetime
);

create table db_inventario.inv_cab_movimiento (
cab_secuencia int,
cab_referencia varchar(20),
cab_fecha datetime,
cab_tipo char(1),
usu_codigo varchar(20)
);

create table db_inventario.inv_det_movimiento (
cab_secuencia int,
det_secuencia int,
prd_codigo varchar(10),
det_cantidad int
);












