# Kill a process called kill me now

exec {'pkill killmenow':
  command => ['/usr/bin/pkill', 'killmenow']
}
