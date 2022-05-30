Создание пользователей
---

Создать пользователя с паролем, можно следующим образом

```sql
CREATE USER user_name WITH PASSWORD 'password';
```

---
Посмотреть пользователей
---

Все пользователи хранятся в системной таблице `pg_user`

```sql
SELECT * FROM pg_user;
```

Вывод
```
 usename  | usesysid | usecreatedb | usesuper | userepl | usebypassrls |  passwd  | valuntil | useconfig 
 ----------+----------+-------------+----------+---------+--------------+----------+----------+-----------
 user1    |    16384 | f           | t        | f       | f            | ******** |          | 
 postgres |       10 | t           | t        | t       | t            | ******** |          | 
 serg     |   286361 | f           | t        | f       | f            | ******** |          | 
```

---
Посмотреть роли 
---

Команда `\du` и `\du+` показывают роли пользователей

Вывод
```
 Role name |       Attributes                                            | Member of | Description
 -----------+------------------------------------------------------------+-----------+-------------
 postgres  | Superuser, Create role, Create DB, Replication, Bypass RLS  | {}        | 
 serg      | Superuser                                                   | {}        | 
 user1     | Superuser                                                   | {}        | 
```


---
Права на таблицу
---

У таблиц в БД могут быть владельцы, мы можем создавать Бд сразу с указанием
владельца, если владелец указан не будет то по дефолту им становится
пользователь`postgres`

Создать БД и сразу назначить ей владельца
```sql
CREATE DATABASE db_one OWNER user_name;
```

Смотрим существующих пользователей командой `du+`
```
    Role name |
    -----------------
    postgres  |
    serg      |
```

Создаем 2 Бд с указанием владельца и без
```sql
CREATE DATABASE db_one OWNER user_name;
CREATE DATABASE db_two;
```

Далее можем посмотреть владельцев на эти таблицы `\l`
```
    Name       |  Owner   |
-----------------------------
    db_one     | serg     | 
    db_two     | postgres |
```

---

Мы можем дать права пользователю на уже существующую таблицу

```sql
GRANT ALL PRIVILEGES ON DATABASE "user_name" to db_name;
```





[//]: # (```sql)

[//]: # (ALTER ROLE "user_name" WITH LOGIN;)

[//]: # (```)


---
Пользователи
---
Посмотреть всех пользователей в PG:

    SELECT * FROM pg_shadow;

Создать пользователя:

    CREATE USER <name> PASSWORD '<password>';

Создать Супер пользователя, дописываем в команду `WITH SUPERUSER`:

    CREATE USER <name> WITH SUPERUSER PASSWORD '<password>';

Удалить пользователя:

    DROP USER <user>;

Даем пользователю права на работу с БД:

    GRANT ALL PRIVILEGES ON DATABASE <DBname> TO <user>;

Если пользователь будет удален, то увидим сообщение **DROP ROLE** но 
удалить его можно не всегда, если у пользователя есть права работы с 
какой то БД то удалить его так просто не получиться, при попытке удалить
такого пользователя получим сообщение типа:

    ERROR:  role "user20" cannot be dropped because some objectsdepend on it
    DETAIL:  privileges for database demo

Тут можно увидеть что пользователя нельзя удалить, из-за того что у него 
есть доступ к БД demo. Чтобы это изменить, мы можем передать доступ к Бд
на другого пользователя, это приведет к копированию допуска новому 
пользователю, но не уберет права допуска у старого владельца.

    REASSIGN OWNED BY <olduser> TO <newuser>

После этой команды увидим `REASSIGN OWNED` что означает все получилось.
Теперь сними у пользователя все права, при помощи след команды.

    DROP OWNED BY <user>

И теперь пользователя можно спокойно удалить.

Если у пользователя в названии есть символ дефиса, к примеру так **user-1** 
то при попытке удаления будет ошибка синтаксиса, для удаления такого 
пользователя следует использовать двойные кавычки.

    DROP USER "<user>";

Узнать текущего пользователя можно 2 способами:

    SELECT current_user;
    SELECT session_user;
