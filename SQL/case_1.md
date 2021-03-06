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
