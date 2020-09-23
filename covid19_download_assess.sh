#!/bin/bash
#
#ultima mod 07-2020
#E.Tufarini
#
#

#download e check covid data per provincia

URL=$(wget -q --method=HEAD https://raw.githubusercontent.com/pcm-dpc/COVID-19/master/dati-province/dpc-covid19-ita-province.csv)

if echo "$URL";
 then
  wget 'https://raw.githubusercontent.com/pcm-dpc/COVID-19/master/dati-province/dpc-covid19-ita-province.csv' -O covid19_ita_province.csv
  echo "This page exists."
 else
  echo "This page does not exist."
fi


#vai nella cartella COVID19_DATA
cd /home/emaserver/DISK1/JUPYTER/COVID19/COVID19_DATA 

#scarica tutti i positivi di ogni provincia
/home/emaserver/DISK1/JUPYTER/COVID19/BIN/covid_provincia.sh

#seleziona i dati per la provincia di viterbo
echo "data,stato,codice_regione,denominazione_regione,codice_provincia,denominazione_provincia,sigla_provincia,lat,long,totale_casi,note" > covid19_viterbo.csv
cat covid19_ita_province.csv | grep VT >> covid19_viterbo.csv


echo ___ all done download, elaboration ...

exit
