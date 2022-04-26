{{ config(
    schema='raw', 
    materialized='view'
) }}

with document_control as (

    {{ flatten_json(
        
        model_name = 'raw.stg_worldcat_xwc', 
        foreign_key = 'rowkey', 
        json_column = 'document_json', 
        startswith_filter = 'CDFRec.v5'

    )}}

)

select *
from document_control