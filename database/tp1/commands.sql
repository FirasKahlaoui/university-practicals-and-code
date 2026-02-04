-- Define an object type for Department containing primitive attributes
CREATE TYPE departement_type AS OBJECT
(
    numDept SMALLINT,
    nameDept VARCHAR(20),
    locationDept VARCHAR(50)
);

-- Define a composite object type for Address
CREATE TYPE address_type AS OBJECT
(
    num_field SMALLINT,
    street VARCHAR(30),
    city VARCHAR(20)
);

-- Define an object type for Employee using the Address type and references (pointers) to other objects
Create type employee_type as object 
(
    matricule smallint,
    employeeName varchar(30),
    address address_type,         -- Use of complex type address_type
    salary decimal(8,2),
    superior ref employee_type,   -- Self-referencing pointer to another employee object
    departement ref departement_type -- Pointer to a department object
);

-- Create a typed table (Object Table) based on departement_type
create table departement of departement_type
(
    constraint pk_departement primary key (numDept)
);

-- Create a typed table (Object Table) based on employee_type
create table employee of employee_type
(
    constraint pk_employee primary key (matricule)
);

-- Standard insertion into the department object table
INSERT INTO departement VALUES (10, 'Direction', 'Nice');

INSERT INTO departement VALUES  (20, 'Coptabilité', 'Marseille');

-- Insertion using the constructor address_type() to create the address object inline
insert into employee values (125, 'Dupond', address_type(15, 'rue Victoe Hugo', 'Nice'), 12500, null, null);

insert into employee (matricule, employeeName, salary, superior, departement) values (200, 'Leroy', 25000, null, null);

-- Insertion using REF() function to retrieve pointers (references) to existing rows 
-- 'ref(superior)' gets the OID (Object ID) of the employee with matricule 125
-- 'ref(departement)' gets the OID of the department with numDept 10
insert into employee (matricule, employeeName, salary, superior, departement)
select 210, 'Ravier', 25000, ref(superior), ref(departement)
from employee superior, departement departement
where superior.matricule = 125 and departement.numDept = 10;

insert into employee (matricule, employeeName, salary, superior, departement)
select 300, 'Toto', 20000, ref(superior), ref(departement)
from employee superior, departement departement
where superior.matricule = 210 and departement.numDept = 10;

-- Query demonstrating dot notation to traverse objects and references
-- 'superior.address.city': Accessing a field within the embedded address object
-- 'superior.superior.employeeName': Implicit dereferencing (following the pointer) to get the name of the superior
-- 'superior.departement.locationDept': Implicit dereferencing to get the location of the referenced department
select matricule, employeeName, superior.address.city, superior.superior.employeeName, superior.departement.locationDept
from employee superior;

-- Filtering based on a dereferenced field
-- 'emp.departement.numDept' follows the pointer to department table to check numDept
select employeeName, emp.departement.numDept
from employee emp
where emp.departement.numDept = 10;

-- Update a reference column (departement) using a subquery that returns a REF
update employee
set departement = (
    select REF(d)
    from departement d
    where numDept = 10
)
where matricule = 125;

-- Update the superior reference
update employee
set superior = (
    select REF(e)
    from employee e
    where matricule = 200
)
where matricule = 125;

-- Update using a reference comparison 
update employee
set superior = (
    select REF(e)
    from employee e
    where matricule = 200
)
where departement = (
    select REF(d)
    from departement d
    where numDept = 10
);

update employee
set departement = (
    select REF(d)
    from departement d
    where numDept = 85
)
where matricule = 200;


SELECT e.matricule, e.employeeName, e.departement.numDept, e.departement.nameDept, e.departement.locationDept
FROM employee e;
