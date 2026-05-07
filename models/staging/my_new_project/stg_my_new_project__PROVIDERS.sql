with 

source as (

    select * from {{ source('my_new_project', 'PROVIDERS') }}

),

renamed as (

    select
        provider_id,
        first_name,
        last_name,
        npi,
        specialty,
        department,
        phone,
        email,
        created_at

    from source

)

select * from renamed