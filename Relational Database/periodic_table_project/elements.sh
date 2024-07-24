#!/bin/bash

ARGUMENT=$1
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"


QUERY="SELECT "\
"properties.atomic_number, "\
"properties.atomic_mass, "\
"properties.melting_point_celsius, "\
"properties.boiling_point_celsius, "\
"elements.symbol, "\
"elements.name, "\
"types.type "\
"FROM properties "\
"INNER JOIN elements ON properties.atomic_number = elements.atomic_number "\
"INNER JOIN types ON properties.type_id = types.type_id "

if [[ -z $ARGUMENT ]]; then
  echo 'Please provide an element as an argument.'
  exit
elif [[ $ARGUMENT =~ ^⁻?[0-9]+$ ]]; then
  QUERY+="WHERE properties.atomic_number = $ARGUMENT;"
elif [[ "$ARGUMENT" =~ ^[a-zA-Z]{1,2}$ ]]; then
  QUERY+="WHERE elements.symbol = '$ARGUMENT';"
elif [[ "$ARGUMENT" =~ ^[a-zA-Z0-9[:space:]]*$ ]]; then
  QUERY+="WHERE elements.name = '$ARGUMENT';"
fi

ELEMENT=$($PSQL "$QUERY")

if [[ -z $ELEMENT ]]; then
  echo 'I could not find that element in the database.'
  exit
fi

IFS='|' read -r ATOMIC_NUMBER MASS MELTING BOILING SYMBOL NAME TYPE <<< $ELEMENT
echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
