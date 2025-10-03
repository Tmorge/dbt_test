with 

source as (

    select * from {{ source('dbt_test', 'raw_orders') }}

),

renamed as (

    select
        order_id,
        customer_id,
        order_date,
        lower(currency) as currency,
        order_status,
        payment_status

    from source

)

select * from renamed
order by customer_id