{{ config(materialized='table') }}

SELECT

    host_id,
    host_name,
    host_since,
    is_superhost,
    response_rate

FROM {{ ref('stg_hosts') }}