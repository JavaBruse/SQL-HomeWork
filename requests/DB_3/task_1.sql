SELECT
    c.name AS customer_name,
    c.email AS customer_email,
    c.phone AS customer_phone,
    COUNT(b.ID_booking) AS total_bookings,
    (
        SELECT STRING_AGG(name, ', ' ORDER BY name)
        FROM (
            SELECT DISTINCT h.name
            FROM Booking b_sub
            JOIN Room r_sub ON b_sub.ID_room = r_sub.ID_room
            JOIN Hotel h ON r_sub.ID_hotel = h.ID_hotel
            WHERE b_sub.ID_customer = c.ID_customer
        ) AS hotel_list
    ) AS hotels,
    AVG(b.check_out_date - b.check_in_date) AS average_stay_duration
FROM Customer c
JOIN Booking b ON c.ID_customer = b.ID_customer
JOIN Room r ON b.ID_room = r.ID_room
JOIN Hotel h ON r.ID_hotel = h.ID_hotel
GROUP BY c.ID_customer
HAVING COUNT(DISTINCT h.ID_hotel) > 1 AND COUNT(b.ID_booking) > 2
ORDER BY total_bookings DESC;