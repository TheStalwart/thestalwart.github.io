{#
    Use H3,
    because i modified SectionBeginning to use H2
#}
### {{ entry.main_column.splitlines()[0] }}

{% for line in entry.date_and_location_column.splitlines() %}
{{ line }}

{% endfor %}
{% for line in entry.main_column.splitlines()[1:] %}
{%- if line != "!!! summary" and (entry.tools or not line.startswith("Tools")) -%}{{ line|replace("    ", "") }}

{% endif -%}
{% endfor %}
