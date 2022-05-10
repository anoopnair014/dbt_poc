
    {{ config(
    schema='raw', 
    materialized='view'
        ) }}

     -- depends_on: {{ ref('stg_worldcat_xwc') }}

    with array_table as (

   {{ json_array_to_table(
        
        model_name = 'raw.stg_worldcat_xwc', 
        foreign_key = 'rowkey',
        json_column = 'document_json', 
        array_path = 'CDFRec.v526'

    )}}

    )

    select *
    from array_table
    