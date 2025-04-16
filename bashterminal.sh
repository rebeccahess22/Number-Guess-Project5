
mkdir number_guessing_game
cd number_guessing_game
touch number_guess.sh
open number_guess.sh
chmod +x number_guess.sh


psql --username=freecodecamp --dbname=postgres
CREATE DATABASE number_guess;
\c number_guess
CREATE TABLE users(
  user_id SERIAL PRIMARY KEY,
  username VARCHAR(22) UNIQUE
  );

CREATE TABLE games(
  game_id SERIAL PRIMARY KEY,
  guesses INT NOT NULL DEFAULT 0,
  user_id INT NOT NULL
  );

ALTER TABLE games ADD FOREIGN KEY (user_id) REFERENCES users(user_id)

pg_dump -cC --inserts -U freecodecamp number_guess > number_guess.sql