--Map method 


create type rectangle_type as object(
    length number,
    width number,
    map member function area return number 
);


create type body rectangle_type as 
map member function area return
number is 
begin 
    return length * width;
end area;
end;

create table rectangle of rectangle_type;

insert into  rectangle values(2,1);
insert into  rectangle values(1,2);
insert into  rectangle values(2,2);

select *
from rectangle 

    --duplicate values are removed
select distinct value(r) 
from rectangle r







