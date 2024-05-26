<p align="center">
  <span>Pусский</span> |
  <a href="README.en.md#readme">English</a>
</p>

---

# enfist

> Приложение ядра [dcape](https://github.com/dopos/dcape) для размещения файлов конфигурации приложений.

[![GitHub Release][1]][2] [![GitHub code size in bytes][3]]() [![GitHub license][4]][5]

[1]: https://img.shields.io/github/release/dopos/dcape-app-enfist.svg
[2]: https://github.com/dopos/dcape-app-enfist/releases
[3]: https://img.shields.io/github/languages/code-size/dopos/dcape-app-enfist.svg
[4]: https://img.shields.io/github/license/dopos/dcape-app-enfist.svg
[5]: LICENSE

 Роль в dcape | Сервис | Docker image
 --- | --- | ---
 config | [enfist](https://github.com/apisite/app-enfist) | [app-enfist](https://github.com/apisite/app-enfist/pkgs/container/app-enfist)

## Назначение

**Enfist** - это сервис хранения конфигураций приложений. Конфигурации хранятся в БД в виде Key-value таблицы, где ключ (key) формируется из адреса git репозитория `organization--repo_name--branch` (`организация--проект--ветка`), а значение (value) - содержимое `.env` файла.

Доступ к хранилищу ограничивается [narra](/dcape/coreapps/narra) и осуществляется через фронтенд **dcape**.

Кроме веб-интерфейса, работа с конфигурациями запуска может осуществляться посредством [dcape-config-cli](https://github.com/dopos/dcape-config-cli).
Примеры команд, доступных после клонирования (git clone) и настройки (make .env) dcape-config-cli:

* `make get TAG=name` - получить из хранилища конфигурацию для ключа (тега) `name` и сохранить в файл `name.env`
* `make set TAG=name` - загрузить файл `name.env` в хранилище с ключом (тегом) `name`

Тег содержит значение, равное ключу БД Key-value хранилища: `organization--name_of_repo--branch` (`организация--проект--ветка`)

В файле конфигурации dcape-config-cli задается два параметра:

* `ENFIST_URL` - адрес сервиса enfist
* `CIS_TOKEN` - токен для авторизации в gitea

---

## Install

Приложение разворачивается в составе [dcape](https://github.com/dopos/dcape).

## License

Copyright 2024 Алексей Коврижкин <ak+dopos@dcape.ru>

Licensed under the Apache License, Version 2.0 (the "[License](LICENSE)")
