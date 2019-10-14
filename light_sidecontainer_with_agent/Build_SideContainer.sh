# Script de build du sidec container
# Pre-requis : 
#  - etre executé sur CentOS
#  - etre loggué sur dockerhub

# Test du nombre d'inputs
if [ "$#" -ne 3 ]; then
 echo "Le nombre d'arguments est invalide"
 echo "Build_sideContainer.sh [Log Insight Version] [Container Image] [Container Version]"
 echo "  Exemple : Build_sideContainer.sh v4.8.0  alexfr/liagent_v4.8.0  1.0"
 exit
fi

# Variables
LI_VERSION=$1
containerImage=$2
containerVersion=$3
echo "LI_VERSION=$LI_VERSION"
echo "containerImage=$containerImage"
echo "containerVersion=$containerVersion"


# Prepare 
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

