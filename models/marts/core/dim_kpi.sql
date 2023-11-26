{{
    config(
        materialized = 'table'
    )
}}


with kpi as (
    select * from {{ ref('stg_sfa__kpis') }}
),


final as (
    select
        country_code = isnull(
            kpi.country_code,
            'n/a'
        ),
        kpi_name = isnull(
            kpi.name,
            'n/a'
        ),
        kpi_level_1 = isnull(
            level1.name,
            'n/a'
        ),
        kpi_level_2 = isnull(
            level2.name,
            'n/a'
        ),
        kpi_level_3 = isnull(
            level3.name,
            'n/a'
        ),
        kpi_level_4 = isnull(
            level4.name,
            'n/a'
        ),
        kpi_level_5 = isnull(
            level5.name,
            'n/a'
        ),
        kpi_level_6 = isnull(
            level6.name,
            'n/a'
        ),
        kpi_external_code = isnull(
            kpi.externalcode,
            'n/a'
        ),
        kpi_description = isnull(
            kpi.comment,
            'n/a'
        ),
        TYPE = isnull(
            kpi.type,
            -1
        ),
        number_of_levels = isnull(
            kpi.level,
            -1
        ),
        status = isnull(
            kpi.status,
            -1
        ),
        activity = isnull(
            kpi.activitytype,
            -1
        ),
        last_modified = kpi.dlm,
        kpi_id = kpi.kpiid,
        parent_id = isnull(
            kpi.kpiid,
            'n/a'
        ),
        parent_id_1 = isnull(
            level1.parentid,
            'n/a'
        ),
        parent_id_2 = isnull(
            level2.parentid,
            'n/a'
        ),
        parent_id_3 = isnull(
            level3.parentid,
            'n/a'
        ),
        parent_id_4 = isnull(
            level4.parentid,
            'n/a'
        ),
        parent_id_5 = isnull(
            level5.parentid,
            'n/a'
        ),
        parent_id_6 = isnull(
            level6.parentid,
            'n/a'
        ),
        kpi_country_id = CONCAT(
            kpi.kpiid,
            ':',
            kpi.country_code
        )
    FROM
        kpi AS kpi
        LEFT JOIN kpi AS level1
        ON kpi.parentid = level1.kpiid
        AND kpi.country_code = level1.country_code
        LEFT JOIN kpi AS level2
        ON level1.parentid = level2.kpiid
        AND kpi.country_code = level2.country_code
        LEFT JOIN kpi AS level3
        ON level2.parentid = level3.kpiid
        AND kpi.country_code = level3.country_code
        LEFT JOIN kpi AS level4
        ON level3.parentid = level4.kpiid
        AND kpi.country_code = level4.country_code
        LEFT JOIN kpi AS level5
        ON level4.parentid = level5.kpiid
        AND kpi.country_code = level5.country_code
        LEFT JOIN kpi AS level6
        ON level5.parentid = level6.kpiid
        AND kpi.country_code = level6.country_code
)

select * from final
