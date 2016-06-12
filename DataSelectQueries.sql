
/*Select full name and finish time for all athletes with injuries */ 

SELECT athlete.first_name, athlete.last_name, athlete.finish_time
FROM athlete
WHERE athlete.injury = TRUE;

/*Select full name and salary for all coaches with 
salary more than 5000$ in descending order */ 

SELECT coach.first_name, coach.last_name, coach.salary
FROM coach
WHERE coach.salary > CAST(5000 as money)
ORDER BY coach.salary DESC;

/* Selectr athletes with salary more than coach salary */

SELECT athlete.first_name, athlete.last_name, athlete.salary as athlete_salary, coach.salary as coach_salary
FROM athlete INNER JOIN coach ON athlete.coach_id = coach.id
WHERE athlete.salary > coach.salary;


/* Rank sponsors by best athlete finish time*/

SELECT company_name, MIN(finish_time) as best_time
FROM sponsor 
INNER JOIN athlete on athlete.sponsor_id = sponsor.id
GROUP BY company_name
ORDER BY best_time;


/* Rank sponsors by amount of money they spent on athletes and coaches*/

SELECT sponsor.company_name, SUM(coach.salary) + SUM(athlete.salary) as expenses
FROM
sponsor INNER JOIN (athlete INNER JOIN coach ON coach.id = athlete.coach_id) 
ON sponsor.id = athlete.sponsor_id
GROUP BY sponsor.company_name
ORDER BY expenses DESC;

