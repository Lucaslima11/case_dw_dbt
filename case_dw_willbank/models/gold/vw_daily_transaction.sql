with transactions as (
    select
        ci.uf,
        fc.dt_transaction,
        ds_transaction_type,
        count(id_transaction) as num_transaction,
        count(distinct fc.cd_account_customer) as num_distinct_customer,
        sum(vl_transaction) as sum_vl_transaction
    from {{ ref('tb_fact_core_transaction') }} as fc
    left join {{ ref('tb_dim_customer_info') }} as ci
        on ci.cd_account_customer = fc.cd_account_customer
    group by
        1,2,3
)

select * from transactions