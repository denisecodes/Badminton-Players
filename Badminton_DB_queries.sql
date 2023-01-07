-- Queries to check tables 
USE Badminton;
SELECT * From Player_info; 
SELECT * FROM Age;
SELECT * From Team;
SELECT * From Player_stats; 
Select * From Game_stats; 
Select * From Mixed_Teams;
Select * From Mens_Teams;
Select * From Womens_Teams;

-- Set Primary Keys
ALTER TABLE `Badminton`.`Age` 
CHANGE COLUMN `Player_ID` `Player_ID` INT NOT NULL,
ADD PRIMARY KEY (`Player_ID`);
;

ALTER TABLE `Badminton`.`Mens_Teams` 
CHANGE COLUMN `Mens_Team_ID` `Mens_Team_ID` INT NOT NULL,
ADD PRIMARY KEY (`Mens_Team_ID`);
;

ALTER TABLE `Badminton`.`Mixed_Teams` 
CHANGE COLUMN `Mixed_Team_ID` `Mixed_Team_ID` INT NOT NULL,
ADD PRIMARY KEY (`Mixed_Team_ID`);
;

ALTER TABLE `Badminton`.`Player_info` 
CHANGE COLUMN `Player_ID` `Player_ID` INT NOT NULL,
ADD PRIMARY KEY (`Player_ID`);
;

ALTER TABLE `Badminton`.`Player_stats` 
CHANGE COLUMN `Player_ID` `Player_ID` INT NOT NULL,
ADD PRIMARY KEY (`Player_ID`);
;

ALTER TABLE `Badminton`.`Team` 
CHANGE COLUMN `Player_ID` `Player_ID` INT NOT NULL,
ADD PRIMARY KEY (`Player_ID`);
;

ALTER TABLE `Badminton`.`Womens_Teams` 
CHANGE COLUMN `Womens_Team_ID` `Womens_Team_ID` INT NOT NULL,
ADD PRIMARY KEY (`Womens_Team_ID`);
;

-- Set Foreign Keys

-- Team foreign keys

ALTER TABLE Team   
ADD CONSTRAINT 
FK_Team_Table_Mixed_Team_ID
FOREIGN KEY (Mixed_Team_ID)
REFERENCES Mixed_Teams (Mixed_Team_ID);

ALTER TABLE Team   
ADD CONSTRAINT 
FK_Team_Table_Mens_Team_ID
FOREIGN KEY (Mens_Team_ID)
REFERENCES Mens_Teams (Mens_Team_ID);

ALTER TABLE Team   
ADD CONSTRAINT 
FK_Team_Table_Womens_Team_ID
FOREIGN KEY (Womens_Team_ID)
REFERENCES Womens_Teams (Womens_Team_ID);

-- Player_stats foreign keys

ALTER TABLE Player_stats  
ADD CONSTRAINT 
FK_Player_stats_Mixed_Team_ID
FOREIGN KEY (Mixed_Team_ID)
REFERENCES Mixed_Teams (Mixed_Team_ID);

ALTER TABLE Player_stats    
ADD CONSTRAINT 
FK_Player_stats_Mens_Team_ID
FOREIGN KEY (Mens_Team_ID)
REFERENCES Mens_Teams (Mens_Team_ID);

ALTER TABLE Player_stats    
ADD CONSTRAINT 
FK_Player_stats_Womens_Team_ID
FOREIGN KEY (Womens_Team_ID)
REFERENCES Womens_Teams (Womens_Team_ID);

-- Games stats foreign keys
-- Set Mixed, Mens, Womens Team IDs to relevant tables 

ALTER TABLE Game_stats  
ADD CONSTRAINT 
FK_Game_stats_Mixed_Team_ID
FOREIGN KEY (Mixed_Team_ID)
REFERENCES Mixed_Teams (Mixed_Team_ID);

ALTER TABLE Game_stats    
ADD CONSTRAINT 
FK_Game_stats_Mens_Team_ID
FOREIGN KEY (Mens_Team_ID)
REFERENCES Mens_Teams (Mens_Team_ID);

ALTER TABLE Game_stats    
ADD CONSTRAINT 
FK_Game_stats_Womens_Team_ID
FOREIGN KEY (Womens_Team_ID)
REFERENCES Womens_Teams (Womens_Team_ID);

-- Join multiple tables in a logical way and create a view, joined columns from player_info, age and 
-- team table together to find out if players played single, mixed, 
-- mens/womens doubles along with their age

CREATE VIEW Single_Mixed_Doubles AS 
SELECT 
Player_info.Player_ID, Player_info.Full_Name, Player_info.Gender, Age.Age,
Player_info.Country, Team.Single, Team.Mixed, Team.Mens_Doubles, Team.Womens_Doubles,
Player_info.World_Ranking 
FROM Player_info
INNER JOIN 
Age
ON Player_Info.Player_ID = Age.Player_ID
INNER JOIN
Team
ON 
Player_info.Player_ID = Team.Player_ID;

SELECT * FROM Single_Mixed_Doubles

-- Create stored function with world rankin labelled as Top 10, 
-- and so forth,Top 20, Top 50, Top 100 


USE Badminton;

DELIMITER //
CREATE FUNCTION World_Ranking_Level(
	World_Ranking INT
)
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
	DECLARE World_Ranking_Level VARCHAR (50);
    IF World_Ranking <= 10 THEN
		SET World_Ranking_Level ='Top 10';
    ELSEIF (World_Ranking <= 20 AND
		World_Ranking > 10) THEN
		SET World_Ranking_Level ='Top 20';
	ELSEIF (World_Ranking <= 50 AND
		World_Ranking > 20) THEN
		SET World_Ranking_Level ='Top 100';   
	ELSEIF (World_Ranking <= 100 AND
		World_Ranking > 50) THEN
		SET World_Ranking_Level ='Top 100';  
	END IF;
	RETURN (World_Ranking_Level);
END//balance
DELIMITER ;

-- How world ranking level works with Full Name and World Ranking of players shown
-- with query below

USE Badminton;
SELECT 
	Full_Name,
    World_Ranking,
    World_Ranking_Level(World_Ranking)
FROM
Player_info;

-- Create stored procedure using world ranking level
-- with badminton players details, world ranking ordered by world ranking

USE Badminton;

DELIMITER //
CREATE PROCEDURE GetBadmintonPlayerDetails()
BEGIN
	SELECT Full_Name, Gender, Country, World_Ranking, World_Ranking_Level(World_Ranking)
    FROM Player_info ORDER BY World_Ranking;
END//balance
DELIMITER ;

-- Use GetBadmintonPlayerDetails store procedure

CALL GetBadmintonPlayerDetails()

                    
-- Subquery within a query, find the names of England's womens badminton double team 

SELECT Player_1_Full_name, Player_2_Full_Name, Country
FROM Womens_Teams
     WHERE Womens_Team_ID IN (SELECT Womens_Team_ID
					FROM Womens_Teams
                    WHERE Country = 'England');  
                    
-- Find countries where there are 2 or more players

USE Badminton;
SELECT 
  Country, COUNT(Player_ID) AS Num_Of_Players
FROM
Player_info	
GROUP BY Country
HAVING COUNT(Player_ID) >=2;


