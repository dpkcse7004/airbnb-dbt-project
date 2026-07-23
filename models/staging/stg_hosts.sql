{{
  config(materialized = 'view')
}}

SELECT
    host_id,
    TRIM(host_name) AS host_name,
    host_since,
    is_superhost,
    response_rate,
    created_at AS host_created_at
FROM {{ source('raw', 'raw_hosts') }}