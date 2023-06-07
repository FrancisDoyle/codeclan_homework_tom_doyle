--1 MVP


--Question 1.

   -- (a). Find the first name, last name and team name of employees who are members of teams. 

SELECT 
e.first_name,
e.last_name 
FROM employees AS e 
INNER JOIN teams ON team_id = teams.id ;


SELECT 
e.first_name,
e.last_name 
FROM employees AS e 
INNER JOIN teams ON team_id = teams.id 
WHERE pension_enrol = TRUE; 


SELECT e.first_name, e.last_name
FROM employees AS e
INNER JOIN teams AS t ON e.team_id = t.id
WHERE CAST(t.charge_cost AS INTEGER) > 80;


	
--Question 2.

  --  (a). Get a table of all employees details, together with their local_account_no and local_sort_code,
  -- if they have them. 


SELECT *
FROM employees AS e 
LEFT JOIN pay_details AS p 
ON e.pay_detail_id  = p.id
LEFT JOIN teams  AS t ON
e.team_id = t.id;

--Question 3.

   -- (a). Make a table, which has each employee id along with the team that employee belongs to.

SELECT 
e.id,
t.name
FROM employees AS e
LEFT JOIN teams  AS t ON
e.team_id = t.id;

-- (b). Breakdown the number of employees in each of the teams. 

SELECT 
count (e.id),
t.name
FROM employees AS e
LEFT JOIN teams  AS t ON
e.team_id = t.id
GROUP BY t.name

-- (c). Order the table above by so that the teams with the least employees come first. 

SELECT 
count (e.id),
t.name
FROM employees AS e
LEFT JOIN teams  AS t ON
e.team_id = t.id
GROUP BY t.name
ORDER BY count (e.id);

--Question 4.

   -- (a). Create a table with the team id, team name and the count of the number of employees 
   -- in each team.


SELECT 
count (e.id),
t.name,
t.id 
FROM employees AS e
LEFT JOIN teams  AS t ON
e.team_id = t.id
GROUP BY t.name, t.id 
ORDER BY count (e.id);

-- (b). The total_day_charge of a team is defined as the charge_cost of the team multiplied by 
--the number of employees in the team. Calculate the total_day_charge for each team.

SELECT 
  t.name,
  t.id,
  SUM(t.charge_cost * COUNT(e.id)) AS total_day_charge
FROM teams AS t
LEFT JOIN employees AS e ON e.team_id = t.id
GROUP BY t.name, t.id;



--(c). How would you amend your query from above to show only those teams with a 
--total_day_charge greater than 5000? 

-- within a sumt need to use having


