# Script de build du sidec container
# Pre-requis : 
#  - etre executé sur CentOS
#  - etre loggué sur dockerhub


# Variables
containerImage="alexfr75/alex-liagent-light"
containerVersion="1.0"
LI_VERSION="v4.8.0"


# Prepare file
rmdir -rf /tmp/preparecontainer
mkdir /tmp/prepareContainer
cd /tmp/prepareContainer


yum install -y git
git clone https://github.com/ahugla/LogInsight.git /tmp/prepareContainer


# On met tous les fichiers au meme endroit (LIagent.bin et dockerfile)
cd $LI_VERSION
mv VMware*.bin LIagent.bin
curl -O https://raw.githubusercontent.com/ahugla/LogInsight/master/light_sidecontainer_with_agent/dockerfile


# Build du container
docker build -t $containerImage:$containerVersion .
docker push $containerImage:$containerVersion

