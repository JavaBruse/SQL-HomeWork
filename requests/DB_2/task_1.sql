SELECT
    c.name AS car_name,
    c.class AS car_class,
    AVG(r.position) AS average_position,
    COUNT(r.race) AS race_count
FROM Cars c
JOIN Results r ON c.name = r.car
GROUP BY c.name, c.class
ORDER BY average_position