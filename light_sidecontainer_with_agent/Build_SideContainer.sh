# Script de build du sidec container
# Pre-requis : 
#  - etre executé sur CentOS
#  - etre loggué sur dockerhub


# Variables
containerImage="alexfr75/alex-liagent"
containerVersion="1.0"
LI_VERSION="v4.8.0"


# Prepare file
rmdir -rf /tmp/preparecontainer
mkdir /tmp/prepareContainer
cd /tmp/prepareContainer


yum install -y git
git clone https://github.com/ahugla/LogInsight.git /tmp/prepareContainer


# On met tous les fichiers au meme endroit (.bin et dockerfile)
cp /tmp/prepareContainer/li/$LI_VERSION/VMware-Log-Insight-*.bin /tmp/preparecontainer/Liagent.bin
curl -O https://trucmachinbidule


# Build du container
docker build -t $containerImage:$containerVersion .

doocker push

