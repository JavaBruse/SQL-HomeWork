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
SELECT
    ca.name AS car_name,
    ca.class AS car_class,
    ca.average_position,
    ca.race_count,
    ca.country AS car_country
FROM CarAvg ca
JOIN ClassAvg cla ON ca.class = cla.class
WHERE ca.average_position < cla.avg_class_position
ORDER BY ca.class, ca.average_position;