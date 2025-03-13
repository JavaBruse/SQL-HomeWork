# Проект "Базы данных"

Это заключительная часть курса "Базы данных"

# Структура:

- База данных 1 "Транспортные средства"
- База данных 2 "Автомобильные гонки"
- База данных 3 "Бронирование отелей"
- База данных 4 "Структура организации"

### Таблицы и исходные данные расположены:

- DATA_CREATE_INSERT_SQL
  - create_insert.db_all.sql - Все таблици и их наполнение, для удобства тестирования всего и сразу.
  - create_insert.db.1.sql - Таблици и наполение "База данных 1"
  - create_insert.db.2.sql - Таблици и наполение "База данных 2"
  - create_insert.db.3.sql - Таблици и наполение "База данных 3"
  - create_insert.db.4.sql - Таблици и наполение "База данных 4"

# Создание БД, настройка, подключение:

1 Создаем БД postgreSQL в Docker\* контейнере:

```bash
docker run --name home_work -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=postgres -e POSTGRES_DB=postgres -p 5432:5432 -d postgres:13
```

\*Предварительно его нужно скачать и установить [Docker.](https://www.docker.com/)

2 Настройка pgAdmin\*

\*Предварительно его нужно скачать и устанвоить [pgAdmin](https://www.pgadmin.org/download/pgadmin-4-windows/).

- Регистрируем новый сервер

  ![alt text](/image/start.jpg)

- Заполняем поля:

  - имя

    ![alt text](/image/config1.jpg)

  - локальный адрес компьютера.
  - порт по умлочанию
  - название DB
  - имя пользователя
  - пороль

    ![alt text](/image/config2.jpg)

- Сохраняем SAVE

# Создание таблиц для заданий и их заполнение:

- Открываем инструменты для отправки запросов Query Tool

  ![alt text](/image/work_space.jpg)

- Добавляем таблицы и данные через Open File

  - /DATA_CREATE_INSERT_SQL/create_insert.db.all.sql в этом файле описаны все таблицы 4 заданий и их наполнение.

    - синтаксис уже переделан под PostgreSQL

      ![alt text](/image/add_file.jpg)

# Решение задач:

### Все решения опсаны \*.sql файлах, далее по структуре:

- requesrts
  - DB_1
    - task_1.sql
    - task_2.sql
  - DB_2
    - task_1.sql
    - task_2.sql
    - task_3.sql
    - task_4.sql
    - task_5.sql
  - DB_3
    - task_1.sql
    - task_2.sql
    - task_3.sql
  - DB_4
    - task_1.sql
    - task_2.sql
    - task_3.sql

## База данных 1. Транспортные средства.

#### Задача 1:

Найдите производителей (maker) и модели всех мотоциклов, которые имеют мощность более 150 лошадиных сил, стоят менее 20 тысяч долларов и являются спортивными (тип Sport). Также отсортируйте результаты по мощности в порядке убывания.

- Результат работы решения:

  ![alt text](/image/db.1.1.jpg)

#### Задача 2:

Найти информацию о производителях и моделях различных типов транспортных средств (автомобили, мотоциклы и велосипеды), которые соответствуют заданным критериям.

Автомобили:
Извлечь данные о всех автомобилях, которые имеют:

Мощность двигателя более 150 лошадиных сил.
Объем двигателя менее 3 литров.
Цену менее 35 тысяч долларов.
В выводе должны быть указаны производитель (maker), номер модели (model), мощность (horsepower), объем двигателя (engine_capacity) и тип транспортного средства, который будет обозначен как Car.

Мотоциклы:
Извлечь данные о всех мотоциклах, которые имеют:

Мощность двигателя более 150 лошадиных сил.
Объем двигателя менее 1,5 литров.
Цену менее 20 тысяч долларов.
В выводе должны быть указаны производитель (maker), номер модели (model), мощность (horsepower), объем двигателя (engine_capacity) и тип транспортного средства, который будет обозначен как Motorcycle.

Велосипеды:
Извлечь данные обо всех велосипедах, которые имеют:

Количество передач больше 18.
Цену менее 4 тысяч долларов.
В выводе должны быть указаны производитель (maker), номер модели (model), а также NULL для мощности и объема двигателя, так как эти характеристики не применимы для велосипедов. Тип транспортного средства будет обозначен как Bicycle.

Сортировка:
Результаты должны быть объединены в один набор данных и отсортированы по мощности в порядке убывания. Для велосипедов, у которых нет значения мощности, они будут располагаться внизу списка.

- Результат работы решения:

  ![alt text](/image/db.1.2.jpg)

## База данных 2 . Автомобильные гонки

#### Задача 1:

Определить, какие автомобили из каждого класса имеют наименьшую среднюю позицию в гонках, и вывести информацию о каждом таком автомобиле для данного класса, включая его класс, среднюю позицию и количество гонок, в которых он участвовал. Также отсортировать результаты по средней позиции.

- Результат работы решения:

  ![alt text](/image/db.2.1.jpg)

#### Задача 2:

Определить автомобиль, который имеет наименьшую среднюю позицию в гонках среди всех автомобилей, и вывести информацию об этом автомобиле, включая его класс, среднюю позицию, количество гонок, в которых он участвовал, и страну производства класса автомобиля. Если несколько автомобилей имеют одинаковую наименьшую среднюю позицию, выбрать один из них по алфавиту (по имени автомобиля).

- Результат работы решения:

  ![alt text](/image/db.2.2.jpg)

#### Задача 3:

Определить классы автомобилей, которые имеют наименьшую среднюю позицию в гонках, и вывести информацию о каждом автомобиле из этих классов, включая его имя, среднюю позицию, количество гонок, в которых он участвовал, страну производства класса автомобиля, а также общее количество гонок, в которых участвовали автомобили этих классов. Если несколько классов имеют одинаковую среднюю позицию, выбрать все из них.

- Результат работы решения:

  ![alt text](/image/db.2.3.jpg)

#### Задача 4:

Определить, какие автомобили имеют среднюю позицию лучше (меньше) средней позиции всех автомобилей в своем классе (то есть автомобилей в классе должно быть минимум два, чтобы выбрать один из них). Вывести информацию об этих автомобилях, включая их имя, класс, среднюю позицию, количество гонок, в которых они участвовали, и страну производства класса автомобиля. Также отсортировать результаты по классу и затем по средней позиции в порядке возрастания.

- Результат работы решения:

  ![alt text](/image/db.2.4.jpg)

#### Задача 5:

Определить, какие классы автомобилей имеют наибольшее количество автомобилей с низкой средней позицией (больше 3.0) и вывести информацию о каждом автомобиле из этих классов, включая его имя, класс, среднюю позицию, количество гонок, в которых он участвовал, страну производства класса автомобиля, а также общее количество гонок для каждого класса. Отсортировать результаты по количеству автомобилей с низкой средней позицией.

- Результат работы решения:

  ![alt text](/image/db.2.5.jpg)

## База данных 3. Бронирование отелей

#### Задача 1:

Определить, какие клиенты сделали более двух бронирований в разных отелях, и вывести информацию о каждом таком клиенте, включая его имя, электронную почту, телефон, общее количество бронирований, а также список отелей, в которых они бронировали номера (объединенные в одно поле через запятую с помощью CONCAT). Также подсчитать среднюю длительность их пребывания (в днях) по всем бронированиям. Отсортировать результаты по количеству бронирований в порядке убывания.

- Результат работы решения:

  ![alt text](/image/db.3.1.jpg)

#### Задача 2:

Необходимо провести анализ клиентов, которые сделали более двух бронирований в разных отелях и потратили более 500 долларов на свои бронирования. Для этого:

Определить клиентов, которые сделали более двух бронирований и забронировали номера в более чем одном отеле. Вывести для каждого такого клиента следующие данные: ID_customer, имя, общее количество бронирований, общее количество уникальных отелей, в которых они бронировали номера, и общую сумму, потраченную на бронирования.
Также определить клиентов, которые потратили более 500 долларов на бронирования, и вывести для них ID_customer, имя, общую сумму, потраченную на бронирования, и общее количество бронирований.
В результате объединить данные из первых двух пунктов, чтобы получить список клиентов, которые соответствуют условиям обоих запросов. Отобразить поля: ID_customer, имя, общее количество бронирований, общую сумму, потраченную на бронирования, и общее количество уникальных отелей.
Результаты отсортировать по общей сумме, потраченной клиентами, в порядке возрастания.

- Результат работы решения:

  ![alt text](/image/db.3.2.jpg)

#### Задача 3:

Вам необходимо провести анализ данных о бронированиях в отелях и определить предпочтения клиентов по типу отелей. Для этого выполните следующие шаги:

Категоризация отелей.
Определите категорию каждого отеля на основе средней стоимости номера:

«Дешевый»: средняя стоимость менее 175 долларов.
«Средний»: средняя стоимость от 175 до 300 долларов.
«Дорогой»: средняя стоимость более 300 долларов.
Анализ предпочтений клиентов.
Для каждого клиента определите предпочитаемый тип отеля на основании условия ниже:

Если у клиента есть хотя бы один «дорогой» отель, присвойте ему категорию «дорогой».
Если у клиента нет «дорогих» отелей, но есть хотя бы один «средний», присвойте ему категорию «средний».
Если у клиента нет «дорогих» и «средних» отелей, но есть «дешевые», присвойте ему категорию предпочитаемых отелей «дешевый».
Вывод информации.
Выведите для каждого клиента следующую информацию:

ID_customer: уникальный идентификатор клиента.
name: имя клиента.
preferred_hotel_type: предпочитаемый тип отеля.
visited_hotels: список уникальных отелей, которые посетил клиент.
Сортировка результатов.
Отсортируйте клиентов так, чтобы сначала шли клиенты с «дешевыми» отелями, затем со «средними» и в конце — с «дорогими».

- Результат работы решения:

  ![alt text](/image/db.3.3.jpg)

## База данных 4. Структура организации

#### Задача 1:

Найти всех сотрудников, подчиняющихся Ивану Иванову (с EmployeeID = 1), включая их подчиненных и подчиненных подчиненных. Для каждого сотрудника вывести следующую информацию:

EmployeeID: идентификатор сотрудника.
Имя сотрудника.
ManagerID: Идентификатор менеджера.
Название отдела, к которому он принадлежит.
Название роли, которую он занимает.
Название проектов, к которым он относится (если есть, конкатенированные в одном столбце через запятую).
Название задач, назначенных этому сотруднику (если есть, конкатенированные в одном столбце через запятую).
Если у сотрудника нет назначенных проектов или задач, отобразить NULL.

- Результат работы решения:

  ![alt text](/image/db.4.1.jpg)

  - и др., весь ответ не влез.

#### Задача 2:

Найти всех сотрудников, подчиняющихся Ивану Иванову с EmployeeID = 1, включая их подчиненных и подчиненных подчиненных. Для каждого сотрудника вывести следующую информацию:

EmployeeID: идентификатор сотрудника.
Имя сотрудника.
Идентификатор менеджера.
Название отдела, к которому он принадлежит.
Название роли, которую он занимает.
Название проектов, к которым он относится (если есть, конкатенированные в одном столбце).
Название задач, назначенных этому сотруднику (если есть, конкатенированные в одном столбце).
Общее количество задач, назначенных этому сотруднику.
Общее количество подчиненных у каждого сотрудника (не включая подчиненных их подчиненных).
Если у сотрудника нет назначенных проектов или задач, отобразить NULL.

- Результат работы решения:

  ![alt text](/image/db.4.2.jpg)

  - и др., весь ответ не влез.

#### Задача 3:

Найти всех сотрудников, которые занимают роль менеджера и имеют подчиненных (то есть число подчиненных больше 0). Для каждого такого сотрудника вывести следующую информацию:

EmployeeID: идентификатор сотрудника.
Имя сотрудника.
Идентификатор менеджера.
Название отдела, к которому он принадлежит.
Название роли, которую он занимает.
Название проектов, к которым он относится (если есть, конкатенированные в одном столбце).
Название задач, назначенных этому сотруднику (если есть, конкатенированные в одном столбце).
Общее количество подчиненных у каждого сотрудника (включая их подчиненных).
Если у сотрудника нет назначенных проектов или задач, отобразить NULL.

- Результат работы решения:

  ![alt text](/image/db.4.3.jpg)
