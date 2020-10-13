create table admin_vpres (
	ADMIN_ID int,
	VICE_PRES_NAME varchar(40),
	primary key (ADMIN_ID,VICE_PRES_NAME)
);

create table administration (
	ID int primary key,
	ADMIN_NR int,
	PRES_ID int,
	YEAR_INAUGURATED date
);

create table election (
	ELECTION_YEAR int,
	CANDIDATE varchar(40),
	VOTES int,
	WINNER_LOSER_INDIC boolean,
	primary key (ELECTION_YEAR,CANDIDATE)
);

create table pres_hobby (
	PRES_ID int,
	HOBBY varchar(20),
	primary key (PRES_ID,HOBBY)
);

create table pres_marriage (
	PRES_ID int,
	SPOUSE_NAME varchar(40),
	SPOUSE_AGE int,
	NR_CHILDREN int,
	MARRIAGE_YEAR int,
	primary key (PRES_ID,SPOUSE_NAME)
);

create table president (
	ID int primary key,
	PRES_NAME varchar(40),
	BIRTH_YEAR int,
	YEARS_SERVED int,
	DEATH_AGE int,
	PARTY varchar(10),
	STATE_ID_BORN int
);

create table state (
	ID int primary key,
	STATE_NAME varchar(20),
	ADMIN_ID int,
	YEAR_ENTERED int
);

alter table admin_vpres
	add constraint vpres_id
	foreign key (ADMIN_ID) references administration (ID);
	
alter table state
	add constraint state_admin_id
	foreign key (ADMIN_ID) references administration (ID);
	
alter table ADMINISTRATION
	add constraint administration_pres_id
	foreign key (PRES_ID) references president (ID);
	
alter table pres_hobby 
	add constraint pres_hobby_id
	foreign key (PRES_ID) references president (ID);
	
alter table pres_marriage 
	add constraint vpres_id
	foreign key (PRES_ID) references president (ID);
	
alter table president 
	add constraint born_in_state
	foreign key (STATE_ID_BORN) references state (ID);
	
alter table president 
	add constraint check_party
	check (BIRTH_YEAR <= 1800 and (PARTY = 'DEMOCRATIC' or PARTY = 'REPUBLIC' or PARTY = 'WHIG' or PARTY = 'FEDERALIST' or PARTY = 'DEMO-REP')
		or (PARTY = 'DEMOCRATIC' or PARTY = 'REPUBLIC' or PARTY = 'FEDERALIST' or PARTY = 'DEMO-REP'));

alter table pres_marriage 
	add constraint spouse_check_children
	check ((spouse_age > 60 and nr_children = 0) or (spouse_age <= 60 and nr_children >= 0));
	
alter table pres_marriage 
	add constraint check_age
	check ((marriage_year < 1800 and spouse_age >= 21) or (marriage_year >= 1800 and spouse_age >= 18));