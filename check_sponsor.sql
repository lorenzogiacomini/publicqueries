SELECT
	 DISTINCT IF(pr.refer_id IS NULL, 'NON sponsorizzato', 'sponsorizzato') AS 'check'
	
		FROM users u
		LEFT JOIN meetab_promoter_refers pr ON u.id = pr.user_id
		
		WHERE u.id = 6
