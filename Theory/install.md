Установка
---

Для `Linux 18` по дефолту используется Postgres `12.16` версии. 

    sudo apt install postgresql postgresql-contrib

При установке программа pg создаст пользователя `postgres` в самой 
СУБД, а также создаст нового пользователя в самой системе Linux
с таким же названием `postgres`. Это делается из-за того что pg создает
идентичную аутентификацию, что значит что каждой роли в самой СУБД 
сопоставляется такая же роль в Linux.  

Это можно увидеть командой:

    // Команда выводит всех пользователей в Linux
    cat /etc/passwd

    // Вывод
    ...
    ...
    serg:x:1000:1000:serg,,,:/home/serg:/bin/bash
    redis:x:122:127::/var/lib/redis:/usr/sbin/nologin
    sshd:x:123:65534::/run/sshd:/usr/sbin/nologin
    mysql:x:124:128:MySQL Server,,,:/nonexistent:/bin/false
    postgres:x:125:129:PostgreSQL administrator,,,:/var/lib/postgresql:/bin/bash
