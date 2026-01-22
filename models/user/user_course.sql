{{ config(materialized='table') }}

SELECT user.user_ptr_id, user.role, course.course_name, course.org_id
FROM {{ source('dbt_dev_us_central1', 'accounts_thmuser_source') }} user
JOIN {{ source('dbt_dev_us_central1', 'course_course_source') }} course
    ON user.current_course_id = course.id

