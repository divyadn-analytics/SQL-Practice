select *
from person.person
where firstName = 'SAM'
Select *
From Person.person
where BusinessEntityID = 10;
Select *, FirstName,LastName
from person.person
where FirstName ='John' and 
LastName='Smith'
Select *
From Person.person
where BusinessEntityID > 10;
Select *
From Person.person
where MiddleName IS NULL;
Select *
From Person.person
where MiddleName IS NOT NULL;
Select *
From Person.person
where LastName = 'HUNTER';
Select *
From Person.person
where FirstName LIKE '%John%';
Select *
From Person.person
where FirstName LIKE 'A%';
Select *
From Person.person
where FirstName IN ('JOHN','DAVID','SAM');
Select *
From Person.person
where BusinessEntityID IN (5,10,15,20);
Select *
From Person.person
where LastName NOT IN ('HUNTER','SMITH','JOHNSON','MILLER');
Select FirstName,LastName
From Person.person
where FirstName IN ('AVA','EMMA','Sophia');
Select *
From Person.person
where BusinessEntityID BETWEEN 50 and 100;
Select *
From Sales.SalesOrderHeader;
Select *
From Sales.SalesOrderHeader
Where TotalDue BETWEEN 1000 and 5000;
Select *
From Sales.SalesOrderHeader
Where OrderDate BETWEEN 2013-01-01 and 2013-12-31;

