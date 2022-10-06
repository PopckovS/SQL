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

Посмотреть информацию о таблицах, что есть в БД

`/dt` - Показать информацию отношения(таблицы) в БД

`/dt+` - Показать подробную информацию

| Схема  |   Имя   |   Тип    | Владелец  |
|--------|:-------:|:--------:|:----------|
| public |   en1   | таблица  | postgres  |
| public | report  | таблица  | postgres  |
| public | table_1 | таблица  | postgres  |
| public | table_2 | таблица  | postgres  |
| public | table_3 | таблица  | postgres  |

---

Посмотреть информацию о пользовательских типах

`/dT` - Показать пользовательские типы данных определенные в этой БД

`/dT+` - Показать подробную информацию о типах, вместе с их элементами

К примеру создадим перечисление с 3-я элементами:
```sql
CREATE TYPE request_state AS ENUM ('created', 'approved', 'finisshed');
```
Тогда вывод информации о нем, будет выглядеть так:

| Схема  |      Имя      | Внутреннее имя | Размер | Элементы  | Владелец | Права доступа | Описание| 
|--------|---------------|----------------|--------|-----------|----------|---------------|---------|
| public | request_state | request_state  | 4      | created  +| postgres |               | |
|        |               |                |        | approved +|          |               | |
|        |               |                |        | finisshed |          |               | |


---
Что такое аутентификация `Peer`
---

По дефолту с установкой `postgres` в системе создается специальный пользователь,
с именем `postgres`, и в самой СУБД создается БД с аналогичным названием 
`postgres`, это для создания реализации специальной аутентификации называемой 
`peer`.

`peer` аутентификация, проводит параллель между пользователем и БД в СУБД 
`postgres`, для отключения такого поведения, требуется поменять настройки
аутентификации, сделать это можно в настройках СУБД `postgres`

Входим в postgres как суперпользователь

    sudo -u postgres psql

Меняем пароль для пользователя

    ALTER USER postgres PASSWORD '<new-password>';

Меняем настройки доступа в файле с настройками для постгресса, он 
находится по пути `/etc/postgresql/<postgres_version>/main/pg_hba.conf`

Меняем аутентификацию с `peer`

```
  # Database administrative login by Unix domain socket
  local all postgres md5
```

На аутентификацию типа `md5`

```
    # Database administrative login by Unix domain socket
    local all all md5
```

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

---
Полезные команды SQL
---

Многие полезные команды SQL требуется сделать через терминал

- Создание БД

    >    CREATE DATABASE db_name;

- Изменить пароль для пользователя

    >    ALTER USER user_name WITH ENCRYPTED PASSWORD '123';

- Переименовать БД, сделать это можно если нет активных подключений к ней

    > ALTER DATABASE old_name_db RENAME TO new_name_db;
    
    Если есть активные подключения к БД то получим
      
    >WARNING:  You need to manually restart any running background workers after this command.
    > ERROR:  database "old_name_db" is being accessed by other users
    > DETAIL:  There are 2 other sessions using the database.
    
    Если все удачно получим сообщение
    > ALTER DATABASE
  
---
Полезные команды SQL
---

Существуют системные таблицы, смотреть их можно в:

      SELECT * FROM pg_catalog.pg_tables

**Установка :**

Установка PostgreSQL 
    
    sudo apt install postgresql postgresql-contrib
    
    psql --version
    psql (PostgreSQL) 10.16 (Ubuntu 10.16-0ubuntu0.18.04.1)

Помощь
    
    psql --help

Создать БД из файла SQL

    psql -f db.sql -U <user>

Подключение к уже существующей БД

    psql -d <DataBase> -U <user>

При попытке въода в систему берется роль самой учетной запись Linux и если в 
PG есть такая роль то под ней и происходит вход в PG.

После установки по дефолту создается специальная роль `postgres` обы зайти в 
систему под этой ролью есть 2 способа:

1) Можно переключиться на учетную запись `postgres` в самой системе и далее уже
   зайти в PG, делается это так


        sudo -i -u postgres

Увидем изменение учетной записи как `postgres@serg-pk` и уже тогда зайдем в PG

    psql

Чтобы выйти из PG используется спец команда:

    \q

2) Рекомендуемый способ, без переключения учетной записи, открываем psql от лица 
пользователя postgres используя sudo.
   

    sudo -u postgres psql

### Создание новой роли
Создать новую рольот лица сцперпользователя:

      sudo -u postgres createuser --interactive

Флаг --interactive спросит запросит имя новой роли и указание будет ли
это суперпользователь. Вводим имя нового пользователя и его роль.

      Enter name of role to add: user-1
      Shall the new role be a superuser? (y/n) y

### Создание новой базы данных
Создание новой БД

      sudo -u <user> createdb <DBname>

Показать все БД можно при помощи команды:

      \l

Создадим БД sammy и посмотрим на нее:

      sudo -u postgres createdb sammy

      \l      

      Name    |  Owner   | Encoding |   Collate   |    Ctype    |   Access privileges   
      -----------+----------+----------+-------------+-------------+-----------------------
       postgres  | postgres | UTF8     | en_US.UTF-8 | en_US.UTF-8 | 
       sammy     | postgres | UTF8     | en_US.UTF-8 | en_US.UTF-8 | 
       template0 | postgres | UTF8     | en_US.UTF-8 | en_US.UTF-8 | =c/postgres          +
                 |          |          |             |             | postgres=CTc/postgres
       template1 | postgres | UTF8     | en_US.UTF-8 | en_US.UTF-8 | =c/postgres          +
                 |          |          |             |             | postgres=CTc/postgres
   
Проверить к какой БД подключены в данный момент:

      \conninfo

      You are connected to database "postgres" as user "postgres" 
      via socket in "/var/run/postgresql" at port "5432"

Запуск PG и подключение к Базе Данных demo

      sudo -u postgres psql -d demo

Посмотреть все таблицы в Базе Данных

      \dt

---
Пользователи и Роли
---

Показать всех пользователей

    SELECT * FROM pg_user;

Показать все роли в БД

    SELECT * FROM pg_roles;

    или команду
    
    \du

---
 
Создать новую роль 

    CREATE ROLE new_role_name;

Удалить роль, и получить ошибку если такой роли не существует

    DROP ROLE role_name;

Удалить роль если такая роль существует, если ее нет то ошибки не будет 

    DROP ROLE IF EXISTS role_name;

---

Есть дамп в виде файла `sql` его требуется развернуть в БД из файла, сделать
это можно такой командой

    psql -U user -d db_name < dump_file.sql

Дать права пользователю на БД

    GRANT ALL PRIVILEGES ON DATABASE db_name to user_name;

Дать пользователю права супер пользователя

    ALTER USER user_name WITH SUPERUSER;

---

У нас есть ситуация, нам требуется сделать дам БД в виде `sql` файла, в самой БД
есть пользователи, и эти пользователи имеют права на различные действия, мы 
можем выгрузить дамп 2 способами, с сохранением прав и без.

Если права будут сохранены, то нам потребуется создать такого же пользователя в нашей
системе, и выполнять действия от его лица, такие как разворот дампа, нам потребуется
выполнять действия либо под тем же пользователем либо под универсальным пользователем 
`postgres`

Или можно выгрузить БД без сохранения прав пользователей.

Сделать дамп с сохранением прав пользователей

    pg_dump db_name > namebackup.sql

Сделать дамп без сохранения прав пользователей

    pg_dump --no-owner db_name > namebackup.sql


1) Подсказка `psql --help`

2) Исполнить SQL файл `psql -f db.sql -U <user>`

3) Подключение к уже сущест БД `psql -d <DataBase> -U <user>`

4) Переключить учетную запись на БД `sudo -i -u <user>`

5) Выйти из режима работы с PostgreSQL `\q`

6) Зайти в PG д ролью `sudo -u <user> psql`

7) Создание новой БД `sudo -u <user> createdb <DBname>`

8) Показать все БД `\l`

9) Показать под каким пользователем и к какой Бд подключены `\conninfo`

10) Посмотерть все таблицы текущей БД `\dt`

11) Подключаемся к PG под пользователем к нужной БД `sudo -u <user> psql -d <db>`

12) `\du`

13) Получить название полей таблицы в синтаксисом `pgsql` 

   ```
      SELECT column_name
      FROM INFORMATION_SCHEMA.COLUMNS
      WHERE TABLE_NAME = 'table_name'
      ;
   ```

14) Востановеление БД из файла `SQL`
   
```   
   SQL psql --host=127.0.0.1 --port 5432 --username postgres --dbname work_ngw_test --file backup_ngw.sql
```
