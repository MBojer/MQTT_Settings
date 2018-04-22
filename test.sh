#!/bin/bash

Hostname=${0}
Hostname=${Hostname:0:(${#Hostname} - 3)}

echo ${Hostname}
