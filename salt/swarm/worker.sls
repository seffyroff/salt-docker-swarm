# SWARM WORKER
{% from 'swarm/leader.sls' import leader_ip with context %}

homelab_join_worker:
    module.run:
        - name: swarm.joinswarm
        - remote_addr:  {{ leader_ip }}
        - listen_addr: '0.0.0.0'
        - token: {{ pillar['swarm_tokens.Worker'] }}
        # - require:
        #     - pkg: python-pip
        #     - pip: docker
        #     - sls: leader