{% set filtered_main_column_lines = [] %}
{% for line in entry.main_column.splitlines() %}
{% if entry.tools or not line.startswith("Tools") %}
{% set _ = filtered_main_column_lines.append(line) %}
{% endif %}
{% endfor %}
{% if not design.entries.short_second_row %}
{% set first_row_lines = entry.date_and_location_column.splitlines()|length %}
{% if first_row_lines == 0 %} {% set first_row_lines = 1 %} {% endif %}
{% else %}
{% set first_row_lines = filtered_main_column_lines|length %}
{% endif %}
#regular-entry(
  [
{% for line in filtered_main_column_lines[:first_row_lines] %}
    {{ line|indent(4) }}

{% endfor %}
  ],
  [
{% for line in entry.date_and_location_column.splitlines() %}
    {{ line|indent(4) }}

{% endfor %}
  ],
{% if not design.entries.short_second_row %}
  main-column-second-row: [
{% for line in filtered_main_column_lines[first_row_lines:] %}
    {{ line|indent(4) }}

{% endfor %}
  ],
{% endif %}
)
