#!/bin/bash

echo "\n;; Ontologia -----------------------\n" > expertsys.clp
cat ./Ontologia/*.pont >> expertsys.clp
echo "\n;; Instancias -----------------------\n" >> expertsys.clp
cat ./Ontologia/*.pins >> expertsys.clp
echo "\n;; Nuestro codigo -----------------------\n" >> expertsys.clp
cat menu.clp >> expertsys.clp
