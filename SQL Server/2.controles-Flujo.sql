-- Control de Flujo: Bloque BEGIN – END/* Encierra un conjunto de instrucciones  Transact-SQL de forma que se pueda  ejecutar un grupo de instrucciones  Transact-SQL. BEGIN y END son palabras  clave del lenguaje de control de ﬂujo.Se utilizan para controles de ﬂujos como  IF, ELSE, WHILE.
*/

-- Control de Flujo: Bloque IF … ELSE/* Impone condiciones en la ejecución de una  instrucción Transact-SQL.La instrucción Transact-SQL (sql_statement)  que sigue a Boolean_expression se ejecuta si  Boolean_expression se evalúa como TRUE.La palabra clave opcional ELSE es una  instrucción Transact-SQL alternativa que se  ejecuta cuando Boolean_expression se  evalúa como FALSE o NULL.*/

DECLARE @valor intSET @valor=55IF @valor<10PRINT 'EL PRECIO ES MUY BAJO'ELSEPRINT 'EL PRECIO ES MUY CARO'

-- Construcción WHILE, BREAK y CONTINUE/*Establece una condición para la ejecución repetida de una instrucción o bloque de  instrucciones SQL.Las instrucciones se ejecutan repetidamente  siempre que la condición especiﬁcada sea  verdadera. Se puede controlar la ejecución de instrucciones en el bucle WHILE con las  palabras clave BREAK y CONTINUE.*/

-- BREAK /* Produce la salida del bucle WHILE  más interno. Se ejecutan las instrucciones que aparecen después de la palabra clave END, que marca el ﬁnal del bucle.*/-- CONTINUE /* Hace que se reinicie el bucle  WHILE y omite las instrucciones que haya  después de la palabra clave CONTINUE.*/

-- GOTO/* La instrucción GOTO provoca que, en la  ejecución de un lote de Transact-SQL, se  salte a una etiqueta.Ninguna de las instrucciones situadas entre  la instrucción GOTO y la etiqueta se  ejecutarán. La etiqueta que constituye el objetivo de un  GOTO sólo identiﬁca el destino del salto.*/

-- WAITFOR/* La instrucción WAITFOR suspende la  ejecución de un lote, un procedimiento  almacenado o una transacción hasta que:Haya pasado un intervalo de tiempo  especiﬁcado.Se haya alcanzado una hora del día  especiﬁcada.*/

DECLARE @indice INT;SET @indice=0 ;WHILE (@indice<=10)BEGIN	IF @indice=7	BEGIN		SET @indice=@indice+1;		WAITFOR DELAY '00:00:05'		CONTINUE;	END	-- Dos formas de salir forzando el while	IF @indice=8 GOTO mensaje;	--IF @indice=9 BREAK;--SET @indice=@indice+1;ENDmensaje: PRINT 'SALI DEL WHILE POR EL GOTO'
