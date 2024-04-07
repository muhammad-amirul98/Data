WITH remote_job_skills AS (
    SELECT
        skill_id,
        COUNT(*) as skill_count
    FROM 
        skills_job_dim AS skills_job
    INNER JOIN job_postings_fact as jobs
    ON jobs.job_id = skills_job.job_id
    WHERE 
        jobs.job_work_from_home = TRUE AND
        jobs.job_title_short = 'Data Analyst'
    GROUP BY skill_id
)

SELECT 
    skills_dim.skill_id,
    skills_dim.skills AS skill_name,
    skill_count
FROM remote_job_skills
INNER JOIN skills_dim ON skills_dim.skill_id = remote_job_skills.skill_id
ORDER BY skill_count DESC
LIMIT 5