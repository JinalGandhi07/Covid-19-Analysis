select * from CovidDeath

select * from CovidVaccination

-- Total Cases, Total Deaths Location-wise

--1. highest cases of Covid
select location,continent, sum(total_cases) TotalCases,sum(total_deaths) TotalDeaths, sum(total_deaths)/sum(total_cases) *100 as DeathPerecentage from CovidDeath
where continent is not null
group by location ,continent
having sum(total_cases) >0
order by sum(total_cases) desc
--United States, North America

--2. highest deaths because of Covid
select location,continent, sum(total_cases) TotalCases,sum(total_deaths) TotalDeaths, sum(total_deaths)/sum(total_cases) *100 as DeathPerecentage from CovidDeath
where continent is not null
group by location ,continent
having sum(total_cases) >0
order by sum(total_deaths) desc
--United States, North America

--2. highest death percentage
select location,continent, sum(total_cases) TotalCases,sum(total_deaths) TotalDeaths, sum(total_deaths)/sum(total_cases) *100 as DeathPerecentage from CovidDeath
where continent is not null
group by location ,continent
having sum(total_cases) >0
order by sum(total_deaths)/sum(total_cases) *100 desc
--Yemen, Asia


--Create view
create view  totalCasesDeaths as
select location,continent, sum(total_cases) TotalCases,sum(total_deaths) TotalDeaths, sum(total_deaths)/sum(total_cases) *100 as DeathPerecentage from CovidDeath
where continent is not null
group by location ,continent
having sum(total_cases) >0

select * from totalCasesDeaths
