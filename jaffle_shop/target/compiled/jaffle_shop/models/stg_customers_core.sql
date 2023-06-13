


with customers_core as (

    select
        id as customer_id,
        first_name,
        last_name

    from jaffle_shop.customers

),

orders_core as (

    select
        id as order_id,
        user_id as customer_id,
        order_date,
        status

    from jaffle_shop.orders

),


customer_orders_core as (

    select
        customer_id,

        min(order_date) as first_order_date,
        max(order_date) as most_recent_order_date,
        count(order_id) as number_of_orders

    from orders_core

    group by 1

),

final as (

    select
        cc.customer_id,
        cc.first_name,
        cc.last_name,
        co.first_order_date,
        co.most_recent_order_date,
        coalesce(co.number_of_orders, 0) as number_of_orders
    from customers_core as cc

    left join customer_orders_core as co using (customer_id) 

)

select * from final