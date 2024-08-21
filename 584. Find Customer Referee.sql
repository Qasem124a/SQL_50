/* Write your T-SQL query statement below */
select name
from Customer
WHERE referee_id IS NULL OR referee_id <> 2;
