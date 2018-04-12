#!/bin/bash

sleep 0.33

mosquitto_pub -h localhost -t "/Boat/Settings/WD1/MQTTKeepAlive" -m "20000" -u DasBoot -P NoSinking
