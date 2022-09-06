Условные выражения в `Postgres`
---

[//]: # (https://postgrespro.ru/docs/postgresql/14/functions-conditional)

К условным выражениям относятся:
1. `CASE`
2. `COALESCE`
3. `NULLIF`
4. `GREATEST`, `LEAST`

---
Конструкция `CASE`
---

`CASE` - схожа с конструкцией `switch`, или `if-else`. Если совпадений не найдено,
то возвращает значение указанное в else, если параметр ни с чем не совпадает 
и для него нет условия else, то он получает значение `NULL`.

    CASE
        WHEN condition1 THEN result1
        WHEN condition2 THEN result2
        ...
        WHEN conditionN THEN resultN
        ELSE result
    END;

Пример выполнения, суть в том что мы можем задавать условия, и при 
удовлетворении этому условию, выполняем некие действия.

    SELECT OrderID, Quantity,
    CASE
        WHEN Quantity > 30 THEN "Количество больше чем 30"
        WHEN Quantity = 30 THEN "Количество составляет 30"
        ELSE "Количество до 30"
    END AS QuantityText
    FROM OrderDetails;

---
Примеры работы
---

1) Получить все фильмы с актером "Johnny Lollobrigida" и увеличить рейтинг
этих фильмов в 2 раза:


    -- Вариант 1 тут получаем все записи 
    SELECT 
        a.first_name, a.last_name,
        CASE 
            WHEN a.first_name = 'Johnny' AND a.last_name = 'Lollobrigida' THEN f.rental_rate + 1
            ELSE f.rental_rate
        END AS new_rate
        ,*
    FROM 
        film AS f INNER JOIN film_actor AS fa ON f.film_id = fa.film_id
        INNER JOIN actor AS a ON fa.actor_id = a.actor_id 
    ;


2) Вывести все цены фильмов, в разных случаях увеличвая цена на 
   некотрое значение
   

    SELECT 
        f.title 
        ,f.rental_rate AS old_rental_rate
        ,CASE 
            WHEN f.rental_rate < 1 THEN f.rental_rate + 2
            WHEN f.rental_rate < 2 THEN f.rental_rate + 1.5
            WHEN f.rental_rate < 3 THEN f.rental_rate + 1.3
            ELSE f.rental_rate + 1
        END AS new_rental_rate
    FROM 
        film AS f
    ORDER BY 
        f.rental_rate 
    ;


3) Получаем уникальные цены из таблицы, в случае если цена равна нулю, 
   то добавляем к ней 0.01 если цена не равна нулю то получаем ее как есть.
    

    SELECT 
        DISTINCT 
        p.amount AS old_amount
        ,CASE  
            WHEN p.amount = 0 THEN p.amount + 0.01 
            WHEN p.amount > 0 THEN p.amount
        END AS new_amout
    FROM 
        payment AS p
    ORDER BY 
        p.amount 
    ; 


---
`NULLIF`
---

Формат: `NULLIF(arg_1, arg_2)`

`NULLIF` - Функция возвращает `NULL` в том случае
если `arg_1` равен `arg_2`, если они не равны то возвращает значение `arg_1`.

Сравнение происходит посимвольно, сс точным сравнением символов подобно
операции `arg_1 = arg_2`.

Один важный момент, когда в случае если мы получаем обратно первый аргумент,
то его тип не всегда может быть не таким же как и раньше, это связано с 
преобразованием типов.

---
`COALESCE`
---

Формат: `COALESCE(arg_1, arg_2 ..... arg_n)`

`COALESCE` - принимает неограниченное количество аргументов, проходится 
по всем аргументам с лева на право, возвращает первый попавшийся аргумент
который отличен от `NULL`, если такого элемента не найдено, то возвращает 
`NULL`.

Вычисление лениво, то есть найдя первый элемент не равный `NULL`, этот
элемент будет возвращен, а все последующие элементы вычисляться не будут.

```sql
SELECT COALESCE(NULL, NULL, NULL, 3, NULL, 5);

-- Результат
-- 3
```

```sql
SELECT COALESCE(NULL, NULL, NULL, NULL, NULL, NULL);

-- Результат
-- NULL
```

---
`GREATEST`, `LEAST`
---

Формат: `GREATEST(arg_1, arg_2)`
Формат: `LEAST(arg_1, arg_2)`

`GREATEST`, `LEAST` - возвращают наибольший и наименьший элемент соответственно,
все эти выражения должны быть приведены к общему типу, который и станет типом
результата, все значения типа `NULL` игнорируются, так что результат будет
равен `NULL` только в том случае если все элементы равны `NULL`.

Происходит поиск общего типа для сравнения, если данные не приводятся к общему
типу то получим ошибку:

```sql
SELECT GREATEST(1, '347', '2');
-- Результат
-- 347

SELECT GREATEST(1, '347.56', '2');
-- Результат
-- ОШИБКА: неверный синтаксис для типа integer: "347.56"

SELECT GREATEST(1, 'NULL', '2');
-- Результат
-- ОШИБКА: неверный синтаксис для типа integer: "NULL"

SELECT GREATEST(1, 'NULL', '2', TRUE);
-- Результат
-- ОШИБКА: в конструкции GREATEST типы integer и boolean не имеют общего
```