Различные примеры SQL запросов
---

    select
        distinct first_name, last_name
    from
        actor as a ;


    select
         last_name, count(last_name) as lnc
    from
        actor as a
    group by
        last_name
    having count(last_name) > 1;


    -- приоритеты логических операторов
    SELECT * FROM payment p ;


    SELECT
        p.amount, p.payment_date
    FROM
        payment AS p
    WHERE
        p.amount > 7 AND p.payment_date > '2007-05-01'
        OR
        p.amount < 3 AND p.payment_date > '2007-05-05'
    ORDER BY
        p.amount, p.payment_date;


    -- приоритеты логических операторов
    SELECT DISTINCT
        amount
    FROM
        payment AS p
    WHERE
        (amount = 1.99 OR amount = 4.99)
        OR
        (amount = 8.99 OR amount = 10.99)
    ORDER BY
        amount;


    SELECT NOW();
    SELECT EXTRACT(YEAR FROM NOW());
    SELECT EXTRACT(MONTH FROM NOW());
    SELECT EXTRACT(DAY FROM NOW());
    SELECT EXTRACT (DOW FROM NOW());
    SELECT AGE(NOW(), '2000-12-12');
    SELECT EXTRACT(YEAR FROM AGE(NOW(), '2000-12-12'));
    SELECT EXTRACT(EPOCH FROM '2020-12-12' - '2000-12-12');


    select age('2020-08-01', '2012-03-05');
    select '2015-01-11'::date - '2015-01-01'::date;


    SELECT
        (EXTRACT(epoch from age('2017-6-15', now())) / 86400)::int


    SELECT
        *
    FROM
        film AS f
    WHERE
        --title LIKE('D% C%e');
        title ilike('d_i%');
    -- LIKE - чувствителен к регистру
    -- ilike - не чувствителен к регистру
    -- % сколько угодно символов
    -- _ один любой символ


    SELECT
        *
    FROM
        film f
    WHERE
        f.title NOT LIKE 'D%'
        AND f.description LIKE '%Shark%'
        AND f.rental_duration IN(3, 5);
    -- функция IN(3, 5) проверяет на наличие одного из указ-х элементов

---

    -- Работа с датами
    SELECT
        c.create_date
        ,c.last_update
    FROM
        customer AS c
    ;


    SELECT
        '2006-01-15 15:15:15'::DATE AS " Дата из строки"
        ,'2006-01-15 15:15:15' AS "Строка"
        ,timestamp'2006-01-15 15:15:15' AS "Дата+Время 1"
        ,'2006-01-15 15:15:15'::TIMESTAMP AS "Дата+Время 2"
    ;


    SELECT
        -- Использование ::DATE
        '2006-01-15 15:15:15'::DATE - '2006-02-13 10:10:10' AS "::DATE 1"
        ,'2006-01-15'::DATE - '2006-02-13'::DATE AS "::DATE 2"
        -- Использование date
        ,date'2006-01-15' - date'2006-02-13' AS "date 1"
        ,date'2006-01-15' - '2006-02-13' AS "date 2"
        -- timestamp дата
        ,timestamp'2006-04-13' - '2006-02-13' AS "ts 1"
        ,timestamp'2006-04-13' - timestamp'2006-02-13' AS "ts 2"
        -- timestamp дата+время
        ,timestamp'2006-04-13 ' - '2006-02-13' AS "ts time 1"
        ,timestamp'2006-04-13 15:15:15' - timestamp'2006-02-13 10:10:10' AS "ts time 2"
        ,'2006-04-13 15:15:15'::TIMESTAMP - '2006-02-13 10:10:10'::TIMESTAMP AS "ts time 3"
    ;


    SELECT
        '2006-04-13'::TIMESTAMP AS tm
        , timestamp'2006-04-13 10:10:10' - date'2006-05-13'
    ;


    SELECT date('2006-04-13 10:10:10') AS "date 1";


    SELECT
        last_update
        ,text(last_update )
        ,last_update ::TEXT
    FROM
        customer c;


    SELECT
        create_date AS "Создание"
        ,last_update AS "Обнова"
        ,concat(create_date - last_update) AS "Вычет"
        ,create_date - '2006-02-13' AS "Нов.вычет"
    FROM
        customer;

---
Домашнее задание №1
--

    SELECT * FROM film f;
    SELECT TEXT(f.last_update) FROM film f;
    SELECT f.rental_rate FROM film f;


    SELECT
        f.title AS "Имя"
        ,f.release_year AS "Релиз"
        ,f.rental_rate AS "Ставка"
        ,round(f.rental_rate / f.rental_duration, 2) AS "Ставка в час"
    FROM
        film AS f
    WHERE
        f.rental_rate > 3
        AND
        f.release_year = 2006
    ORDER BY
        f.title;

        --TEXT(f.release_year) LIKE '2006%'
        --EXTRACT(YEAR FROM f.last_update) = '2006'

---
Домашнее задание №2
---

    SELECT * FROM payment p;

    SELECT
        *
    FROM
        payment AS p
    WHERE
        p.payment_date > '2007-05-01' AND p.amount > 3
        OR
        p.amount > 10
    ORDER BY
        p.payment_date;

---
Домашнее задание №3
---

    SELECT
        --a.first_name || ' ' || a.last_name
        CONCAT(a.first_name, ' ', a.last_name)
    FROM
        actor AS a
    WHERE
        a.first_name LIKE 'F%'
        AND
        a.last_name NOT LIKE '%s'
    ORDER BY
        a.last_update;

