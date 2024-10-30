sed -i "s/NODES/${NODES}/" /etc/nginx/nginx.conf
sed -i "s/LISTEN_PORT/${LISTEN_PORT}/" /etc/nginx/nginx.conf
cat /etc/nginx/nginx.conf
rm /etc/nginx/conf.d/default.conf

exec nginx -g 'daemon off;'