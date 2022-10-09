Что такое аутентификация `Peer`
---

И так, в нашу ОС установлен сервис `postgres`, вход в сам сервис производится
под пользователем, `postgres` использует специальную аутентификацию `peer`,
согласно которой каждая БД соотносится с пользователем который имеет такое же
название, как и сама БД. 

То есть, тот пользователь под которым мы находимся в нашей ОС, должен 
соотноситься с БД в самом `postgres`, и тогда входя в сервис `postgres` мы
сразу соединяемся с нужной нам БД.

Пример аутентификации `peer`, предположим что в нашем сервисе `postgres` уже
существует созданная БД с названием `db_1`
```
# мы находимся под пользователем serg, попробуем войти в сервис postgres
# под ппользователем db_1
serg@serg-pk: psql -U db_1

# получим ошибку
psql: error: FATAL:  Peer authentication failed for user "db_1"

# сосздадим пользователя с именем db_1
serg@serg-pk: sudo adduser db_1

# войдем под новым пользователем в ОС
serg@serg-pk: su - db_1

# теперь мы под пользователем db_1 и можем авойти в сервис postgres
db_1@serg-pk: psql -U db_1

# мы вошли в сервис postgres под пользователем db_1
db_1=>
```

---
Как отключить аутентификацию `peer`
---

Мы можем изменить способ аутентификации `peer`, что бы иметь возможность
соединяться с `postgres` по логину и паролю. 

Настройки аутентификации указаны в файле конфигурации по пути
`/etc/postgresql/<postgres_version>/main/pg_hba.conf`

Меняем аутентификацию с `peer`

```
  # Database administrative login by Unix domain socket
  local      all            postgres      peer
```

На аутентификацию типа `md5`

```
    # Database administrative login by Unix domain socket
    local      all            all           md5
```

Перезагружаем сервис `postgres`

     sudo service postgresql restart

Теперь после такого изменения мы можем входить в сервис `postgres` под 
любым существующим пользователем, указывая логин и пароль:

```
# входим в сервис
psql -U db_1

# мы вошли в сервис postgres под пользователем db_1
db_1=>
```

---

Входим в postgres как суперпользователь

    sudo -u postgres psql

Меняем пароль для пользователя

    ALTER USER postgres PASSWORD '<new-password>';

---
Сервис `Postgresql` 
---
Обратиться к сервису `Postgresql` в терминале Linux 


    sudo service postgresql status
    sudo service postgresql start
    sudo service postgresql stop
    sudo service postgresql restart

