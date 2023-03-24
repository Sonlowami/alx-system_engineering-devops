# Kill a process called kill me now

exec {'pkill killmenow':
  command => '/usr/bin/pkill -f killmenow',
}
