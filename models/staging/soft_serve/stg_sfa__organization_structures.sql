with source as (
      select * from {{ ref('sfa__organization_structures_snapshot') }}
),
renamed as (
    select



        ----------  ids
        {{ adapter.quote("dbt_scd_id") }} as dbt_scd_id,
        {{ dbt_utils.generate_surrogate_key(["Country_Code", "OrgStructureID"]) }} as _id,

        {{ dbt_utils.generate_surrogate_key(["Country_Code", "OrgStructureID"]) }} as organizational_structure_id,
        {{ adapter.quote("OrgStructureID") }} as organizational_structure_key,
        
        {{ adapter.quote("ParentID") }} as parent_structure_id,
        {{ adapter.quote("NodeId") }} as structure_node_id,
        {{ adapter.quote("Level") }}  as structure_node_level,
        {{ adapter.quote("TreeNodeHierarchy") }},
        {{ adapter.quote("OrgStructureCode") }},
        {{ adapter.quote("OrgStructureOldId") }},
        {{ adapter.quote("AT_ID") }},
        {{ convert_country_to_code("Country_Code") }} as country_id,

        ----------  strings
        {{ adapter.quote("Name") }} as structure_name,
        {{ adapter.quote("PhoneNumber") }} as structure_telephone,
        {{ adapter.quote("Email") }} as structure_email,
        {{ adapter.quote("FullName") }} as structure_whole_node_tree,
        {{ adapter.quote("AdditionalFullTextSearch") }} as structure_name_detail,

        ----------  numerics
        {{ adapter.quote("Status") }},
        {{ adapter.quote("BusinessRole") }},

        ----------  booleans
        {{ adapter.quote("ResetPassword") }},

        ----------  timestamps
        {{ adapter.quote("DLM") }} as dlm,
        {{ adapter.quote("dbt_valid_from") }} as dbt_valid_from,
        coalesce("dbt_valid_to", cast('{{ var("future_proof_date") }}' as datetime)) as dbt_valid_to
        
        ----------  omited
        -- {{ adapter.quote("ULM") }},
        -- {{ adapter.quote("TaxCode") }},
        -- {{ adapter.quote("StaffType_id") }},
        -- {{ adapter.quote("OfficeID") }},
        -- {{ adapter.quote("ChildOrgStructureToUserTypeLinkRequired") }},
        -- {{ adapter.quote("ChildOrgStructureToActivityTypeLinkRequired") }},


    from source
)
select * from renamed
  