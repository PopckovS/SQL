---
Утилита `psql`
---

> Войти в БД под указанным пользователем

    psql -U <user_name>
    psql -U postgres

---

Посмотреть все Базы Данных что есть в наличии

    \l

    # Вывод
       Name    |  Owner   | Encoding |  Collate   |   Ctype    |   Access privileges   
    -----------+----------+----------+------------+------------+-----------------------
     postgres  | postgres | UTF8     | en_US.utf8 | en_US.utf8 | 
     template0 | postgres | UTF8     | en_US.utf8 | en_US.utf8 | =c/postgres          +
               |          |          |            |            | postgres=CTc/postgres
     template1 | postgres | UTF8     | en_US.utf8 | en_US.utf8 | =c/postgres          +
               |          |          |            |            | postgres=CTc/postgres

---

Подключиться к определенной БД, и все последующие команды по работе будут применяться
к этой БД, сделать это можно 2 командами:

    # первая
    \connect <DBNAME>;
    \connect postgres;

    # вторая
    \c <DBNAME>;
    \c postgres;

---

Посмотреть список всех таблиц что есть в БД

    \dt


    # Выводим таблицы
          List of relations
     Schema |   Name   | Type  |  Owner   
    --------+----------+-------+----------
     public | profiles | table | postgres
    (1 row)


    # Если таблиц не обнаружено то поулчим вывод
    No relations found.
