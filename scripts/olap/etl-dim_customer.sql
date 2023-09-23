-- usar las tablas con el nombre del esquema
-- sakila.rental
use sakila;

insert into sakila_dwh.dim_customer (customer_id,customer,district,city,country)
select 
    st.customer_id,
    concat(st.first_name , ' ' , st.last_name) as customer,      
    ad.district,
    ci.city,
    co.country
from
  customer as st join address as ad using(address_id) 
  join city as ci using (city_id)
  join country as co using (country_id)
;