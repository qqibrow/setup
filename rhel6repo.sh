#!/bin/bash
set -x

# enable epel repo in rhel6
# http://www.tecmint.com/how-to-enable-epel-repository-for-rhel-centos-6-5/

wget http://download.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
rpm -ivh epel-release-6-8.noarch.rpm

# fix error according to this post
# https://community.hpcloud.com/article/centos-63-instance-giving-cannot-retrieve-metalink-repository-epel-error
sudo sed -i "s/mirrorlist=https/mirrorlist=http/" /etc/yum.repos.d/epel.repo
