with
source as (select * from {{ source("sfa", "dbo_ContentFiles") }}),

renamed as (
    select
    
        ----------  ids
        {{ dbt_utils.generate_surrogate_key(["Country_Code", "ContentFileID"]) }} as content_file_id,
        {{ adapter.quote("ContentFileID") }} as content_file_key,

        {{ dbt_utils.generate_surrogate_key(["Country_Code", "ContentID"]) }} as sfa_file_id,
        {{ adapter.quote("ContentID") }} as sfa_file_key,

        {{ convert_country_to_code("Country_Code") }} as country_id,
        {{ adapter.quote("Country_Code") }} as country_code,

        ----------  strings
        {{ adapter.quote("ContentFileName") }} as sfa_file_name,
        {{ adapter.quote("ContentFileUniqueName") }} as sfa_file_name_unique ,
        {{ adapter.quote("Hash") }} as hash,
        {{ adapter.quote("Comment") }} as comment,

        ----------  numerics
        {{ adapter.quote("Status") }} as status,
        {{ adapter.quote("Size") }} as size,

        ----------  booleans
        {{ adapter.quote("IsEdited") }} as is_edited,

        ----------  timestamps
        {{ adapter.quote("CreationDate") }},
        {{ adapter.quote("ReceivingResultDate") }},
        {{ adapter.quote("DLM") }} as dlm,
        {{ adapter.quote("Valid_From") }},
        {{ adapter.quote("Valid_To") }}

        ----------  omited
        -- {{ adapter.quote("Activity_ID") }},
        -- {{ adapter.quote("PhotoTypeId") }},
        -- {{ adapter.quote("ULM") }},

    from source
)

select *
from renamed
