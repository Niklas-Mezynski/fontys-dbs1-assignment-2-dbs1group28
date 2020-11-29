--PART 4
-- 1
select distinct hobby 
from pres_hobby ph 
where pres_id = any (	select id 
						from president p2
						where not exists (	select *
											from election e 
											where winner_loser_indic = 'L' and e.candidate = p2."name"))
order by hobby;

-- 2
select distinct s.name
from state s
	inner join president p 
		on s.id = p.state_id_born
	inner join (select pres_id ,min(year_inaugurated) as min_year_inaugurated from administration 
			group by pres_id
			having min(year_inaugurated) > 1900) adm
		on p.id = adm.pres_id
order by s."name" ;
								  
-- 4
select distinct s.name
from state s
	inner join president p 
		on s.id = p.state_id_born 
	inner join pres_marriage pm 
		on pm.pres_id = p.id 
where pm.nr_children = 0
order by s."name" ;								  
								  


-- Subqueries without correlation
-- 1
select p."name", p.birth_year 
from president p 
where p.id in (
select ph.pres_id 
from pres_hobby ph
group by ph.pres_id 
having count(*) > 4
);

								  
								  
-- Subqueries with correlation
-- 1
select p.name, p.party, p.years_served 
from president p
where p.years_served =
any (select (max(p2.years_served)) 
from president p2 
where p2.party = p.party)
order by years_served desc;

								  
-- exercise with two solutions
-- uncorrelated
select p."name", p.birth_year 
from president p 
where p.id in (
select ph.pres_id 
from pres_hobby ph
group by ph.pres_id 
having count(*) > 4
);

-- correlated
select p."name", p.birth_year 
from president p 
where exists (
select ph.pres_id 
from pres_hobby ph
where p.id = ph.pres_id 
group by ph.pres_id 
having count(*) > 4
);


