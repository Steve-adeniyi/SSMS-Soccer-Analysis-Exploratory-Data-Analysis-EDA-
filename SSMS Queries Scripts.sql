--View the first 100 rows of the dataset to understand its structure.

SELECT TOP (100) *
FROM [Test].[dbo].[Soccer_dataset_advanced]

---Count the total number of players in the dataset.

SELECT COUNT(*) AS TotalPlayers
FROM [Test].[dbo].[Soccer_dataset_advanced]

---List all unique teams in the league.

SELECT DISTINCT(Team)
FROM [Test].[dbo].[Soccer_dataset_advanced]

---Count how many players are in each team.

SELECT 
   Team,
   COUNT(*) AS NumberOfPlayer
FROM [dbo].[Soccer_dataset_advanced]
GROUP BY Team;

---Identify the top 10 players with the most goals.

SELECT TOP 10
   player_name,
   goals
FROM [dbo].[Soccer_dataset_advanced]

---Find the average salary for players in each team.
  
SELECT
   Team,
   AVG(CAST(average_salary_zar AS FLOAT)) AS AverageSalary
FROM [dbo].[Soccer_dataset_advanced]
GROUP BY Team;

---Retrieve the top 10 players with the highest market value.

SELECT TOP 10
   Player_name,
   market_value_zar
FROM [dbo].[Soccer_dataset_advanced]
ORDER BY market_value_zar;

---Calculate the average passing accuracy for each position

SELECT
   Position,
   AVG(CAST(passing_accuracy AS FLOAT)) AS AveragePassingAccuracy
FROM [dbo].[Soccer_dataset_advanced]
GROUP BY Position;

---Compare shot accuracy with goals to find correlations.

SELECT
    ( COUNT(*) * SUM(CAST(shot_accuracy AS FLOAT) * CAST(Goals AS FLOAT))
        - SUM(CAST(shot_accuracy AS FLOAT)) * SUM(CAST(Goals AS FLOAT)))
    /
    SQRT((COUNT(*) * SUM(CAST(shot_accuracy AS FLOAT) * CAST(shot_accuracy AS FLOAT)) 
            - SUM(CAST(shot_accuracy AS FLOAT)) * SUM(CAST(shot_accuracy AS FLOAT)))
        *
        (COUNT(*) * SUM(CAST(Goals AS FLOAT) * CAST(Goals AS FLOAT)) 
            - SUM(CAST(Goals AS FLOAT)) * SUM(CAST(Goals AS FLOAT)))) AS CorrelationCoefficient
FROM [dbo].[Soccer_dataset_advanced]

---Compute total goals and assists for each team.

SELECT
    Team,
    SUM(CAST(goals AS INT)) AS TotalGoals,
    SUM(CAST(assists AS INT)) AS TotalAssists
FROM [dbo].[Soccer_dataset_advanced]
GROUP BY Team;

---Count players by their marital status.

SELECT
   marital_status,
   COUNT(*) AS NumberOfPlayers
FROM [dbo].[Soccer_dataset_advanced]
GROUP BY Marital_Status
ORDER BY Marital_Status;

--- Count players by nationality.

SELECT 
  nationality,
  COUNT(*) AS NumberOfPlayer
FROM [dbo].[Soccer_dataset_advanced]
GROUP BY Nationality
ORDER BY Nationality;

---Find average market value grouped by nationality

SELECT 
   nationality,
   AVG(CAST(market_value_zar AS FLOAT)) AS AverageMarketValue
FROM [dbo].[Soccer_dataset_advanced]
GROUP BY Nationality;

---Determine how many player contracts end in each year

SELECT
   contract_end_year,
   COUNT(*) AS NumberOfYear
FROM [dbo].[Soccer_dataset_advanced]
WHERE contract_end_year IS NOT NULL
GROUP BY contract_end_year
ORDER BY contract_end_year ASC;

---Identify players whose contracts end next year.

SELECT *
FROM [dbo].[Soccer_dataset_advanced]
WHERE contract_end_year = YEAR(GETDATE())+1;

---Summarize the number of players by injury status.

SELECT 
  injury_status,
  COUNT(*) AS NumberOfPlayer
FROM [dbo].[Soccer_dataset_advanced]
GROUP BY injury_status
ORDER BY injury_status;
  
---Calculate goals per match ratio for each player.

SELECT
   player_name,
   goals,
   matches_played,
   CAST(goals AS FLOAT) /NULLIF(CAST(matches_played AS FLOAT),0) AS GoalPerMatch
FROM [dbo].[Soccer_dataset_advanced];

---how many players are managed by each agent.

SELECT
   agent,
   COUNT(*) AS PlayerNumber
FROM [dbo].[Soccer_dataset_advanced]
GROUP BY agent
ORDER BY PlayerNumber DESC;

---Calculate average height and weight by player position

SELECT
   position,
   AVG(CAST(height_cm AS FLOAT)) AS AverageHeight,
   AVG(CAST(weight_kg AS FLOAT)) AS AverageWeight
FROM [dbo].[Soccer_dataset_advanced]
GROUP BY Position
ORDER BY Position;

---Identify players with the highest combined goals and assists.

SELECT 
   player_name,
   CAST(goals AS INT) AS Goals,
   CAST(assists AS INT) AS Assists,
   CAST(goals AS INT) + CAST(assists AS INT) AS TotalContribution
FROM [dbo].[Soccer_dataset_advanced]
ORDER BY TotalContribution DESC;
