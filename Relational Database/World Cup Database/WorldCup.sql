CREATE TABLE teams(
    team_id SERIAL NOT NULL PRIMARY KEY,
    name TEXT UNIQUE NOT NULL
)
;

CREATE TABLE games(
    game_id SERIAL NOT NULL PRIMARY KEY,
    year INT NOT NULL,
    round VARCHAR(20) NOT NULL,
    winner_id INT NOT NULL REFERENCES teams(team_id),
    opponent_id INT NOT NULL REFERENCES teams(team_id),
    winner_goals INT NOT NULL,
    opponent_goals INT NOT NULL
);
