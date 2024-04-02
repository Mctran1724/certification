#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

#For speed, do it in one pass

echo $($PSQL "TRUNCATE teams, games")


cat games.csv | while IFS=',' read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS

do

#Only do everything if it's not the first row
if [[ $YEAR != "year" ]]
then
  #insert teams
  #First check if the winning team is already in there
  WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'; ")
  #Now see if the losing team is in there arleady
  OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'; ")

  # If the winning team doesn't show up, put them in
  if [[ -z $WINNER_ID ]] 
  then 
    INSERT_WINNER_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER'); ")
    if [[ $INSERT_WINNER_RESULT == "INSERT 0 1" ]]
    then
      echo "Inserted into teams, $WINNER"
    fi
  fi

  if [[ -z $OPPONENT_ID ]] 
  then 
    INSERT_OPPONENT_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT'); ")
    if [[ $INSERT_OPPONENT_RESULT == "INSERT 0 1" ]]
    then
      echo "Inserted into teams, $OPPONENT"
    fi
  fi


  WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'; ")
  OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'; ")

  #check if the game id exists for the game, identified by year, round, and teams playing
  GAME_ID=$($PSQL "SELECT game_id FROM games WHERE year='$YEAR' AND ROUND='$ROUND' AND winner_id='$WINNER_ID' AND opponent_id='$OPPONENT_ID'; ")
  
  if [[ -z $GAME_ID ]] 
  then
    INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', '$WINNER_ID', '$OPPONENT_ID', $WINNER_GOALS, $OPPONENT_GOALS)")
    if [[ $INSERT_GAME_RESULT == "INSERT 0 1" ]]
    then
      echo "Inserted into students, $YEAR $ROUND $WINNER $OPPONENT $WINNER_GOALS $OPPONENT_GOALS"
    fi
  fi



fi
done