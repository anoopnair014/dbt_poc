select
    t.document_json:CDFRec::varchar as CDFRec,
    children.index as child_idx,
    child.key as key_name,
    child.value::varchar as key_value
from
    stg_worldcat_xwc t,
    lateral flatten(input => parse_json(t.document_json:CDFRec), outer => true) children,
    lateral flatten(children.value, outer => true) child
limit 100