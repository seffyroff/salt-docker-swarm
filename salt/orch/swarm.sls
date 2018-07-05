# /srv/salt/orch/swarm.sls
{% set swarm_roles = salt.pillar.get('swarm_roles') %}

swarm_init_leader:
    salt.state:
        - tgt: {{ swarm_roles.leader }}
        - tgt_type: list
        - sls:
            - swarm.leader
# REACTOR LISTENS TO RETURNED TOKENS AND TRIGGERS MANAGER DEPLOY

# retrieve_swarm_tokens:
#     salt.state:
#         - tgt: 'swarm_role:leader'
#         - tgt_type: 'grain'
#         - sls:
#             - swarm.tokens

