#!/bin/bash

Settings_Topic[1]='/Boat/Settings/MegaWemos/MQTTKeepAlive'
Settings_Payload[1]='20000'

Settings_Topic[2]='/Boat/Settings/MegaWemos/Button1Target'
Settings_Payload[2]='#/Boat/Relay/MegaWemos&1-FLIP'

Settings_Topic[3]='/Boat/Settings/MegaWemos/Button2Target'
Settings_Payload[3]='#/Boat/Relay/MegaWemos&1-FLIP'

Settings_Topic[4]='/Boat/Settings/MegaWemos/Button3Target'
Settings_Payload[4]='#/Boat/Relay/MegaWemos&1-FLIP'

Settings_Topic[5]='/Boat/Settings/MegaWemos/Button4Target'
Settings_Payload[5]='#/Boat/Relay/MegaWemos&1-FLIP'

Settings_Topic[6]='/Boat/Settings/MegaWemos/Button5Target'
Settings_Payload[6]='#/Boat/Relay/MegaWemos&1-FLIP'

Settings_Topic[7]='/Boat/Settings/MegaWemos/Button6Target'
Settings_Payload[7]='#/Boat/Relay/MegaWemos&1-FLIP'

Settings_Topic[8]='/Boat/Settings/MegaWemos/Button7Target'
Settings_Payload[8]='#/Boat/Relay/MegaWemos&1-FLIP'

Settings_Topic[9]='/Boat/Settings/MegaWemos/Button8Target'
Settings_Payload[9]='#/Boat/Relay/MegaWemos&1-FLIP'


for (( i=1; i<=${#Settings_Topic[@]}; i++ ))
do
  mosquitto_pub -h localhost -t ${Settings_Topic[i]} -m ${Settings_Payload[i]} -u DasBoot -P NoSinking
  sleep 1.5
done

exit 0
