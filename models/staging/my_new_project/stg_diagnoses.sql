with 

source as (

    select * from {{ source('my_new_project', 'DIAGNOSES') }}

),

renamed as (

    SELECT
    DIAGNOSIS_ID,
    ADMISSION_ID,
    ICD_CODE,
    ICD_DESCRIPTION,
    DIAGNOSIS_TYPE,
    SEQUENCE_NUMBER,
    POA_INDICATOR,
    CREATED_AT


    from source

)

select * from renamed