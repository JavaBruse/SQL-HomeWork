# Создание БД, настройка, подключение:

1 Создаем БД postgreSQL в Docker\* контейнере:

```bash
docker run --name home_work -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=postgres -e POSTGRES_DB=postgres -p 5432:5432 -d postgres:13
```

\*Предварительно его нужно скачать и установить [Docker.](https://www.docker.com/)

2 Настройка pgAdmin

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

- Открваем инструменты для отправки запросов Query Tool

  ![alt text](/image/work_space.jpg)

- Добавляем таблицы и данные через Open File

  - /DATA_SQL/create_insert.db.all.sql в этом файле описаны все таблицы 4 заданий и их наполнение.

    - синтаксис уже переделан под PostgreSQL

      ![alt text](/image/add_file.jpg)

# Решение задач:

## База данных 1. Транспортные средства.

- Задача 1:

```sql
SELECT v.maker, m.model
FROM Motorcycle m
JOIN Vehicle v ON m.model = v.model
where m.horsepower > 150
and m.price < 20000
and m.type = 'Sport'
```

- Результат работы:

  ![alt text](/image/db.1.1.jpg)

- Задача 2:

```sql
SELECT v.maker, c.model, c.horsepower, c.engine_capacity, 'Car' AS vehicle_type
FROM Car c
JOIN Vehicle v ON c.model = v.model
WHERE c.horsepower > 150
AND c.engine_capacity < 3
AND c.price < 35000

UNION ALL

SELECT v.maker, m.model, m.horsepower, m.engine_capacity, 'Motorcycle' AS vehicle_type
FROM Motorcycle m
JOIN Vehicle v ON m.model = v.model
WHERE m.horsepower > 150
AND m.engine_capacity < 1.5
AND m.price < 20000

UNION ALL

SELECT v.maker, b.model, NULL AS horsepower, NULL AS engine_capacity, 'Bicycle' AS vehicle_type
FROM Bicycle b
JOIN Vehicle v ON b.model = v.model
WHERE b.gear_count > 18
AND b.price < 4000

ORDER BY horsepower DESC NULLS LAST;
```

- Результат работы:

  ![alt text](/image/db.1.2.jpg)

## База данных 2 . Автомобильные гонки

- Задача 1:

```sql
SELECT
    c.name AS car_name,
    c.class AS car_class,
    AVG(r.position) AS average_position,
    COUNT(r.race) AS race_count
FROM Cars c
JOIN Results r ON c.name = r.car
GROUP BY c.name, c.class
ORDER BY average_position
```

- Результат работы:

  ![alt text](/image/db.2.1.jpg)

- Задача 2:

```sql
SELECT
    c.name AS car_name,
    c.class AS car_class,
    AVG(r.position) AS average_position,
    COUNT(r.race) AS race_count,
	cl.country
FROM Cars c
JOIN Results r ON c.name = r.car
JOIN Classes cl ON c.class = cl.class
GROUP BY c.name, c.class, cl.country
ORDER BY average_position ASC, c.name ASC
LIMIT 1
```

- Результат работы:

  ![alt text](/image/db.2.2.jpg)

- Задача 3:

```sql
WITH ClassAvg AS (
    SELECT
        c.class,
        cl.country,
        AVG(r.position) AS avg_class_position,
        COUNT(DISTINCT r.race) AS total_races
    FROM Cars c
    JOIN Results r ON c.name = r.car
    JOIN Classes cl ON c.class = cl.class
    GROUP BY c.class, cl.country
),
MinAvg AS (
    SELECT MIN(avg_class_position) AS min_avg FROM ClassAvg
),
CarStats AS (
    SELECT
        c.name,
        c.class,
        cl.country,
        AVG(r.position) AS average_position,
        COUNT(r.race) AS race_count
    FROM Cars c
    JOIN Results r ON c.name = r.car
    JOIN Classes cl ON c.class = cl.class
    GROUP BY c.name, c.class, cl.country
)
SELECT cs.name as car_name, cs.class as car_class, cs.average_position, cs.race_count, cs.country as car_country, ca.total_races
FROM CarStats cs
JOIN ClassAvg ca ON cs.class = ca.class
JOIN MinAvg ma ON ca.avg_class_position = ma.min_avg
ORDER BY cs.class;
```

- Результат работы:

  ![alt text](/image/db.2.3.jpg)

- Задача 4:

```sql
WITH ClassAvg AS (
    SELECT
        c.class,
        AVG(r.position) AS avg_class_position,
        COUNT(DISTINCT c.name) AS car_count
    FROM Cars c
    JOIN Results r ON c.name = r.car
    GROUP BY c.class
    HAVING COUNT(DISTINCT c.name) > 1
),
CarAvg AS (
    SELECT
        c.name,
        c.class,
        cl.country,
        AVG(r.position) AS average_position,
        COUNT(r.race) AS race_count
    FROM Cars c
    JOIN Results r ON c.name = r.car
    JOIN Classes cl ON c.class = cl.class
    GROUP BY c.name, c.class, cl.country
)
SELECT ca.name as car_name, ca.class as car_class, ca.average_position, ca.race_count, ca.country as car_country
FROM CarAvg ca
JOIN ClassAvg cla ON ca.class = cla.class
WHERE ca.average_position < cla.avg_class_position
ORDER BY ca.class, ca.average_position;
```

- Результат работы:

  ![alt text](/image/db.2.4.jpg)

- Задача 5:

```sql


```

## База данных 3. Бронирование отелей

- Задача 1:

```sql


```

- Задача 2:

```sql


```

- Задача 3:

```sql

```

- Задача 4:

```sql


```

- Задача 5:

```sql


```

## База данных 4. Структура организации

- Задача 1:

```sql


```

- Задача 2:

```sql


```

- Задача 3:

```sql

```

- Задача 4:

```sql


```

- Задача 5:

```sql


```
