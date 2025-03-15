--Covid Cases Infection Rate
--1. Highest Covid Cases based on population
select location,continent, max(total_cases) TotalCases, AVG(population) population, max(total_cases)/avg(population) *100 as MaxCovidPercenatge from CovidDeath
where continent is not null
group by location ,continent
having max(total_cases) >0
order by MaxCovidPercenatge desc
--Andorra Europe

--for india
select location,continent, max(total_cases) TotalCases, AVG(population) population, max(total_cases)/avg(population) *100 as CovidPercenatge from CovidDeath
where location='India'
group by location ,continent
having max(total_cases) >0


--2. Lowest Covid Cases based on population
select location,continent,  max(total_cases) TotalCases, AVG(population) population, max(total_cases)/avg(population) *100 as MinCovidPercenatge from CovidDeath
where continent is not null
group by location ,continent
having max(total_cases) >0
order by MinCovidPercenatge 
--Tanzania, Africa


--3. year wise data for each date
SELECT continent, location, date, total_cases, population, (total_cases * 1.0 /population) * 100 as PercentPopulationInfected
FROM coviddeath
WHERE Continent is not NULL and year(date)='2021'
order by 1,2


--Creating View
create view highestInfectionRate as
(select location,continent, max(total_cases) TotalCases, AVG(population) population, max(total_cases)/avg(population) *100 as MaxCovidPercenatge from CovidDeath
where continent is not null
group by location ,continent
having max(total_cases) >0
)

select * from highestInfectionRate
