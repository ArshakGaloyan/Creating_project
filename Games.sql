with gameinfo as 
(
SELECT 
    home_team.team_long_name AS home_team_name,
    away_team.team_long_name AS away_team_name,
    `match`.away_team_api_id,
    `match`.home_team_api_id,
    home_team_goal,
    away_team_goal
    from
    `match`
JOIN 
    team AS away_team ON `match`.away_team_api_id = away_team.team_api_id
JOIN 
    team AS home_team ON `match`.home_team_api_id = home_team.team_api_id
)
SELECT 
home_team_name,
away_team_name,
home_team_goal,
away_team_goal,
    CASE
		WHEN home_team_goal>away_team_goal THEN CONCAT(home_team_name,' ','wins')
        WHEN home_team_goal<away_team_goal THEN CONCAT(away_team_name,' ','wins')
        ELSE 'Draw'
        END AS RESULT

from gameinfo
where home_team_name like 'FC Barcelona'