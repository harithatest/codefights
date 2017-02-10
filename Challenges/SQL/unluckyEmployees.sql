/*Please add ; after each select statement*/
CREATE PROCEDURE unluckyEmployees()
BEGIN 

SELECT y.dep_name,y.emp_number,y.total_salary
FROM (
SELECT @rn:=@rn+1 rn, x.*
FROM(
SELECT  d.name as dep_name, count(e.id) as emp_number, COALESCE(sum(e.salary),0) as total_salary
FROM Department d 
LEFT OUTER JOIN Employee e
on d.id = e.department
GROUP BY d.name
HAVING count(e.id) < 6
ORDER BY total_salary DESC,emp_number DESC,d.id
) x
JOIN (SELECT @rn:= 0) r 
) y
WHERE MOD(y.rn, 2) = 1;
END

