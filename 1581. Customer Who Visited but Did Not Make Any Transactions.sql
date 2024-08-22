/* Write your T-SQL query statement below */
select v.customer_id, COUNT(*) AS count_no_trans
from Visits v LEFT JOIN Transactions t on v.visit_id = t.visit_id
where t.transaction_id IS NULL
group by v.customer_id
