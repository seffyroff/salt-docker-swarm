# duplicate functionality of https://docs.docker.com/install/linux/docker-ce/ubuntu/

# Uninstall old versions

oldpkgs_remove:
    pkg.removed:
        - pkgs: ['docker', 'docker-engine', 'docker.io']

# Setup the repo

# refresh_apt_pkgs:
#     pkg.uptodate

# Install HTTPS Repo pkg deps
pkg_docker_deps_install:
    pkg.installed:
        - pkgs: ['bridge-utils', 'apt-transport-https', 'ca-certificates', 'curl', 'software-properties-common', 'python-pycurl', 'python-apt', 'python-pip']
        - refresh: True
        - allow_updates: True

pkg_docker_python_deps_install:
    pip.installed:
        - name: docker
        - require: 
            - pkg: python-pip

# Add Docker Repo

add_docker_repo:
    pkgrepo.managed:
        - keyserver: https://download.docker.com/linux/ubuntu/gpg
        - keyid: 0EBFCD88
        - name: deb https://download.docker.com/linux/ubuntu xenial edge stable
        - architectures: amd64


# $ sudo apt-get install docker-ce
pkg_docker_ce_install:
    pkg.installed:
        - name: docker-ce
