Функции обработки данных
---

`RTRIM()`  - отбрасывает все пробелы с лева.

`CONCAT()` - В некоторых СУБД требуется объединять вычисляемые поля при помощи функции
конкатенации, в такой функции не требуется указывать оператор объединения `||`

`UPPER()` - преобразует в верх регистр.

`LENGTH()` - возвращает длину строки

[//]: # (LEN&#40;&#41;)

`LOWER()` - в нижний регистр

[//]: # (LCASE&#40;&#41;)

`LTRIM()` - удаляет пробелы с левой стороны

`RTRIM()` - удаляет пробелы с правой стороны

[//]: # (to_char&#40;&#41;)

[//]: # (to_number&#40;&#41;)

[//]: # (to_date&#40;&#41;)

`YEAR()` - возвращает год из даты

`ABS()` - модуль числа


ARRAY_TO_STRING()
---
Объединяет элементы массива с помощью разделителя, создавая строку, 
есть и 3-й, необязательный параметр.

---
Стандартное использование:
```sql
SELECT 
    array_to_string(
        ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 
        ':'
    )
;

-- Результат
1:2:3:4:5:6:7:8:9:10
```

---

Представим что в нашем массиве встречаются значения `NULL`, в таком случае 
функция `array_to_string` проигнорирует его при конкатенации.
```sql
SELECT 
    array_to_string(
        ARRAY[1, 2, 3, NULL, 4, 5, 6, NULL, 7, 8, 9, 10], 
        ':'
    )
;

-- Результат
1:2:3:4:5:6:7:8:9:10
```

---

Третий необязательный параметр функции `array_to_string` указывает на какое
значение заменить `NULL` при встрече в конкатенации

```sql
SELECT 
    array_to_string(
        ARRAY[1, 2, 3, NULL, 4, 5, 6, NULL, 7, 8, 9, 10], 
        ':',
        '&'
    )
;

-- Результат
1:2:3:&:4:5:6:&:7:8:9:10
```





ARRAY_AGG()
---





