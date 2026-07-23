{{
  config(materialized = 'view')
}}

SELECT
    listing_id,
    host_id,
    property_type,
    room_type,
    INITCAP(TRIM(city)) AS city,
    UPPER(TRIM(country)) AS country,
    accommodates,
    bedrooms,
    bathrooms,
    price_per_night,
    created_at AS listing_created_at
FROM {{ source('raw', 'raw_listings') }}