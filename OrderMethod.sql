--order method

create type customerType as object(
    id number,
    name varchar2(20),
    addr varchar2(30),
    order member function match(c customerType)return integer
);

create or replace type body customerType as
     order member function match(c customerType)return integer is 
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

declare 
    customer1 customerType;
    customer2 customerType;
    result number;
begin
    customer1 := customerType(5, 'John', '123 Main St');
    customer2 := customerType(2, 'Alice', '456 Elm St');
    result := customer1.match(customer2);
    DBMS_OUTPUT.PUT_LINE('Result: ' || result);
end;
/


