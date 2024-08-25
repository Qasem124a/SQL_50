/* Write your T-SQL query statement below */
WITH TotalRequests AS (
    SELECT 
        user_id, 
        COUNT(*) AS total_requests
    FROM 
        Confirmations
    GROUP BY 
        user_id
),
ConfirmedRequests AS (
    SELECT 
        user_id, 
        COUNT(*) AS confirmed_requests
    FROM 
        Confirmations
    WHERE 
        action = 'confirmed'
    GROUP BY 
        user_id
)
SELECT 
    s.user_id, 
    ROUND(CASE 
            WHEN COALESCE(t.total_requests, 0) = 0 THEN 0.00 
            ELSE COALESCE(c.confirmed_requests, 0) * 1.0 / COALESCE(t.total_requests, 0) 
         END, 2) AS confirmation_rate
FROM 
    Signups s
LEFT JOIN 
    TotalRequests t ON s.user_id = t.user_id
LEFT JOIN 
    ConfirmedRequests c ON s.user_id = c.user_id
ORDER BY 
    s.user_id;
