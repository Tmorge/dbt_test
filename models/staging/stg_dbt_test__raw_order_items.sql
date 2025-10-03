with 

source as (

    select * from {{ source('dbt_test', 'raw_order_items') }}

),

renamed as (

    select
        order_item_id,
        order_id,
        product_id,
        sku,
        quantity,
        unit_price,
        gross_revenue,
        net_revenue,
        refunded_revenue

    from source

)

select * from renamed