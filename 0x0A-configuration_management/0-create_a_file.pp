# Create a file in /tmp
file { '/tmp/school':
  ensure  => present,
  mode    => '0744',
  path    => '/tmp/school',
  content => "I love Puppet\n",
  owner   => 'www-data',
  group   => 'www-data'
}


