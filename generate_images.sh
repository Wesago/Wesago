NAMESPACE="gic-wesago"

# website_dep nginx
docker build -t registry.deti/${NAMESPACE}/nginxwebsite:v1 -f website_dep/nginx/Dockerfile website_dep/nginx
docker push registry.deti/${NAMESPACE}/nginxwebsite:v1

# website_dep react
docker build -t registry.deti/${NAMESPACE}/websitejob:v1 -f website_dep/react/Dockerfile website_dep/react
docker push registry.deti/${NAMESPACE}/websitejob:v1

# wesago_dep django
docker build -t registry.deti/${NAMESPACE}/wesago-django:v1 -f wesago_dep/django/Dockerfile .
docker push registry.deti/${NAMESPACE}/wesago-django:v1

# wesago_dep nginx
docker build -t registry.deti/${NAMESPACE}/nginx:v1 -f wesago_dep/nginx/Dockerfile wesago_dep/nginx
docker push registry.deti/${NAMESPACE}/nginx:v1

# wesago_dep postgres
docker build -t registry.deti/${NAMESPACE}/postgres:v1 -f wesago_dep/postgres/Dockerfile wesago_dep/postgres
docker push registry.deti/${NAMESPACE}/postgres:v1

# wesago_dep redis
docker build -t registry.deti/${NAMESPACE}/redis:v1 -f wesago_dep/redis/Dockerfile wesago_dep/redis
docker push registry.deti/${NAMESPACE}/redis:v1

# wesago_dep rsyslog
docker build -t registry.deti/${NAMESPACE}/rsyslog-server:v1 -f wesago_dep/rsyslog/Dockerfile wesago_dep/rsyslog
docker push registry.deti/${NAMESPACE}/rsyslog-server:v1

# monitor_dep grafana
docker build -t registry.deti/${NAMESPACE}/grafana:v1 -f monitoring/grafana/Dockerfile monitoring/grafana
docker push registry.deti/${NAMESPACE}/grafana:v1
