#ORCH DOCKER

install_docker:
    salt.state:
        - tgt: '*'
        - sls:
            - docker-ce
            - docker-ce.pkg
            - docker-ce.post
