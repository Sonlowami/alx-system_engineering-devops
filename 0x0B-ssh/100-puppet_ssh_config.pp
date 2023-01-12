# Configure an SSH configuration file
file_line { 'Disable passwords':
  ensure => present,
  path   => '/etc/ssh/config',
  line   => '  PasswordAuthority no'
}

file_line { 'Declare identity file':
  ensure => present,
  path   => '/etc/ssh/config',
  line   => '  IdentityFile ~/.ssh/school'
}
