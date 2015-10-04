JobTests
--------
тестовые задания для ИТишников, работа и обсуждение

- тестовые задания (выложить, просмотреть, найти)
- комментарии (добавить, ответить, рейтинг)
- доска объявлений о работе

v. 0.1

* тестовые задания

Install:
-----------------------

## Setup environment variables

```
SECRET_KEY_BASE = YOURSECRETKEYGOESHERE
APPLICATION_URL = http://domain.com:port
MAIL_FROM = user@domain.com
MAIL_SERVER_URL = protocol://user:password@domain:port?domain=domain.com&authentication=plain&starttls_auto=true # as 
```

## Setup database
```
rake db:create
rake db:migrate
rake db:seed
```
## Tests & code style

rubocop:
```
rubocop -a
```

specs:
```
rspec
```