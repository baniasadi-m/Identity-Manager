#!/bin/bash
TZ="Asia/Tehran"; export TZ
cd /app

python manage.py makemigrations && python manage.py migrate

# python manage.py trialactive

if [ -n "$DJANGO_SUPERUSER_EMAIL" ] && [ -n "$DJANGO_SUPERUSER_PASSWORD" ] ; then
    (python manage.py createsuperuser --email=$DJANGO_SUPERUSER_EMAIL --noinput)
fi


# Run the original CMD
exec "$@"