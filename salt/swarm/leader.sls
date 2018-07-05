# /srv/salt/swarm/leader.sls
{% set leader_ip = salt['network.ip_addrs'](cidr='10.0.10.0/24') | first %}

create_homelab:
    module.run:
        - name: swarm.swarm_init
        - advertise_addr: {{ leader_ip }}
        - listen_addr: '0.0.0.0'
        - force_new_cluster: False
