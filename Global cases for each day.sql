--7) What are the global cases for each day
select sum(new_cases) totalCases, sum(new_deaths) totalDeaths,
 case
        WHEN SUM(new_cases) <> 0 THEN SUM(new_deaths)/SUM(new_cases)*100 
        ELSE 0
    END AS death_rate,
date from CovidDeath
where continent is not null and new_cases>0 and new_cases is not null
group by date
order by date 

--on 23rd January 2020, First covid case was found
--on 2021-07-04, last recent covid case was found

-- 7) What are the global cases for each day continent wise
select sum(new_cases) totalCases, sum(new_deaths) totalDeaths, continent,
 case
        WHEN SUM(new_cases) <> 0 THEN SUM(new_deaths)/SUM(new_cases)*100 
        ELSE 0
    END AS death_rate,
date from CovidDeath
where continent is not null and new_cases>0 and new_cases is not null
group by date, continent
order by date 

--on 23rd January 2020, First covid case was found in Asia and 1 death happened

--create view
create view GlobalCasesPerDay as
select sum(new_cases) totalCases, sum(new_deaths) totalDeaths,
 case
        WHEN SUM(new_cases) <> 0 THEN SUM(new_deaths)/SUM(new_cases)*100 
        ELSE 0
    END AS death_rate,
date from CovidDeath
where continent is not null and new_cases>0 and new_cases is not null
group by date

select * from GlobalCasesPerDay



