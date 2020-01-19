create user 'rk_admin'@'localhost' identified by 'rk_admin';
create user 'rk_admin'@'127.%' identified by 'rk_admin';
create user 'rk_admin'@'172%' identified by 'rk_admin';
create user 'rk_admin'@'10.%' identified by 'rk_admin';

grant all on model.* to 'rk_admin'@'localhost';
grant all on ib.* to 'rk_admin'@'localhost';

grant all on model.* to 'rk_admin'@'127.%';
grant all on ib.* to 'rk_admin'@'127.%';

grant all on model.* to 'rk_admin'@'172%';
grant all on ib.* to 'rk_admin'@'172%';

grant all on model.* to 'rk_admin'@'10.%';
grant all on ib.* to 'rk_admin'@'10.%';

select host, user from mysql.user;