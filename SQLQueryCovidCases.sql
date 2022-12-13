

--SELECT *
--from SQLProject1..CovidDeaths

select location, date, total_cases, new_cases, total_deaths, population
from SQLProject1..CovidDeaths
order by 1,2

--Total cases vs Total deaths
select location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathsPercentage
from SQLProject1..CovidDeaths
where location like '%Belgium%'
order by 1,2


--Total cases vs Population
-- percentage of population with covid
select location, date, total_cases, population, (total_cases/population)*100 as PopulationPercentage
from SQLProject1..CovidDeaths
where location like '%Belgium%'
order by 1,2

--countries with highest infection rates compared to population

select location, population, max(total_cases) as HighestInfectionCount, max((total_cases/population))*100 as PopulationPercentage
from SQLProject1..CovidDeaths
--where location like '%Belgium%'
group by location,population
order by PopulationPercentage desc


--Highest Death rate count per population
select location, MAX(cast(total_deaths as int)) AS TotalDeathCount
from SQLProject1..CovidDeaths
where continent is not null
group by location
order by TotalDeathCount desc

--Breakdown by continent
select location, MAX(cast(total_deaths as int)) AS TotalDeathCount
from SQLProject1..CovidDeaths
where continent is not null
group by location
order by TotalDeathCount desc


select *
from SQLProject1..CovidDeaths dea
join SQLProject1..CovidVaccinations vac
	on dea.location = vac.location
	and dea.date = vac.date



--Total population vs vaccinations
select dea.location,dea.continent,dea.date,dea.population, vac.new_vaccinations
from SQLProject1..CovidDeaths dea
join SQLProject1..CovidVaccinations vac
	on dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null
order by 2,3