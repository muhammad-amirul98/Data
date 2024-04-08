/*
 Skills required for highest paying jobs
 use the top 10 highest-paying software jobs from first query
 add the specific skills required for these jobs
 */
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
    /*
     WITH top_paying_jobs AS (
     SELECT 
     job_id,
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
     
     SELECT 
     skills_dim.skills,
     COUNT(skills) AS count_skills
     FROM top_paying_jobs
     INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
     INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id 
     GROUP BY
     skills
     ORDER BY
     count_skills DESC
     */
    /*
     [
     {
     "job_id": 562251,
     "company_name": "Datavant",
     "job_title": "Senior Software Engineer",
     "salary_year_avg": "225000.0",
     "skills": "python"
     },
     {
     "job_id": 562251,
     "company_name": "Datavant",
     "job_title": "Senior Software Engineer",
     "salary_year_avg": "225000.0",
     "skills": "javascript"
     },
     {
     "job_id": 562251,
     "company_name": "Datavant",
     "job_title": "Senior Software Engineer",
     "salary_year_avg": "225000.0",
     "skills": "typescript"
     },
     {
     "job_id": 562251,
     "company_name": "Datavant",
     "job_title": "Senior Software Engineer",
     "salary_year_avg": "225000.0",
     "skills": "azure"
     },
     {
     "job_id": 562251,
     "company_name": "Datavant",
     "job_title": "Senior Software Engineer",
     "salary_year_avg": "225000.0",
     "skills": "aws"
     },
     {
     "job_id": 562251,
     "company_name": "Datavant",
     "job_title": "Senior Software Engineer",
     "salary_year_avg": "225000.0",
     "skills": "snowflake"
     },
     {
     "job_id": 562251,
     "company_name": "Datavant",
     "job_title": "Senior Software Engineer",
     "salary_year_avg": "225000.0",
     "skills": "spark"
     },
     {
     "job_id": 562251,
     "company_name": "Datavant",
     "job_title": "Senior Software Engineer",
     "salary_year_avg": "225000.0",
     "skills": "react"
     },
     {
     "job_id": 1356375,
     "company_name": "SmarterDx",
     "job_title": "Senior Software Engineer, Full Stack",
     "salary_year_avg": "205000.0",
     "skills": "python"
     },
     {
     "job_id": 1356375,
     "company_name": "SmarterDx",
     "job_title": "Senior Software Engineer, Full Stack",
     "salary_year_avg": "205000.0",
     "skills": "elasticsearch"
     },
     {
     "job_id": 1356375,
     "company_name": "SmarterDx",
     "job_title": "Senior Software Engineer, Full Stack",
     "salary_year_avg": "205000.0",
     "skills": "dynamodb"
     },
     {
     "job_id": 1356375,
     "company_name": "SmarterDx",
     "job_title": "Senior Software Engineer, Full Stack",
     "salary_year_avg": "205000.0",
     "skills": "aws"
     },
     {
     "job_id": 1356375,
     "company_name": "SmarterDx",
     "job_title": "Senior Software Engineer, Full Stack",
     "salary_year_avg": "205000.0",
     "skills": "snowflake"
     },
     {
     "job_id": 1356375,
     "company_name": "SmarterDx",
     "job_title": "Senior Software Engineer, Full Stack",
     "salary_year_avg": "205000.0",
     "skills": "pandas"
     },
     {
     "job_id": 1356375,
     "company_name": "SmarterDx",
     "job_title": "Senior Software Engineer, Full Stack",
     "salary_year_avg": "205000.0",
     "skills": "airflow"
     },
     {
     "job_id": 1356375,
     "company_name": "SmarterDx",
     "job_title": "Senior Software Engineer, Full Stack",
     "salary_year_avg": "205000.0",
     "skills": "react"
     },
     {
     "job_id": 1356375,
     "company_name": "SmarterDx",
     "job_title": "Senior Software Engineer, Full Stack",
     "salary_year_avg": "205000.0",
     "skills": "graphql"
     },
     {
     "job_id": 1356375,
     "company_name": "SmarterDx",
     "job_title": "Senior Software Engineer, Full Stack",
     "salary_year_avg": "205000.0",
     "skills": "node.js"
     },
     {
     "job_id": 365528,
     "company_name": "Huckleberry Labs",
     "job_title": "Engineering",
     "salary_year_avg": "205000.0",
     "skills": "python"
     },
     {
     "job_id": 365528,
     "company_name": "Huckleberry Labs",
     "job_title": "Engineering",
     "salary_year_avg": "205000.0",
     "skills": "aws"
     },
     {
     "job_id": 365528,
     "company_name": "Huckleberry Labs",
     "job_title": "Engineering",
     "salary_year_avg": "205000.0",
     "skills": "gcp"
     },
     {
     "job_id": 1398776,
     "company_name": "MongoDB",
     "job_title": "Senior Software Engineer, Cluster Scalability",
     "salary_year_avg": "200000.0",
     "skills": "mongodb"
     },
     {
     "job_id": 1398776,
     "company_name": "MongoDB",
     "job_title": "Senior Software Engineer, Cluster Scalability",
     "salary_year_avg": "200000.0",
     "skills": "mongodb"
     },
     {
     "job_id": 1231528,
     "company_name": "MongoDB",
     "job_title": "Senior Software Engineer, Server Security",
     "salary_year_avg": "200000.0",
     "skills": "mongodb"
     },
     {
     "job_id": 1231528,
     "company_name": "MongoDB",
     "job_title": "Senior Software Engineer, Server Security",
     "salary_year_avg": "200000.0",
     "skills": "mongodb"
     },
     {
     "job_id": 64759,
     "company_name": "Orbis",
     "job_title": "Senior Ruby Engineer - Analytics Platform - $190-210k+",
     "salary_year_avg": "200000.0",
     "skills": "typescript"
     },
     {
     "job_id": 64759,
     "company_name": "Orbis",
     "job_title": "Senior Ruby Engineer - Analytics Platform - $190-210k+",
     "salary_year_avg": "200000.0",
     "skills": "ruby"
     },
     {
     "job_id": 64759,
     "company_name": "Orbis",
     "job_title": "Senior Ruby Engineer - Analytics Platform - $190-210k+",
     "salary_year_avg": "200000.0",
     "skills": "ruby"
     },
     {
     "job_id": 946351,
     "company_name": "Webflow",
     "job_title": "Staff Frontend Engineer",
     "salary_year_avg": "191000.0",
     "skills": "javascript"
     },
     {
     "job_id": 946351,
     "company_name": "Webflow",
     "job_title": "Staff Frontend Engineer",
     "salary_year_avg": "191000.0",
     "skills": "css"
     },
     {
     "job_id": 946351,
     "company_name": "Webflow",
     "job_title": "Staff Frontend Engineer",
     "salary_year_avg": "191000.0",
     "skills": "react"
     },
     {
     "job_id": 946351,
     "company_name": "Webflow",
     "job_title": "Staff Frontend Engineer",
     "salary_year_avg": "191000.0",
     "skills": "graphql"
     },
     {
     "job_id": 946351,
     "company_name": "Webflow",
     "job_title": "Staff Frontend Engineer",
     "salary_year_avg": "191000.0",
     "skills": "node.js"
     },
     {
     "job_id": 946351,
     "company_name": "Webflow",
     "job_title": "Staff Frontend Engineer",
     "salary_year_avg": "191000.0",
     "skills": "react.js"
     },
     {
     "job_id": 1054268,
     "company_name": "Pulley",
     "job_title": "Staff Software Engineer, AI",
     "salary_year_avg": "185000.0",
     "skills": "python"
     },
     {
     "job_id": 1054268,
     "company_name": "Pulley",
     "job_title": "Staff Software Engineer, AI",
     "salary_year_avg": "185000.0",
     "skills": "javascript"
     },
     {
     "job_id": 1054268,
     "company_name": "Pulley",
     "job_title": "Staff Software Engineer, AI",
     "salary_year_avg": "185000.0",
     "skills": "typescript"
     },
     {
     "job_id": 1054268,
     "company_name": "Pulley",
     "job_title": "Staff Software Engineer, AI",
     "salary_year_avg": "185000.0",
     "skills": "golang"
     },
     {
     "job_id": 182858,
     "company_name": "ConsenSys",
     "job_title": "Senior Software Engineer (Confirmations - System)",
     "salary_year_avg": "184500.0",
     "skills": "javascript"
     },
     {
     "job_id": 182858,
     "company_name": "ConsenSys",
     "job_title": "Senior Software Engineer (Confirmations - System)",
     "salary_year_avg": "184500.0",
     "skills": "typescript"
     },
     {
     "job_id": 182858,
     "company_name": "ConsenSys",
     "job_title": "Senior Software Engineer (Confirmations - System)",
     "salary_year_avg": "184500.0",
     "skills": "react"
     },
     {
     "job_id": 117409,
     "company_name": "Robert Half",
     "job_title": "Director of Software Engineer",
     "salary_year_avg": "182500.0",
     "skills": "python"
     },
     {
     "job_id": 117409,
     "company_name": "Robert Half",
     "job_title": "Director of Software Engineer",
     "salary_year_avg": "182500.0",
     "skills": "javascript"
     },
     {
     "job_id": 117409,
     "company_name": "Robert Half",
     "job_title": "Director of Software Engineer",
     "salary_year_avg": "182500.0",
     "skills": "html"
     },
     {
     "job_id": 117409,
     "company_name": "Robert Half",
     "job_title": "Director of Software Engineer",
     "salary_year_avg": "182500.0",
     "skills": "css"
     },
     {
     "job_id": 117409,
     "company_name": "Robert Half",
     "job_title": "Director of Software Engineer",
     "salary_year_avg": "182500.0",
     "skills": "c#"
     },
     {
     "job_id": 117409,
     "company_name": "Robert Half",
     "job_title": "Director of Software Engineer",
     "salary_year_avg": "182500.0",
     "skills": "mongodb"
     },
     {
     "job_id": 117409,
     "company_name": "Robert Half",
     "job_title": "Director of Software Engineer",
     "salary_year_avg": "182500.0",
     "skills": "redis"
     },
     {
     "job_id": 117409,
     "company_name": "Robert Half",
     "job_title": "Director of Software Engineer",
     "salary_year_avg": "182500.0",
     "skills": "mysql"
     },
     {
     "job_id": 117409,
     "company_name": "Robert Half",
     "job_title": "Director of Software Engineer",
     "salary_year_avg": "182500.0",
     "skills": "elasticsearch"
     },
     {
     "job_id": 117409,
     "company_name": "Robert Half",
     "job_title": "Director of Software Engineer",
     "salary_year_avg": "182500.0",
     "skills": "mongodb"
     },
     {
     "job_id": 117409,
     "company_name": "Robert Half",
     "job_title": "Director of Software Engineer",
     "salary_year_avg": "182500.0",
     "skills": "dynamodb"
     },
     {
     "job_id": 117409,
     "company_name": "Robert Half",
     "job_title": "Director of Software Engineer",
     "salary_year_avg": "182500.0",
     "skills": "couchbase"
     },
     {
     "job_id": 117409,
     "company_name": "Robert Half",
     "job_title": "Director of Software Engineer",
     "salary_year_avg": "182500.0",
     "skills": "azure"
     },
     {
     "job_id": 117409,
     "company_name": "Robert Half",
     "job_title": "Director of Software Engineer",
     "salary_year_avg": "182500.0",
     "skills": "aws"
     },
     {
     "job_id": 117409,
     "company_name": "Robert Half",
     "job_title": "Director of Software Engineer",
     "salary_year_avg": "182500.0",
     "skills": "asp.net"
     }
     ]
     */