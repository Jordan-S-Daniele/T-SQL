--EJERCICIO ORDER BY

/*
1)  Mostrar las personas ordenadas primero por su apellido y luego por su nombre--Tablas:Person.Person--Campos: Firstname, Lastname*/ SELECT *FROM Person.PersonORDER BY  Lastname, Firstname DESC;

/*
2)  Mostrar cinco productos más caros y su nombre ordenado en forma alfabética--Tablas:Production.Product--Campos: Name, ListPrice*/ SELECT top 5 *FROM Production.ProductORDER BY  ListPrice desc, name
