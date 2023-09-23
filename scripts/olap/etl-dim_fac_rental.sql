-- usar las tablas con el nombre del esquema
-- sakila.rental
use sakila;

insert into sakila_dwh.fac_rental (rental_id,date_key,count_rental)
select 
    rental_id,
    TO_DAYS(rental_date) AS date_key,
    1 as count_rental
from
    (
    select 
       rental_id,
       rental_date
    from 
        sakila.rental
    ) rental
;