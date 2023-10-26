with source as (
      select * from {{ source('sfa', 'dbo_StaffOrganizationalStructureLinksActive_v') }}
),
renamed as (
    select
        *

    from source
)
select * from renamed
  