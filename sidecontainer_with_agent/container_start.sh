# echo input parameters
echo "LI_VERSION="$LI_VERSION
echo "LI_SERVER="$LI_SERVER


# installe l'agent log insight
git clone https://github.com/ahugla/LogInsight.git  /tmp/li
chmod +x /tmp/li/$LI_VERSION/VMware-Log-Insight-*.bin
/tmp/li/$LI_VERSION/VMware-Log-Insight-*.bin
rm -rf /tmp/li


# configure agent with Log Insight Server FQDN or IP
# sed -i '8 a hostname='$LI_SERVER'' /var/lib/loginsight-agent/liagent.ini


echo "***********LIAGENT CONFIGURATION************" >>   /var/lib/loginsight-agent/liagent.ini
echo "[server]"              >> /var/lib/loginsight-agent/liagent.ini
echo "hostname=$LI_SERVER"   >> /var/lib/loginsight-agent/liagent.ini
echo "[filelog|syslog]"      >> /var/lib/loginsight-agent/liagent.ini
echo "directory=/var/log"    >> /var/lib/loginsight-agent/liagent.ini
echo "include=*.*"           >> /var/lib/loginsight-agent/liagent.ini



# start Log Insight agent
/etc/init.d/liagentd start


# pour que le process ne s'arrete pas et que le container ne termine pas
tail -f /dev/null

