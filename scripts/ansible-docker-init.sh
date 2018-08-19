
sudo yum install docker -y
sudo service docker start
sudo service docker status
sudo chkconfig docker on

sudo docker run hello-world
sudo docker run -it ubuntu bash

sudo docker info
sudo docker version
docker search ubuntu
docker pull ubuntu
docker images

docker rmi ubuntu


# See all docker containers
sudo docker ps -a
# see all running docker containers
sudo docker ps -l


#############################
#	Create an Apache docker #
#############################

sudo docker run -it ubuntu bash --name webserver
