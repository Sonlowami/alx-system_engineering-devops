# Install and configure nginx web server
package {'nginx':
  ensure => latest,
  before => File['hello'],
}

file {'hello':
  ensure  => file,
  path    => '/var/www/html/index.nginx-debian.html',
  content => 'Hello World!'
}

file {'error404':
  ensure  => file,
  path    => '/var/www/html/error_404.html',
  content => "Ceci n'est pas une page",
}

exec {'redirect':
  command  => 'sudo sed -i "/^\tserver_name _.*/a \\trewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;" /etc/nginx/sites-available/default',
  provider => shell,
}

exec {'set_404':
  command  => "sudo sed -i '/^http.*/a \\terror_page 404 /error404.html;' /etc/nginx/nginx.conf",
  provider => shell,
}

service {'restart nginx':
  hasrestart => true,
}

exec {'restart':
  command  => 'sudo systemctl restart nginx',
  provider => shell,
}
