-- Find all employees whose first name is John.
select first_name, last_name
from employees
where first_name like 'J%';
-- Find the number of employees in each department and list the departments in descending order of employee count
SELECT 
    d.department_name,
    COUNT(e.employee_id) AS num_employees
FROM 
    departments d
LEFT JOIN 
    employees e ON d.department_id = e.department_id
GROUP BY 
    d.department_name
ORDER BY 
    num_employees DESC;


SELECT 
    j.job_title,
    ROUND(AVG(e.salary), 2) AS avg_salary
FROM 
    employees e
JOIN 
    jobs j ON e.job_id = j.job_id
GROUP BY 
    j.job_title
ORDER BY 
    avg_salary DESC;


-- Find the average salary per department
select AVG(salary) as avg_salary,d.department_name 
from employees e 
join departments d on e.department_id =d.department_id
group by d.department_name 


-- Find the total number of dependents per employee.
select
    e.employee_id,
    e.first_name,
    e.last_name,
    COUNT(*) AS total_dependents
FROM 
    employees e
JOIN 
    dependents d ON e.employee_id = d.employee_id
GROUP BY 
    e.employee_id, e.first_name, e.last_name;



-- Find the department with the highest average salary.
select avg(e.salary ) as avg_salary,d.department_name  from employees e 
join departments d on e.department_id  =d.department_id 
group by d.department_name 
order by avg_salary desc
limit 1;

-- Show departments with more than 5 employees.
select d.department_name,count(e.employee_id ) as num_employee   from departments d  left join employees e  on d.department_id =e.department_id 
group by d.department_name
having count(e.employee_id )>5
order by num_employee  desc;


-- List all employees who work in department IDs 2, 5 or 9.
select * from employees e 
where department_id in(2,5,9)

-- List the first and last names of employees who either have a manager id of 103 or a salary greater than 8000.
select e.first_name,e.last_name  from employees e 
where manager_id=103 or salary>8000