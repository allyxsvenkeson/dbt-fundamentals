{% set payment_methods = ['credit_card', 'coupon', 'bank_transfer', 'gift_card'] %} -- set list of values for payment methods

with payments as (
    select * from {{ ref('stg_payments') }}
),

pivoted as (

    select
        order_id,
        {%- for payment_method in payment_methods %} -- for loop, for each value in list payment_methods 
        sum(case when payment_method = '{{ payment_method }}' then amount else 0 end) as {{ payment_method }}_amount -- run each value in list through this
        {%- if not loop.last -%}  -- if not the last value in the loop then add , 
        ,
        {%-endif -%}
        {%- endfor %} -- end for loop
    from payments
    group by 1
)


select * from pivoted