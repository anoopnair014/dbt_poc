{{ config(
    schema='raw', 
    materialized='table'
) }}

with source_raw_worldcat_localholdingsdetail as (
    
  SELECT 
    DATA:"institutionNumber"::STRING as institutionNumber, 
    DATA:"holdLibCode"::STRING as holdLibCode, 
    regexp_replace(DATA:"document"::STRING, '[^[:ascii:]]', '') as document_raw,
    F_XML2JSON(document_raw) as document_json,
    DATA:"createDate"::STRING as createDate, 
    DATA:"rowkey"::STRING as rowkey, 
    DATA:"lastModifiedDate"::STRING as lastModifiedDate, 
    DATA:"oclcNumber"::STRING as oclcNumber

    FROM {{ source('RAW', 'WORLDCAT_LOCALHOLDINGSDETAIL') }}
    limit 1000


)

select * 
from source_raw_worldcat_localholdingsdetail