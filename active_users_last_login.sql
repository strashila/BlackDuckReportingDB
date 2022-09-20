

SELECT * FROM reporting.user  
WHERE last_login > CURRENT_DATE - INTERVAL '6 months'  
  AND active = true;
