
--Population vs Vaccinations per Date per Countries
select a.date,a.continent,a.location,b.population, a.new_vaccinations,
sum(new_vaccinations) over (partition by a.location  ORDER BY  a.date) as SumOfVaccinationsOnEachDayIncludingPReviousDay
from CovidVaccination a
join CovidDeath b
on a.location= b.location and a.date= b.date
WHERE a.continent is not null and a.new_vaccinations >0
ORDER BY location


--Percentage of population being vaccinated date and location wise
--using cte
with cte as(
select a.date,a.continent,a.location,b.population, a.new_vaccinations,
sum(CAST(new_vaccinations as int)) over (partition by a.location  ORDER BY  a.date) as SumOfVaccinationsOnEachDayIncludingPReviousDay
from CovidVaccination a
join CovidDeath b
on a.location= b.location and a.date= b.date
WHERE a.continent is not null and a.new_vaccinations >0
)
select *, SumOfVaccinationsOnEachDayIncludingPReviousDay/population * 100 PercentagePopulationVaccinatedDateLocationWise from cte
ORDER BY location


--Percentage of population being vaccinated date and location wise
--using Temporary Tables
select * into #temp1 from (
select a.date,a.continent,a.location,b.population, a.new_vaccinations,
sum(CAST(new_vaccinations as int)) over (partition by a.location  ORDER BY  a.date) as SumOfVaccinationsOnEachDayIncludingPReviousDay
from CovidVaccination a
join CovidDeath b
on a.location= b.location and a.date= b.date
WHERE a.continent is not null and a.new_vaccinations >0
) d

select *,SumOfVaccinationsOnEachDayIncludingPReviousDay/population * 100  PercentagePopulationVaccinatedDateLocationWise from #temp1
ORDER BY location


--create view
create view VaccinationsPerDatePerCountry as
select a.date,a.continent,a.location,b.population, a.new_vaccinations, 
sum(new_vaccinations) over (partition by a.location  ORDER BY  a.date) as SumOfVaccinationsOnEachDayIncludingPReviousDay
from CovidVaccination a
join CovidDeath b
on a.location= b.location and a.date= b.date
WHERE a.continent is not null and a.new_vaccinations >0

select * from VaccinationsPerDatePerCountry