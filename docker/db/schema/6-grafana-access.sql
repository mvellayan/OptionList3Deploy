create user 'grafana'@'localhost' identified by 'granfnaGRAFANA';
create user 'grafana'@'127.%' identified by 'grafanaGRAFANA';
create user 'grafana'@'192%' identified by 'grafanaGRAFANA';

grant select on model.* to 'grafana'@'localhost';
grant select on ib.* to 'grafana'@'localhost';

grant select on model.* to 'grafana'@'127.%';
grant select on ib.* to 'grafana'@'127.%';

grant select on model.* to 'grafana'@'192.%';
grant select on ib.* to 'grafana'@'192.%';

