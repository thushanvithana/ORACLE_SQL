--Nested tables

-- Define the project type
create type proj_t as object(
    pno number,
    pname varchar2(15)
);

-- Define the project list type
create type proj_list as table of proj_t;

-- Define the employee type
create type employee_t as object(
    eno number,
    projects proj_list
);

-- Create the employee table
create table employee of employee_t (
    eno primary key
    )
    nested table projects store as employee_proj_table


insert into employee values ( employee_t(1, proj_list(proj_t(1,'A'), proj_t(2,'B'))));
insert into employee values ( employee_t(2, proj_list(proj_t(2,'B'), proj_t(3,'BB'))));
insert into employee values ( employee_t(3, proj_list(proj_t(3,'C'), proj_t(4,'BBB'))));
insert into employee values ( employee_t(4, proj_list(proj_t(4,'D'), proj_t(5,'BBBB'))));
insert into employee values ( employee_t(5, proj_list(proj_t(5,'E'), proj_t(6,'BBBBB'))));
insert into employee values ( employee_t(6, proj_list(proj_t(6,'F'), proj_t(7,'BBBBBB'))));


select *
from employee

