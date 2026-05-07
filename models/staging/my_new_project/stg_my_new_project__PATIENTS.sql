with 

source as (

    select * from {{ source('my_new_project', 'PATIENTS') }}

),

renamed as (

    select
        patient_id,
        first_name,
        last_name,
        date_of_birth,
        gender,
        ssn,
        address,
        city,
        state,
        zip_code,
        phone,
        email,
        emergency_contact_name,
        emergency_contact_phone,
        created_at,
        updated_at

    from source

)

select * from renamed