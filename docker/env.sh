# Env variables needed to deploy using the docker-compose file. These values are for
# testing - not production. In production, these would be obtained from a secret store
# such as Hashicorp Vault or the Jenkins secret store and then set (without displaying
# them in the log) in the Jenkins job prior to executing Docker Compose.

# Variables required by MySQL. They are defined at,
# 	https://hub.docker.com/_/mysql

export MYSQL_ROOT_PASSWORD=Abcde12345

# TCP port in the host on which to expose the Web application
export HOST_PORT=8080
