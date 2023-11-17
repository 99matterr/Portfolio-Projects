SELECT *
FROM CovidDeaths 
ORDER BY location

--SELECT *
--FROM CovidVacinations
--ORDER BY 3, 4

-- Select Data that we are going to be using

SELECT location, date, total_cases, new_cases, total_deaths, population
FROM CovidDeaths 
ORDER BY location

-- Looking at Total Cases vs Total deaths which shows the likelihood of diying from covid depending on the country
/*
To handle the divide by zero error in SQL Server
you can use the NULLIF function to return a null value if the divisor is zero. 
Here’s an example code snippet that you can use to modify your SQL query:

SELECT column1 / NULLIF(column2, 0) AS result FROM your_table

This will return a null value if the divisor is zero and prevent the divide by zero error1. 
You can replace column1, column2, and your_table with the appropriate column names and table name.

ALTER TABLE CovidDeaths ALTER COLUMN total_cases float  -- I hade to make some changes on the formating on the table
i got an erro about some of th data on some colums being varchar and i had to change them to numbers
the code quiry before this text if the one i used
first i used int to change the colums to integer but i got 0 as a result of the division
the when i change them to floats it worked
*/

SELECT location, date, total_cases, total_deaths, new_cases, (total_deaths / nullif(total_cases, 0)*100) as DeathsPercentages
FROM CovidDeaths
ORDER BY location


-- the *100 is to make the results from the division as percentegues

SELECT location, date, total_cases, total_deaths, new_cases, (total_deaths / nullif(total_cases, 0)*100) as DeathsPercentages
FROM CovidDeaths
Where location like '%states%'
ORDER BY DeathsPercentages desc
--this query is to check the percentage on the SU


-- Looking at total cases vs population

SELECT location, date, total_cases, population, (total_deaths / population)*1000 as DeathsPercentages
FROM CovidDeaths
Where location like '%states%'
ORDER BY DeathsPercentages desc


-- Looking at Countries with Highest Infection rate compared to Population

SELECT location, population, MAX(total_cases) as HighestInfectionCount, MAX((total_deaths / population)*1000) as 
	PercentageOfPopulationInfected
FROM CovidDeaths
--Where location like '%states%'
Group By Location, population
ORDER BY PercentageOfPopulationInfected desc


-- Showing countries with highest death count per population

SELECT location, MAX(total_deaths) as TotalDeathCount
FROM CovidDeaths
--Where location like '%states%'
Group By Location, population
ORDER BY location 

-- Let's break it down by continent by highest count per population

SELECT continent, MAX(total_deaths) as TotalDeathCount
FROM CovidDeaths
--Where location like '%states%'
--Where continent is not null
Group By continent
ORDER BY TotalDeathCount desc


-- Global numbers DeathsPercentage

SELECT date, SUM(new_cases) as TotalCases, SUM(new_deaths) as TotalDeaths, SUM(new_deaths)/SUM(nullif(new_cases, 0))*100 as DeathsPercentage
FROM CovidDeaths
--Where location like '%states%'
Group by date
ORDER BY 1, 2

SELECT date, SUM(new_cases) as TotalCases, SUM(new_deaths) as TotalDeaths, SUM(new_deaths)/SUM(nullif(new_cases, 0))*100 as DeathsPercentage
FROM CovidDeaths
--Where location like '%states%'
Group by date
ORDER BY 1, 2

--ALTER TABLE CovidDeaths ALTER COLUMN new_cases float
--ALTER TABLE CovidDeaths ALTER COLUMN new_deaths float




-- Looking at countries with highest infection rate compared to population

SELECT DISTINCT location, population, MAX(total_deaths) as HighestInfectionCount, MAX((total_cases/population)) as
	PercentaguePopulationInfected
FROM CovidDeaths
--Where location like '%states%'
Group By location, population
ORDER BY PercentaguePopulationInfected desc

--SELECT MAX(total_deaths), location
--From CovidDeaths
--Group by location


-- Looking at Total Population vs Total Vaccinations

Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
From CovidDeaths as dea
join CovidVaccinations as vac
	on dea.location = vac.location 
	and dea.date = vac.date
where dea.continent is not null
order by vac.new_vaccinations desc



