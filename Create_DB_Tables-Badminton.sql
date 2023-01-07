-- Create database Badminton to demonstrate badminton player statistics and info 

CREATE DATABASE Badminton;
USE Badminton;
-- Table focused on players' basic info
CREATE TABLE Player_info (
	Player_ID INT,
   	Full_Name VARCHAR (30),
    Gender VARCHAR (10),
    Country VARCHAR (30), 
    World_Ranking INT
);
-- Table focused on players age, birthday and horoscope
CREATE TABLE Age (
	Player_ID INT,
	Full_Name VARCHAR (30),
    Age INT,
    Date_Of_Birth DATE,
    Horoscope VARCHAR (20)
);
-- Table focused the team they play for and partner(s) if doubles
CREATE TABLE Team (
	Player_ID INT,
 	Full_Name VARCHAR (30),
    Country VARCHAR (30),
    Single VARCHAR (10),
    Mixed VARCHAR (10),
    Mixed_Partner_Name VARCHAR (30),
    Mixed_Team_ID INT,
    Mens_Doubles VARCHAR (10),
	Mens_Partner_Name VARCHAR (30),
	Mens_Team_ID INT,
    Womens_Doubles VARCHAR (10),
	Womens_Partner_Name VARCHAR (30),
    Womens_Team_ID INT
);
-- Table focused on game and competition statistics 
-- DROP Table Game_stats
Use Badminton;
CREATE TABLE Game_stats (
	Player_ID_1 INT,
    Player_1_Full_Name VARCHAR (40),
    Player_ID_2 INT,
	Player_2_Full_Name VARCHAR (40),
    Mixed_Team_ID INT,
    Mens_Team_ID INT,
    Womens_Team_ID INT,
    Competition_Name VARCHAR (100),
    Opponent_Full_Name VARCHAR (50),
    Match_Result VARCHAR (30),
    Match_Score VARCHAR (30),
    Competition_Ranking INT
);
-- Table focused on player statistics - matches won, lost
CREATE TABLE Player_stats (
	Player_ID INT,
	Mixed_Team_ID INT,
    Mens_Team_ID INT,
    Womens_Team_ID INT,
	Player_Full_Name VARCHAR (30),
	Matches_Won INT,
    Matches_Lost INT,
    Total_Matches INT,
    Total_Aces_Smashes INT,
    Total_Service_Points INT
); 

-- Table focused on mixed teams
-- DROP TABLE Mixed_Teams
USE Badminton;
CREATE TABLE Mixed_Teams (
	Mixed_Team_ID INT,
    Male_Player_Full_Name VARCHAR (40),
    Female_Player_FUll_Name VARCHAR (40),
    Country VARCHAR (40)
);

-- Table focused on mens teams
-- DROP TABLE Mens_Teams
USE Badminton;
CREATE TABLE Mens_Teams (
	Mens_Team_ID INT,
    Player_1_Full_Name VARCHAR (40),
    Player_2_FUll_Name VARCHAR (40),
    Country VARCHAR (40)
);

-- Table focused on womens teams
-- DROP TABLE Womens_Teams
USE Badminton;
CREATE TABLE Womens_Teams (
	Womens_Team_ID INT,
    Player_1_Full_Name VARCHAR (40),
    Player_2_FUll_Name VARCHAR (40),
    Country VARCHAR (40)
);

-- Insert values into tables 

-- DROP Table Player_info;
SELECT * From Player_info; 
USE Badminton;
INSERT INTO player_info
(Player_ID, Full_Name, Gender, Country, World_Ranking)
VALUES
(1, 'Tommy Sugiarto', 'Male', 'Indonesia', 40),
(2, 'Carolina Marin', 'Female', 'Spain', 5),
(3, 'Viktor Axelsen', 'Male', 'Denmark', 1),
(4, 'Chou Tien Chen', 'Male', 'Chinese Taipei', 5),
(5, 'Rachanok Intanon', 'Female', 'Thailand', 8),
(6, 'Saina Nehwal', 'Female', 'India', 30),
(7, 'Coraline Bergeron', 'Female', 'France', 7),
(8, 'Wei Ming Tay', 'Male', 'Singapore', 20),
(9, 'Tai Tzu Ying', 'Female', 'Chinese Taipei', 2),
(10, 'Sarina Satomi', 'Female', 'Japan', 1),
(11, 'Yuma Yamazaki', 'Female', 'Japan', 1),
(12, 'Meril Loquette', 'Male', 'France', 26),
(13, 'Qu Zimo', 'Male', 'China', 5),
(14, 'Mai Jianpeng', 'Male', 'China', 4),
(15, 'Gabrielle Adcock', 'Female', 'England', 23),
(16, 'Chris Adcock', 'Male', 'England', 23),
(17, 'Nozomi Okuhara', 'Female', 'Japan', 6),
(18, 'Jenny Moore', 'Female', 'England', 66),
(19, 'Gregory Mairs', 'Male', 'England', 66),
(20, 'Jenny Nystorm', 'Female', 'Finland', 665);

-- DROP Table Age;
SELECT * FROM Age;
USE Badminton;
INSERT INTO Age
(Player_ID, Full_Name, Age, Date_Of_Birth, Horoscope)
VALUES
(1, 'Tommy Sugiarto', 34, '1988-05-31','Gemini'),
(2, 'Carolina Marin', 29, '1993-06-15', 'Gemini'),
(3, 'Viktor Axelsen', 28, '1994-01-04', 'Capricorn'),
(4, 'Chou Tien Chen', 32, '1990-01-08', 'Capricorn'),
(5, 'Rachanok Intanon', 27, '1995-02-05', 'Acquaris'),
(6, 'Saina Nehwal', 32, '1990-03-17', 'Pisces'),
(7, 'Coraline Bergeron', 25, '1997-07-07', 'Cancer'),
(8, 'Wei Ming Tay', 39, '1983-05-01', 'Taurus'),
(9, 'Tai Tzu Ying', 28, '1994-06-20', 'Gemini'),
(10, 'Sarina Satomi', 24, '1998-04-09', 'Aries'),
(11, 'Yuma Yamazaki', 34, '1988-04-08', 'Aries'),
(12, 'Meril Loquette', 40, '1982-09-03', 'Virgos'),
(13, 'Qu Zimo', 20, '2001-09-22', 'Libras'),
(14, 'Mai Jianpeng', 33, '1989-07-02', 'Cancer'),
(15, 'Gabrielle Adcock', 31, '1990-09-30', 'Libras'),
(16, 'Chris Adcock', 33, '1989-04-27', 'Taurus'),
(17, 'Nozomi Okuhara', 27, '1995-03-13', 'Pisces'),
(18, 'Jenny Moore', 27, '1995-08-31', 'Virgo'),
(19, 'Gregory Mairs', 27, '1994-12-07', 'Sagittarius'),
(20, 'Jenny Nystorm', 27, '1995-06-13','Gemini');

-- DROP Table Team;
SELECT * From Team;
USE Badminton;
INSERT INTO Team
(Player_ID, Full_Name, Country, Single, Mixed, Mixed_Partner_Name, Mixed_Team_ID, Mens_Doubles, 
Mens_Partner_Name, Mens_Team_ID, Womens_Doubles, Womens_Partner_Name, Womens_Team_ID)
VALUES
(1, 'Tommy Sugiarto', 'Indonesia', 'Yes', 'No', NULL, NULL, 'No', NULL, NULL, 'No', NULL, NULL),
(2, 'Carolina Marin', 'Spain', 'Yes', 'No', NULL, NULL, 'No', NULL, NULL, 'No', NULL, NULL), 
(3, 'Viktor Axelsen', 'Denmark', 'Yes', 'No', NULL, NULL, 'No', NULL, NULL, 'No', NULL, NULL),
(4, 'Chou Tien Chen', 'Chinese Taipei', 'Yes', 'No', NULL, NULL, 'No', NULL, NULL, 'No', NULL, NULL),
(5, 'Rachanok Intanon', 'Thailand', 'Yes', 'No', NULL, NULL, 'No', NULL, NULL, 'No', NULL, NULL),
(6, 'Saina Nehwal', 'India', 'Yes', 'No', NULL, NULL, 'No', NULL, NULL, 'No', NULL, NULL),
(7, 'Coraline Bergeron', 'France', 'Yes', 'Yes', 'Meril Loquette', 1, 'No', NULL, NULL, 'Yes', 'Madeline Garnier', 1),
(8, 'Wei Ming Tay', 'Singapore', 'Yes', 'No', NULL, NULL, 'No', NULL, NULL, 'No', NULL, NULL),
(9, 'Tai Tzu Ying', 'Chinese Taipei', 'Yes', 'No', NULL, NULL, 'No', NULL, NULL, 'No', NULL, NULL),
(10, 'Sarina Satomi', 'Japan', 'Yes', 'No', NULL, NULL, 'No', NULL, NULL, 'Yes', 'Yuma Yamazaki', 2),
(11, 'Yuma Yamazaki', 'Japan', 'Yes', 'Yes','Tanji Takehiko', 2, 'No', NULL, NULL, 'Yes', 'Sarina Satomi', 2),
(12, 'Meril Loquette', 'France', 'Yes', 'Yes', 'Coraline Bergeron', 1, 'Yes', 'Enéas Faucheux', 1, 'No', NULL, NULL),
(13, 'Qu Zimo', 'China', 'Yes', 'Yes', 'Yan Xifeng', 3, 'Yes', 'Mai Jianpeng', 2, 'No', NULL, NULL),
(14, 'Mai Jianpeng', 'China', 'Yes', 'No', NULL, NULL, 'Yes', 'Qu Zimo', 2, 'No', NULL, NULL),
(15, 'Gabrielle Adcock', 'England', 'No', 'Yes', 'Chris Adcock', '4', 'No', NULL, NULL, 'No', NULL, NULL),
(16, 'Chris Adcock', 'England', 'No', 'Yes', 'Gabrielle Adcock', '4', 'No', NULL, NULL, 'No', NULL, NULL),
(17, 'Nozomi Okuhara', 'Japan', 'Yes', 'No', NULL, NULL, 'No', NULL, NULL, 'No', NULL, NULL),
(18, 'Jenny Moore', 'England', 'No', 'Yes', 'Gregory Mairs', 5, 'No', NULL, NULL, 'Yes', 'Jessica Hopton', 3),
(19, 'Gregory Mairs', 'England', 'No', 'Yes', 'Jenny Moore', 5, 'Yes', 'Jeff Robinson', 3, 'No', NULL, NULL),
(20, 'Jenny Nystorm', 'Finland', 'Yes', 'No', NULL, NULL, 'No', NULL, NULL, 'No', NULL, NULL);


-- DROP Table Player_stats;
SELECT * From Player_stats; 
USE Badminton;
INSERT INTO Player_stats
(Player_ID, Mixed_Team_ID, Mens_Team_ID, Womens_Team_ID, Player_Full_Name, Matches_Won, Matches_Lost, 
Total_Matches, Total_Aces_Smashes, Total_Service_Points)
VALUES
(1, NULL, NULL, NULL, 'Tommy Sugiarto', 15, 7, Matches_won + Matches_lost, 8, 10),
(2, NULL, NULL, NULL, 'Carolina Marin', 66, 10, Matches_won + Matches_lost, 43, 33),
(3, NULL, NULL, NULL, 'Viktor Axelsen', 100, 20, Matches_won + Matches_lost, 70, 55),
(4, NULL, NULL, NULL, 'Chou Tien Chen', 80, 8, Matches_won + Matches_lost, 64, 52),
(5, NULL, NULL, NULL, 'Rachanok Intanon', 58, 9, Matches_won + Matches_lost, 45, 22),
(6, NULL, NULL, NULL, 'Saina Nehwal', 53, 30, Matches_won + Matches_lost, 29, 12),
(7, 1, NULL, 1, 'Coraline Bergeron', 33, 6, Matches_won + Matches_lost, 10, 8),
(8, NULL, NULL, NULL, 'Wei Ming Tay', 84, 35, Matches_won + Matches_lost, 26, 35),
(9, NULL, NULL, NULL, 'Tai Tzu Ying', 53, 10, Matches_won + Matches_lost, 27, 15),
(10, NULL, NULL, 2, 'Sarina Satomi', 107, 5, Matches_won + Matches_lost, 45, 62),
(11, 2, NULL, 2, 'Yuma Yamazaki', 142, 20, Matches_won + Matches_lost, 54, 82),
(12, 1, 1, NULL, 'Meril Loquette', 111, 43, Matches_won + Matches_lost, 39, 53),
(13, 3, 2, NULL, 'Qu Zimo', 142, 34, Matches_won + Matches_lost, 57, 74),
(14, NULL, 2, NULL, 'Mai Jianpeng', 207, 32, Matches_won + Matches_lost, 93, 105),
(15, 4, NULL, NULL, 'Gabrielle Adcock', 180, 142, Matches_won + Matches_lost, 92, 112),
(16, 4, NULL, NULL, 'Chris Adcock', 180, 142, Matches_won + Matches_lost, 123, 162),
(17, NULL, NULL, NULL, 'Nozomi Okuhara', 60, 13, Matches_won + Matches_lost, 43, 38),
(18, 5, NULL, 3, 'Jenny Moore', 129, 60, Matches_won + Matches_lost, 78, 46),
(19, 5, 3, NULL, 'Gregory Mairs', 135, 76, Matches_won + Matches_lost, 83, 57),
(20, NULL, NULL, NULL, 'Jenny Nystorm', 10, 3, Matches_won + Matches_lost, 5, 6);


SELECT * From Game_stats; 
USE Badminton;
INSERT INTO Game_stats
(Player_ID_1, Player_1_Full_Name, Player_ID_2, Player_2_Full_Name, Mixed_Team_ID, Mens_Team_ID, Womens_Team_ID, Competition_Name, 
Opponent_Full_Name, Match_Result, Match_Score, Competition_Ranking)
VALUES
(1, 'Tommy Sugiarto', NULL, NULL, NULL, NULL, NULL, 'India Open 2022', 'Kunlavut Vitidsarn', 
'Lost', '17-21 & 10-21', 5), -- inserted
(2, 'Carolina Marin', NULL, NULL, NULL, NULL, NULL, 'Japan Open 2022', 'Line Christophersen', 
'Win', '21-10 & 21-18', 3),
(3, 'Viktor Axelsen', NULL, NULL, NULL, NULL, NULL, 'Mens World Championship 2022', 
'Kunlavut Vitidsarn', 'Win', '21-5 & 21-16', 1),
(4, 'Chou Tien Chen', NULL, NULL, NULL, NULL, NULL, 'Japan Open 2022', 'Kenta Nishimoto', 
'Lost', '19-21 & 23-21 & 17-21', 4),
(5, 'Rachanok Intanon', NULL, NULL, NULL, NULL, NULL, 'Japan Open 2022', 'Yue Han', 
'Win', '21-16 & 13-21 & 21-19', 7),
(6, 'Saina Nehwal', NULL, NULL, NULL, NULL, NULL, 'Japan Open 2022', 'Akane Yamaguchi', 
'Lost', '9-21 & 17-21', 20),
(7, 'Coraline Bergeron', 12, 'Meril Loquette', 1, NULL, 1,'Tokyo Paralympic Games 2020', 'Desiderio Milano 
& Andreina Lorenzo', 'Win', '21-15 & 21-18', 4), -- inserted
(8, 'Wei Ming Tay', NULL, NULL, NULL, NULL, NULL, 'Tokyo Paralympic Games 2020', 'Teng Jun Kai', 
'Lost', '14-21 & 18-21', 10),
(9, 'Tai Tzu Ying', NULL, NULL, NULL, NULL, NULL, 'Japan Open 2022', 'Ga Eun Kim', 
'Win', '19-21 & 21-13 & 21-10', 3),
(10, 'Sarina Satomi', 11, 'Yuma Yamazaki', NULL, NULL, 2, 'Tokyo Paralympic Games 2020', 
'Zhou Boqin & Song Zhong', 'Win', '21-17 & 21-9', 2), -- inserted
(11, 'Yuma Yamazaki', NULL, 'Mizuno Masa', 2, NULL, 2, 'Tokyo Paralympic Games 2020', 
'Ambrosio Sedillo & Robertina Arencibia', 'Win', '21-8 & 21-13', 1), -- inserted
(12, 'Meril Loquette', NULL, 'Léonard Durand', 1, 1, NULL, 'Tokyo Paralympic Games 2020', 
'Ersin Mercan & Kutsi Tüzmen', 'Lost', '19-21 & 12-21', 16), -- inserted
(13, 'Qu Zimo', NULL, NULL, 3, 2, NULL, 'Mens World Championship 2022', 'Tommy Sugiarto', 'Lost', 
'21-10 & 21-15', 8), -- inserted
(14, 'Mai Jianpeng', 13, 'Qu Zimo', NULL, 2, NULL, 'Mens Doubles World Championship 2022', 
'Apostol Pushkin & Florentiy Morozov', 'Lost', '18-21 & 19-21', 5),
(15, 'Gabrielle Adcock', 16, 'Chris Adcock', 4, NULL, NULL, 'All England 2017', 
'Marco Correia & Reynaldo Vieira', 'Win', '21-16 & 21-10', 17),
(16, 'Chris Adcock', 15, 'Gabrielle Adcock', 4, NULL, NULL, 'European Championships 2018', 
'Marguerita Paramo & Augusto Caballero', 'Win', '21-18 & 21-19', 15),
(17, 'Nozomi Okuhara', NULL, NULL, NULL, NULL, NULL, 'Malaysia Masters', 'Yvonne Li', 'Win', '21-9 & 21-19', 4),
(18, 'Jenny Moore', NULL, 'Jessica Hopton', 5, NULL, 3, 'All England 2022', 
'Yvonne Li & Ann-Kathrin Spori', 'Win', '21-18 & 21-19', 25),
(19, 'Gregory Mairs', 18, 'Jenny Moore', 5, 3, NULL, 'Mixed World Championships 2022', 
'Venkat Gaurav Prasad & Juhi Dewangan', 'Win', '21-10 & 23-21', 35),
(20, 'Jenny Nystorm', NULL, NULL, NULL, NULL, NULL, 'Sweden Open', 'Nur Intan', 'Lost', '18-21 & 10-21', 70);

USE Badminton;
INSERT INTO Mixed_Teams
(Mixed_Team_ID, Male_Player_Full_Name, Female_Player_Full_Name, Country)
VALUES
(1, 'Meril Loquette', 'Coraline Bergeron', 'France'),
(2, 'Tanji Takehiko', 'Yuma Yamazaki', 'Japan'),
(3, 'Qu Zimo', 'Yan Xifeng', 'China'),
(4, 'Chris Adcock', 'Gabrielle Adcock', 'England'),
(5, 'Gregory Mairs', 'Jenny Moore', 'England');

USE Badminton;
INSERT INTO Mens_Teams
(Mens_Team_ID, Player_1_Full_Name, Player_2_Full_Name, Country)
VALUES
(1, 'Meril Loquette', 'Enéas Faucheux', 'France'),
(2, 'Qu Zimo', 'Mai Jianpeng', 'China'),
(3, 'Gregory Mairs', 'Jeff Robinson', 'England');


USE Badminton;
INSERT INTO Womens_Teams
(Womens_Team_ID, Player_1_Full_Name, Player_2_Full_Name, Country)
VALUES
(1, 'Coraline Bergeron', 'Madeline Garnier', 'France'),
(2, 'Sarina Satomi', 'Yuma Yamazaki', 'Japan'),
(3, 'Jenny Moore', 'Jessica Hopton', 'England');








