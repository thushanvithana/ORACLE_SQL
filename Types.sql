--types creation 

create type dept_t as object(
    dno char(5),
    dname varchar2(30)
)

create type emp_t as object(
    eno char(5),
    ename varchar2(30),
    sal float,
    workdept ref dept_t
)

create table dept of dept_t(
    dno primary key
)


create table emp of emp_t(
    eno primary key
)

insert into dept values(dept_t('D1', 'IT'))
insert into dept values(dept_t('D2', 'CS'))
insert into dept values(dept_t('D3', 'IT'))
insert into dept values(dept_t('D4', 'CS'))
insert into dept values(dept_t('D5', 'IT'))
insert into dept values(dept_t('D6', 'CS'))

    
insert into emp values(emp_t('E1','amal', 566.00, 
    (select ref(d) from dept d where d.dno = 'D1')
));
insert into emp values(emp_t('E2', 'nimal', 600.00,
    (select ref(d) 
    from dept d 
    where d.dno = 'D2'
)));
insert into emp values(emp_t('E3', 'kamal',4000,(
    select ref(d)
    from dept d
    where d.dno = 'D3'
)));

SELECT e.eno, e.ename, e.sal, e.workdept.dno, e.workdept.dname
FROM emp e;



