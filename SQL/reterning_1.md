RETERNING
---
Имеется таблица:

[//]: # (-- строка эквивалентна id int DEFAULT nextval&#40;'clients_id_seq'&#41; PRIMARY KEY)

```sql
CREATE TABLE clients(
    id serial PRIMARY KEY, 
    name varchar NOT NULL
);
```

Когда мы вставляем в нее строку, у нас может быть потребность узнать, какой `id`
был присвоен новой строке в этой таблице, оператор `RETERNING` дает возможность
вернуть значение после операции `INSERT`.

```sql
INSERT INTO clients(name) VALUES('Sergio') RETURNING id;

-- Результат
-- 1001
```

Возвращать можно любые данные, из `INSERT` и `UPDATE` и `DELETE` операций.

---

Может возникнуть необходимость получить баланс по счету после обновления
данных, но если делать 2 запроса и не в одной транзакции, то из-за конкурентных
параллельных изменений одной и той же записи, мы можем получить некорректные
данные.

Обновляем данные
```sql
UPDATE accounts SET balance = balance - 100 WHERE id = 10;
```

Получаем обновленные значения
```sql
SELECT balance FROM accounts WHERE id = 10;
```

Эту проблему мы можем обойти с помощью оператора `RETURNING` после обновления.

```sql
UPDATE accounts SET balance = balance - 100 WHERE id = 10 RETURNING balance;
```

---

```sql
DELETE FROM customers RETURNING *;

-- Результат
 id   |  name
------+--------
 1950 | Hana
 2709 | Maritza
 9192 | Miya
 6437 | Jamil
```



