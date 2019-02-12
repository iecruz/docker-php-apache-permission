Commands:
docker build -t test .
docker run -v $(pwd):/var/www/html -p 8000:80 --name test -u www-data:www-data --sysctl net.ipv4.ip_unprivileged_port_start=0 test
