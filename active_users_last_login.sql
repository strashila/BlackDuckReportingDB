/* Get active users that logged in in the last 6 months */  

SELECT * FROM reporting.user  
WHERE last_login > CURRENT_DATE - INTERVAL '6 months'  
  AND active = true;
