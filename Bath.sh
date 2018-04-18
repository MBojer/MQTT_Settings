#!/bin/bash

# D1 = 5
# D2 = 4
# D3 = ?
# D4 = 15
# D5 = 14
# D6 = 12
# D7 = 13
# D8 = 2

# Remember the ";" at the end of each payload, has to be there to remove garbel at the end

Hostname='Dobby'

Settings_Topic=()
Settings_Payload=()

Publish_Delay=0.500

# --------------- MQTT KeepAlive ---------------
Settings_Topic+=('/Boat/Settings/'${Hostname}'/MQTTKeepAlive')
Settings_Payload+=('20000;')


# --------------- MQTT Flash Password ---------------
Settings_Topic+=('/Boat/Settings/'${Hostname}'/MQTTFlashPassword')
# -1 = disabled
Settings_Payload+=('-1;')


# --------------- Buzzer Pin ---------------
#Settings_Topic+=('/Boat/Settings/'${Hostname}'/BuzzerPin')
#Settings_Payload+=('15;')


#--------------- DHT Pin ---------------
#Settings_Topic+=('/Boat/Settings/'${Hostname}'/DHTPin')
#Settings_Payload+=('2;')



#--------------- Relay On State ---------------
Settings_Topic+=('/Boat/Settings/'${Hostname}'/RelayOnState')
Settings_Payload+=('0;')

#--------------- Relay Pins ---------------
Settings_Topic+=('/Boat/Settings/'${Hostname}'/RelayPins')
Settings_Payload+=('5,4,14,12,13;')

#--------------- Relay Pins Auto Off ---------------
Settings_Topic+=('/Boat/Settings/'${Hostname}'/RelayPinsAutoOff')
Settings_Payload+=('1,1,1,1,1;')

#--------------- Relay Pins Auto Off Delay ---------------
Settings_Topic+=('/Boat/Settings/'${Hostname}'/RelayPinsAutoOffDelay')
Settings_Payload+=('500,1000,1500,2000,2500;')



for (( i=0; i<${#Settings_Topic[@]}; i++ ))
do
	echo ${i}
	echo ${Settings_Topic[i]}
	echo ${Settings_Payload[i]}
	mosquitto_pub -h localhost -t ${Settings_Topic[i]} -m ${Settings_Payload[i]} -u DasBoot -P NoSinking
	sleep ${Publish_Delay}
done

exit 0
