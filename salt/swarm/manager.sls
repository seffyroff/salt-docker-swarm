# /srv/salt/swarm/manager.sls

{% set swarm_leader_ip = salt.pillar.get('swarm_leader_ip') %}
{% set swarm_token_manager = salt.pillar.get('swarm_token_manager') %}

homelab_join_manager:
    module.run:
        - name: swarm.joinswarm
        - remote_addr:  {{ swarm_leader_ip }}
        - listen_addr: '0.0.0.0'
        - token: {{ swarm_token_manager }}
