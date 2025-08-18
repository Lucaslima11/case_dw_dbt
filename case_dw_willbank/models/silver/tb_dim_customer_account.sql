with customer as (
    select distinct
        cd_account_customer,
        entry_date
    from {{ ref('tb_customer') }}
)

select
    {{ dbt_utils.generate_surrogate_key(['customer.cd_account_customer']) }} as cd_customer_id,
    customer.cd_account_customer,
    customer.entry_date
from customer

