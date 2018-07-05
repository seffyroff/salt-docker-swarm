# /srv/salt/orch/managers.sls
{% set tag = salt.pillar.get('event_tag') %}
{% set data = salt.pillar.get('event_data', default='null') %}
{## {% do salt.log.error(show_full_context()) %} ##}

swarm_join_managers:
    salt.state:
        - tgt: 'swarm_role:manager'
        - tgt_type: 'grain'
        - sls:
            - swarm.manager
        - pillar:
            swarm_leader_ip: {{ data.id | dns_check(port=443) }}
            swarm_token_manager: {{ data['return']['module_|-create_homelab_|-swarm.swarm_init_|-run']['changes']['ret']['Tokens'].Manager }}

