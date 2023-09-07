-----XML-----------
create table demo(
id integer primary key,
exml xml,
);

insert into demo values(1 , 
'<persons>
    <person>
        <name>John Doe</name>
        <age>30</age>
        <email>john.doe@example.com</email>
        <city>New York</city>
    </person>
    <person>
        <name>Jane Smith</name>
        <age>25</age>
        <email>jane.smith@example.com</email>
        <city>Los Angeles</city>
    </person>
</persons>');

insert into demo values(2 , 
'<persons>
    <person>
        <name>thussss Doe</name>
        <age>10</age>
        <email>john.doe@example.com</email>
        <city>Neennfgw York</city>
    </person>
    <person>
        <name>Jane Smith</name>
        <age>25</age>
        <email>jane.smith@example.com</email>
        <city>Los Angeles</city>
    </person>
</persons>');


select * 
from demo



select id, exml.query('/persons/person/name')
from demo
where id = 2

--dispaly  only age 
select id,  exml.query('/persons/person/age[. gt 20]')
from demo
where id = 2

--display all details 
select id,  exml.query('/persons/person[age > 2]')
from demo
where id = 2



------------------------------axes------------------------------

select id, exml.query('/persons/child::person[attribute::id="1"]')
from demo

select id, exml.query('//person[@id="1"]')
from demo

select id, exml.query('descendant-or-self::person[@id="1"]')
from demo

--------------------------xquery---------------------------------
select exml.query('for $person in /persons/person
					let $x := $person/age
					where $x >23
					return $person')
from demo