{% macro create_f_xml2json() %}

create or replace function F_XML2JSON(XML string, INDENT int)
returns string
language java
strict immutable
imports=('@ext_oclcworldcatpoc_stage/tojson.jar')
handler='XmlToJson.xmlToJson'
;

create or replace function F_XML2JSON(XML string)
returns variant
language sql
as
$$
    parse_json(F_XML2JSON(XML, 0))
$$
;

{% endmacro %}