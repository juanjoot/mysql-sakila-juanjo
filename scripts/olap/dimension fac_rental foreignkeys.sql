use sakila_dwh;

drop table fac_rental;

create table if not exists fac_rental
(
rental_key      int(8) not null AUTO_INCREMENT,
rental_id       int(11) not null,

-- foreign key
date_key        int(8) not null,
store_key       int(8) not null,
customer_key    int(8) not null,


count_rental    int(11) not null,

primary key (rental_key),
unique index rental_id (rental_id),

index date_key (date_key),
foreign key (date_key) references dim_time(date_key),
index store_key (store_key),
foreign key (store_key) references dim_store(store_key),
index customer_key (customer_key),
foreign key (customer_key) references dim_customer(customer_key)

);
