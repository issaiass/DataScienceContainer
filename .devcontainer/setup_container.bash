#!/bin/bash

# Create user data_science read, write execute (0440 for read-only), and allow it to install stuff. 
adduser --disabled-password --gecos "docker user" data_science
echo 'data_science ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/data_science && chmod 0777 /etc/sudoers.d/data_science
chown -R data_science /app

# Suppress deprecated setuptools warning
echo "PYTHONWARNINGS=\"ignore:setup.py install is deprecated::setuptools.command.install,ignore:easy_install command is deprecated::setuptools.command.easy_install\"; export PYTHONWARNINGS" >> /home/data_science/.bashrc