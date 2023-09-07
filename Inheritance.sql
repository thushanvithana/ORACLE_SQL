-- Create types
create or replace type person_type as object (
    id number,
    name varchar2(15),
    address varchar2(30)
) not final;

create or replace type student_type under person_type (
    sid number,
    school varchar2(30)
) not final;

create or replace type employee_type under person_type (
    eid number,
    occupation varchar2(30)
);

create or replace type parttime_type under student_type (
    day_count number
);

-- Create table
create table person_table of person_type (
    id primary key
);

-- Insert data
insert into person_table values (person_type(1, 'supun', 'panadura'));
insert into person_table values (student_type(2, 'supun', 'panadura', 100, 'SLIIT'));
insert into person_table values (parttime_type(3, 'supun', 'panadura', 100, 'SLIIT', 2));
insert into person_table values (employee_type(4, 'supun', 'panadura', 100, 'SLIIT', 'doctor'));

-- Select all data
select value(p) 
from person_table p;



select value(s)
from persons s 
where values(s) is of (student_type)
