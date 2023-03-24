# 0X0A. Configuration Management using Puppet

Configuration management is a process of maintaining the
desired state of servers in a network.
There are a lot of tools used to automate this process, including
Puppet, Ansible, and Chef.

Puppet, which is used in this project, is a client-server configuration
management system.

## How puppet works

The system is comprised of a puppetmaster software, installed on a unix-based
OS, and connected to one or more puppet agents found on different computers
running different operating systems.

The puppet agent periodically sends facts about the client. Then, the master
reads that information, compares to the predefined desired state, and compiles
catalogs to achieve the desired state. The agent then downloads the catalogs and run them on the host OS. each catalog is specific to a particular computer.

The operator sets the desired state by writing 'manifests', files ending with a.pp extension, in which they declare host resources, and their desired state.

## About this directory

This directory contain three files that creates a file, installs flask, and kills a process respectively.

## Author
[Uwimana Lowami](https://github.com/Sonlowami)
