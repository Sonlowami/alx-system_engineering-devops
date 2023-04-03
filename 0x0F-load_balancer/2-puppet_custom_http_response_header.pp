# Puppet header to create a custom header
exec {'X-Served-By':
  command  => sed -i "/^http.*/a \\\tadd_header X-Served-By $(hostname);" /etc/nginx/nginx.conf,
  provider => shell,
}
