{{ config(materialized='view') }}
SELECT
    host_id,
    COUNT(listing_id) AS total_listings,
    AVG(price_per_night) AS avg_price_per_night
FROM {{ ref('stg_listings') }}
GROUP BY host_id