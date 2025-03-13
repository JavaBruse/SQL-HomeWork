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
SELECT
    cs.name AS car_name,
    cs.class AS car_class,
    cs.average_position,
    cs.race_count,
    cs.country AS car_country,
    ca.total_races
FROM CarStats cs
JOIN ClassAvg ca ON cs.class = ca.class
JOIN MinAvg ma ON ca.avg_class_position = ma.min_avg
ORDER BY cs.class;