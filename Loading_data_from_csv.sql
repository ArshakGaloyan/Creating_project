use `europeansoccerdatabase`;
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Country.csv'
INTO TABLE `country`
FIELDS TERMINATED BY ','
IGNORE 1 LINES
(id, name);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/League.csv'
INTO TABLE `league`
FIELDS TERMINATED BY ','
IGNORE 1 LINES
(id,country_id,name);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Player.csv'
INTO TABLE `player`
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Team.csv"
INTO TABLE `team`
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(id,
 team_api_id,
 @team_fifa_api_id,
 team_long_name,
 team_short_name
)
SET team_fifa_api_id=IF(@team_fifa_api_id='',NULL,@team_fifa_api_id)
;






LOAD DATA LOCAL INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Team_attributes.csv'
INTO TABLE `team_attributes`
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@id, @team_fifa_api_id, @team_api_id, @date, @buildUpPlaySpeed, @buildUpPlaySpeedClass, 
 @buildUpPlayDribbling, @buildUpPlayDribblingClass, @buildUpPlayPassing, @buildUpPlayPassingClass, 
 @buildUpPlayPositioningClass, @chanceCreationPassing, @chanceCreationPassingClass, 
 @chanceCreationCrossing, @chanceCreationCrossingClass, @chanceCreationShooting, 
 @chanceCreationShootingClass, @chanceCreationPositioningClass, @defencePressure, 
 @defencePressureClass, @defenceAggression, @defenceAggressionClass, @defenceTeamWidth, 
 @defenceTeamWidthClass, @defenceDefenderLineClass)
SET
 id = IF(@id='', NULL, @id),
 team_fifa_api_id = IF(@team_fifa_api_id='', NULL, @team_fifa_api_id),
 team_api_id = IF(@team_api_id='', NULL, @team_api_id),
 date = IF(@date='', NULL, @date),
 buildUpPlaySpeed = IF(@buildUpPlaySpeed='', NULL, @buildUpPlaySpeed),
 buildUpPlaySpeedClass = IF(@buildUpPlaySpeedClass='', NULL, @buildUpPlaySpeedClass),
 buildUpPlayDribbling = IF(@buildUpPlayDribbling='', NULL, @buildUpPlayDribbling),
 buildUpPlayDribblingClass = IF(@buildUpPlayDribblingClass='', NULL, @buildUpPlayDribblingClass),
 buildUpPlayPassing = IF(@buildUpPlayPassing='', NULL, @buildUpPlayPassing),
 buildUpPlayPassingClass = IF(@buildUpPlayPassingClass='', NULL, @buildUpPlayPassingClass),
 buildUpPlayPositioningClass = IF(@buildUpPlayPositioningClass='', NULL, @buildUpPlayPositioningClass),
 chanceCreationPassing = IF(@chanceCreationPassing='', NULL, @chanceCreationPassing),
 chanceCreationPassingClass = IF(@chanceCreationPassingClass='', NULL, @chanceCreationPassingClass),
 chanceCreationCrossing = IF(@chanceCreationCrossing='', NULL, @chanceCreationCrossing),
 chanceCreationCrossingClass = IF(@chanceCreationCrossingClass='', NULL, @chanceCreationCrossingClass),
 chanceCreationShooting = IF(@chanceCreationShooting='', NULL, @chanceCreationShooting),
 chanceCreationShootingClass = IF(@chanceCreationShootingClass='', NULL, @chanceCreationShootingClass),
 chanceCreationPositioningClass = IF(@chanceCreationPositioningClass='', NULL, @chanceCreationPositioningClass),
 defencePressure = IF(@defencePressure='', NULL, @defencePressure),
 defencePressureClass = IF(@defencePressureClass='', NULL, @defencePressureClass),
 defenceAggression = IF(@defenceAggression='', NULL, @defenceAggression),
 defenceAggressionClass = IF(@defenceAggressionClass='', NULL, @defenceAggressionClass),
 defenceTeamWidth = IF(@defenceTeamWidth='', NULL, @defenceTeamWidth),
 defenceTeamWidthClass = IF(@defenceTeamWidthClass='', NULL, @defenceTeamWidthClass),
 defenceDefenderLineClass = IF(@defenceDefenderLineClass='', NULL, @defenceDefenderLineClass);




LOAD DATA LOCAL INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Match.csv"
INTO TABLE `match`
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@id, @country_id, @league_id, @season, @stage, @date, @match_api_id, @home_team_api_id, @away_team_api_id,
 @home_team_goal, @away_team_goal, @home_player_X1, @home_player_X2, @home_player_X3, @home_player_X4,
 @home_player_X5, @home_player_X6, @home_player_X7, @home_player_X8, @home_player_X9, @home_player_X10,
 @home_player_X11, @away_player_X1, @away_player_X2, @away_player_X3, @away_player_X4, @away_player_X5,
 @away_player_X6, @away_player_X7, @away_player_X8, @away_player_X9, @away_player_X10, @away_player_X11,
 @home_player_Y1, @home_player_Y2, @home_player_Y3, @home_player_Y4, @home_player_Y5, @home_player_Y6,
 @home_player_Y7, @home_player_Y8, @home_player_Y9, @home_player_Y10, @home_player_Y11, @away_player_Y1,
 @away_player_Y2, @away_player_Y3, @away_player_Y4, @away_player_Y5, @away_player_Y6, @away_player_Y7,
 @away_player_Y8, @away_player_Y9, @away_player_Y10, @away_player_Y11, @home_player_1, @home_player_2,
 @home_player_3, @home_player_4, @home_player_5, @home_player_6, @home_player_7, @home_player_8,
 @home_player_9, @home_player_10, @home_player_11, @away_player_1, @away_player_2, @away_player_3,
 @away_player_4, @away_player_5, @away_player_6, @away_player_7, @away_player_8, @away_player_9,
 @away_player_10, @away_player_11, @goal, @shoton, @shotoff, @foulcommit, @card, @cross, @corner,
 @possession, @B365H, @B365D, @B365A, @BWH, @BWD, @BWA, @IWH, @IWD, @IWA, @LBH, @LBD, @LBA, @PSH, @PSD, @PSA,
 @WHH, @WHD, @WHA, @SJH, @SJD, @SJA, @VCH, @VCD, @VCA, @GBH, @GBD, @GBA, @BSH, @BSD, @BSA
)
SET
 id = IF(@id='', NULL, @id),
 country_id = IF(@country_id='', NULL, @country_id),
 league_id = IF(@league_id='', NULL, @league_id),
 season = IF(@season='', NULL, @season),
 stage = IF(@stage='', NULL, @stage),
 date = IF(@date='', NULL, @date),
 match_api_id = IF(@match_api_id='', NULL, @match_api_id),
 home_team_api_id = IF(@home_team_api_id='', NULL, @home_team_api_id),
 away_team_api_id = IF(@away_team_api_id='', NULL, @away_team_api_id),
 home_team_goal = IF(@home_team_goal='', NULL, @home_team_goal),
 away_team_goal = IF(@away_team_goal='', NULL, @away_team_goal),
 home_player_X1 = IF(@home_player_X1='', NULL, @home_player_X1),
 home_player_X2 = IF(@home_player_X2='', NULL, @home_player_X2),
 home_player_X3 = IF(@home_player_X3='', NULL, @home_player_X3),
 home_player_X4 = IF(@home_player_X4='', NULL, @home_player_X4),
 home_player_X5 = IF(@home_player_X5='', NULL, @home_player_X5),
 home_player_X6 = IF(@home_player_X6='', NULL, @home_player_X6),
 home_player_X7 = IF(@home_player_X7='', NULL, @home_player_X7),
 home_player_X8 = IF(@home_player_X8='', NULL, @home_player_X8),
 home_player_X9 = IF(@home_player_X9='', NULL, @home_player_X9),
 home_player_X10 = IF(@home_player_X10='', NULL, @home_player_X10),
 home_player_X11 = IF(@home_player_X11='', NULL, @home_player_X11),
 away_player_X1 = IF(@away_player_X1='', NULL, @away_player_X1),
 away_player_X2 = IF(@away_player_X2='', NULL, @away_player_X2),
 away_player_X3 = IF(@away_player_X3='', NULL, @away_player_X3),
 away_player_X4 = IF(@away_player_X4='', NULL, @away_player_X4),
 away_player_X5 = IF(@away_player_X5='', NULL, @away_player_X5),
 away_player_X6 = IF(@away_player_X6='', NULL, @away_player_X6),
 away_player_X7 = IF(@away_player_X7='', NULL, @away_player_X7),
 away_player_X8 = IF(@away_player_X8='', NULL, @away_player_X8),
 away_player_X9 = IF(@away_player_X9='', NULL, @away_player_X9),
 away_player_X10 = IF(@away_player_X10='', NULL, @away_player_X10),
 away_player_X11 = IF(@away_player_X11='', NULL, @away_player_X11),
 home_player_Y1 = IF(@home_player_Y1='', NULL, @home_player_Y1),
 home_player_Y2 = IF(@home_player_Y2='', NULL, @home_player_Y2),
 home_player_Y3 = IF(@home_player_Y3='', NULL, @home_player_Y3),
 home_player_Y4 = IF(@home_player_Y4='', NULL, @home_player_Y4),
 home_player_Y5 = IF(@home_player_Y5='', NULL, @home_player_Y5),
 home_player_Y6 = IF(@home_player_Y6='', NULL, @home_player_Y6),
 home_player_Y7 = IF(@home_player_Y7='', NULL, @home_player_Y7),
 home_player_Y8 = IF(@home_player_Y8='', NULL, @home_player_Y8),
 home_player_Y9 = IF(@home_player_Y9='', NULL, @home_player_Y9),
 home_player_Y10 = IF(@home_player_Y10='', NULL, @home_player_Y10),
 home_player_Y11 = IF(@home_player_Y11='', NULL, @home_player_Y11),
 away_player_Y1 = IF(@away_player_Y1='', NULL, @away_player_Y1),
 away_player_Y2 = IF(@away_player_Y2='', NULL, @away_player_Y2),
 away_player_Y3 = IF(@away_player_Y3='', NULL, @away_player_Y3),
 away_player_Y4 = IF(@away_player_Y4='', NULL, @away_player_Y4),
 away_player_Y5 = IF(@away_player_Y5='', NULL, @away_player_Y5),
 away_player_Y6 = IF(@away_player_Y6='', NULL, @away_player_Y6),
 away_player_Y7 = IF(@away_player_Y7='', NULL, @away_player_Y7),
 away_player_Y8 = IF(@away_player_Y8='', NULL, @away_player_Y8),
 away_player_Y9 = IF(@away_player_Y9='', NULL, @away_player_Y9),
 away_player_Y10 = IF(@away_player_Y10='', NULL, @away_player_Y10),
 away_player_Y11 = IF(@away_player_Y11='', NULL, @away_player_Y11),
 home_player_1 = IF(@home_player_1='', NULL, @home_player_1),
 home_player_2 = IF(@home_player_2='', NULL, @home_player_2),
 home_player_3 = IF(@home_player_3='', NULL, @home_player_3),
 home_player_4 = IF(@home_player_4='', NULL, @home_player_4),
 home_player_5 = IF(@home_player_5='', NULL, @home_player_5),
 home_player_6 = IF(@home_player_6='', NULL, @home_player_6),
 home_player_7 = IF(@home_player_7='', NULL, @home_player_7),
 home_player_8 = IF(@home_player_8='', NULL, @home_player_8),
 home_player_9 = IF(@home_player_9='', NULL, @home_player_9),
 home_player_10 = IF(@home_player_10='', NULL, @home_player_10),
 home_player_11 = IF(@home_player_11='', NULL, @home_player_11),
 away_player_1 = IF(@away_player_1='', NULL, @away_player_1),
 away_player_2 = IF(@away_player_2='', NULL, @away_player_2),
 away_player_3 = IF(@away_player_3='', NULL, @away_player_3),
 away_player_4 = IF(@away_player_4='', NULL, @away_player_4),
 away_player_5 = IF(@away_player_5='', NULL, @away_player_5),
 away_player_6 = IF(@away_player_6='', NULL, @away_player_6),
 away_player_7 = IF(@away_player_7='', NULL, @away_player_7),
 away_player_8 = IF(@away_player_8='', NULL, @away_player_8),
 away_player_9 = IF(@away_player_9='', NULL, @away_player_9),
 away_player_10 = IF(@away_player_10='', NULL, @away_player_10),
 away_player_11 = IF(@away_player_11='', NULL, @away_player_11),
 goal = IF(@goal='', NULL, @goal),
 shoton = IF(@shoton='', NULL, @shoton),
 shotoff = IF(@shotoff='', NULL, @shotoff),
 foulcommit = IF(@foulcommit='', NULL, @foulcommit),
 card = IF(@card='', NULL, @card),
 `cross` = IF(@cross='', NULL, @cross),
 corner = IF(@corner='', NULL, @corner),
 possession = IF(@possession='', NULL, @possession),
 B365H = IF(@B365H='', NULL, @B365H),
 B365D = IF(@B365D='', NULL, @B365D),
 B365A = IF(@B365A='', NULL, @B365A),
 BWH = IF(@BWH='', NULL, @BWH),
 BWD = IF(@BWD='', NULL, @BWD),
 BWA = IF(@BWA='', NULL, @BWA),
 IWH = IF(@IWH='', NULL, @IWH),
 IWD = IF(@IWD='', NULL, @IWD),
 IWA = IF(@IWA='', NULL, @IWA),
 LBH = IF(@LBH='', NULL, @LBH),
 LBD = IF(@LBD='', NULL, @BD),
 LBA = IF(@LBA='', NULL, @LBA),
 PSH = IF(@PSH='', NULL, @PSH),
 PSD = IF(@PSD='', NULL, @PSD),
 PSA = IF(@PSA='', NULL, @PSA),
 WHH = IF(@WHH='', NULL, @WHH),
 WHD = IF(@WHD='', NULL, @WHD),
 WHA = IF(@WHA='', NULL, @WHA),
 SJH = IF(@SJH='', NULL, @SJH),
 SJD = IF(@SJD='', NULL, @SJD),
 SJA = IF(@SJA='', NULL, @SJA),
 VCH = IF(@VCH='', NULL, @VCH),
 VCD = IF(@VCD='', NULL, @VCD),
 VCA = IF(@VCA='', NULL, @VCA),
 GBH = IF(@GBH='', NULL, @GBH),
 GBD = IF(@GBD='', NULL, @GBD),
 GBA = IF(@GBA='', NULL, @GBA),
 BSH = IF(@BSH='', NULL, @BSH),
 BSD = IF(@BSD='', NULL, @BSD),
 BSA = IF(@BSA='', NULL, @BSA);
SET sql_safe_updates = 0;
delete from player_attributes;


LOAD DATA LOCAL INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Player_attributes.csv'
INTO TABLE player_attributes
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@id, @player_fifa_api_id, @player_api_id, @date, @overall_rating, @potential, @preferred_foot,
 @attacking_work_rate, @defensive_work_rate, @crossing, @finishing, @heading_accuracy, @short_passing,
 @volleys, @dribbling, @curve, @free_kick_accuracy, @long_passing, @ball_control, @acceleration, @sprint_speed,
 @agility, @reactions, @balance, @shot_power, @jumping, @stamina, @strength, @long_shots, @aggression,
 @interceptions, @positioning, @vision, @penalties, @marking, @standing_tackle, @sliding_tackle, @gk_diving,
 @gk_handling, @gk_kicking, @gk_positioning, @gk_reflexes)
SET
id = IF(@id='', NULL, @id),
player_fifa_api_id = IF(@player_fifa_api_id='', NULL, @player_fifa_api_id),
player_api_id = IF(@player_api_id='', NULL, @player_api_id),
date = IF(@date='', NULL, @date),
overall_rating = IF(@overall_rating='', NULL, @overall_rating),
potential = IF(@potential='', NULL, @potential),
preferred_foot = IF(@preferred_foot='', NULL, @preferred_foot),
attacking_work_rate = IF(@attacking_work_rate='', NULL, @attacking_work_rate),
defensive_work_rate = IF(@defensive_work_rate='', NULL, @defensive_work_rate),
crossing = IF(@crossing='', NULL, @crossing),
finishing = IF(@finishing='', NULL, @finishing),
heading_accuracy = IF(@heading_accuracy='', NULL, @heading_accuracy),
short_passing = IF(@short_passing='', NULL, @short_passing),
volleys = IF(@volleys='', NULL, @volleys),
dribbling = IF(@dribbling='', NULL, @dribbling),
curve = IF(@curve='', NULL, @curve),
free_kick_accuracy = IF(@free_kick_accuracy='', NULL, @free_kick_accuracy),
long_passing = IF(@long_passing='', NULL, @long_passing),
ball_control = IF(@ball_control='', NULL, @ball_control),
acceleration = IF(@acceleration='', NULL, @acceleration),
sprint_speed = IF(@sprint_speed='', NULL, @sprint_speed),
agility = IF(@agility='', NULL, @agility),
reactions = IF(@reactions='', NULL, @reactions),
balance = IF(@balance='', NULL, @balance),
shot_power = IF(@shot_power='', NULL, @shot_power),
jumping = IF(@jumping='', NULL, @jumping),
stamina = IF(@stamina='', NULL, @stamina),
strength = IF(@strength='', NULL, @strength),
long_shots = IF(@long_shots='', NULL, @long_shots),
aggression = IF(@aggression='', NULL, @aggression),
interceptions = IF(@interceptions='', NULL, @interceptions),
positioning = IF(@positioning='', NULL, @positioning),
vision = IF(@vision='', NULL, @vision),
penalties = IF(@penalties='', NULL, @penalties),
marking = IF(@marking='', NULL, @marking),
standing_tackle = IF(@standing_tackle='', NULL, @standing_tackle),
sliding_tackle = IF(@sliding_tackle='', NULL, @sliding_tackle),
gk_diving = IF(@gk_diving='', NULL, @gk_diving),
gk_handling = IF(@gk_handling='', NULL, @gk_handling),
gk_kicking = IF(@gk_kicking='', NULL, @gk_kicking),
gk_positioning = IF(@gk_positioning='', NULL, @gk_positioning),
gk_reflexes = IF(@gk_reflexes='', NULL, @gk_reflexes);