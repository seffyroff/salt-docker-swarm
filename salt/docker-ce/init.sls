install_docker-pip:
  pkg.installed:
    - name: python-pip
  pip.installed:
    - name: docker
    - upgrade: True