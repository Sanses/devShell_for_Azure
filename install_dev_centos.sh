#!/bin/bash
# AzureVM for Centos7.5 Develop Environment
# Author : https://github.com/Sanses

echo "======================================"
echo "OpenJDK install"
echo "======================================"

sudo yum install -y java-1.8.0-openjdk-devel.x86_64


echo "======================================"
echo "Git install"
echo "======================================"

sudo yum install -y git

sudo yum install -y azure-cli

echo "======================================"
echo "Maven install"
echo "======================================"

sudo mkdir /tools
cd /tools
sudo wget http://apache.tt.co.kr/maven/maven-3/3.6.1/binaries/apache-maven-3.6.1-bin.tar.gz
sudo tar xvfz apache-maven-3.6.1-bin.tar.gz
sudo ln -s apache-maven-3.6.1  maven

echo " "  >> ~/.bash_profile
echo "# maven "  >> ~/.bash_profile
echo "export MAVEN_HOME=/tools/maven"  >> ~/.bash_profile
echo "PATH=\${MAVEN_HOME}/bin:\${PATH}"  >> ~/.bash_profile
echo "export PATH"  >> ~/.bash_profile
source ~/.bash_profile

echo "======================================"
echo "Azure-cli install"
echo "======================================"

sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[azure-cli]\nname=Azure CLI\nbaseurl=https://packages.microsoft.com/yumrepos/azure-cli\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/azure-cli.repo'

sudo yum install -y azure-cli
