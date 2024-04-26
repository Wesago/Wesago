NAMESPACE="gic-wesago"

# website_dep nginx
docker build -t registry.deti/${NAMESPACE}/nginx:v1 -f website_dep/nginx/Dockerfile website_dep/nginx
docker push registry.deti/${NAMESPACE}/nginx:v1

# website_dep react
docker build -t registry.deti/${NAMESPACE}/websitejob:v1 -f website_dep/react/Dockerfile website_dep/react
docker push registry.deti/${NAMESPACE}/websitejob:v1

# wesago_app (The same as wesago_dep django but without gunicorn, for local development)
# docker build -t registry.deti/${NAMESPACE}/wesago-django:v1 -f wesago_app/Dockerfile wesago_app/
# docker push registry.deti/${NAMESPACE}/wesago-django:v1

# wesago_dep django
docker build -t registry.deti/${NAMESPACE}/wesago-django:v1 -f wesago_dep/django/Dockerfile .
docker push registry.deti/${NAMESPACE}/wesago-django:v1

# wesago_dep celery (Not used since the celery code is the same as the django code and only CMD is different which is overriden in the kubernetes deployment)
# docker build -t registry.deti/${NAMESPACE}/wesago-celery:v1 -f wesago_dep/celery/Dockerfile .
# docker push registry.deti/${NAMESPACE}/wesago-celery:v1

# wesago_dep nginx
docker build -t registry.deti/${NAMESPACE}/nginx:v1 -f wesago_dep/nginx/Dockerfile wesago_dep/nginx
docker push registry.deti/${NAMESPACE}/nginx:v1

# wesago_dep postgres
docker build -t registry.deti/${NAMESPACE}/postgres:v1 -f wesago_dep/postgres/Dockerfile wesago_dep/postgres
docker push registry.deti/${NAMESPACE}/postgres:v1

# wesago_dep redis
docker build -t registry.deti/${NAMESPACE}/redis:v1 -f wesago_dep/redis/Dockerfile wesago_dep/redis
docker push registry.deti/${NAMESPACE}/redis:v1

# wesago_dep rsyslog (Not implemented yet)
# docker build -t registry.deti/${NAMESPACE}/rsyslog:v1 -f wesago_dep/rsyslog/Dockerfile wesago_dep/rsyslog
# docker push registry.deti/${NAMESPACE}/rsyslog:v1
