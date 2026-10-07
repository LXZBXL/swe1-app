#!/bin/bash
set -e
source /var/app/venv/*/bin/activate
cd /var/app/current
export DJANGO_SETTINGS_MODULE=mysite.settings
django-admin migrate --noinput
django-admin createsuperuser --noinput || true
