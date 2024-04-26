FROM python:3.12

ENV APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE 1
ENV PYTHONUNBUFFERED 1
ENV IN_WESAGO_DOCKER 1
ENV WESAGO_PLUGINS "/wesago_app/plugins"

# Install dependencies in one single command/layer
RUN apt-get update && \
    apt-get install -y --allow-unauthenticated \
      vim \
      libffi-dev \
      libssl-dev \
      libjpeg-dev \
      libopenjp2-7-dev \
      locales \
      cron \
      postgresql-client-15 \
      gettext && \
    apt-get clean

# Make current directory available as "Wesago" within docker
COPY wesago_app /wesago_app
WORKDIR /wesago_app

# Install requirements files
RUN pip install --upgrade pip && \
    pip install -r requirements.txt

EXPOSE 8000

CMD ["gunicorn", "wesagodocker.wsgi:application", "--bind", "0.0.0.0:8000"]

