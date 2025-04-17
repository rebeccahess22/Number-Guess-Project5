#make a git repository 
mkdir number_guessing_game
cd number_guessing_game

#create a shell script 
touch number_guess.sh
open number_guess.sh
chmod +x number_guess.sh

#connect to the sql database 
psql --username=freecodecamp --dbname=postgres

#create a new database for this project 
CREATE DATABASE number_guess;
#connect to the database
\c number_guess

#create tables that the shell script will use to record and acquire information from the database on a row basis. 
CREATE TABLE users(
  user_id SERIAL PRIMARY KEY,
  username VARCHAR(22) UNIQUE
  );

CREATE TABLE games(
  game_id SERIAL PRIMARY KEY,
  guesses INT NOT NULL DEFAULT 0,
  user_id INT NOT NULL
  );

#connect the two tables through the user_id 
ALTER TABLE games ADD FOREIGN KEY (user_id) REFERENCES users(user_id)

#export the final database to a .sql file
pg_dump -cC --inserts -U freecodecamp number_guess > number_guess.sql
