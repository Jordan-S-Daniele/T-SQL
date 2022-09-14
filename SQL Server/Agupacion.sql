-- Agrupación y Funciones de Agregado/* Agrupa un conjunto de ﬁlas seleccionado en  un conjunto de ﬁlas de resumen de acuerdo  con los valores de una o más columnas o  expresiones.Se devuelve una ﬁla para cada grupo. Las  funciones de agregado de la lista <select> de  la cláusula SELECT proporcionan información  de cada grupo en lugar de ﬁlas individuales.*/

SELECT ProductID, MAX(LineTotal) as MaximoFROM Sales.SalesOrderDetail  WHERE ProductID > 995GROUP BY ProductID;

-- Having/* Especiﬁca una condición de búsqueda para un  grupo. HAVING solo se puede utilizar con la  instrucción SELECT.Normalmente, HAVING se usa con una  cláusula GROUP BY. */SELECT ProductID, MAX(LineTotal) as Maximo  FROM Sales.SalesOrderDetailWHERE ProductID>995GROUP BY ProductIDHAVING MAX(LineTotal)>3000;


