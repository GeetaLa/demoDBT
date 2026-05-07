with 

source as (

    select * from {{ source('my_new_project', 'PAYMENTS') }}

),

renamed as (

    select
        payment_id,
        admission_id,
        insurance_id,
        payment_date,
        payment_amount,
        payment_method,
        payment_source,
        check_number,
        era_number,
        adjustment_amount,
        adjustment_reason,
        balance_remaining,
        created_at

    from source

)

select * from renamed