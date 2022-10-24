with customer_payments as (
    select
        {{ref('stg_payments')}}.order_id,
        {{ref('stg_payments')}}.amount,
        {{ref('stg_orders')}}.customer_id
    from {{ ref('stg_payments')}}
    left join {{ ref('stg_orders')}} on 
        {{ref('stg_payments')}}.order_id = {{ref('stg_orders')}}.order_id
)
select * from customer_payments

