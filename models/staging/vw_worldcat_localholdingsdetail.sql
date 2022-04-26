{{ config(
    schema='raw', 
    materialized='view'
) }}

with document_HldDetRec as (

    {{ flatten_json(
        
        model_name = 'raw.stg_worldcat_localholdingsdetail', 
        foreign_key = 'rowkey', 
        json_column = 'document_json', 
        startswith_filter = 'HldDetRec'

    )}}

)

select *
from document_HldDetRec