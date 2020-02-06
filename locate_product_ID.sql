SELECT o.id, DATE_FORMAT(o.created_at, '%d/%m/%Y') AS 'data', u.name, u.surname, u.email AS 'email_utente', o.contact_email AS 'email_ordine', o.total_price, o.total_global_discount, o.products_json FROM jiri_jkshop_orders o INNER JOIN users u ON o.user_id = u.id AND o.orderstatus_id not IN (2,5)

AND LOCATE('"product_id":30', o.products_json) > 0

AND DATE(o.created_at) >= '2020-02-05'

ORDER BY o.id ASC
