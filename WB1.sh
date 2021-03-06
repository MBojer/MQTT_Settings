#!/bin/bash

Settings_Topic[1]='/Boat/Settings/WB1/MQTTKeepAlive'
Settings_Payload[1]='20000'


# --------------- Button 1 ---------------
Settings_Topic[2]='/Boat/Settings/WB1/Button1Target'
Settings_Payload[2]='/Boat/Relay/WR1/1&2'

# --------------- Button 2 ---------------
Settings_Topic[3]='/Boat/Settings/WB1/Button2Target'
Settings_Payload[3]='/Boat/Relay/WR1/2&2'

# --------------- Button 3 ---------------
Settings_Topic[4]='/Boat/Settings/WB1/Button3Target'
Settings_Payload[4]='/Boat/Functions&zzzZZZ'

# --------------- Button 4 - zzzZZZ ---------------
Settings_Topic[5]='/Boat/Settings/WB1/Button4Target'
Settings_Payload[5]='/Boat/Dimmer/WDimmer/1&70'

# --------------- Button 5 ---------------
Settings_Topic[6]='/Boat/Settings/WB1/Button5Target'
Settings_Payload[6]='/Boat/Relay/WR1/1&2'



for (( i=1; i<=${#Settings_Topic[@]}; i++ ))
do
  mosquitto_pub -h localhost -t ${Settings_Topic[i]} -m ${Settings_Payload[i]} -u DasBoot -P NoSinking
  sleep 1.5
done

exit 0
