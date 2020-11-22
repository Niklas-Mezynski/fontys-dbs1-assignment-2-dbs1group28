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



-- 3
select distinct s."name"
from state s
inner join president p 
on p.state_id_born = s.id
inner join election e 
on e.candidate = p."name"
where 



select candidate
from election e 
where winner_loser_indic = 'L';

select p.name, p.birth_year
from president p
where not exists (
select ph.pres_id, count(ph.hobby) 
from pres_hobby ph 
group by ph.pres_id
having count(*) <= 4 
);


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
select p."name", p.party, p.years_served
from president p
where exists (
select p2.party,max(years_served) 
from president p2
group by p2.party
); 

select p2.party, max(years_served) 
from president p2
group by p2.party






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


