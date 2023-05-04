/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  student
 * Created: Mar 9, 2023
 */

/*CREATE TABLE test(
id VARCHAR(20)
);*/

--DROP DATABASE ESPN;
--CREATE DATABASE ESPN;
CREATE DATABASE Account_ESPN;
CREATE DATABASE Information_ESPN;
CREATE DATABASE Betting_ESPN;

--DROP DATABASE Account_ESPN;
--DROP DATABASE Information_ESPN;
--DROP DATABASE Betting_ESPN;

DROP TABLE Betting;
DROP TABLE Accounts;
DROP TABLE Teams;
DROP TABLE Players;
DROP TABLE Leagues;


CREATE TABLE Account_ESPN.Accounts(
    userID INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(100) NOT NULL,
    password VARCHAR(100) NOT NULL,
    amountBet FLOAT,
    netWinnings FLOAT,
    accountType CHAR(1) NOT NULL DEFAULT 'U' -- U for user, M for Moderator, B for Bookie
);

CREATE TABLE Betting_ESPN.Betting(
    betID INT PRIMARY KEY AUTO_INCREMENT,
    userID INT,
    odds FLOAT NOT NULL,
    priceOfBet FLOAT NOT NULL,
    currentBet FLOAT
    --FOREIGN KEY(userID) 
);

-- Sports System
CREATE TABLE Information_ESPN.Leagues(
    leagueID INT PRIMARY KEY AUTO_INCREMENT,
    leagueName VARCHAR(100) NOT NULL,
    numOfTeams INT,
    numOfPlayers INT,
    sport VARCHAR(100) NOT NULL,
    gamesInSeason INT
);

CREATE TABLE Information_ESPN.Teams(
    leagueID INT,
    teamName VARCHAR(100) NOT NULL,
    positionInLeague INT NOT NULL,
    numOfPlayers INT NOT NULL,
    amountBet FLOAT,
    trophiesWon VARCHAR(100),
    FOREIGN KEY(leagueID) REFERENCES Leagues(leagueID)
);

CREATE TABLE Information_ESPN.Players(
    playerID INT PRIMARY KEY AUTO_INCREMENT,
    leagueID INT,
    playerName VARCHAR(100) NOT NULL,
    playerNum INT,
    team VARCHAR(100),
    age INT NOT NULL,
    yearsPro INT NOT NULL,
    points INT,
    goals INT,
    assists INT,
    FOREIGN KEY(leagueID) REFERENCES Leagues(leagueID)
);



INSERT INTO Information_ESPN.Leagues(leagueName, numOfTeams, numOfPlayers, sport, gamesInSeason)
VALUES ("National Football League", 32, 300, "American Football", 17);

INSERT INTO Information_ESPN.Leagues(leagueName, numOfTeams, numOfPlayers, sport, gamesInSeason)
VALUES ("Major League Baseball", 30, 300, "Baseball", 162);

INSERT INTO Information_ESPN.Leagues(leagueName, numOfTeams, numOfPlayers, sport, gamesInSeason)
VALUES ("National Basketball Association", 30, 500, "Basketball", 82);

INSERT INTO Information_ESPN.Leagues(leagueName, numOfTeams, numOfPlayers, sport, gamesInSeason)
VALUES ("Premier League", 20, 200, "Soccer", 38);

INSERT INTO Information_ESPN.Leagues(leagueName, numOfTeams, numOfPlayers, sport, gamesInSeason)
VALUES ("National Hockey League", 32, 400, "Hockey", 82);

INSERT INTO Information_ESPN.Leagues(leagueName, numofTeams, numOfPlayers, sport, gamesInSeason)
VALUES ("PGA Tour", 0, null, "Golf", null);



--EPL

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (2, "Arsenal", 1, 20);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (2, "Manchester City", 2, 20);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (2, "Manchester United", 3, 20);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (2, "Tottenham", 4, 19);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (2, "Newcastle United", 5, 21);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (2, "Liverpool", 6, 22);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (2, "Brighton", 7, 17);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (2, "Brentford", 8, 24);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (2, "Fulham", 9, 17);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (2, "Chelsea", 10, 14);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (2, "Aston Villa", 11, 17);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (2, "Crystal Palace", 12, 19);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (2, "Wolves", 13, 18);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (2, "Nottingham Forest", 14, 17);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (2, "Everton", 15, 19);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (2, "Leicester City", 16, 21);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (2, "West Ham United", 17, 22);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (2, "Bournemouth", 18, 23);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (2, "Leeds United", 19, 17);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (2, "Southampton", 20, 20);




--NFL

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (1, "Arizona Cardinals", 1, 50);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (1, "Atlanta Falcons", 1, 50);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (1, "Carolina Panthers", 1, 50);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (1, "Chicago Bears", 1, 50);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (1, "Dallas Cowboys", 1, 50);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (1, "Detroit Lions", 1, 50);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (1, "Green Bay Packers", 1, 50);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (1, "Los Angeles Rams", 1, 50);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (1, "Minnesota Vikings", 1, 50);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (1, "New Orleans Saints", 1, 50);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (1, "New York Giants", 1, 50);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (1, "Philadelphia Eagles", 1, 50);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (1, "San Francisco 49ers", 1, 50);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (1, "Seattle Seahawks", 1, 50);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (1, "Tampa Bay Buccaneers", 1, 50);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (1, "Washington Commanders", 1, 50);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (1, "Baltimore Ravens", 1, 50);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (1, "Buffalo Bills", 1, 50);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (1, "Cincinnati Bengals", 1, 50);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (1, "Cleveland Browns", 1, 50);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (1, "Denver Broncos", 1, 50);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (1, "Houston Texans", 1, 50);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (1, "Indianapolis Colts", 1, 50);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (1, "Jacksonville Jaguars", 1, 50);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (1, "Kansas City Chiefs", 1, 50);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (1, "Las Vegas Raiders", 1, 50);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (1, "Los Angeles Chargers", 1, 50);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (1, "Miami Dolphins", 1, 50);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (1, "New England Patriots", 1, 50);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (1, "New York Jets", 1, 50);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (1, "Pittsburgh Steelers", 1, 50);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (1, "Tennessee Titans", 1, 50);

--NBA

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (3, "Milwaukee Bucks", 1, 12);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (3, "Boston Celtics", 2, 13);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (3, "Philadeplhia 76ers", 3, 11);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (3, "Denver Nuggets", 4, 15);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (3, "Cleveland Cavaliers", 5, 20);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (3, "Sacramento Kings", 6, 13);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (3, "Memphis Grizzlies", 7, 15);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (3, "New York Knicks", 8, 13);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (3, "Brooklyn Nets", 9, 14);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (3, "Phoenix Suns", 10, 16);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (3, "Miami Heat", 11, 17);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (3, "Los Angeles Clippers", 12, 13);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (3, "Golden State Warriors", 13, 12);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (3, "Minnesota Timberwolves", 14, 11);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (3, "Dallas Mavericks", 15, 14);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (3, "Atlanta Hawks", 16, 16);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (3, "Oklahoma City Thunder", 17, 17);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (3, "Los Angeles Lakers", 18, 18);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (3, "Toronto Raptors", 19, 19);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (3, "Utah Jazz", 20, 13);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (3, "New Orleans Pelicans", 21, 11);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (3, "Washington Wizards", 22, 12);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (3, "Chicago Bulls", 23, 14);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (3, "Indiana Pacers", 24, 15);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (3, "Portland Trail Blazers", 25, 13);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (3, "Orlando Magic", 26, 16);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (3, "Charlotte Hornets", 27, 12);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (3, "San Antonio Spurs", 28, 20);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (3, "Houston Rockets", 29, 13);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (3, "Detroit Pistons", 30, 15);



--NHL

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (1, "Arizona Cardinals", 1, 50);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (1, "Atlanta Falcons", 1, 50);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (1, "Carolina Panthers", 1, 50);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (1, "Chicago Bears", 1, 50);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (1, "Dallas Cowboys", 1, 50);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (1, "Detroit Lions", 1, 50);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (1, "Green Bay Packers", 1, 50);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (1, "Los Angeles Rams", 1, 50);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (1, "Minnesota Vikings", 1, 50);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (1, "New Orleans Saints", 1, 50);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (1, "New York Giants", 1, 50);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (1, "Philadelphia Eagles", 1, 50);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (1, "San Francisco 49ers", 1, 50);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (1, "Seattle Seahawks", 1, 50);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (1, "Tampa Bay Buccaneers", 1, 50);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (1, "Washington Commanders", 1, 50);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (1, "Baltimore Ravens", 1, 50);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (1, "Buffalo Bills", 1, 50);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (1, "Cincinnati Bengals", 1, 50);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (1, "Cleveland Browns", 1, 50);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (1, "Denver Broncos", 1, 50);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (1, "Houston Texans", 1, 50);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (1, "Indianapolis Colts", 1, 50);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (1, "Jacksonville Jaguars", 1, 50);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (1, "Kansas City Chiefs", 1, 50);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (1, "Las Vegas Raiders", 1, 50);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (1, "Los Angeles Chargers", 1, 50);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (1, "Miami Dolphins", 1, 50);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (1, "New England Patriots", 1, 50);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (1, "New York Jets", 1, 50);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (1, "Pittsburgh Steelers", 1, 50);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (1, "Tennessee Titans", 1, 50);

--NBA

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (4, "Boston Bruins", 1, 12);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (4, "Carolina Hurricanes", 2, 13);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (4, "New Jersey Devils", 3, 11);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (4, "Vegas Golden Knights", 4, 15);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (4, "Toronto Maple Leafs", 5, 20);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (4, "Dallas Stars", 6, 13);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (4, "Los Angeles Kings", 7, 15);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (4, "New York Rangers", 8, 13);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (4, "Tampa Bay Lightning", 9, 14);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (4, "Minnesota Wild", 10, 16);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (4, "Colorado Avalanche", 11, 17);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (4, "Edmonton Oilers", 12, 13);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (4, "Seattle Kraken", 13, 12);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (4, "Winnipeg Jets", 14, 11);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (4, "Pittsburgh Penguins", 15, 14);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (4, "New York Islanders", 16, 16);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (4, "Nashville Predatorsr", 17, 17);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (4, "Calgary Flames", 18, 18);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (4, "Florida Panthers", 19, 19);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (4, "Washington Capitals", 20, 13);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (4, "Buffalo Sabres", 21, 11);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (4, "Ottawa Senators", 22, 12);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (4, "Detroit Red Wings", 23, 14);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (4, "Vancouver Canucks", 24, 15);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (4, "St. Louis Blues", 25, 13);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (4, "Arizona Coyotes", 26, 16);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (4, "Montreal Canadiens", 27, 12);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (4, "Philadelphia Flyers", 28, 20);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (4, "Anaheim Ducks", 29, 13);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (4, "Chicago Blackhawks", 30, 15);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (4, "San Jose Sharks", 31, 13);

INSERT INTO Information_ESPN.Teams(leagueID, teamName, positionInLeague, numOfPlayers)
VALUES (4, "Columbus Blue Jackets", 32, 15);


--

INSERT INTO Information_ESPN.Players(leagueID, playerName, playerNum, team, age, yearsPro, points, goals, assists) VALUES (2, "Marcus Rashford", 10, "Manchester United", 25, 7, 130, 81, 49);

INSERT INTO Information_ESPN.Players(leagueID, playerName, playerNum, team, age, yearsPro, points, goals, assists) VALUES (2, "Joao Palhinha", 26, "Fulham", 27, 8, 19, 4, 15);

INSERT INTO Information_ESPN.Players(leagueID, playerName, playerNum, team, age, yearsPro, points, goals, assists) VALUES (2, "Allan Saint-Maximin", 10, "Manchester United", 25, 7, 130, 81, 49);

INSERT INTO Information_ESPN.Players(leagueID, playerName, playerNum, team, age, yearsPro, points, goals, assists) VALUES (2, "Casemiro", 18, "Manchester United", 31, 12, 48, 8, 40);

INSERT INTO Information_ESPN.Players(leagueID, playerName, playerNum, team, age, yearsPro, points, goals, assists) VALUES (2, "Neal Maupay", 20, "Everton", 26, 6, 39, 32, 7);

INSERT INTO Information_ESPN.Players(leagueID, playerName, playerNum, team, age, yearsPro, points, goals, assists) VALUES (2, "Erling Haaland", 9, "Manchester City", 22, 3, 99, 81, 18);

INSERT INTO Information_ESPN.Players(leagueID, playerName, playerNum, team, age, yearsPro, points, goals, assists) VALUES (2, "Raheem Sterling", 17, "Chelsea", 25, 7, 134, 68, 66);

INSERT INTO Information_ESPN.Players(leagueID, playerName, playerNum, team, age, yearsPro, points, goals, assists) VALUES (2, "Wilfried Zaha", 11, "Crystal Palace", 30, 11, 88, 38, 50);

INSERT INTO Information_ESPN.Players(leagueID, playerName, playerNum, team, age, yearsPro, points, goals, assists) VALUES (2, "William Saliba", 12, "Arsenal", 22, 4, 9, 8, 1);

INSERT INTO Information_ESPN.Players(leagueID, playerName, playerNum, team, age, yearsPro, points, goals, assists) VALUES (2, "Jamie Vardy", 9, "Leicester City", 36, 16, 196, 170, 26);

INSERT INTO Information_ESPN.Players(leagueID, playerName, playerNum, team, age, yearsPro, points, goals, assists) VALUES (2, "Darwin Nunez", 27, "Liverpool", 23, 5, 41, 34, 7);

INSERT INTO Information_ESPN.Players(leagueID, playerName, playerNum, team, age, yearsPro, points, goals, assists) VALUES (2, "Son Heung-min", 7, "Tottenham Hotspur", 30, 11, 155, 101, 54);

INSERT INTO Information_ESPN.Players(leagueID, playerName, playerNum, team, age, yearsPro, points, goals, assists) VALUES (2, "Amadou Onana", 8, "Everton", 21, 3, 7, 4, 3);

INSERT INTO Information_ESPN.Players(leagueID, playerName, playerNum, team, age, yearsPro, points, goals, assists) VALUES (2, "Douglas Luiz", 6, "Aston VIlla", 24, 6, 18, 5, 13);


--




--
INSERT INTO Account_ESPN.Accounts(username, password, accountType)
VALUES ("Admin", "Admin", "M");


SELECT * FROM Information_ESPN.Leagues LIMIT 100;
SELECT * FROM Information_ESPN.Accounts WHERE username LIKE "Admin";
SELECT * FROM Information_ESPN.Accounts WHERE username LIKE "a";
SELECT * FROM Information_ESPN.Teams WHERE leagueID LIKE 1;
SELECT * FROM Information_ESPN.Accounts;



