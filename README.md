# salt-docker-swarm
Saltstack scripts to spin up a Docker Swarm. Might grow up one day to be a formula.

Clone this repo to your file_roots on your master, or add as a gitrepo (untested).

TODO A reactor that responds to the Swarm init needs adding, to trigger the Swarm Managers joining.  
TODO Set Reactor Event on script start, and remove at the end:
reactor:
  - 'salt/job/*/ret/celery.lan':
      - /srv/reactor/swarmtokens.sls