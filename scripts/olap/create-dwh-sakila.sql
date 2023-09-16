create database if not exists sakila_dwh;

use sakila_dwh;
-- dimension tiempo
create table if not exists dim_time
(
date_key        int(8) not null,
date_value      date not null,
month_number    int(3) not null,
month_name      char(12) not null,
year4           int(5) not null,
day_of_week     int(5) not null,
day_of_week_name char(12)  not null,

constraint dim_time_pk 
    primary key (date_key),
constraint dim_time_ak1 
    unique index (date_value)
);

-- dimension fac_rental

create table if not exists fac_rental
(
rental_key      int(8) not null AUTO_INCREMENT,
rental_id       int(11) not null,
date_key        int(8) not null,
count_rental    int(11) not null,

primary key (rental_key),
unique index rental_id (rental_id),

index date_key (date_key),
foreign key (date_key) references dim_time(date_key)

);

