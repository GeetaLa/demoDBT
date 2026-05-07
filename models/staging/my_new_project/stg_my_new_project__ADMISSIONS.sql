with 

source as (

    select * from {{ source('my_new_project', 'ADMISSIONS') }}

),

renamed as (

    select
        admission_id,
        patient_id,
        provider_id,
        insurance_id,
        admission_date,
        discharge_date,
        admission_type,
        room_number,
        bed_number,
        floor,
        admission_diagnosis,
        discharge_status,
        drg_code,
        drg_description,
        length_of_stay,
        created_at,
        updated_at

    from source

)

select * from renamed