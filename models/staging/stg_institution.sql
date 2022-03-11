{{ config(materialized='view') }}

with source_raw_institution as (
  
  SELECT 
    DATA:"cityId"::STRING as cityId, 
    DATA:"cityPhrase"::STRING as cityPhrase, 
    DATA:"countryId"::STRING as countryId, 
    DATA:"illStatus"::STRING as illStatus, 
    DATA:"instProfile"::STRING as instProfile, 
    DATA:"institutionSymbol"::STRING as institutionSymbol,
    DATA:"libType"::STRING as libType, 
    DATA:"libType2"::STRING as libType2, 
    DATA:"libType3"::STRING as libType3, 
    DATA:"marcCode2"::STRING as marcCode2, 
    DATA:"stateNumericId"::STRING as stateNumericId,
    DATA:"zipCode"::STRING as zipCode, 
    DATA:"lastModifiedDate"::STRING as lastModifiedDate, 
    DATA:"registryId"::STRING as registryId, 
    DATA:"ulBibCount"::STRING as ulBibCount, 
    DATA:"marcCode"::STRING as marcCode, 
    DATA:"searchable"::STRING as searchable, 
    DATA:"visibility"::STRING as visibility, 
    DATA:"stateProvId"::STRING as stateProvId, 
    DATA:"bibCount"::STRING as bibCount, 
    DATA:"dataCenter"::STRING as dataCenter, 
    DATA:"firstSearchSubscriber"::STRING as firstSearchSubscriber, 
    DATA:"holdingCount"::STRING as holdingCount, 
    DATA:"institutionName"::STRING as institutionName, 
    DATA:"libType4"::STRING as libType4, 
    DATA:"networkId"::STRING as networkId, 
    DATA:"rowkey"::STRING as rowkey, 
    DATA:"marcCode3"::STRING as marcCode3
  FROM 
    {{ source('RAW', 'INSTITUTION') }}

)

select * 
from source_raw_institution