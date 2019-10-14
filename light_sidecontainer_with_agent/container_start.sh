# echo input parameters  -  docker logs permet de les voirs
echo "LI_VERSION="$LI_VERSION
echo "LI_SERVER="$LI_SERVER
echo "TAG_APPLI="$TAG_APPLI


# installe l'agent log insight
chmod +x /tmp/li/Liagent.bin
/tmp/li/Liagent.bin
rm -rf /tmp/li


# configure l'agent Log Insight
echo "***********LIAGENT CONFIGURATION************" >>   /var/lib/loginsight-agent/liagent.ini
echo "[server]"                 >> /var/lib/loginsight-agent/liagent.ini
echo "hostname=$LI_SERVER"      >> /var/lib/loginsight-agent/liagent.ini
echo "[filelog|pod_log]"        >> /var/lib/loginsight-agent/liagent.ini
echo "directory=/var/pod_log"   >> /var/lib/loginsight-agent/liagent.ini
echo "include=*.*"              >> /var/lib/loginsight-agent/liagent.ini
echo "tags={\"Tag_Appli\":\"$TAG_APPLI\"}" >> /var/lib/loginsight-agent/liagent.ini


# start Log Insight agent
/etc/init.d/liagentd start


# pour que le process ne s'arrete pas et que le container ne termine pas
tail -f /dev/null

