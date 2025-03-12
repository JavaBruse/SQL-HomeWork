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
- Сохраняем SAVE.
  ![alt text](/image/config2.jpg)

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

## База данных 2 . Автомобильные гонки

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
