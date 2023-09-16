use sakila;

with datos_alquiler as (
  SELECT
    film_id
    , title
    , category.name AS category
    , concat(first_name, ' ', last_name) customer
    , rental_date
FROM inventory
    LEFT JOIN rental USING(inventory_id)
    LEFT JOIN film USING(film_id)
    LEFT JOIN film_category USING(film_id)
    LEFT JOIN category USING(category_id)
    LEFT JOIN customer using (customer_id) 
)
,
dato_ANO_MES as (
    SELECT       
        customer      
        ,year(rental_date) as rental_year
        ,month(rental_date) as rental_month
        ,count(*) as rental_times
    FROM 
        datos_alquiler
    Group by
       customer        
        ,rental_year
        ,rental_month   
) ,

DATOS_CON_MESES_EN_COLUMNAS AS (

SELECT customer ,
    sum(case when rental_year = 2005 and rental_month= 5 then rental_times else 0 end) as may2005,
    sum(case when rental_year = 2005 and rental_month= 6 then rental_times else 0 end) as jun2005

from
    dato_ANO_MES
group by 
    customer
),

-- agrupado cliente cuanto alquilo en mayo y junio - la diferencia y porcentaje de crecimiento
calculo_comparativo as (

select 
    customer,
    may2005,
    jun2005,
    (jun2005 - may2005) as diffjun2005,    
    ((jun2005 - may2005)/may2005) as porcjun2005
from 
    DATOS_CON_MESES_EN_COLUMNAS
group by
    customer
)

select * from calculo_comparativo
limit 10;


