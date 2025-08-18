with customer as (
    select
        cd_account_customer,
        full_name,
        birth_date,
        uf,
        uf_name,
        street_name
    from {{ ref('tb_customer') }}
)

select
    {{ dbt_utils.generate_surrogate_key(['customer.cd_account_customer']) }} as cd_customer_id,
    customer.cd_account_customer,
    customer.full_name,
    customer.birth_date,
    customer.uf,
    customer.uf_name,
    customer.street_name
from customer