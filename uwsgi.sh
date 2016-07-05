#!/bin/sh
chown uwsgi /static
chown uwsgi /project/pinaxcon/site_media/media
su -m uwsgi -c "python /project/manage.py migrate --noinput"
su -m uwsgi -c "python /project/manage.py collectstatic --noinput"
su -m uwsgi -c "/usr/local/bin/uwsgi --socket :5000 --wsgi-file /project/pinaxcon/wsgi.py --master --processes 3 --threads 2 --chdir /project"
