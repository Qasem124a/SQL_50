/* Write your T-SQL query statement below */
select u.unique_id, e.name
from Employees e LEFT JOIN EmployeeUNI u on e.id = u.id
