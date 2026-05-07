with 

source as (

    select * from {{ source('my_new_project', 'PROCEDURES') }}

),

renamed as (

    select
        procedure_id,
        admission_id,
        provider_id,
        cpt_code,
        cpt_description,
        icd_procedure_code,
        procedure_date,
        modifier,
        quantity,
        created_at

    from source

)

select * from renamed