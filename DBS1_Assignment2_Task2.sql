-- 1.1
select marriage_year
from pres_marriage
where spouse_name = 'RODHAM H';

-- 1.2
select name
from state
where year_entered = 1845;

-- 1.3
select election_year
from election
where candidate = 'NIXON R M' and winner_loser_indic = 'W';

-- 1.4
select votes
from election
where candidate = 'OBAMA B' and election_year = 2008;

-- 1.5
select candidate
from election
where election_year = 1968;

-- 1.6
select birth_year, death_age
from president
where name = 'ROOSEVELT T';

-- 2.7
select avg(years_served)
from president;

-- 2.8
select min(votes)
from election
where election_year >= 1800 and election_year <= 1899 and winner_loser_indic = 'W';

-- 2.9
select count(distinct election_year)
from election
where election_year >= 1901 and election_year <= 2000;

-- 2.10
select count(id)
from state
where year_entered >= 1875 and year_entered <= 1925;

-- 2.11
select count(distinct state_id_born)
from president
where birth_year < 1900;

-- 2.12 ?
select count(id)
from president
where birth_year + death_age >= 1950 and birth_year < 1950;

-- 3.1
select candidate, election_year, votes
from election 
inner join
	president on candidate = name
inner join
	state on state.id = president.state_id_born 
where election.ELECTION_YEAR > 1900 and state.year_entered > 1800 and election.winner_loser_indic = 'W' and president.party = 'DEMOCRATIC';

-- 3.2
select spouse_name
from pres_marriage 
inner join 
	president on president.id = pres_marriage.pres_id
inner join 
	state on state.id = president.state_id_born 
where state.year_entered > 1850;

-- 3.3
select state.name, state.year_entered, president.name
from state
inner join
	president on president.state_id_born = state.id 
where state.year_entered > 1800 and president.years_served >= 4;

-- 3.4
select president."name", president.birth_year, election.election_year, election.candidate, election.votes, election.winner_loser_indic
from election
inner join
	president on president."name" = election.candidate
where president.party = 'REPUBLICAN' and election.election_year >= 1950 and election.election_year <= 1980;

-- 4.1
select name, party
from president
where years_served > (select avg(years_served)
					  from president
					  where birth_year >= 1850 and birth_year <= 1900)
order by president."name";

-- 4.2 ?
select name, birth_year
from president
where death_age > (select max(death_age)
				   from president
				   where birth_year < 1800);

-- 4.3
select name, birth_year
from president
inner join
	pres_marriage on president.id = pres_marriage.pres_id 
where president.party = 'DEMOCRATIC' and president.birth_year < 1800 and pres_marriage.nr_children >= 1;


