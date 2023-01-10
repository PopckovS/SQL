---
Мета информация о таблицах
---

Во время работы у нас может возникнуть необходимость узнать информацию не
из таблицы, а о самой таблице, `Postgresql` хранит информацию в таблицах,
но где-то должна храниться и информация о самих таблицах, она находится
в системной схеме `information_schema` в таблице `columns `

```sql
SELECT 
    column_name, 
    data_type 
FROM 
    information_schema.columns 
WHERE 
    table_name = 'table_name'
;
```
