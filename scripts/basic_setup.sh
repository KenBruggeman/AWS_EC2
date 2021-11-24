#! /usr/bin/env bash
#
# Author: Ken Bruggeman  
#
# Prerequisite: add a password for the default ec2-user (sudo passwd ec2-user) BEFORE running this script!  

# This script will install Git and ansible, clone a repository, give a password to the default ec2-user and download the epel-release packages  
# needed for the bertvv.rh-base role.  

set -o errexit  # abort on nonzero exitstatus
set -o nounset  # abort on unbound variable
set -o pipefail # don’t hide errors within pipes  

echo "installing Git"
sudo yum install git -y  
echo "installing Ansible"
sudo amazon-linux-extras install ansible2 -y 
echo "Cloning the repository" 
git clone https://github.com/KenBruggeman/AWS_EC2.git  
cd AWS_EC2/scripts  
chmod +x role-deps.sh   
cd ..    
echo "Installing Ansible roles"
./scripts/role-deps.sh  
cd ansible/  
echo "Provide ec2-user password for the execution of the playbook:"  
read ec2_pass
ansible-playbook site.yml -i inventory -K $ec2_pass
