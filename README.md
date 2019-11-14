# ims_gemfire
Gemfire Automation Scripts to be used to deploy gemfire on RHEL or CENTOS Boxes.

# Check out

Check out the repo

git clone https://github.com/nobodynowhere/ims_gemfire.git

# Setup

Setup password less SSH between the ansible host and all other hosts in the cluster

Configure Gemfire locator and Cache server hosts in ansible hosts file under

For eg:

[locators]   
rhel-loca1 hostname_for_clients=rhel-loca1.local   
rhel-loca2 hostname_for_clients=rhel-loca2.local    
rhel-loca3 hostname_for_clients=rhel-loca3.local    

[cacheservers]   
rhel-cs1 hostname_for_clients=rhel-cs1.local    
rhel-cs2 hostname_for_clients=rhel-cs2.local    
rhel-cs3 hostname_for_clients=rhel-cs3.local    

# configuration Changes

Create environment (production/staging/dev) specific hosts and configurations

Download the JDK and Pivotal Gemfire tar files

Create a folder ../files and drop the downloaded tars under ../files

Update the hosts file, JDK, Gemfire, cache server configurations and specific host configurations under corresponding group or host var file

# Run

ansible-playbook -i inventories/environment/hosts site.yml

For eg:
ansible-playbook -i inventories/production/hosts site.yml -v
