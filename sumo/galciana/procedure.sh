#Fonte http://sumo.dlr.de/wiki/Simulation_of_Urban_MObility_-_Wiki
# dati .osm mappa da www.openstreetmap.org © OpenStreetMap contributors

cd ${0%/*}

#1: Scaricare i dati da OpenStreetMaps (galciana.osm)

#2: Generare la .net per la simulazione (Netconvert importa le informazioni relative alle strade e le converte in un unico formato usabile da altri tool)
netconvert --osm-files galciana.osm -o galciana.net.xml --output.street-names true --output.original-names true

#3: aggiungere le informazioni addizionali da visualizzare, vedere http://sumo.dlr.de/wiki/Networks/Import/OpenStreetMap
# salvare i dati in un file 'typemap.xml' ed eseguire il comando: (Polyconvert importa shapes (poligoni o punti di interesse) da varie fonti e le converte per essere visualizzate con la SUMO-GUI)
polyconvert --net-file galciana.net.xml --osm-files galciana.osm --type-file typemap.xml -o galciana.poly.xml

#configurare i veicoli e i dati delle rotte, si veda qui http://sumo.dlr.de/wiki/Tools/Trip
#python ../tools/randomTrips.py -n galciana.net.xml -r galciana1.rou.xml -e 100 -l
python ../tools/randomTrips.py -n galciana.net.xml -r galciana1.rou.xml -e 100 -l -p 0.1

#Adesso è stata generata la rete delle strade per la simulazione
#5: Creare il file di configurazione galciana.sumo.cfg file in cui inserire i file di riferimento per sumo-gui
#6: Lanciare la simulazione

sumo-gui galciana1.sumo.cfg