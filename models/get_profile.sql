-- depends_on: {{ ref("vw_worldcat_xwc_admin") }}
{% if execute %}
    {{ dbt_profiler.get_profile(relation=ref("vw_worldcat_xwc_admin")) }}
{% endif %}