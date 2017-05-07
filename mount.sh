#!/bin/bash

echo ";; Ontologia -----------------------" > expertsys.clp
cat ./Ontologia/*.pont >> expertsys.clp
echo ";; Instancias -----------------------" >> expertsys.clp
cat ./Ontologia/*.pins >> expertsys.clp
echo ";; Nuestro codigo -----------------------" >> expertsys.clp
cat menu.clp >> expertsys.clp
