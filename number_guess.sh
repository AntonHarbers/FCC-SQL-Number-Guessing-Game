#!/bin/bash
echo -e "\nEnter your username:"
read USERNAME_INPUT

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
USERNAME=$($PSQL "SELECT username FROM users WHERE username='$USERNAME_INPUT'")
NUMBER_OF_TURNS=0

RANDOM_NUMBER=$(( 1 + $RANDOM % 1000 ))

if [[ -z $USERNAME ]] 
then
  echo -e "\nWelcome, $USERNAME_INPUT! It looks like this is your first time here."
  GAMES_PLAYED=0
  INSERT_USERNAME_RESULT=$($PSQL "INSERT INTO users(username, games_played) VALUES('$USERNAME_INPUT', $GAMES_PLAYED)")  
else
  GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE username='$USERNAME_INPUT'")
  BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE username='$USERNAME_INPUT'")
  echo -e "\nWelcome back, $USERNAME_INPUT! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses.\n"
fi

echo "Guess the secret number between 1 and 1000:"

GUESS_NUMBER () {
  read GUESS

  if [[ $GUESS =~ ^-?[0-9]+$ ]]
  then
    if (( $GUESS == $RANDOM_NUMBER ))
    then
	    NUMBER_OF_TURNS=$(( $NUMBER_OF_TURNS + 1 ))
      echo -e "\nYou guessed it in $NUMBER_OF_TURNS tries. The secret number was $RANDOM_NUMBER. Nice job!\n" 
    elif (( $GUESS > $RANDOM_NUMBER ))
    then
      echo -e "\nIt's lower than that, guess again:"
      NUMBER_OF_TURNS=$(( $NUMBER_OF_TURNS + 1 ))
      GUESS_NUMBER
    else
      echo -e "\nIt's higher than that, guess again:"
      NUMBER_OF_TURNS=$(( $NUMBER_OF_TURNS + 1 ))
      GUESS_NUMBER
    fi
  else
    echo -e "\nThat is not an integer, guess again:\n"
    GUESS_NUMBER
  fi
}

GUESS_NUMBER

if (( $GAMES_PLAYED == 0 ))
then
  GAMES_PLAYED=$(( $GAMES_PLAYED + 1 ))
  RENEW_RECORD=$($PSQL "UPDATE users SET games_played=$GAMES_PLAYED, best_game=$NUMBER_OF_TURNS WHERE username='$USERNAME_INPUT'")
else
  GAMES_PLAYED=$(( $GAMES_PLAYED + 1 ))

  if (( $NUMBER_OF_TURNS < $BEST_GAME ))
  then
    RENEW_RECORD=$($PSQL "UPDATE users SET games_played=$GAMES_PLAYED, best_game=$NUMBER_OF_TURNS WHERE username='$USERNAME_INPUT'")
  else
    RENEW_RECORD=$($PSQL "UPDATE users SET games_played=$GAMES_PLAYED WHERE username='$USERNAME_INPUT'")
  fi
fi
