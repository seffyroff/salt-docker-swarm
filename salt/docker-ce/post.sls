docker:
  group.present:
    - addusers:
      - seffyroff

docker.override.conf:
  file.managed:
    - name: /etc/systemd/system/docker.service.d/override.conf
    - source: salt://docker-ce/files/docker.override.conf
    - makedirs: True

service.systemctl_reload:
  module.run

restart_docker:
  module.run:
    - name: service.restart
    - m_name: docker

install_docker-compose:
  pip.installed:
    - name: docker-compose
    - upgrade: True

docker_compose_bash_completion:
  file.managed:
    - name: /etc/bash_completion.d/docker-compose
    - source: https://raw.githubusercontent.com/docker/compose/1.21.2/contrib/completion/bash/docker-compose
    - skip_verify: True
    