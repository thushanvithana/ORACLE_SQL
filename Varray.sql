--varray

create type price_arr as varray(10) of number(12,2)

create table pricelist(
    pno integer,
    prices price_arr
)

insert into pricelist values(1, price_arr(2.50,3.75,4.25));
insert into pricelist values(2, price_arr(2.50,3.75,4.25));

select p.pno,  p.prices as price_array
from pricelist p 





