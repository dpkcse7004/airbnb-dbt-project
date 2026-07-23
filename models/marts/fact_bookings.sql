{{ config(
    materialized='incremental',
    unique_key='booking_id',
    incremental_strategy='merge'
) }}

SELECT *

FROM {{ ref('int_booking_details') }}

{% if is_incremental() %}

WHERE booking_date >
(
    SELECT MAX(booking_date)
    FROM {{ this }}
)

{% endif %}