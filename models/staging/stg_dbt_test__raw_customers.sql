with 

source as (

    select * from {{ source('dbt_test', 'raw_customers') }}

),

renamed as (

    select
        customer_id,
        email,
        first_name,
        last_name,
        created_at,
        updated_at,
        deleted_at,
        marketing_channel,
        country

    from source

)

select * from renamed