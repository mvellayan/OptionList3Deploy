# OptionList3 Deployment Installation

## 1. Choose Centos 7 VM (not Amazon Linux or thers)

        Using US-EAST-1: 
        CentOS Linux 7 x86_64 HVM EBS ENA 1901_01-b7ee8a69-ee97-4a49-9e68-afaee216db2e-ami-05713873c6794f575.4 
        (ami-02eac2c0129f6376b)

:warning:  Centos8 -- Found problems with docker, java8 etc installation 

## 2. Install docker 

Install git, docker.  Follow instructions [here](https://docs.docker.com/install/linux/docker-ce/centos/)

```
sudo yum -y install git

sudo yum remove docker docker-client docker-client-latest docker-common docker-latest docker-latest-logrotate  docker-logrotate  docker-engine
sudo yum install -y yum-utils   device-mapper-persistent-data   lvm2
sudo yum-config-manager --add-repo  https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install -y docker-ce docker-ce-cli containerd.io
sudo systemctl start docker
sudo systemctl enable docker
sudo docker run hello-world


adduser mvellayan
sudo usermod -aG docker mvellayan
sudo usermod -aG docker centos
passwd mvellayan 
```
install docker compose 
```
curl -L https://github.com/docker/compose/releases/download/1.25.1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose

chmod +x /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version
```  

## 3. Clone git

commands:
```
git config --global credential.helper store
git clone https://github.com/mvellayan/OptionList3Deploy.git


```


## 4. 
