# Kills a process called killmenow
exec { 'pkill':
  command => '/usr/bin/pkill -f killmenow',
  path    => '/usr/bin/pkill',
}
