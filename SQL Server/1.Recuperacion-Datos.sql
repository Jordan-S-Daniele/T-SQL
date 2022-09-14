---------------------------------------------------------------------------------------------------------

--DISTINCT

---------------------------------------------------------------------------------------------------------

--1)Mostrar los diferentes productos vendidos

--Tablas: Sales.SalesOrderDetail

--Campos: ProductID

SELECT  DISTINCT

		[ProductID]

FROM 

		[Sales].[SalesOrderDetail];

---------------------------------------------------------------------------------------------------------

-- UNION 

---------------------------------------------------------------------------------------------------------

--2)Mostrar todos los productos vendidos y ordenados

--Tablas: Sales.SalesOrderDetail, Production.WorkOrder

--Campos: ProductID



SELECT

		[ProductID]

FROM 

		[Sales].[SalesOrderDetail]

UNION ALL  

SELECT   

		[ProductID]

FROM 

		[Production].[WorkOrder]

--3)Mostrar los diferentes productos vendidos y ordenados

--Tablas: Sales.SalesOrderDetail, Production.WorkOrder

--Campos: ProductID

SELECT

		[ProductID]

FROM 

		[Sales].[SalesOrderDetail]

UNION 

SELECT   

		[ProductID]

FROM 

		[Production].[WorkOrder];



---------------------------------------------------------------------------------------------------------

-- CASE 

---------------------------------------------------------------------------------------------------------

--4)Obtener el id y una columna denominada sexo cuyo valores disponibles sean “Masculino” y ”Femenino”

--Tablas: HumanResources.Employee

--Campos: BusinessEntityID, Gender

SELECT 

		[BusinessEntityID]

		,CASE WHEN [Gender]='F' THEN 'Femenino'

			 ELSE 'Masculino'

		END [Sexo]

FROM 

		[HumanResources].[Employee];

--5)Mostrar el id de los empleados si tiene salario deberá mostrarse descendente de lo contrario ascendente

--Tablas:HumanResources.Employee

--Campos: BusinessEntityID, SalariedFlag	

SELECT	[BusinessEntityID]

		,[SalariedFlag]

FROM 

		[HumanResources].[Employee]

ORDER BY 

		CASE [SalariedFlag] WHEN 1 THEN [BusinessEntityID] END DESC  

        ,CASE WHEN [SalariedFlag] = 0 THEN [BusinessEntityID] END;  