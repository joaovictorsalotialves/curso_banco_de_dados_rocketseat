SELECT 
  e.employee_id, 
  e.first_name || ' ' || e.last_name AS nome, 
  d.department_name, 
  p.position_name 
FROM employees e 
INNER JOIN departments d 
  ON e.department_id = d.department_id 
INNER JOIN positions p 
  ON e.position_id = p.position_id; -- Lista todos os funcionários com seus respectivos departamentos e cargos

SELECT 
  e.employee_id, 
  e.first_name || ' ' || e.last_name AS nome, 
  e.department_id, 
  e.position_id 
FROM employees e 
LEFT JOIN departments d 
  ON e.department_id = d.department_id 
LEFT JOIN positions p 
  ON e.position_id = p.position_id 
WHERE d.department_id IS NULL 
  OR p.position_id IS NULL; -- Lista todos os funcionários que não estão atribuídos a um departamento ou cargo

SELECT 
  d.department_name, 
  COUNT(e.employee_id) AS total_funcionarios 
FROM departments d 
LEFT JOIN employees e 
  ON d.department_id = e.department_id 
GROUP BY d.department_name 
ORDER BY total_funcionarios DESC; -- Conta o número de funcionários em cada departamento, incluindo departamentos sem funcionários

SELECT 
  s.employee_id, 
  s.salary_amount 
FROM salaries s 
WHERE s.effective_to IS NULL; -- Lista os salários atuais dos funcionários

SELECT 
  p.position_name, 
  AVG(s.salary_amount) AS media_salarial 
FROM positions p 
INNER JOIN employees e 
  ON p.position_id = e.position_id 
INNER JOIN (
    SELECT employee_id, salary_amount 
    FROM salaries 
    WHERE effective_to IS NULL
  ) AS s 
ON e.employee_id = s.employee_id 
GROUP BY p.position_name 
ORDER BY media_salarial DESC; -- Calcula a média salarial por cargo, considerando apenas os salários atuais
