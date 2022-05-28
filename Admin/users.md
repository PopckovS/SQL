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
