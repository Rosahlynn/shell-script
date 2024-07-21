#!/bin/bash
agendamento() {
  op=$(yad --title "Agendamento de Backup" \
           --form \
           --field="Hora e Minuto:H" "$(date +%H:%M)" \
           --field="Comando de Backup:C" "/home/ava-02/q1/script.sh" \
           --button="Agendar:0" \
           --button="Cancelar:1")

  if [ $? -eq 0 ]; then
    ti=$(echo "$op" | cut -d'|' -f1)
    da=$(echo "$op" | cut -d'|' -f2)
    bp=$(echo "$op" | cut -d'|' -f3)

    go=$(date -d "$da $ti" +"%H:%M %m%d%Y")

    echo "$bp" | at "$go"

    echo "Agendamento concluído"

  else
    echo "Agendamento cancelado"
  fi
}

agendamento
