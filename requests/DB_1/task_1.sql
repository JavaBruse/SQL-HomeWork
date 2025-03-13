SELECT v.maker, m.model
FROM Motorcycle m
JOIN Vehicle v ON m.model = v.model
where m.horsepower > 150
and m.price < 20000
and m.type = 'Sport'