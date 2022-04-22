Пользователи и роли
---

Создать БД и сразу назначить ей владельца
```sql
CREATE DATABASE db_one OWNER user_name;
```

Смотрим существующих пользователей `du+`
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

```
    Name       |  Owner   |
-----------------------------
    db_one     | serg     | 
    db_two     | postgres |
```

```sql
ALTER ROLE "user_name" WITH LOGIN;
```

