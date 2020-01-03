-- Innesco Zapier: eBook per G19 [Guida alla Flora Intestinale]

SELECT o.id, o.ds_first_name, o.contact_email, co.coupon_id, o.orderstatus_id FROM jiri_jkshop_orders o LEFT JOIN coupon_order co ON o.id = co.order_id WHERE co.coupon_id = 4072 AND o.orderstatus_id NOT IN (2,5)
