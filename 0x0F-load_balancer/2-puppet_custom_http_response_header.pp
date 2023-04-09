# Puppet header to create a custom header and configure a brand new ubuntu machine with nginx

package {'nginx':
  ensure => latest,
}

exec {'hello':
  command => "/bin/echo 'Hello World!' |  /bin/tee /var/www/html/index.nginx-debian.html",
}

exec {'redirect':
  command => "/bin/sed -i '/^\tserver_name _.*/a \\trewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;' /etc/nginx/sites-available/default",
}

exec {'Error 404':
  command => "/bin/sed -i '/^http.*/a \\terror_page 404 /error404.html;' /etc/nginx/nginx.conf; /bin/echo 'Ceci n\'est pas une page' | /bin/tee /var/www/html/error404.html",
}
exec {'X-Served-By':
  command  => " /bin/sed -i '/^http.*/a \\tadd_header X-Served-By $(hostname);' /etc/nginx/nginx.conf",
  provider => shell,
}

exec {'Restart':
  command => service nginx restart,
}
