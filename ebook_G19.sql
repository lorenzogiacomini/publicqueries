-- Innesco Zapier: eBook per G19 [Guida alla Flora Intestinale]
-- DESCRIZIONE: vengono estratti tutti gli ordini validi (quindi in uno status diverso da 2 e 5)
-- per i quali è stato utilizzato il codice coupon con ID = 4072

SELECT o.id, o.ds_first_name, o.contact_email, co.coupon_id, o.orderstatus_id
FROM jiri_jkshop_orders o LEFT JOIN coupon_order co ON o.id = co.order_id
WHERE co.coupon_id = 4072 AND o.orderstatus_id NOT IN (2,5)

-- per filtrare meglio la query possiamo aggiungere questa/e riga/righe:

-- AND o.id > xxx (se vogliamo filtrare per ID ordine maggiore di un determinato ID
-- AND o.created_at > '2019-12-25 23:59:59' se vogliamo filtrare per ordini creati dopo il 25 Dicembre 2019
-- AND YEAR(o.created_at) = 2019 AND MONTH(o.created_at) = 12 AND DAYOFMONTH(o.created_at) = 25 se vogliamo filtrare per data precisa
-- AND DATE(o.created_at) = '2019-12-25' variante di quella sopra sopra ma dobbiamo inserire la data in formato americano
