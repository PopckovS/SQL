-- Задача #1
SELECT model, speed, hd
FROM PC
WHERE price < 500

-- Задача #2
SELECT DISTINCT maker
FROM Product
WHERE type LIKE('Printer')

-- Задача #3
SELECT model, ram, screen
FROM Laptop
WHERE price > 1000

-- Задача #4
SELECT *
FROM Printer
WHERE color = 'y'

-- Задача #5
SELECT model, speed, hd
FROM PC
WHERE price < 600 AND cd IN('12x', '24x')

-- Задача #5
SELECT DISTINCT
    p.maker,
    lp.speed
FROM
    Product AS p INNER JOIN Laptop AS lp ON p.model = lp.model
WHERE
    lp.hd >= 10.0
ORDER BY
    maker, speed;

-- Задача #6
SELECT
    lp.model, lp.price
FROM
    Product AS pr
    INNER JOIN Laptop AS lp ON pr.model = lp.model
WHERE
    pr.maker = 'B'

UNION

SELECT
    pt.model, pt.price
FROM
    Product AS pr
    INNER JOIN Printer AS pt ON pr.model = pt.model
WHERE
    pr.maker = 'B'

UNION

SELECT
    pc.model, pc.price
FROM
    Product AS pr
    INNER JOIN PC AS pc ON pr.model = pc.model
WHERE
    pr.maker = 'B';

-- Задача #7
SELECT DISTINCT
    maker
FROM Product
WHERE type = 'PC'
EXCEPT
SELECT DISTINCT maker
FROM Product
WHERE type = 'Laptop';

-- Задача #8
SELECT DISTINCT
     pr.maker
FROM
     Product AS pr
INNER JOIN PC AS pc ON pr.model = pc.model
WHERE
     pc.speed >= 450

-- Задача #9
SELECT
    model, price
FROM
    Printer
WHERE
    price = (SELECT MAX(price)
               FROM Printer
            )

-- Задача #10
SELECT
    model, max(price)
FROM
    Printer
GROUP BY
    model

-- Задача #11
SELECT
       avg(speed)
FROM
    PC AS pc

-- Задача #12
SELECT
       AVG(speed)
FROM
     Laptop
WHERE
      price > 1000

-- Задача #13
SELECT
       AVG(pc.speed)
FROM
     PC AS pc INNER JOIN Product AS pr ON pc.model = pr.model
WHERE
      pr.maker = 'A'

-- Задача #14