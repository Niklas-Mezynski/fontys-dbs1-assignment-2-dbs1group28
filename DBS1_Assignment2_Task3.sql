-- Part 3: SELECT Queries with GROUP BY

-- 1
select election_year, count(*), min(votes)
from election
group by election_year 
having count(*) >= 3 and min(votes) > 20;

-- 2
select pres_id, count(*)
from pres_hobby
group by pres_id 
having count(*) >= 5;

-- 3
select	election_year, sum(votes)
from election
where election_year > 1900
group by election_year
having count(candidate) >= 3
order by election_year;	

-- 4
select max(vote_diff)
from (	select (max(votes)-min(votes)) vote_diff, election_year
		from election
		where election_year > 1900
		group by election_year
		having count(*) = 2
		) vote_diff_table;
		
	
-- 5
select election_year, count(*) candidates
from election
where election_year > 1850
group by election_year 
having count(*) > 2 and max(votes) >= 0.8 * sum(votes)
order by election_year;

-- 6
select pres_id, max(nr_children), min(nr_children)
from pres_marriage
group by pres_id
having count(pres_marriage)>1
order by pres_id;

-- 7
select pres_id
from pres_marriage pm 
group by pres_id
having count(*) = 1 and min(spouse_age) >= 30
order by pres_id;

-- 8
select pres_id, round(avg(nr_children))
from pres_marriage
group by pres_id
having max(spouse_age) < 30 and avg(nr_children) > 4
order by pres_id;

-- 9
select pres_id, sum(nr_children)
from pres_marriage
group by pres_id
having min(spouse_age) > 30
order by pres_id;


-- 10
select pres_id
from pres_marriage
group by pres_id
having sum(nr_children) = 0
order by pres_id;

-- 11
select pres_id
from pres_marriage
group by pres_id
having min(nr_children) >= 2 and count(*) > 1
order by pres_id;


-- 12 ??
select death_age, count(*)
from president
where death_age > 85
group by death_age
order by death_age;

