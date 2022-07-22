
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(materialized='table') }}

{% set get_table_name %}
select distinct table_name from test_db.information_schema.tables where table_schema!= 'INFORMATION_SCHEMA'
{% endset %}

{% set results = run_query(get_table_name) %}

{% if execute %}
{% set table_names = results.columns[0].values() %}
{% else %}
{% set table_names= [] %}
{% endif %}

{% for tables in table_names %}
   {% if not loop.first %}
        UNION ALL
    {% endif %} 
    {% set get_column_names %}
        SELECT distinct column_name from test_db.information_schema.columns where table_name =  '{{ tables }}'
    {% endset %} 
    {% set cresults = run_query(get_column_names) %}
    {% if execute %}
        {% set col_names = cresults.columns[0].values() %}
    {% else %}
        {% set col_names = [] %}
    {% endif %}
    {% for columns in col_names %}
    {% if not loop.first %}
        UNION ALL
    {% endif %}
    SELECT  {{tables}}.{{columns}}, sum({{tables}}.{{columns}}) FROM {{tables}}
    {% endfor %}
 {% endfor %}