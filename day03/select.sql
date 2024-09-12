select column1, column2 from dbname.schema.table

use TSQL

--select all columns from the hr.employees table
select * from hr.employees 
select * from tsql.hr.employees
select * from [tsql].[hr].[employees]


--select lastname, firstname, hiredate from the hr.employees table 
select lastname, firstname, hiredate from [HR].[Employees]

--select lastname, firstname, hiredate from the hr.employees table using table alias e
select e.city, e.hiredate, e.lastname, e.firstname from hr.Employees as e


select [lastname], [firstname], [hiredate]  from [HR].[Employees]

select e.city, e.hiredate as date, e.lastname, e.firstname from hr.Employees as e


select od.productid, od.unitprice, od.qty, (od.unitprice * od.qty ) as total       
from [Sales].OrderDetails od

select productid, unitprice, qty, (unitprice*qty) as total from Sales.OrderDetails

select distinct country from tsql.Sales.Customers --91
select distinct city from tsql.Sales.Customers --91
