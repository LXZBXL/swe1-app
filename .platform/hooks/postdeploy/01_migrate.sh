#!/bin/bash
set -e
source /var/app/venv/*/bin/activate
cd /var/app/current
export DJANGO_SETTINGS_MODULE=mysite.settings
django-admin migrate --noinput
django-admin createsuperuser --noinput || true

# SQLite needs write access to the DB file AND its directory (for journal files),
# but migrate runs as root while gunicorn runs as the webapp user.
chown webapp:webapp /var/app/current/db.sqlite3 || true
chmod 666 /var/app/current/db.sqlite3 || true
chmod 777 /var/app/current || true
