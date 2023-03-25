# Puppet code to set up a configuration file in a server

file_line {'Declaring identity file':
  path => '/etc/ssh/ssh_config',
  ensure => present,
  line => '    IdentityFile ~/.ssh/school',
}

file_line {'Deactivating Password authentication':
  path =>'/etc/ssh/ssh_config',
  ensure => present,
  line => '    PasswordAuthentication no',
}
