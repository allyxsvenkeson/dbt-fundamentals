with payments as (
    select id as payment_id,
           orderid as order_id,
           paymentmethod as payment_method,
           status,
           round(amount/100.0,2) as amount,
           {{ cents_to_dollars('amount', 3) }} as amount_macro-- call macro 
           --created as created_at 
from {{ source('stripe','payment')}}  
)

select * from payments

