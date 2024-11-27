{% macro get_dependencies(model_folder,model_name) %}
    {% set models = graph.nodes.values() %}

    {% set model = (models | selectattr('name', 'equalto', model_name) | list).pop() %}
    {% set sources = model[model_folder] %}
    {% set refs = model['refs'] %}


    {% do log(model_folder ~" : ", info=true) %}
    {% set unique_sources = [] %}    
    {% for source in sources if source not in unique_sources %}
        {% do unique_sources.append(source) %}
        {% do log(source[0] ~ '.' ~ source[1], info=true) %}
    {% endfor %}

    {% do log("refs: ", info=true) %}
    {% set unique_refs = [] %}    
    {% for ref in refs if reference not in unique_refs %}
        {% do unique_refs.append(ref) %}
        {% do log(ref[0], info=true) %}
    {% endfor %}

{% endmacro %}