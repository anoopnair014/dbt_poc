
    {{ config(
    schema='raw', 
    materialized='view'
        ) }}



    with array_table as (

    {{ json_array_to_table(
        
        model_name = 'raw.stg_worldcat_xwc', 
        foreign_key = 'rowkey',
        json_column = 'document_json', 
        array_path = 'CDFRec.Admin.CORCInfo.URLNotif.Institution'

    )}}

    )

    select *
    from array_table
    