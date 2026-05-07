with 

source as (

    select * from {{ source('my_new_project', 'INSURANCE') }}

),

renamed as (

    select
        insurance_id,
        patient_id,
        payer_name,
        plan_name,
        policy_number,
        group_number,
        coverage_type,
        effective_date,
        termination_date,
        is_primary,
        created_at

    from source

)

select * from renamed