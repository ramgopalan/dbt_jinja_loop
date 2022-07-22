-- Use the `ref` function to select from other models

select *
from test_db.test_schema.my_first_dbt_model
where id = 1