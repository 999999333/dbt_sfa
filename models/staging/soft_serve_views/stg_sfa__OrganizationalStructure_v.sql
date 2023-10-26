with source as (
      select * from {{ source('sfa', 'dbo_OrganizationalStructure_v') }}
),
renamed as (
    select
        {{ adapter.quote("Country_Code") }},
        {{ adapter.quote("OrgStructureID") }},
        {{ adapter.quote("ParentID") }},
        {{ adapter.quote("OrgStructureCode") }},
        {{ adapter.quote("Name") }},
        {{ adapter.quote("Email") }},
        {{ adapter.quote("AT_ID") }},
        {{ adapter.quote("Level") }},
        {{ adapter.quote("OrgStructureOldId") }},
        {{ adapter.quote("Status") }},
        {{ adapter.quote("DLM") }},
        {{ adapter.quote("ULM") }},
        {{ adapter.quote("TaxCode") }},
        {{ adapter.quote("PhoneNumber") }},
        {{ adapter.quote("NodeId") }},
        {{ adapter.quote("TreeNodeHierarchy") }},
        {{ adapter.quote("StaffType_id") }},
        {{ adapter.quote("FullName") }},
        {{ adapter.quote("AdditionalFullTextSearch") }},
        {{ adapter.quote("ResetPassword") }},
        {{ adapter.quote("OfficeID") }},
        {{ adapter.quote("BusinessRole") }},
        {{ adapter.quote("ChildOrgStructureToUserTypeLinkRequired") }},
        {{ adapter.quote("ChildOrgStructureToActivityTypeLinkRequired") }}

    from source
)
select * from renamed
  