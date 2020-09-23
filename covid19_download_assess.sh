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


#seleziona i dati per la provincia di viterbo
echo "data,stato,codice_regione,denominazione_regione,codice_provincia,denominazione_provincia,sigla_provincia,lat,long,totale_casi,note" > covid19_viterbo.csv
cat covid19_ita_province.csv | grep VT >> covid19_viterbo.csv

#download andamento nazionale
URL=$(wget -q --method=HEAD https://raw.githubusercontent.com/pcm-dpc/COVID-19/master/dati-andamento-nazionale/dpc-covid19-ita-andamento-nazionale.csv)

if echo "$URL";
 then
  wget 'https://raw.githubusercontent.com/pcm-dpc/COVID-19/master/dati-andamento-nazionale/dpc-covid19-ita-andamento-nazionale.csv' -O covid19_italia.csv
  echo "This page exists."
 else
  echo "This page does not exist."
fi

echo ___ all done download, elaboration ...

exit
