/* Get active users that logged in in the last 6 months */  

SELECT * FROM reporting.user  
WHERE last_login > CURRENT_DATE - INTERVAL '6 months'  
  AND active = true;
  
  
/* Alternatively, users that did NOT log in in the last 6 months */

SELECT * FROM reporting.user
WHERE last_login < CURRENT_DATE - INTERVAL '180 days'
ORDER BY last_login DESC
