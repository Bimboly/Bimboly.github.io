USE [BIMBOLY SQL PROJECTS]
GO

SELECT [Year]
      ,[Team]
      ,[NAME ]
      ,[No#]
      ,[Pos]
      ,[Ht]
      ,[Wt]
      ,[Age]
      ,[Exp]
      ,[College]
      ,[FirstName]
      ,[LastName]
      ,[Ft]
      ,[In]
      ,[Inches]
  FROM [dbo].['Football Players Data$']

GO

SELECT *
FROM [dbo].['Football Players Data$']

-- Write a query to find all the players in the "Arizona" team.
SELECT TEAM
      ,NAME
FROM [dbo].['Football Players Data$']
WHERE TEAM = 'ARIZONA'


-- Write a query to find all the players who play as a "WR" (Wide Receiver).
SELECT NAME
      ,Pos
FROM [dbo].['Football Players Data$']
WHERE Pos = 'WR'


-- Write a query to list all players taller than 6 feet 2 inches.
SELECT NAME
      ,Ht
FROM [dbo].['Football Players Data$']
WHERE Ht > '6-2'


-- Write a query to find all players who attended the "Washington" college.
SELECT NAME
      ,College
FROM [dbo].['Football Players Data$']
WHERE College = 'Washington'

-- Write a query to list players who are 25 years old or younger.
SELECT NAME
      ,College
FROM [dbo].['Football Players Data$']
WHERE College = 'Washington'

-- Write a query to list players who are 25 years old or younger.
SELECT NAME
      ,Age
FROM [dbo].['Football Players Data$']
WHERE Age <= '25'


-- Write a query to find all players with missing Age data.
SELECT NAME
      ,Age
FROM [dbo].['Football Players Data$']
WHERE Age = 'N/A'


-- Write a query to find players who are rookies (Exp = 'R').
SELECT NAME
      ,Exp
FROM [dbo].['Football Players Data$']
WHERE Exp = 'R'


-- Write a query to find the tallest player on the "New Orleans" team.
SELECT NAME, Team, Inches
FROM [dbo].['Football Players Data$'] 
WHERE Team = 'New Orleans'
Order by Inches DESC 


-- Write a query to find players weighing more than 250 pounds.
SELECT NAME
      ,Wt
FROM [dbo].['Football Players Data$']
WHERE Wt > '250'
Order by Wt ASC


-- Write a query to calculate the average height of players at each position.
Select Pos, AVG(Inches) AS Avg_Height
FROM [dbo].['Football Players Data$']
GROUP BY Pos



-- Write a query to rank players by age within their team. If two players have the same age, rank them by their weight.
SELECT Team, FirstName, LastName, Age, Wt,
RANK() OVER (PARTITION BY Team ORDER BY Age DESC, Wt DESC) AS Age_Rank
FROM [dbo].['Football Players Data$']


-- Write a query to calculate the average height (in inches) for all players older than 25 years.
SELECT AVG(Inches) AS Avg_Height
FROM [dbo].['Football Players Data$']
WHERE Age > '25'


-- Write a query to find all players whose height is greater than the average height of their respective team.
 SELECT Team, AVG(Inches) AS Avg_Team_Height
 FROM [dbo].['Football Players Data$']
 GROUP BY Team


--Write a query to find all players who share the same last name.
SELECT LastName, COUNT(*) AS Player_Count
 FROM [dbo].['Football Players Data$']
GROUP BY LastName
HAVING COUNT(*) > 1;

-- Write a query to find the tallest and shortest players from each college.
   SELECT College, 
    MAX(Inches) AS Max_Height, 
	 MIN(Inches) AS Min_Height
	 FROM [dbo].['Football Players Data$']
	 GROUP BY College


-- Write a query to calculate the percentage of players in each position for every team.
 SELECT Team, Pos, COUNT(*) AS Pos_Count
  FROM [dbo].['Football Players Data$']
 GROUP BY Team, Pos

 SELECT Team, COUNT(*) AS Total_Count
 FROM [dbo].['Football Players Data$']
 GROUP BY Team

