#!/bin/bash

Hostname='WBuzzer'

Settings_Topic=()
Settings_Payload=()

# --------------- MQTT KeepAlive ---------------
Settings_Topic+=('/Boat/Settings/'${Hostname}'/MQTTKeepAlive')
Settings_Payload+=('20000')


# --------------- MQTT Flash Password ---------------
Settings_Topic+=('/Boat/Settings/'${Hostname}'/MQTTFlashPassword')
# -1 = disabled
Settings_Payload+=("-1")


# --------------- Buzzer Pin ---------------
Settings_Topic+=('/Boat/Settings/'${Hostname}'/BuzzerPin')
Settings_Payload+=('15')


#--------------- DHT Pin ---------------
Settings_Topic+=('/Boat/Settings/'${Hostname}'/DHTPin')
Settings_Payload+=('2')



for (( i=0; i<${#Settings_Topic[@]}; i++ ))
do
#	echo ${i}
#	echo ${Settings_Topic[i]}
	mosquitto_pub -h localhost -t ${Settings_Topic[i]} -m ${Settings_Payload[i]} -u DasBoot -P NoSinking
	sleep 0.250
done

exit 0
