# Puppet code to set up a configuration file in a server

file-line {'Declaring identity file':
  path => '/etc/ssh/ssh_config',
  ensure => present,
  line => '    IdentityFile ~/.ssh/school',
}

file-line {'Deactivating Password authentication':
  path =>'/etc/ssh/ssh_config',
  ensure => present,
  line => '    PasswordAuthentication no',
}
