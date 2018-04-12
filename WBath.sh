#!/bin/bash

Settings_Topic[1]='/Boat/Settings/WBath/MQTTKeepAlive'
Settings_Payload[1]='20000'


# --------------- TheBatTargetNo ---------------
Settings_Topic[2]='/Boat/Settings/WBath/TheBatTargetON'
Settings_Payload[2]='/Boat/Relay/WR1&2-ON'

# --------------- Button 2 ---------------
Settings_Topic[3]='/Boat/Settings/WBath/TheBatTargetOFF'
Settings_Payload[3]='/Boat/Relay/WR1&2-OFF'

# --------------- Button 3 ---------------
Settings_Topic[4]='/Boat/Settings/WBath/TheBatTrigger'
Settings_Payload[4]='15'

# --------------- RelayAutoOFFTimer ---------------
Settings_Topic[5]='/Boat/Settings/WBath/RelayAutoOFFTimer'
Settings_Payload[5]='20000'

for (( i=1; i<=${#Settings_Topic[@]}; i++ ))
do
  mosquitto_pub -h localhost -t ${Settings_Topic[i]} -m ${Settings_Payload[i]} -u DasBoot -P NoSinking
  sleep 0.500
done

exit 0
