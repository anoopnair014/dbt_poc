{{ config(
    schema='raw', 
    materialized='view'
) }}

with document_admin as (

    {{ flatten_json(
        
        model_name = 'raw.stg_worldcat_xwc', 
        json_column = 'document_json', 
        startswith_filter = 'CDFRec.Admin'

    )}}

)

select *
from document_admin