# DISEÑO DE LA BODEGA DE DATOS

## Alquiler

**Dim_Tiempo**

columna             tipo        Restriccion

date_key            int         PK , NN
date_value          date        UK , NN
month_number        int         NN
month_name          int         NN
year4               int         NN
day_of_week         int         NN
day_of_week_name    char(12)    NN

**fac_rental**

columna             tipo        Restriccion

rental_key          int         PK , NN
rental_id           int         UK , NN
date_key            int         FK(dim_date), NN
count_rental        int         NN
