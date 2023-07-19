Теория
---
1) [Транзакции `ACID`](Theory/transaction_1.md)
2) [Как спроектировать модель данных](Theory/data_model_1.md)

---
Установка, администрирование, расширения.
---

1) [Установка](Admin/install.md)

2) [Администрирование `Postgres`](Admin/lesson_1.md)

3) [Аутентификация](Admin/auth_1.md)

4) [Системные таблицы](Admin/lesson_2.md)

5) [Расширения](Admin/app_1.md)

6) [Мета информация о запросах и структуре данных](Admin/exp_1.md) 

7) [Типы данных в Postgres](Admin/type.md)

---
Права, Пользователи и Роли
---

1) [Часть 1](Users/users_1.md)


---
SQL Основное:
---

- [Запросы `SELECT` ](SQL/sql_1.md) 
  - `SELECT`, `DISTINCT`, `LIMIT`, `OFFSET`, `ORDER BY`
  - `WHERE`, `ASC`, `DESC`, `LIKE`, `NOT LIKE`, `ILIKE`


- [Агрегации: ](SQL/sql_2.md)
  - Агрегатные функции: `MIN`, `MAX`, `COUNT`, `AVG`, `SUM`
  - Вычисляемые поля


- [Функции обработки : ](SQL/sql_3.md)


- [Уникальный идентификатор `UUID`](SQL/uuid.md) 


- [Изменение, Удаление](SQL/delete.md)
    - `DROP`, `DELETE`, `IF EXISTS`, `TRUNCATE`


---
SQL продвинутое:
---

 - [Группировки](SQL/group_1.md)
   - Группировка`GROUP BY`
   - Фильтрация групп `HAVING`


 - [Объединение таблиц, JOIN](SQL/join_1.md)
   - `UNION`, `UNION ALL`
   - `INNER JOIN`
   - `LEFT`, `RIGHT JOIN`
   - `SELF`, `CROSS JOIN`


 - [Условные выражения](SQL/expression.md)
   - `CASE`, `COALESCE`, `NULLIF`, `GREATEST`, `LEAST`


 - [Оконные функции](SQL/over_1.md)


---
SQL Структуры данных
---

   - [Представления `VIEW`](SQL/view.md)
       - Перенаправление `CRUD` операций на оригинальную таблицу   
       - `CREATE VIEW`, `DROP VIEW`


   - [Обобщенные табличные выражения `WITH` ](SQL/with_1.md)


   - [Последовательности `SEQUENCE` ](SQL/sequence_1.md)


   - [Перечисление `ENUM` ](SQL/enum_1.md)


   - [Ограничения в БД](SQL/sql_4.md)


   - [Разное ](SQL/other_1.md)
     - `RETERNING`, `TRUNCATE`


---
Оптимизация, Индексы
---


  - [Анализ](index/analyze.md)


  - [Индексы](index/index_1.md)
    - Индексы, оптимизация запросов


___
Практическое владение языком SQL
---

1)  **[Решение упражнений с сайта `sql-academy.org` :](https://sql-academy.org/)**
    - [Задачи на `SELECT`](Practice/sql-academy.org/SELECT/Exercises.md)


2) **[Решение упражнений с сайта `sql-ex.ru` :](http://sql-ex.ru)**
    - [Задачи на `SELECT`](Practice/sql-ex.ru/SELECT/Exercises.md)

---
Другое
---

1)  **[Как сделать ? :](Other/other_2.md)**
    - Как заменить данные в конкретных полях в записях. 


2)  **[Разное](Other/other_1.md)**

   