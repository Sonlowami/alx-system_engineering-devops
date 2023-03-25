# Puppet code to set up a configuration file in a server

File {'ssh_config':
  path => '/home/sonlowami/alx/alx-system_engineering-devops/0x0B-ssh/config',
  ensure => file,
  content => "Host *\n\tIdentityFile ~/.ssh/school\n\tPasswordAuthentication no\n",
}
