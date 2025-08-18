{% macro parse_date(col) %}
    case
      when try_cast({{ col }} as date) is not null then cast({{ col }} as date)
      when try_strptime(cast({{ col }} as varchar), '%Y%m') is not null then strptime(cast({{ col }} as varchar), '%Y%m')::date
      else null
    end
{% endmacro %}