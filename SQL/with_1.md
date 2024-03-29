Обобщенные табличные выражения 
---
CTE (Common Table Expressions) - это временный результат выполнения запроса
SQL, он существует только в процессе выполнения текущего запроса, и не 
сохраняется в памяти на диске.

По сути мы выносим подзапрос SQL в отдельный участок и присваиваем ему
специальный алиас по которому можем к нему повторно обращаться, это 
позволяет оптимизировать как размер SQL запроса, так и позволяет не 
выполнять подзапрос повторно.

Синтаксис
```
WITH <название общего табличного выражения> 
     ( <алиас_поле>, <алиас_поле>, <алиас_поле> ) 
     AS ( SELECT .... )
SELECT .... FROM <название общего табличного выражения> ;
```

Мы имеем возможность давать CTE название, CTE выполняет в себе SQL запрос,
и возвращает данные с набором полей, мы имеем возможность давать алиасы
для каждого из возвращаемых полей, когда CTE готово, мы выполняем внешний
SQL запрос, который может получать данные из CTE.

---

Пример №1
```sql
BEGIN;
    -- создаем CTE с названием "A"     
	WITH A AS
	    -- внутри CTE создаем наш подзапрос
		( 
			SELECT * FROM table_1 
			WHERE
				id IN (1, 2)
		)
	-- получаем данные из CTE
	SELECT * FROM A;
COMMIT;
```

---

Пример №2

```sql
BEGIN;
    -- создаем CTE, задаем алиасы для возвращаемых полей
	WITH A (new_id, new_name, new_description, new_count, new_category) AS 
	     -- внутри CTE создаем наш подзапрос
		(
			SELECT id, name, description, count, category 
			FROM 
				table_1 
			WHERE
				id IN (1, 2)
		)
	-- получаем данные из CTE
	SELECT * FROM A;
COMMIT;
```

---

Пример №3. Мы можем задавать несколько табличных выражений в одной 
инструкции сразу.

```sql
BEGIN;
    -- создаем несколько CTE сразу
	WITH 
		A AS (SELECT * FROM table_1),
		B AS (SELECT * FROM table_1)
	-- получаем данные из CTE
	SELECT * FROM A 
	UNION 
	SELECT * FROM B;
COMMIT;
```
