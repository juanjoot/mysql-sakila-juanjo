use sakila;
-- con un cte
-- paso 1 unir tablas
with ventas_por_tienda as (    
select 
    st.store_id,
    concat (a.address,',', ci.city) as store,
    co.country,
    concat (sf.first_name,',', sf.last_name) as staff,
    p.amount,
    year(p.payment_date) as year,
    month(p.payment_date) as month,
    dayofmonth(p.payment_date) as day
from 
    store st 
    join address as a using(address_id)
    join city as ci using(city_id)
    join country as co using(country_id)
    join staff as sf using(store_id)
    join payment as p using(staff_id)
),
-- paso 2 agrupar y sumar
ventas_por_tienda_anno_mes as (
select 
    store,
    year,
    month,
    sum(amount) amount
from 
    ventas_por_tienda
group by
    store,
    year,
    month
),
-- paso 3 suma de meses en columnas
ventas_por_tienda_por_mes as (

select 
    store,
    sum(case when year = 2005 and month = 5 then amount else 0 end) may2005,
    sum(case when year = 2005 and month = 6 then amount else 0 end) jun2005,
    sum(case when year = 2005 and month = 7 then amount else 0 end) jul2005

from 
    ventas_por_tienda_anno_mes
group by
    store
),
-- paso 4 calcula las diferencias
ventas_por_tienda_comparativo as (

select 
    store,
    may2005,
    jun2005,
    (may2005 - jun2005) as diffjun2005,
    jul2005,
    (jul2005 - jun2005) as diffjul2005
from 
    ventas_por_tienda_por_mes
group by
    store
)

select * from ventas_por_tienda_comparativo
limit 10;