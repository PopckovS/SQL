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

---
Что такое аутентификация `Peer`
---

Входим в postgres как суперпользователь

    sudo -u postgres psql

Меняем пароль для пользователя

    ALTER USER postgres PASSWORD '<new-password>';

Меняем настройки доступа в файле с настройками для постгресса, он 
находится по пути
`/etc/postgresql/<postgres_version>/main/pg_hba.conf`

Меняем доступ с `peer`

    local   all         all                  peer

на доступ типа `md5`

    local   all         all                  md5

Перезагружаем сервис постгресса

     sudo service postgresql restart

---
Сервис `Postgresql` 
---
Обратиться к сервису `Postgresql` в терминале Linux 


    sudo service postgresql status
    sudo service postgresql start
    sudo service postgresql stop
    sudo service postgresql restart

---
Подключение к `PostgresQL` через URL 
--
К БД можно подключаться через URL 

    # Шаблон
    postgres://<пользователь>:<пароль>@<хост>:<порт>/<название БД>

    # Пример
    postgres://postgres:postgrespassword@postgres:5432/db_name



---
Утилита `pg_dump`
---

[ Почитать про `pg_dump` ](https://postgrespro.ru/docs/postgresql/11/app-pgdump)

`pg_dump` - утилита для создания дампов СУБД `Postgres`, можно делать как
дамп локальной Бд, так и удаленной.

Утилита `pg_dump` находится по пути `/usr/bin/pg_dump`


Дамп только схемы БД

> pg_dump --host <хост> --port <порт> --username <пользователь> --blobs --verbose --encoding utf-8 --schema-only --file "путь к файлу" "название бд"


Дамп всей БД

> pg_dump --host <хост> --port <порт> --username <пользователь> --blobs --verbose --encoding utf-8 --file "путь к файлу" "название бд"


Пример запроса

>pg_dump --host 192.168.4.197 --port 5432 --username postgres --blobs --verbose --encoding utf-8 --file "/home/sergio/Документы/Проекты/bd_name/bd_name" "bd_name"

