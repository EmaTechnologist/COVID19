#!/bin/bash
#
#ultima mod 09-2020
#E.Tufarini
#
#

#upload dei dati su github

#UPLOAD AUTOMATICO DEI FILE NEL REPOSITORY REMOTO
#imposta la data
date=$(date +%d/%m/%Y_%H:%M)
#aggiungi i file della cartella al repository
git add *
#tieni traccia della data del caricamento
git commit -m "commit $date"
#esegui l'upload (pull e push)
git push -f origin master





echo ___ all done upload on github ...

exit
