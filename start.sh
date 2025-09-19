#!/bin/bash

# Calcola memoria disponibile in MB e lascia 2GB liberi
MEM_AVAIL_MB=$(free -m | awk '/^Mem:/{print $7}')
MEM_FOR_MC=$((MEM_AVAIL_MB - 2048))

# Avvia il server con tutta la memoria disponibile meno 2GB
java -Xms${MEM_FOR_MC}M -Xmx${MEM_FOR_MC}M -jar server.jar nogui
