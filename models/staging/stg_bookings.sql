{{
  config(materialized = 'view')
}}

SELECT * from {{ source('raw', 'raw_bookings') }}