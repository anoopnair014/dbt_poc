{{ config(
    schema='raw', 
    materialized='table'
) }}

with source_raw_worldcat_xwc as (
    
  SELECT
    data:"rowkey"::STRING as rowkey,
    data:"workId"::STRING as workId,  
    regexp_replace(data:"document"::STRING, '[^[:ascii:]]', '') as document_raw,
    F_XML2JSON(document_raw) as document_json,
    CHECK_JSON(document_json) as check_document_json,
    data:"priFormat"::STRING as priFormat, 
    data:"physFormat"::STRING as physFormat, 
    data:"language"::STRING as language, 
    data:"createDate"::STRING as createDate, 
    data:"publisher"::STRING as publisher, 
    data:"dataSource"::STRING as dataSource
  FROM
    {{ source('RAW', 'WORLDCAT_XWC') }}
  LIMIT 10000

)

select * 
from source_raw_worldcat_xwc