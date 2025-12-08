SELECT 
  e.employee_id, 
  e.first_name || ' ' || e.last_name AS nome, 
  d.department_name, 
  s.salary_amount 
FROM employees AS e 
INNER JOIN departments AS d 
  ON e.department_id = d.department_id 
INNER JOIN salaries AS s 
  ON e.employee_id = s.employee_id 
    AND s.effective_to IS NULL 
WHERE s.salary_amount > (
    SELECT AVG(s2.salary_amount) 
    FROM employees AS e2 
    INNER JOIN salaries AS s2 
      ON e2.employee_id = s2.employee_id 
        AND s2.effective_to IS NULL 
    WHERE e2.department_id = e.department_id
  )
ORDER BY d.department_name, s.salary_amount DESC; -- Esta consulta seleciona os funcionários cujo salário atual é maior que a média dos salários atuais em seus respectivos departamentos, exibindo o nome completo do funcionário, o nome do departamento e o valor do salário. Os resultados são ordenados pelo nome do departamento e pelo valor do salário em ordem decrescente.

SELECT AVG(s.salary_amount) 
FROM employees AS e 
INNER JOIN departments AS d 
  ON e.department_id = d.department_id 
INNER JOIN salaries AS s 
  ON e.employee_id = s.employee_id 
    AND s.effective_to IS NULL 
WHERE d.department_name = 'Marketing'; -- Esta consulta calcula a média dos salários atuais dos funcionários que trabalham no departamento de Marketing.
