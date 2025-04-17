#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

#randomly generate a number that users have to guess 
#define the projram 
GUESSING_GAME() {

  #if a message is passed, print it
  if [[ $1 ]]
  then 
    echo $1
  fi 

  echo "Enter your username:"
  read USERNAME
  
  #allow usernames that are up to 22 CHARACTERS
  CHAR_LEN=$( echo -n $USERNAME | wc -c )
  if [[ $CHAR_LEN -gt 22 ]]
  then 
    #send user to the beginning to try again 
    echo "username is too long."
    GUESSING_GAME "Character limit is 22."

  else 
    #trim the string -- with xargs, this will occur throughout the function
    USERNAME=$( echo $USERNAME | xargs )
    
    #check if we have it in our records 
    #The username can be inserted without game history. If a user does not complete a game, the will still be recorded. 
    USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'" | xargs )
    if [[ -z $USER_ID ]]
    then 
      echo "Welcome, $USERNAME! It looks like this is your first time here."
      #add new user to the users table
      INSERT_USER=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
      USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'" | xargs )
    else 
      #pull stats on the user from the games table 
      #total games played by the user 
      GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM games WHERE user_id='$USER_ID'" | xargs )
      
      #the minimum number of guesses -> the best game
      BEST_GAME=$($PSQL "SELECT MIN(guesses) FROM games WHERE user_id='$USER_ID'" | xargs)
      
      echo Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses.

    fi 
  
    #create the secret number that the user will have to guess
    SECRET_NUMBER=$(( RANDOM % 1000 + 1))
    NUMBER_OF_GUESSES=0 #THIS LOOP WILL INDEX

    echo "Guess the secret number between 1 and 1000:"
    read NUMBER_ENTERED

    #until the number entered is the secret number this loop will continue 
    until [[ $SECRET_NUMBER = $NUMBER_ENTERED ]]
    do 
      #if the entry was not a number
      if [[ ! $NUMBER_ENTERED =~ ^[0-9]+$ ]]
      then 
        echo "That is not an integer, guess again:"
        read NUMBER_ENTERED

        #add 1 to the number of guesses
        ((NUMBER_OF_GUESSES++)) 
      else 
        #if the entry was a number 
        #if it was greater than the secret number
        if [[ $NUMBER_ENTERED -gt $SECRET_NUMBER ]]
        then 
          echo "It's lower than that, guess again:"

          read NUMBER_ENTERED

          ((NUMBER_OF_GUESSES++)) 
        #if it was less than the number entered
        elif [[ $NUMBER_ENTERED -lt $SECRET_NUMBER ]]
        then 
          echo "It's higher than that, guess again:"

          read NUMBER_ENTERED

          ((NUMBER_OF_GUESSES++)) 
        fi 
      fi
        
    done 
    #add 1 for the last guess
    ((NUMBER_OF_GUESSES++)) 

    #enter this games stats into the games table
    INSERT_GAME=$($PSQL "INSERT INTO games(user_id, guesses) VALUES($USER_ID, $NUMBER_OF_GUESSES)")

    #print a success message
    echo You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!

    
  fi
   

}
#initialize the program
GUESSING_GAME 
