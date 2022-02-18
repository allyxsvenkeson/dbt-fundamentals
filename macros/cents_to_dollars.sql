{% macro cents_to_dollars(column_name, decimal_places=2) -%} -- creating macro called cents_to_dollars () takes column_name and decimal_places, 2 is the default can override when using (similar to a python function)

round( 1.0 * {{ column_name }} / 100, {{ decimal_places }}) -- this is what the macro does takes the column / 100 and rounds by decimal places entered into argument

{%- endmacro %} -- need to indicate the end of the macro