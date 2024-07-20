#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# Function to get user information
get_user() {
  echo "Enter your username:"
  read USERNAME

  # Truncate the username to 22 characters if it's longer
  USERNAME=${USERNAME:0:22}

  USER_DATA=$($PSQL "SELECT user_id, username, games_played, best_game FROM users WHERE username='$USERNAME'")

  if [[ -z $USER_DATA ]]; then
    echo "Welcome, $USERNAME! It looks like this is your first time here."
    ADD_USER_RESULT=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
    USER_DATA=$($PSQL "SELECT user_id, username, games_played, best_game FROM users WHERE username='$USERNAME'")
  else
    echo "$USER_DATA" | while IFS="|" read USER_ID USERNAME GAMES_PLAYED BEST_GAME
    do
      echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
    done
  fi

  USER_ID=$(echo $USER_DATA | cut -d '|' -f 1)
}

# Function to play the game
play_game() {
  SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))
  echo "Guess the secret number between 1 and 1000:"
  NUMBER_OF_GUESSES=0

  while true; do
    read GUESS

    if ! [[ $GUESS =~ ^[0-9]+$ ]]; then
      echo "That is not an integer, guess again:"
    else
      ((NUMBER_OF_GUESSES++))

      if [[ $GUESS -eq $SECRET_NUMBER ]]; then
        echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
        break
      elif [[ $GUESS -gt $SECRET_NUMBER ]]; then
        echo "It's lower than that, guess again:"
      else
        echo "It's higher than that, guess again:"
      fi
    fi
  done

  # Update the database
  UPDATE_GAMES_PLAYED=$($PSQL "UPDATE users SET games_played = games_played + 1 WHERE user_id = $USER_ID")
  INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(user_id, guesses) VALUES($USER_ID, $NUMBER_OF_GUESSES)")
  
  # Update best game if needed
  BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE user_id = $USER_ID")
  if [[ -z $BEST_GAME ]] || [[ $NUMBER_OF_GUESSES -lt $BEST_GAME ]]; then
    UPDATE_BEST_GAME=$($PSQL "UPDATE users SET best_game = $NUMBER_OF_GUESSES WHERE user_id = $USER_ID")
  fi
}

# Main script execution
get_user
play_game
