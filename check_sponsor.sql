SELECT
	DISTINCT IF(pr.user_id IS NULL, 'NON sponsorizzato', 'sponsorizzato') AS 'check'
	 	
		FROM users u
		LEFT JOIN meetab_promoter_refers pr ON u.id = pr.refer_id
		
		WHERE u.id = 7029 -- inserire ID utente di cui fare il check
