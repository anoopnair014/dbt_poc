{% macro json_array_to_table(model_name, foreign_key, json_column, array_path) %}

{% set json_array_keys_query %}
select distinct

    k.value::varchar as key

from {{ model_name }},
   lateral flatten(input => {{ json_column }}:{{ array_path }}) f,
   lateral flatten(input => 
      case
         when
            startswith(f.this, '[') 
         then
            f.value::array 
         when
            not startswith(f.this, '[') 
         then
            to_array(f.this) 
         else
            f.this 
      end
   ) g,
   lateral flatten(input => object_keys(g.value)) k

order by 1
{% endset %}


{% set results = run_query(json_array_keys_query) %}

--{{ log("results: " ~ results, True) }}

{% if execute %}
{% set results_list = results.columns[0].values() %}
{% else %}
{% set results_list = [] %}
{% endif %}

--{{ log("results_list: " ~ results_list, True) }}

select 

m.{{ foreign_key }},
{% for key in results_list %}
g.value:{{ key }}::varchar as {{ key }}
{% if not loop.last %},{% endif %}
{% endfor %}

from {{ model_name }} m,
   lateral flatten(input => {{ json_column }}:{{ array_path }}) f,
   lateral flatten(input => 
      case
         when
            startswith(f.this, '[') 
         then
            f.value::array 
         when
            not startswith(f.this, '[') 
         then
            to_array(f.this) 
         else
            f.this 
      end
   ) g

{% endmacro %}