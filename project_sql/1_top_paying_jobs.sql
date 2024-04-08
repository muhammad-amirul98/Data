-- Highest paying jobs
-- Top 10 software jobs that are remote
-- Jobs with specified salaries
-- Why? To understand demands
SELECT company_dim.name AS company_name,
    job_title,
    job_location,
    salary_year_avg
FROM job_postings_fact
    LEFT JOIN company_dim ON company_dim.company_id = job_postings_fact.company_id
WHERE job_title_short = 'Software Engineer'
    AND job_location = 'Anywhere'
    AND salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10