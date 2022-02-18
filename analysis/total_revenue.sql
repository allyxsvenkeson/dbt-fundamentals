-- analysis files are sql files that can be run against models to get aggregated data etc. they don't affect the models and will be saved
-- example if you want to run a query every day to see total revenue

with payments as (
    select * from {{ ref('stg_payments')}}
),

aggregated as (
    select sum(amount) as total_revenue
    from payments
    where status = 'success'
)

select * from aggregated