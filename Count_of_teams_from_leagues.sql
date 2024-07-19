SELECT 
    country.name AS countryname,
    league.name AS leaguename,
    COUNT(DISTINCT home_team_api_id) AS count_of_games
FROM 
    `match`
JOIN 
    country ON country.id = `match`.country_id
JOIN 
    league ON league.id = `match`.league_id
GROUP BY 
    country.id, league.id;


