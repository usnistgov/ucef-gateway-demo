#!/usr/bin/env bash

. ./env.sh
logtofile="-l "
echo "LOG4J=$LOG4J"

cd "$TRIPLESEND_HOME/target"
xterm -hold -fg cyan -bg black -l -lf TripleSend.log -T "Triple Send" -geometry 80x20+600+0 -e "java -D$LOG4J -D$IPV4 -jar TripleSend-0.1.0-SNAPSHOT.jar -configFile conf/TripleSendConfig.json" &

cd "$TRIPLEREC_HOME/target"
sleep 5
xterm -hold -fg pink -bg black -l -lf TripleReceive.log -T "Triple Receive" -geometry 80x20+700+60 -e "java -D$LOG4J -D$IPV4 -jar TripleReceive-0.1.0-SNAPSHOT.jar -configFile conf/TripleReceiveConfig.json" &

cd "$DEMO_HOME/target"
sleep 5
xterm -hold -fg green -bg black -l -lf gateway.log -T "Gateway Injection" -geometry 80x20+800+120 -e "java -D$LOG4J -D$IPV4 -jar gateway-demo-0.0.1-SNAPSHOT.jar" &






