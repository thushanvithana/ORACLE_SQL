--member function

create type emp_t as object(
    eno CHAR(5),
    ename VARCHAR2(30),
    basicsal float,
    allowance float,
    MEMBER FUNCTION totMonthlyPay RETURN float
)

CREATE OR REPLACE TYPE BODY emp_t AS 
    MEMBER FUNCTION totMonthlyPay RETURN FLOAT IS 
    BEGIN 
        RETURN self.basicsal + self.allowance;
    END totMonthlyPay;
END;
/


create table emp of emp_t
/

    
insert into emp values(emp_t('E123', 'saman', 10000, 2000))
/
insert into emp values(emp_t('E124', 'nimal', 20000, 4000))
/
insert into emp values(emp_t('E125', 'kamal', 30000, 6000))
/
insert into emp values(emp_t('E126', 'pimal', 40000, 8000))
/

select e.ename, e.totMonthlyPay()
from emp e


-- Add another member function
ALTER TYPE emp_t
ADD MEMBER FUNCTION tot2MonthlyPay RETURN FLOAT
CASCADE;


-- Create or replace type body
CREATE OR REPLACE TYPE BODY emp_t AS 
    MEMBER FUNCTION totMonthlyPay RETURN FLOAT IS 
    BEGIN 
        RETURN self.basicsal + self.allowance;
    END;

    MEMBER FUNCTION tot2MonthlyPay RETURN FLOAT IS 
    BEGIN
        RETURN 2 * (self.basicsal + self.allowance);
    END;
END;
/

select e.ename, e.totMonthlyPay(), e.tot2MonthlyPay()
from emp e



