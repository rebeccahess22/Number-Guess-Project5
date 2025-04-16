#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

#randomly generate a number that users have to guess 
GUESSING_GAME() {

  if [[ $1 ]]
  then 
    echo $1
  fi 

  echo "Enter your username:"
  read USERNAME
  
  #SHOULD ALLOW USERNAMES THAT ARE 22 CHARACTERS
  CHAR_LEN=$( echo -n $USERNAME | wc -c )
  if [[ $CHAR_LEN -gt 22 ]]
  then 
    echo "username is too long."
    GUESSING_GAME "Character limit is 22."

  else 
    USERNAME=$( echo $USERNAME | xargs )
    #check if we have it in our records 
    #the username can be inserted without game history 
    USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'" | xargs )
    if [[ -z $USER_ID ]]
    then 
      echo "Welcome, $USERNAME! It looks like this is your first time here."
      
      INSERT_USER=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
      USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'" | xargs )
    else 
      GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM games WHERE user_id='$USER_ID'" | xargs )
      BEST_GAME=$($PSQL "SELECT MIN(guesses) FROM games WHERE user_id='$USER_ID'" | xargs)
      
      echo Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses.

    fi 
  

    SECRET_NUMBER=$(( RANDOM % 1000 + 1))
    NUMBER_OF_GUESSES=0 #THIS LOOP WILL INDEX

    echo "Guess the secret number between 1 and 1000:"
    read NUMBER_ENTERED

    until [[ $SECRET_NUMBER = $NUMBER_ENTERED ]]
    do 
      if [[ ! $NUMBER_ENTERED =~ ^[0-9]+$ ]]
      then 
        echo "That is not an integer, guess again:"
        read NUMBER_ENTERED

        ((NUMBER_OF_GUESSES++)) 
      else 
        if [[ $NUMBER_ENTERED -gt $SECRET_NUMBER ]]
        then 
          echo "It's lower than that, guess again:"

          read NUMBER_ENTERED

          ((NUMBER_OF_GUESSES++)) 
        elif [[ $NUMBER_ENTERED -lt $SECRET_NUMBER ]]
        then 
          echo "It's higher than that, guess again:"

          read NUMBER_ENTERED

          ((NUMBER_OF_GUESSES++)) 
        fi 
      fi
        
    done 
    ((NUMBER_OF_GUESSES++)) 
    INSERT_GAME=$($PSQL "INSERT INTO games(user_id, guesses) VALUES($USER_ID, $NUMBER_OF_GUESSES)")
    echo You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!

    
  fi
   

}

GUESSING_GAME 