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