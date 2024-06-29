#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

PRESENTATION () {
  echo -e "\n~~~~~ MY SALON ~~~~~\n"
  echo -e "\nWelcome to My Salon, how can I help you?\n"
  SERVICES_REQUEST
}

SERVICES_REQUEST () {
  LIST_OF_SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id;")
  echo "$LIST_OF_SERVICES" | while read SERVICE_ID BAR SERVICE_NAME
  do
    echo "$SERVICE_ID) $SERVICE_NAME"
  done
  read SERVICE_ID_SELECTED

  CHECKING_SERVICE=$($PSQL "SELECT service_id FROM services WHERE service_id = $SERVICE_ID_SELECTED;")

  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]; then
    echo -e "\nInvalid input. Please enter a valid service number."
    SERVICES_REQUEST
  elif [[ -z $CHECKING_SERVICE ]]; then
    echo -e "\nI could not find that service. What would you like today?"
    SERVICES_REQUEST
  else
    echo -e "\nWhat's your phone number?"
    read CUSTOMER_PHONE

    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE';")
    if [[ -z $CUSTOMER_ID ]]; then
      echo -e "\nI don't have a record for that phone number, what's your name?"
      read CUSTOMER_NAME
      INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES ('$CUSTOMER_NAME', '$CUSTOMER_PHONE');")
      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE';")
    else
      CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE';")
    fi

    echo -e "\nWhat time would you like your appointment, $CUSTOMER_NAME?"
    read SERVICE_TIME
    BOOKING_SERVICE=$($PSQL "INSERT INTO appointments (customer_id, service_id, time) VALUES ($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME');")
    SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED;")
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE';")

    echo -e "\nI have put you down for a$SERVICE_NAME at $SERVICE_TIME,$CUSTOMER_NAME."
  fi
}

PRESENTATION
