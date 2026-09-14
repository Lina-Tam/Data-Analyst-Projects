create database cycle_competitions;
use cycle_competitions;

create table riders(
rider_id integer primary key,
rider_name varchar(20),
rating integer,
age integer check (age>0)
);

insert into riders values
(102,'Andrews',8,23),
(105,'Sandy',9,45),
(110,'Zaira',7,35),
(108,'Alex',6,20),
(104,'Diana',9,40),
(117,'Fred',5,35),
(165,'Siara',7,43),
(187,'Joe',8,25),
(163,'Joseph',6,30),
(145,'Harry',4,26);

create table bicycles(
bicycle_id integer primary key,
brand_name varchar(30),
type varchar(30),
color varchar(10)
);

insert into bicycles values
(201,'Jupiter','Mountain Bike','Red'),
(215,'NAKTO','Single Gear Bike','Blue'),
(214,'X-Treme','Road Bike','Red'),
(232,'X-Treme','Road Bike','Black'),
(256,'Giant','Single Gear Bike','Green'),
(210,'Bulls','Road Bike','Blue'),
(221,'Jupiter','Mountain Bike','Red'),
(235,'NAKTO','Electric Bike','Black'),
(240,'Giant','Road Bike','Green'),
(262,'Giant','Electric Bike','Red');

create table competitions(
rider_id integer,
bicycle_id integer,
year year,
place varchar(2),
position integer,
time_taken time,
primary key(rider_id,bicycle_id,year),
foreign key(rider_id) references riders(rider_id),
foreign key(bicycle_id) references bicycles(bicycle_id)
);

insert into competitions values
(110,215,2010,'TX',3,'02:40:35'),
(145,232,2013,'CA',10,'03:36:21'),
(117,210,2010,'TX',2,'02:29:46'),
(165,256,2012,'WA',5,'02:00:50'),
(117,210,2016,'NM',1,'01:56:24'),
(187,214,2018,'GA',4,'04:45:30'),
(187,214,2020,'GA',1,'02:35:09'),
(163,201,2021,'NY',5,'05:03:01'),
(105,240,2010,'TX',1,'02:10:35'),
(105,240,2016,'NM',4,'02:30:20'),
(145,232,2016,'CA',8,'02:45:30'),
(110,215,2014,'TX',4,'02:55:42');

select * from riders;

drop view nameandbrand;
--  1. Retrieve the name and bicycle brand of the rider who achieved the fastest time across all competitions.
create view nameandbrand as 
select r.rider_name, b.brand_name, min(c.time_taken) as fastest_time
from riders r, bicycles b, competitions c
where r.rider_id = c.rider_id
and b.bicycle_id = c.bicycle_id
group by r.rider_name, b.brand_name
order by fastest_time asc
limit 1;

select * from nameandbrand;

drop view total_rider_competitions;
-- 2. Find the names of riders who have taken part in more than one competition and use 𝐺𝑅𝑂𝑈𝑃_𝐶𝑂𝑁𝐶𝐴𝑇() to display all the places where each rider competed. 
-- Include riders even when their multiple participations occurred at the same location.
create view total_rider_competitions as
select r.rider_id, r.rider_name, count(*) as rider_competitions, group_concat(c.place) as place_completed
from competitions c, riders r
where r.rider_id = c.rider_id
group by r.rider_id, r.rider_name
having count(*) > 1;

select *
from total_rider_competitions;

-- 3. Identify the top-rated rider who has never participated in any competitions.
create view top_rated_non_competitions as
select rider_name, rating
from riders
where rider_id not in (
select rider_id
from competitions 
)
order by rating desc
limit 1; 

select *
from top_rated_non_competitions;

drop view avg_competition_time;

-- 4. Find the average competition time for each rider. Use 𝑡𝑖𝑚𝑒_𝑡𝑜_sec() and sec_𝑡𝑜_𝑡𝑖𝑚𝑒() function to get this task done.
create view avg_competition_time as 
select r.rider_id, r.rider_name, sec_to_time(avg(time_to_sec(c.time_taken))) as avg_competition_time
from riders r, competitions c
where r.rider_id = c.rider_id
group by r.rider_id, r.rider_name;

select *
from avg_competition_time;

drop view most_frequent_bicycle_color;

-- 5. Retrieve the colors of bicycles that appear most frequently in competitions.
create view most_frequent_bicycle_color as
select b.color, count(*) as total_used
from bicycles b, competitions c
where b.bicycle_id = c.bicycle_id
group by b.color
order by total_used desc
limit 1;

select *
from most_frequent_bicycle_color;


-- 6. Find the riders who used more than one bicycle type across all their competitions.
create view riders_multiple_bicycle_types as
select r.rider_name, count(distinct b.type) as type_count
from riders r, competitions c, bicycles b
where r.rider_id = c.rider_id
and b.bicycle_id = c.bicycle_id
group by r.rider_name
having count(distinct b.type) > 1;

select *
from riders_multiple_bicycle_types;


-- 7. Identify the state (place) where the highest number of competitions were held.
create view state_most_competitions as
select place, count(*) as state_most_competitions
from competitions
group by place 
order by state_most_competitions desc
limit 1;

select * 
from state_most_competitions;


-- 8. List the riders whose age is above the overall average age of all riders.
create view age_above_average as 
select rider_name, age
from riders
where age > (
select avg(age)
from riders);


select *
from age_above_average;

-- 9. Find the riders who finished in the top 3 positions in any competition.
create view riders_top3 as 
select distinct r.rider_name, c.position
from riders r, competitions c 
where r.rider_id = c.rider_id
and c.position <= 3
order by c.position asc;

select * 
from riders_top3;


-- 10. List the riders along with the number of competitions they participated in, sorted from highest to lowest.
create view rider_competition_count as 
select r.rider_id, r.rider_name, count(*) as number_of_competitions
from riders r, competitions c
where r.rider_id = c.rider_id 
and r.rider_name is not null
group by r.rider_id, r.rider_name
order by number_of_competitions desc;

select *
from rider_competition_count;
