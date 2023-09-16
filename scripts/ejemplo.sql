use sakila;

select 
    c.customer_id,
    c.first_name,
    c.last_name,
    s.address_id,
    s.district,
    ci.city_id,
    ci.city,
    co.country_id,
    co.country,
    co.last_update

from 
    customer as c
    inner join address as s using(address_id)
    inner join city as ci using(city_id)
    inner join country as co using(country_id)
limit 10;