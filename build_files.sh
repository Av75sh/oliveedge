#!/bin/bash

# Install dependencies
pip install -r requirements.txt

# Copy media to static for Vercel
mkdir -p staticfiles_build/static/media
cp -r static/media/* staticfiles_build/static/media/ 2>/dev/null || :

# Collect static files
python manage.py collectstatic --noinput --clear

# Make migrations
python manage.py makemigrations --noinput
python manage.py migrate --noinput