--order method
create type customer_t as object(
    id number,
    name varchar2(20),
    addr varchar2(30),
    order member function match(c customer_t) return integer
);

create or replace type body customer_t as 
    order member function match(c customer_t) return integer is 
    begin
        if self.id < c.id then 
            return -1;
        elsif self.id > c.id then 
            return 1;
        else 
            return 0;
        end if;
    end match;
end;
/


