with source as (
      select * from {{ ref('sfa__staff_snapshot') }}
),
renamed as (
    select
        ----------  ids
        {{ adapter.quote("dbt_scd_id") }},
        {{ dbt_utils.generate_surrogate_key(["Country_Code", "Staff_id"]) }} as _id,
        {{ adapter.quote("Staff_id") }} as staff_id,
        {{ adapter.quote("Staff_Code") }} as staff_code,
        {{ convert_country_to_code("Country_Code") }} as country_id,

        ----------  strings
        {{ adapter.quote("Name") }} as staff_name_whole,
        {{ adapter.quote("FName") }} as staff_name_first,
        {{ adapter.quote("LName") }} as staff_name_last,
        {{ adapter.quote("Position") }} as staff_position,
        {{ adapter.quote("Comment") }} as staff_comment,
        {{ adapter.quote("EMail") }} as staff_email,
        reverse(
            left(
                reverse({{ adapter.quote("Name") }}),
                patindex('%[^0-9 ]%', reverse({{ adapter.quote("Name") }}) + 'x') - 1
            )
        ) as staff_telephone,

        ----------  numerics
        {{ adapter.quote("Status") }} as status,

        ----------  booleans

        ----------  timestamps
        {{ adapter.quote("DLM") }} as dlm,
        {{ adapter.quote("dbt_valid_from") }},
        coalesce("dbt_valid_to", cast('{{ var("future_proof_date") }}' as datetime)) as dbt_valid_to
        
        ----------  omited
        -- {{ adapter.quote("SName") }} as staff_middle_name,
        -- {{ adapter.quote("BirthDate") }} as staff_birth_date,
        -- {{ adapter.quote("Location") }} as staff_location,
        -- {{ adapter.quote("Dept") }} as staff_department,
        -- {{ adapter.quote("GeographyID") }},
        -- {{ adapter.quote("StaffType_id") }},
        -- {{ adapter.quote("ULM") }},

    from source
)
select * from renamed
  