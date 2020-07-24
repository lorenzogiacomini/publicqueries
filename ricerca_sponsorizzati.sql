SET @id_sponsor := 106;

SELECT
	u.id,
	u.name,
	u.surname,
	u.email,
	u.promoter_code AS 'codice_sponsor'

	FROM users u
	WHERE u.id = @id_sponsor

UNION

SELECT
	u.id,
	u.name AS nome_sponsorizzato,
	u.surname AS cognome_sponsorizzato,
	t1.level,
	ROUND(SUM(o.total_price),2) AS 'totale'
	
	FROM
		(SELECT pr.user_id, u.name, u.surname, u.email, pr.refer_id, pr.level FROM meetab_promoter_refers pr INNER JOIN users u ON pr.user_id = u.id) t1

	INNER JOIN users u ON t1.refer_id = u.id
	LEFT JOIN jiri_jkshop_orders o ON u.id = o.user_id
		WHERE
			t1.user_id = @id_sponsor				    -- ID utente Promoter
			AND o.orderstatus_id NOT IN (2,5) 	-- l'ordine è valido
			AND o.created_at BETWEEN '2000-01-01 00:00:00' AND '2020-12-31 23:59:59' -- per range di data

GROUP BY u.id

