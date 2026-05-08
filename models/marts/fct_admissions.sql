with admissions as (

    select * from {{ ref('stg_my_new_project__ADMISSIONS') }}

),

charges as (

    select * from {{ ref('stg_my_new_project__CHARGES') }}

),

charge_totals as (

    select
        admission_id,
        count(charge_id) as charge_count,
        sum(total_amount) as total_charges
    from charges
    group by 1

),

final as (

    select
        admissions.admission_id,
        admissions.patient_id,
        admissions.provider_id,
        admissions.insurance_id,
        admissions.admission_date,
        admissions.discharge_date,
        admissions.admission_type,
        admissions.room_number,
        admissions.bed_number,
        admissions.floor,
        admissions.admission_diagnosis,
        admissions.discharge_status,
        admissions.drg_code,
        admissions.drg_description,
        admissions.length_of_stay,
        coalesce(charge_totals.charge_count, 0) as charge_count,
        coalesce(charge_totals.total_charges, 0) as total_charges,
        admissions.created_at,
        admissions.updated_at
    from admissions
    left join charge_totals
        on admissions.admission_id = charge_totals.admission_id

)

select * from final
