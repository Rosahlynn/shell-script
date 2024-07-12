#!/bin/bash

di="/home/$(whoami)"
ba="/tmp/backup"
mkdir -p "$di"
tm=$(date +%H%M)
bf="backup_${tm}.tar.gz"
bp="${ba}/${bf}"

echo "Criando backup de ${di} em ${bp} ... "

tar -czf "${bp}" "${di}"

if [ $? -eq 0 ]; then
 echo "Backup concluído."
else
 echo "Ocorreu um erro no backup."
fi
