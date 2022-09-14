/* CRITERIOS DE SELECCION
--LIKE
1) Mostrar el nombre, precio y color de los accesorios para asientos de las bicicletas cuyo precio sea  mayor a 100 pesos.--tablas: Production.Product--campos: Name, ListPrice, Color*/SELECT  Name, ListPrice, ColorFROM Production.ProductWHERE Name LIKE '%Seat%' AND ListPrice>100;

/*
2) Mostrar los nombre de los productos que tengan cualquier combinaci�n de 'mountain bike'.--tablas: Production.Product--campos: Name*/SELECT  NameFROM Production.ProductWHERE Name LIKE '%mountain bike%';

/*
3) Mostrar las personas que su nombre empiece con la letra 'y'. --tablas:Person.Person--campos: FirstName*/SELECT  FirstNameFROM Person.PersonWHERE FirstName LIKE 'y%';

/*
4) Mostrar las personas que la segunda letra de su apellido es una s. --tablas:Person.Person--campos: LastName*/SELECT  FirstNameFROM Person.PersonWHERE FirstName LIKE '_[s]%';

SELECT  LastNameFROM Person.PersonWHERE LastName LIKE '__[ml]%';

/*
5) Mostrar el nombre concatenado con el apellido de las personas cuyo apellido tengan terminaci�n espa�ola (ez).--tablas: Person.Person--campos: FirstName,LastName*/SELECT  concat(FirstName,' ', LastName) as NOMBREFROM Person.PersonWHERE LastName LIKE '%ez';

/*
6) Mostrar los nombres de los productos que terminen en un n�mero. --tablas: Production.Product--campos: Name*/SELECT NameFROM Production.ProductWHERE Name LIKE '%[0-9]';

SELECT NameFROM Production.ProductWHERE Name LIKE '%[094]';

/*
7) Mostrar las personas cuyo  nombre tenga una C o c como primer car�cter, cualquier otro como segundo car�cter, ni d ni e ni f ni g como tercer car�cter,cualquiera entre j y r o entre s y w como cuarto car�cter y el resto sin restricciones. --tablas:Person.Person--campos: FirstName*/SELECT  FirstNameFROM Person.PersonWHERE FirstName LIKE '[C-c]_[^d-g][j-w]%';