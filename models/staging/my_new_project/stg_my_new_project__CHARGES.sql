with 

source as (

    select * from {{ source('my_new_project', 'CHARGES') }}

),

renamed as (

    select
        charge_id,
        admission_id,
        procedure_id,
        charge_code,
        charge_description,
        charge_date,
        quantity,
        unit_price,
        total_amount,
        revenue_code,
        department,
        created_at

    from source

)

select * from renamed