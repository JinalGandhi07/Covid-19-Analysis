--Death Rate Location wise
--1. Highest Covid Deaths based on population location wise
select location,continent, max(total_deaths) TotalCases, AVG(population) population, max(total_deaths)/avg(population) *100 as MaxDeathPercenatge from CovidDeath
where continent is not null
group by location ,continent
having max(total_deaths) >0
order by MaxDeathPercenatge desc
--Peru South America


--2. Lowest Covid Deaths based on population location wise
select location,continent,  max(total_deaths) TotalCases, AVG(population) population, max(total_deaths)/avg(population) *100 as MinDeathPercenatge from CovidDeath
where continent is not null
group by location ,continent
having max(total_deaths) >0
order by MinDeathPercenatge 
--Tanzania, Africa

--3. highest death count country
select location,continent,  max(total_deaths) TotalDeaths, AVG(population) population from CovidDeath
where continent is not null
group by location ,continent
having max(total_deaths) >0
order by  max(total_deaths) desc
--United States, North America


--3. Lowest death count country
select location,continent,  max(total_deaths) TotalDeaths, AVG(population) population from CovidDeath
where continent is not null
group by location ,continent
having max(total_deaths) >0
order by  max(total_deaths) 
--Vanuatu , Oceania


--create view
create view DeathRate as
select location,continent,  max(total_deaths) TotalCases, AVG(population) population, max(total_deaths)/avg(population) *100 as MinDeathPercenatge from CovidDeath
where continent is not null
group by location ,continent
having max(total_deaths) >0

select * from DeathRate


