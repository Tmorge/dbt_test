select 
    date(order_date) as order_date,
    sum(net_revenue-refunded_revenue) as final_net_revenue
from {{ ref('int_orders_with_order_items') }} 
where order_status in ('paid','partial_refund')
and payment_status in ('authorized','settled')
and date(order_date) >= date_sub(current_date(),interval 30 day)
group by 1
order by 1