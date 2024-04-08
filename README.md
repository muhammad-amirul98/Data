# Introduction

This project explores top-paying jobs and high-demand skills in software engineering.

SQL Queries: [project_sql](/project_sql/)

# Background

In my attempt to learn SQL, I utilized the Data from this [Course](https://lukebarousse.com/sql) to learn SQL functions along the way while extracting data about software development trends.

## Questions I Tackled:

1. Top paying jobs in software
2. Skills required for these top paying jobs
3. Most in-demand skills for software engineers
4. Skills associated with higher salaries
5. Most optimal skills based on highest demand and highest salary

# Tools I Used

- **SQL**
- **PostgreSQL**
- **Visual Studio Code**
- **Git & Github**

# The Analysis

Each query tackled a specific question relating to the job market for software development.

### 1. Top Paying Jobs In Software

```sql
SELECT
    company_dim.name AS company_name,
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
```

| Company Name     | Job Title                                              | Job Location | Salary Yearly Avg |
| ---------------- | ------------------------------------------------------ | ------------ | ----------------- |
| Datavant         | Senior Software Engineer                               | Anywhere     | $225,000.00       |
| Huckleberry Labs | Engineering                                            | Anywhere     | $205,000.00       |
| SmarterDx        | Senior Software Engineer, Full Stack                   | Anywhere     | $205,000.00       |
| Orbis            | Senior Ruby Engineer - Analytics Platform - $190-210k+ | Anywhere     | $200,000.00       |
| MongoDB          | Senior Software Engineer, Cluster Scalability          | Anywhere     | $200,000.00       |
| MongoDB          | Senior Software Engineer, Server Security              | Anywhere     | $200,000.00       |
| Webflow          | Staff Frontend Engineer                                | Anywhere     | $191,000.00       |
| Pulley           | Staff Software Engineer, AI                            | Anywhere     | $185,000.00       |
| ConsenSys        | Senior Software Engineer (Confirmations - System)      | Anywhere     | $184,500.00       |
| Robert Half      | Director of Software Engineer                          | Anywhere     | $182,500.00       |

### 2. Skills associated with top paying jobs

```sql
WITH top_paying_jobs AS (
    SELECT job_id,
        company_dim.name AS company_name,
        job_title,
        salary_year_avg
    FROM job_postings_fact
        LEFT JOIN company_dim ON company_dim.company_id = job_postings_fact.company_id
    WHERE job_title_short = 'Software Engineer'
        AND job_location = 'Anywhere'
        AND salary_year_avg IS NOT NULL
    ORDER BY salary_year_avg DESC
    LIMIT 10
)
SELECT top_paying_jobs.*,
    skills_dim.skills
FROM top_paying_jobs
    INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY salary_year_avg DESC
```

### 3. Skills with most demand

```sql
SELECT skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_postings_fact.job_title_short = 'Software Engineer'
    AND job_work_from_home = True
GROUP BY skills
ORDER BY demand_count DESC
LIMIT 5
```

### 4. Skills with highest pay

```sql
SELECT skills,
    ROUND(AVG(salary_year_avg), 0) as average_salary
FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_postings_fact.job_title_short = 'Software Engineer'
    AND salary_year_avg IS NOT NULL -- AND job_location = 'Singapore'
    AND job_work_from_home = True
GROUP BY skills
ORDER BY average_salary DESC
LIMIT 100
```

### 5. Most optimal skills to learn

```sql
SELECT skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count,
    ROUND(AVG(job_postings_fact.salary_year_avg), 0) as avg_salary
FROM job_postings_fact
    INNER JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
    INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE job_postings_fact.job_title_short = 'Software Engineer'
    AND salary_year_avg IS NOT NULL -- AND job_location = 'Singapore'
    AND job_work_from_home = True
GROUP BY skills_dim.skill_id
HAVING COUNT(skills_job_dim.job_id) > 10
ORDER BY demand_count DESC,
    avg_salary DESC
LIMIT 50;
```

# What I Learned

Enhanced my SQL proficiency through:

- Crafting Complex Queries: Employed advanced SQL techniques like table merging and WITH statements.
- Aggregating Data: Utilized COUNT, GROUP BY, and AVG functions to condense information.
- Real-World Application: Translated practical inquiries into meaningful SQL queries, offering actionable insights.

# Conclusions

In wrapping up this project, I've improved my SQL skills while diving into software engineering job trends. By analyzing data, I've discovered the highest-paying roles and the skills they require. This journey taught me how to use SQL effectively and provided valuable insights into the job market. Overall, it's been a rewarding experience that has enhanced my understanding of both SQL and software engineering trends.
