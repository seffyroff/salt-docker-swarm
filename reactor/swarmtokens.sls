# /srv/reactor/swarmtokens.sls
{% if 'swarm.leader' in data['fun_args'] %}
invoke_orchestrate_file:
  runner.state.orchestrate:
    - args:
        - mods: orch.managers
        - pillar:
            event_tag: {{ tag }}
            event_data: {{ data|json }}
{% endif %}