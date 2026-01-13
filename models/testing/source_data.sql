{{ config(
    materialized='view'
) }}

-- This model serves as a staging layer for raw course data
-- It references the seed file 'course_raw.csv'

select
    course_id,
    course_name,
    created_at,
    -- Add any transformations here
    current_timestamp() as loaded_at

from {{ ref('course_raw') }}
